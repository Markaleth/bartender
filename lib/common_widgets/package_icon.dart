import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:provider/provider.dart';

import '../services/icon_resolution/icon_resolution_service.dart';
import '../data/models/icon_cache/resolved_icon.dart';

class PackageIcon extends StatefulWidget {
  final String name;
  final String? homepage;
  final bool isCask;
  final double size;

  const PackageIcon({
    super.key,
    required this.name,
    this.homepage,
    required this.isCask,
    this.size = 48.0,
  });

  @override
  State<PackageIcon> createState() => _PackageIconState();
}

class _PackageIconState extends State<PackageIcon> {
  late IconResolutionService _iconService;
  ResolvedIcon? _resolvedIcon;
  Future<FileInfo?>? _fileInfoFuture;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _iconService = context.read<IconResolutionService>();
    _loadIcon();
  }

  @override
  void didUpdateWidget(covariant PackageIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.name != widget.name) {
      _loadIcon();
    }
  }

  Future<void> _loadIcon() async {
    setState(() {
      _isLoading = true;
    });

    final memoryIcon = _iconService.getMemoryCachedIcon(widget.name);
    if (memoryIcon != null) {
      setState(() {
        _resolvedIcon = memoryIcon;
        if (memoryIcon.iconUrl != null) {
          _fileInfoFuture = DefaultCacheManager().getFileFromCache(memoryIcon.iconUrl!);
        }
        _isLoading = false;
      });
      return;
    }

    final fetchedIcon = await _iconService.getIcon(widget.name, widget.homepage, widget.isCask);
    if (mounted) {
      setState(() {
        _resolvedIcon = fetchedIcon;
        if (fetchedIcon != null && fetchedIcon.iconUrl != null) {
          _fileInfoFuture = DefaultCacheManager().getFileFromCache(fetchedIcon.iconUrl!);
        }
        _isLoading = false;
      });
    }
  }

  Widget _buildFallback() {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        widget.name.isNotEmpty ? widget.name[0].toUpperCase() : '?',
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          fontWeight: FontWeight.bold,
          fontSize: widget.size * 0.5,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return _buildFallback();
    }

    if (_resolvedIcon == null || _resolvedIcon!.iconUrl == null) {
      return _buildFallback();
    }

    return FutureBuilder<FileInfo?>(
      future: _fileInfoFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildFallback();
        }
        
        if (!snapshot.hasData || snapshot.data == null) {
          // Fallback to network if not in cache for some reason
          if (_resolvedIcon!.isSvg) {
            return SvgPicture.network(
              _resolvedIcon!.iconUrl!,
              width: widget.size,
              height: widget.size,
              placeholderBuilder: (_) => _buildFallback(),
            );
          } else {
            return Image.network(
              _resolvedIcon!.iconUrl!,
              width: widget.size,
              height: widget.size,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => _buildFallback(),
            );
          }
        }

        final file = snapshot.data!.file;
        if (_resolvedIcon!.isSvg) {
          return SvgPicture.file(
            file,
            width: widget.size,
            height: widget.size,
            placeholderBuilder: (_) => _buildFallback(),
          );
        } else {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.file(
              file,
              width: widget.size,
              height: widget.size,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => _buildFallback(),
            ),
          );
        }
      },
    );
  }
}
