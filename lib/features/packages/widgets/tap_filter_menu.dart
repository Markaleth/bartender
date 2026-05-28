import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/core/services/tap_filter_notifier.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TapFilterMenu extends StatelessWidget {
  final Iterable<String> uniqueTapNames;

  const TapFilterMenu({super.key, required this.uniqueTapNames});

  @override
  Widget build(BuildContext context) {
    final tapNotifier = context.watch<TapFilterNotifier>();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: spacingM),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(radiusXl),
        border: Border.all(color: AppColors.borderNeutral),
      ),
      child: MenuAnchor(
        builder: (context, controller, child) {
          final text = tapNotifier.selectedTaps.isEmpty
              ? 'Filter by Tap'
              : tapNotifier.selectedTaps.length == 1
              ? tapNotifier.selectedTaps.first
              : '${tapNotifier.selectedTaps.length} Taps';

          return _LabelWidget(
            text: text,
            tapNotifier: tapNotifier,
            controller: controller,
          );
        },
        menuChildren: [
          ...uniqueTapNames.map((tapName) {
            final isSelected = tapNotifier.selectedTaps.contains(tapName);
            return CheckboxMenuButton(
              value: isSelected,
              onChanged: (bool? checked) {
                tapNotifier.toggleFilter(tapName);
              },
              closeOnActivate: false,
              child: Text(
                tapName,
                style: context.bodyM.copyWith(
                  color: isSelected
                      ? AppColors.secondary
                      : AppColors.textPrimary,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _LabelWidget extends StatelessWidget {
  final String text;
  final TapFilterNotifier tapNotifier;
  final MenuController controller;

  const _LabelWidget({
    required this.text,
    required this.tapNotifier,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (controller.isOpen) {
          controller.close();
        } else {
          controller.open();
        }
      },
      borderRadius: BorderRadius.circular(radiusXl),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: spacingS,
          horizontal: spacingXs,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: context.bodyM.copyWith(
                color: tapNotifier.selectedTaps.isEmpty
                    ? AppColors.textSecondary
                    : AppColors.secondary,
              ),
            ),
            const SizedBox(width: spacingS),
            const Icon(Icons.arrow_drop_down, color: AppColors.onSurface),
          ],
        ),
      ),
    );
  }
}
