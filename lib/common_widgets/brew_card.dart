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
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                Text(version, style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            const SizedBox(height: 8),
            Text(description, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 16),
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