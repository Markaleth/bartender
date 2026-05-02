import 'package:bartender/common_widgets/horizontal_divider.dart';
import 'package:bartender/common_widgets/package_icon/package_icon.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/core/constants/durations.dart';
import 'package:bartender/core/utils/string_utils.dart';
import 'package:bartender/features/packages/widgets/package_grid_matrix.dart';
import 'package:bartender/features/packages/widgets/package_variant_tag.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';

class PackageListItem extends StatelessWidget {
  final String id;
  final String name;
  final String? homepage;
  final bool isCask;

  final bool isExpanded;
  final VoidCallback onExpand;
  final String? description;
  final String? version;
  final List<String> dependencies;

  const PackageListItem({
    super.key,
    required this.id,
    required this.name,
    this.homepage,
    required this.isCask,
    required this.isExpanded,
    required this.onExpand,
    this.description,
    this.version,
    required this.dependencies,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return AnimatedContainer(
          duration: defaultAnimationDuration,
          curve: Curves.easeInOut,
          margin: EdgeInsets.symmetric(
            vertical: isExpanded ? spacingS : 0,
          ),
          decoration: BoxDecoration(
            color: isExpanded ? AppColors.surface : Colors.transparent,
            borderRadius: BorderRadius.circular(isExpanded ? radiusL : 0),
            border: isExpanded
                ? Border.all(color: AppColors.borderNeutral)
                : Border.all(color: Colors.transparent),
          ),
          child: AnimatedSize(
            duration: defaultAnimationDuration,
            curve: Curves.easeInOut,
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PackageListItemHeader(
                  id: id,
                  name: name,
                  homepage: homepage,
                  isCask: isCask,
                  isExpanded: isExpanded,
                  onExpand: onExpand,
                  description: description,
                  version: version,
                  constraints: constraints,
                ),
                if (isExpanded)
                  _PackageListItemDetails(
                    version: version,
                    dependencies: dependencies,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _PackageListItemHeader extends StatelessWidget {
  final String id;
  final String name;
  final String? homepage;
  final bool isCask;
  final bool isExpanded;
  final VoidCallback onExpand;
  final String? description;
  final String? version;
  final BoxConstraints constraints;

  const _PackageListItemHeader({
    required this.id,
    required this.name,
    this.homepage,
    required this.isCask,
    required this.isExpanded,
    required this.onExpand,
    this.description,
    this.version,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    final tag = StringUtils.extractVariantTag(name, id);
    final isLargeScreen = constraints.maxWidth >= 600;

    Widget titleWidget = Text(name, style: context.titleM);
    if (tag != null) {
      titleWidget = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(name, style: context.titleM),
          const SizedBox(width: spacingS),
          PackageVariantTag(tag: tag),
        ],
      );
    }

    return InkWell(
      onTap: onExpand,
      borderRadius: BorderRadius.circular(isExpanded ? radiusL : 0),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: spacingL,
          vertical: spacingS,
        ),
        child: Row(
          children: [
            PackageIcon(name: id, homepage: homepage, isCask: isCask),
            const SizedBox(width: spacingM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleWidget,
                  if (description != null && description!.isNotEmpty)
                    Text(
                      description!,
                      style: context.labelM.copyWith(
                        color: AppColors.textSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
            if (isLargeScreen)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: spacingM),
                child: Text(
                  version ?? id,
                  style: context.labelM.copyWith(
                    fontFamily: 'monospace',
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            Icon(
              isExpanded ? Icons.expand_less : Icons.expand_more,
              color: AppColors.iconDefault,
            ),
          ],
        ),
      ),
    );
  }
}

class _PackageListItemDetails extends StatelessWidget {
  final String? version;
  final List<String> dependencies;

  const _PackageListItemDetails({this.version, required this.dependencies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const HorizontalDivider(),
        Padding(
          padding: const EdgeInsets.all(spacingL),
          child: PackageGridMatrix(
            version: version ?? 'Unknown',
            dependencies: dependencies,
          ),
        ),
        const HorizontalDivider(),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: spacingL,
            vertical: spacingM,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  // Dummy uninstall
                },
                child: const Text('Uninstall'),
              ),
              const SizedBox(width: spacingM),
              ElevatedButton(
                onPressed: () {
                  // Dummy install
                },
                child: const Text('Install'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
