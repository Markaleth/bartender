import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';

class CollapsedWidget extends StatelessWidget {
  const CollapsedWidget({
    super.key,
    required this.inProgressCount,
    required this.toggleDrawer,
  });

  final int inProgressCount;
  final VoidCallback toggleDrawer;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: toggleDrawer,
        borderRadius: BorderRadius.circular(radiusL),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacingM),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (inProgressCount > 0)
                    const Padding(
                      padding: EdgeInsets.only(right: spacingS),
                      child: SizedBox(
                        width: spacingS,
                        height: spacingS,
                        child: CircularProgressIndicator(
                          strokeWidth: thicknessS,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  Text(
                    '$inProgressCount In Progress',
                    style: context.labelM.copyWith(color: AppColors.primary),
                  ),
                ],
              ),
              const Icon(Icons.expand_less, color: AppColors.primary),
            ],
          ),
        ),
      ),
    );
  }
}
