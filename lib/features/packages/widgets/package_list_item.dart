import 'package:bartender/common_widgets/package_icon/package_icon.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/core/utils/string_utils.dart';
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
    final tag = StringUtils.extractVariantTag(name, id);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isLargeScreen = constraints.maxWidth >= 600;

        Widget titleWidget = Text(name);
        if (tag != null) {
          titleWidget = Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(name),
              const SizedBox(width: spacingS),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: StringUtils.getVariantColor(tag).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: StringUtils.getVariantColor(tag).withValues(alpha: 0.5),
                  ),
                ),
                child: Text(
                  tag,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: StringUtils.getVariantColor(tag),
                  ),
                ),
              ),
            ],
          );
        }

        return ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: spacingL,
            vertical: spacingS,
          ),
          leading: PackageIcon(name: id, homepage: homepage, isCask: isCask),
          title: titleWidget,
          subtitle: isLargeScreen
              ? Text(
                  id,
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                )
              : null,
        );
      },
    );
  }
}
