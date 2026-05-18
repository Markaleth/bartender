import 'package:flutter/material.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:bartender/data/models/tap/tap_model.dart';

class TapCard extends StatelessWidget {
  final TapModel tap;
  final bool isSyncing;
  final VoidCallback onViewPackages;
  final VoidCallback onForceSync;
  final VoidCallback onRemove;

  const TapCard({
    super.key,
    required this.tap,
    required this.isSyncing,
    required this.onViewPackages,
    required this.onForceSync,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radiusM),
        side: const BorderSide(color: AppColors.borderNeutral),
      ),
      child: Padding(
        padding: const EdgeInsets.all(spacingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _TitleWidget(tap: tap, isSyncing: isSyncing, onRemove: onRemove),
            if (tap.remote != null)
              Text(
                tap.remote!,
                style: context.bodyM.copyWith(color: AppColors.textSecondary),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

            Row(
              children: [
                if (tap.formulaNames.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(right: spacingXs),
                    child: _Badge(
                      text: '${tap.formulaNames.length} Formulae',
                      color: AppColors.secondary,
                    ),
                  ),
                if (tap.caskTokens.isNotEmpty)
                  _Badge(
                    text: '${tap.caskTokens.length} Casks',
                    color: AppColors.tertiary,
                  ),
              ],
            ),
            const SizedBox(height: spacingS),
            Text(
              'Last Sync: Placeholder',
              style: context.labelM.copyWith(color: AppColors.textSecondary),
            ),
            const Spacer(),
            _FooterWidget(
              onViewPackages: onViewPackages,
              isSyncing: isSyncing,
              onForceSync: onForceSync,
            ),
          ],
        ),
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    required this.tap,
    required this.isSyncing,
    required this.onRemove,
  });

  final TapModel tap;
  final bool isSyncing;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: spacingXs,
      children: [
        const Icon(Icons.account_tree_outlined, color: AppColors.primary),

        Expanded(
          child: Text(
            tap.name,
            style: context.titleM.copyWith(fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.delete_outline, color: AppColors.error),
          onPressed: isSyncing
              ? null
              : () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('Remove Tap'),
                      content: Text(
                        'Are you sure you want to untap ${tap.name}?',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(ctx).pop(),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                            onRemove();
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: AppColors.error,
                          ),
                          child: const Text('Remove'),
                        ),
                      ],
                    ),
                  );
                },
        ),
      ],
    );
  }
}

class _FooterWidget extends StatelessWidget {
  const _FooterWidget({
    required this.onViewPackages,
    required this.isSyncing,
    required this.onForceSync,
  });

  final VoidCallback onViewPackages;
  final bool isSyncing;
  final VoidCallback onForceSync;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(onPressed: onViewPackages, child: const Text('Browse')),
        TextButton(
          onPressed: isSyncing ? null : onForceSync,
          child: const Text('Force Sync'),
        ),
      ],
    );
  }
}

class _Badge extends StatelessWidget {
  final String text;
  final Color color;

  const _Badge({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: spacingS,
        vertical: spacingXs,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(radiusL),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Text(
        text,
        style: context.labelS.copyWith(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
