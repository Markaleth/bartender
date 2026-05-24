import 'package:bartender/common_widgets/icon_widget.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/app_icons.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:flutter/widgets.dart';

//todo: extend component to handle all health related notices (deprecated, missing deps, etc)
class PackageHealthWidget extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  const PackageHealthWidget({
    super.key,
    this.padding = const EdgeInsets.symmetric(
      horizontal: spacingM,
      vertical: spacingS,
    ),
  });

  @override
  Widget build(BuildContext context) => Container(
    padding: padding,
    decoration: BoxDecoration(
      color: AppColors.tertiary.withValues(alpha: 0.2),
      borderRadius: BorderRadius.circular(radiusM),
      border: Border.all(color: AppColors.tertiary),
    ),
    child: const Row(
      children: [
        IconWidget(
          assetName: deprecateIcon,
          color: AppColors.tertiary,
          size: iconSizeL,
        ),
        SizedBox(width: spacingS),
        Text(
          'This package is no longer maintained.',
          style: TextStyle(color: AppColors.tertiary),
        ),
      ],
    ),
  );
}
