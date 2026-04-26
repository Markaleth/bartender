import 'package:bartender/core/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:bartender/core/constants/app_strings.dart';

class BrewCard extends StatelessWidget {
  final String title;
  final String version;
  final String description;
  final VoidCallback? onInstall;

  const BrewCard({
    super.key,
    required this.title,
    required this.version,
    required this.description,
    this.onInstall,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: spacingL),
      child: Padding(
        padding: const EdgeInsets.all(spacingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            Text(version, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: spacingM),
            Text(description, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: spacingL),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: onInstall,
                child: const Text(actionInstall),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
