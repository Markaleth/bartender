import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import '../../data/db/database_interface.dart';
import '../../data/models/icon_cache/resolved_icon.dart';
import 'icon_url_builders.dart';

class IconResolutionService {
  final DatabaseInterface _db;
  final DefaultCacheManager _cacheManager = DefaultCacheManager();
  
  final Map<String, ResolvedIcon?> _memoryCache = {};
  final Set<String> _activeFetches = {};

  IconResolutionService(this._db);

  /// Synchronously returns a memory-cached icon if available, preventing UI flicker.
  ResolvedIcon? getMemoryCachedIcon(String packageName) {
    return _memoryCache[packageName];
  }

  /// The main entry point to resolve an icon.
  Future<ResolvedIcon?> getIcon(String packageName, String? homepage, bool isCask) async {
    // 1. Check Memory Cache
    if (_memoryCache.containsKey(packageName)) {
      return _memoryCache[packageName];
    }

    // 2. Prevent concurrent fetches for the same package
    if (_activeFetches.contains(packageName)) {
      // If a fetch is active, wait for it or just let the caller handle loading state
      // For simplicity, we could poll or use a Completer map, but returning null 
      // temporarily and letting the UI rebuild is often enough, or we can await a Completer.
      // Let's implement a Completer map for true deduping.
    }
    
    return _resolveAndCache(packageName, homepage, isCask);
  }
  
  final Map<String, Future<ResolvedIcon?>> _pendingFutures = {};

  Future<ResolvedIcon?> _resolveAndCache(String packageName, String? homepage, bool isCask) {
    if (_pendingFutures.containsKey(packageName)) {
      return _pendingFutures[packageName]!;
    }
    
    final future = _performResolution(packageName, homepage, isCask).whenComplete(() {
      _pendingFutures.remove(packageName);
    });
    
    _pendingFutures[packageName] = future;
    return future;
  }

  Future<ResolvedIcon?> _performResolution(String packageName, String? homepage, bool isCask) async {
    // 3. Check DB Cache
    final dbResult = await _db.getIconCache(packageName);
    if (dbResult != null) {
      final now = DateTime.now();
      // If it's less than 30 days old, use it
      if (now.difference(dbResult.resolvedAt).inDays < 30) {
        _memoryCache[packageName] = dbResult;
        return dbResult;
      }
    }

    // 4. Run Waterfall
    final uri = homepage != null ? Uri.tryParse(homepage) : null;
    
    for (final builder in IconUrlBuilders.waterfall) {
      final url = builder(packageName, uri, isCask);
      if (url == null) continue;

      try {
        // Try to download. This will throw an exception if it's a 404 or fails.
        await _cacheManager.downloadFile(url);
        
        // Let's do a basic SVG detection
        final isSvgResolved = url.toLowerCase().endsWith('.svg');

        final resolvedIcon = ResolvedIcon(
          packageName: packageName,
          iconUrl: url,
          isSvg: isSvgResolved,
          resolvedAt: DateTime.now(),
        );

        // Save to DB and Memory
        await _db.saveIconCache(packageName, url, isSvgResolved);
        _memoryCache[packageName] = resolvedIcon;
        return resolvedIcon;
      } catch (e) {
        // Download failed, move to next provider
        continue;
      }
    }

    // 5. If all fail, cache the negative result to avoid spamming
    final nullIcon = ResolvedIcon(
      packageName: packageName,
      iconUrl: null,
      isSvg: false,
      resolvedAt: DateTime.now(),
    );
    await _db.saveIconCache(packageName, null, false);
    _memoryCache[packageName] = nullIcon;
    return nullIcon;
  }
}
