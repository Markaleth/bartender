import 'package:bartender/common_widgets/package_icon/package_icon.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:flutter/material.dart';

class PackageListItem extends StatelessWidget {
  final String id;
  final String name;
  final String? homepage;
  final bool isCask;

  const PackageListItem({
    super.key,
    required this.id,
    required this.name,
    this.homepage,
    required this.isCask,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: spacingL,
        vertical: spacingS,
      ),
      leading: PackageIcon(
        name: id,
        homepage: homepage,
        isCask: isCask,
      ),
      title: Text(name),
    );
  }
}
