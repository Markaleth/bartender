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
  final dynamic model; // CaskModel or FormulaModel
  final String id;
  final String name;
  final String? homepage;
  final bool isCask;

  final bool isExpanded;
  final VoidCallback onExpand;
  final String? description;
  final String? version;

  const PackageListItem({
    super.key,
    required this.model,
    required this.id,
    required this.name,
    this.homepage,
    required this.isCask,
    required this.isExpanded,
    required this.onExpand,
    this.description,
    this.version,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: spacingXs,
            horizontal: spacingS,
          ),
          child: AnimatedContainer(
            duration: defaultAnimationDuration,
            curve: Curves.easeInOut,
            margin: EdgeInsets.symmetric(vertical: isExpanded ? spacingS : 0),
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
                      model: model,
                    ),
                ],
              ),
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
    final isLargeScreen = constraints.maxWidth >= widthBreakpoint;

    return InkWell(
      onTap: onExpand,
      borderRadius: BorderRadius.circular(radiusL),
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
                  _PackageListItemTitle(name: name, id: id),
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

class _PackageListItemTitle extends StatelessWidget {
  final String name;
  final String id;

  const _PackageListItemTitle({required this.name, required this.id});

  @override
  Widget build(BuildContext context) {
    final tag = StringUtils.extractVariantTag(name, id);

    if (tag != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(name, style: context.titleM),
          const SizedBox(width: spacingS),
          PackageVariantTag(tag: tag),
        ],
      );
    }

    return Text(name, style: context.titleM);
  }
}

class _PackageListItemDetails extends StatelessWidget {
  final dynamic model;

  const _PackageListItemDetails({required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const HorizontalDivider(),
        Padding(
          padding: const EdgeInsets.all(spacingL),
          child: PackageGridMatrix(
            model: model,
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
              OutlinedButton(
                onPressed: () {
                  // Dummy uninstall
                },
                child: Text(
                  'Uninstall',
                  style: context.labelL.copyWith(color: AppColors.primary),
                ),
              ),
              const SizedBox(width: spacingM),
              ElevatedButton(
                onPressed: () {
                  // Dummy install
                },
                child: Text(
                  'Install',
                  style: context.labelL.copyWith(color: AppColors.onPrimary),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
