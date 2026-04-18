
import 'package:bar/theme/bartender_layout.dart';
import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  final String label;
  final bool isActive;

  const StatusBadge({super.key, required this.label, this.isActive = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isActive ? BartenderColors.secondary.withValues(alpha: 0.2) : Colors.grey.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: isActive ? BartenderColors.secondary : Colors.grey,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? BartenderColors.secondary : Colors.grey,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}