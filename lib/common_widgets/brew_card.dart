import 'package:bartender/core/constants/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:bartender/core/constants/app_strings.dart';

class BrewCard extends StatelessWidget {
  final String title;
  

  final VoidCallback? onInstall;

  const BrewCard({super.key, required this.title, this.onInstall});

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
              Text(title, style: Theme.of(context).textTheme.titleMedium),
              Text(title, style: Theme.of(context).textTheme.titleMedium),
              Text(title, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: spacingL),
              Spacer(),
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
