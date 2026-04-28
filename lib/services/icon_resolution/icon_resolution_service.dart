import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import '../../data/db/database_interface.dart';
import '../../data/models/icon_cache/resolved_icon.dart';
import 'icon_url_builders.dart';

class IconResolutionService {
  final DatabaseInterface _db;
  final DefaultCacheManager _cacheManager = DefaultCacheManager();
  
  final Map<String, ResolvedIcon?> _memoryCache = {};
  final Map<String, Future<ResolvedIcon?>> _pendingFutures = {};

  IconResolutionService(this._db);

  /// Synchronously returns a memory-cached icon if available, preventing UI flicker.
  ResolvedIcon? getMemoryCachedIcon(String packageName) {
    return _memoryCache[packageName];
  }

  /// The main entry point to resolve an icon.
  Future<ResolvedIcon?> getIcon(String packageName, String? homepage, bool isCask) async {
    if (_memoryCache.containsKey(packageName)) {
      return _memoryCache[packageName];
    }
    
    return _resolveAndCache(packageName, homepage, isCask);
  }

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
    final cachedResult = await _checkDatabaseCache(packageName);
    if (cachedResult != null) return cachedResult;

    final resolvedIcon = await _runWaterfall(packageName, homepage, isCask);
    if (resolvedIcon != null) return resolvedIcon;

    return _cacheNegativeResult(packageName);
  }

  Future<ResolvedIcon?> _checkDatabaseCache(String packageName) async {
    final dbResult = await _db.getIconCache(packageName);
    if (dbResult == null) return null;

    final isNegativeCache = dbResult.iconUrl == null;
    final now = DateTime.now();
    
    // Return cached result if it's a valid URL, OR if it's a recent negative cache (< 30 days)
    if (!isNegativeCache || now.difference(dbResult.resolvedAt).inDays < 30) {
      _memoryCache[packageName] = dbResult;
      return dbResult;
    }

    return null;
  }

  Future<ResolvedIcon?> _runWaterfall(String packageName, String? homepage, bool isCask) async {
    final uri = homepage != null ? Uri.tryParse(homepage) : null;
    
    for (final builder in IconUrlBuilders.waterfall) {
      final url = builder(packageName, uri, isCask);
      if (url == null) continue;

      try {
        // Try to download. This will throw an exception if it's a 404 or fails.
        await _cacheManager.downloadFile(url);
        return await _cacheSuccessfulResult(packageName, url);
      } catch (e) {
        // Download failed, move to next provider
        continue;
      }
    }
    
    return null;
  }

  Future<ResolvedIcon> _cacheSuccessfulResult(String packageName, String url) async {
    final isSvgResolved = url.toLowerCase().endsWith('.svg');
    final resolvedIcon = ResolvedIcon(
      packageName: packageName,
      iconUrl: url,
      isSvg: isSvgResolved,
      resolvedAt: DateTime.now(),
    );

    await _db.saveIconCache(packageName, url, isSvgResolved);
    _memoryCache[packageName] = resolvedIcon;
    
    return resolvedIcon;
  }

  Future<ResolvedIcon> _cacheNegativeResult(String packageName) async {
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
