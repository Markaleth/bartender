import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';
import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/common_widgets/package_icon/package_icon.dart';

class BrewCard extends StatelessWidget {
  final String title;
  final String? description;
  final String version;
  final String? homepage;
  final bool isCask;

  final VoidCallback? onInstall;

  const BrewCard({
    super.key,
    required this.title,
    this.onInstall,
    required this.description,
    required this.version,
    this.homepage,
    this.isCask = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: spacingM),
      child: Card(
        margin: const EdgeInsets.only(bottom: spacingL),
        child: Padding(
          padding: const EdgeInsets.all(spacingL),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PackageIcon(
                    name: title,
                    homepage: homepage,
                    isCask: isCask,
                    size: spacingXl,
                  ),
                  const SizedBox(width: spacingS),
                  Expanded(
                    child: SizedBox(
                      height: spacing2Xl,
                      child: Text(
                        title,
                        style: context.titleM,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: spacingM),
              Text(
                description ?? '',
                style: context.labelL,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              Text(
                'Version: $version',
                style: context.labelM,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: spacingM),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: onInstall,
                  child: const Text(actionInstall),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
