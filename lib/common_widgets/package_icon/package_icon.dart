import 'package:bartender/common_widgets/icon_widget.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/app_icons.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

import '../../services/icon_resolution/icon_resolution_service.dart';
import 'state/package_icon_state.dart';
import 'view_model/package_icon_view_model.dart';

class PackageIcon extends StatefulWidget {
  final String name;
  final String? homepage;
  final double size;
  final double padding;

  const PackageIcon({
    super.key,
    required this.name,
    this.homepage,
    this.size = spacing2Xl,
    this.padding = spacingS,
  });

  @override
  State<PackageIcon> createState() => _PackageIconState();
}

class _PackageIconState extends State<PackageIcon> {
  late PackageIconViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = PackageIconViewModel(context.read<IconResolutionService>());
    _viewModel.loadIcon(widget.name, widget.homepage);
  }

  @override
  void didUpdateWidget(covariant PackageIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.name != widget.name) {
      _viewModel.loadIcon(widget.name, widget.homepage);
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, _) {
        return Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            color: AppColors.borderNeutral,
            borderRadius: BorderRadius.circular(radiusM),
          ),
          padding: EdgeInsets.all(widget.padding),
          child: _viewModel.state.when(
            loading: () => OverflowBox(
              maxWidth: widget.size,
              maxHeight: widget.size,
              child: _LoadingIndicator(size: widget.size),
            ),
            success: (icon) {
              if (icon.isSvg) {
                return _SvgIcon(url: icon.iconUrl!, size: widget.size);
              } else {
                return _NetworkImageIcon(url: icon.iconUrl!, size: widget.size);
              }
            },
            fallback: () => const _PlaceholderWidget(),
          ),
        );
      },
    );
  }
}

class _PlaceholderWidget extends StatelessWidget {
  const _PlaceholderWidget();

  @override
  Widget build(BuildContext context) {
    return const IconWidget(assetName: brewIcon);
  }
}

class _SvgIcon extends StatelessWidget {
  final String url;
  final double size;

  const _SvgIcon({required this.url, required this.size});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
      url,
      placeholderBuilder: (_) => OverflowBox(
        maxWidth: size,
        maxHeight: size,
        child: _LoadingIndicator(size: size),
      ),
    );
  }
}

class _NetworkImageIcon extends StatelessWidget {
  final String url;
  final double size;

  const _NetworkImageIcon({required this.url, required this.size});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      width: size,
      height: size,
      fit: BoxFit.cover,
      placeholder: (context, url) => OverflowBox(
        maxWidth: size,
        maxHeight: size,
        child: _LoadingIndicator(size: size),
      ),
      errorWidget: (context, url, error) => const _PlaceholderWidget(),
      imageBuilder: (context, imageProvider) => ClipRRect(
        borderRadius: BorderRadius.circular(radiusM),
        child: Image(image: imageProvider, fit: BoxFit.cover),
      ),
    );
  }
}

class _LoadingIndicator extends StatefulWidget {
  final double size;
  const _LoadingIndicator({required this.size});

  @override
  State<_LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<_LoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;

  @override
  void initState() {
    super.initState();
    _shimmerController = AnimationController.unbounded(vsync: this)
      ..repeat(min: -0.5, max: 1.5, period: const Duration(milliseconds: 1000));
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _shimmerController,
      builder: (context, child) {
        return Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radiusM),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.textSecondary,
                AppColors.iconDefault,
                AppColors.textSecondary,
              ],
              stops: [
                _shimmerController.value - 0.3,
                _shimmerController.value,
                _shimmerController.value + 0.3,
              ],
            ),
          ),
        );
      },
    );
  }
}
