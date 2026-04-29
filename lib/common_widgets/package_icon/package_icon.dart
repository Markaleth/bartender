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
  final bool isCask;
  final double size;

  const PackageIcon({
    super.key,
    required this.name,
    this.homepage,
    required this.isCask,
    this.size = spacing2Xl,
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
    _viewModel.loadIcon(widget.name, widget.homepage, widget.isCask);
  }

  @override
  void didUpdateWidget(covariant PackageIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.name != widget.name) {
      _viewModel.loadIcon(widget.name, widget.homepage, widget.isCask);
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
        return _viewModel.state.when(
          loading: () => _LoadingIndicator(widget: widget, context: context),
          success: (icon) {
            if (icon.isSvg) {
              return SvgPicture.network(
                icon.iconUrl!,
                width: widget.size,
                height: widget.size,
                placeholderBuilder: (_) =>
                    _LoadingIndicator(widget: widget, context: context),
              );
            } else {
              return CachedNetworkImage(
                imageUrl: icon.iconUrl!,
                width: widget.size,
                height: widget.size,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    _LoadingIndicator(widget: widget, context: context),
                errorWidget: (context, url, error) =>
                    _LoadingIndicator(widget: widget, context: context),
                imageBuilder: (context, imageProvider) => ClipRRect(
                  borderRadius: BorderRadius.circular(radiusM),
                  child: Image(
                    image: imageProvider,
                    width: widget.size,
                    height: widget.size,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }
          },
          fallback: () => _LoadingIndicator(widget: widget, context: context),
        );
      },
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator({
    required this.widget,
    required this.context,
  });

  final PackageIcon widget;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }
}
