import 'package:bartender/common_widgets/button_widget.dart';
import 'package:bartender/common_widgets/package_health_widget.dart';
import 'package:bartender/common_widgets/horizontal_divider.dart';
import 'package:bartender/common_widgets/icon_widget.dart';
import 'package:bartender/common_widgets/package_icon/package_icon.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/app_icons.dart';
import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/core/constants/durations.dart';
import 'package:bartender/core/utils/string_utils.dart';
import 'package:bartender/features/packages/models/package_states.dart';
import 'package:bartender/features/packages/widgets/package_grid_matrix.dart';
import 'package:bartender/features/packages/widgets/package_variant_tag.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';
import 'package:bartender/core/models/operation_task/operation_task.dart';
import 'package:bartender/features/queue/view_models/queue_view_model.dart';
import 'package:provider/provider.dart';

class PackageListItem extends StatefulWidget {
  final PackageListItemState model;
  final String id;
  final String name;
  final String? homepage;
  final bool isCask;

  final String? description;
  final String? version;

  const PackageListItem({
    super.key,
    required this.model,
    required this.id,
    required this.name,
    this.homepage,
    required this.isCask,
    this.description,
    this.version,
  });

  @override
  State<PackageListItem> createState() => _PackageListItemState();
}

class _PackageListItemState extends State<PackageListItem> {
  bool isExpanded = false;

  void _onExpand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: spacingXs,
            horizontal: spacingS,
          ),
          child: Opacity(
            opacity: widget.model.isSupported ? 1.0 : 0.5,
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
                    id: widget.id,
                    name: widget.name,
                    homepage: widget.homepage,
                    isCask: widget.isCask,
                    isExpanded: isExpanded,
                    isDeprecated: widget.model.isDeprecated,
                    onExpand: _onExpand,
                    description: widget.description,
                    version: widget.version,
                    constraints: constraints,
                  ),
                  if (isExpanded)
                    _PackageListItemDetails(
                      model: widget.model,
                      id: widget.id,
                      isCask: widget.isCask,
                    ),
                ],
              ),
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
  final bool isDeprecated;
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
    required this.isDeprecated,
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
            PackageIcon(name: id, homepage: homepage),
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
                child: Row(
                  children: [
                    if (isDeprecated)
                      Padding(
                        padding: const EdgeInsets.only(right: spacingM),
                        child: IconWidget(
                          assetName: deprecateIcon,
                          color: AppColors.warning,
                          size: iconSizeM,
                        ),
                      ),
                    Text(
                      version ?? id,
                      style: context.labelM.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
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
  final PackageListItemState model;
  final String id;
  final bool isCask;

  const _PackageListItemDetails({
    required this.model,
    required this.id,
    required this.isCask,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HorizontalDivider(),
        Padding(
          padding: const EdgeInsets.all(spacingL),
          child: PackageGridMatrix(model: model.gridModel),
        ),
        const HorizontalDivider(),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: spacingL,
            vertical: spacingM,
          ),
          child: Align(
            alignment: Alignment.centerRight,
            child: Row(
              spacing: spacingM,
              children: [
                if (model.isDeprecated)
                  PackageHealthWidget(
                    isDeprecated: model.isDeprecated,
                    isOutdated: false,
                    hasMissingDependencies: false,
                    isDisabled: false,
                  ),
                Spacer(),
                _PackageActionButton(model: model, id: id, isCask: isCask),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _PackageActionButton extends StatelessWidget {
  final PackageListItemState model;
  final String id;
  final bool isCask;

  const _PackageActionButton({
    required this.model,
    required this.id,
    required this.isCask,
  });

  String _getButtonLabel(bool isQueued, bool isInProgress) {
    if (!model.isSupported) return 'Unsupported';
    if (isQueued) return queuedCopy;
    final baseAction = model.isInstalled ? uninstallButtonLabel : installButtonLabel;
    return isInProgress ? '${baseAction}ing...' : baseAction;
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final activeTaskStatus = context.select<QueueViewModel, OperationStatus?>(
          (vm) => vm.state.tasks.where((t) => t.packageId == id).lastOrNull?.status,
        );

        bool isQueued = activeTaskStatus == OperationStatus.queued;
        bool isInProgress = activeTaskStatus == OperationStatus.inProgress;

        return SizedBox(
          width: defaultButtonWidth,
          child: ButtonWidget.primary(
            label: _getButtonLabel(isQueued, isInProgress),
            state: !model.isSupported
                ? ButtonState.disabled
                : (isQueued || isInProgress)
                    ? ButtonState.loading
                    : ButtonState.enabled,
            onPressed: (!model.isSupported || isQueued || isInProgress)
                ? null
                : () {
                    context.read<QueueViewModel>().queueOperation(
                      packageId: id,
                      type: isCask ? PackageType.cask : PackageType.formula,
                      operation: model.isInstalled
                          ? OperationType.uninstall
                          : OperationType.install,
                    );
                  },
          ),
        );
      },
    );
  }
}
