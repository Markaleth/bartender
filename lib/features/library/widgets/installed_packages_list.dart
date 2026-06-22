import 'package:bartender/common_widgets/horizontal_divider.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/data/models/cask/cask_model.dart';
import 'package:bartender/data/models/formula/formula_model.dart';
import 'package:bartender/features/library/view_models/library_view_model.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InstalledPackagesList extends StatelessWidget {
  final List<dynamic> packages;

  const InstalledPackagesList({super.key, required this.packages});

  @override
  Widget build(BuildContext context) {
    if (packages.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: spacingL),
        Text(
          installedPackagesCopy,
          style: context.bodyM.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: spacingS),
        DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(radiusS),
            border: Border.all(color: AppColors.borderNeutral),
          ),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: packages.length,
            separatorBuilder: (context, index) => const HorizontalDivider(),
            itemBuilder: (context, index) {
              return _PackageListTile(package: packages[index]);
            },
          ),
        ),
      ],
    );
  }
}

class _PackageListTile extends StatelessWidget {
  final dynamic package;

  const _PackageListTile({required this.package});

  @override
  Widget build(BuildContext context) {
    final isCask = package is CaskModel;
    final name = isCask ? package.token : (package as FormulaModel).name;
    final version = isCask
        ? package.version
        : (package as FormulaModel).versions.stable;

    return Material(
      color: Colors.transparent,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: spacingM),
        dense: true,

        title: Text(
          name,
          style: context.bodyM.copyWith(color: AppColors.textPrimary),
        ),
        trailing: Text(
          version,
          style: context.labelM.copyWith(color: AppColors.textSecondary),
        ),
        onTap: () {
          context.read<LibraryViewModel>().selectPackage(package);
        },
      ),
    );
  }
}
