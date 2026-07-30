import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';

// 1. Base Layout
class TapStat extends StatelessWidget {
  final String title;
  final Widget child;

  const TapStat({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.titleM.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        child,
      ],
    );
  }
}

// 2. Pure Text Variant
class TapStatText extends StatelessWidget {
  final String title;
  final String value;

  const TapStatText({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return TapStat(
      title: title,
      child: Text(
        value,
        style: context.labelS.copyWith(color: AppColors.textSecondary),
      ),
    );
  }
}

// 3. Clickable Variant
class TapStatClickable extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback onTap;

  const TapStatClickable({
    super.key,
    required this.title,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TapStat(
      title: title,
      child: Tooltip(
        message: value,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: onTap,
            child: Text(
              value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.labelS.copyWith(
                color: AppColors.primary,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// 4. Smart Async Variant (Caches Future to stop rebuild flicker)
class TapStatAsync<T> extends StatefulWidget {
  final String title;
  final Future<T> Function() fetcher; // Pass function, not future
  final String Function(T?) formatData;

  const TapStatAsync({
    super.key,
    required this.title,
    required this.fetcher,
    required this.formatData,
  });

  @override
  State<TapStatAsync<T>> createState() => _TapStatAsyncState<T>();
}

class _TapStatAsyncState<T> extends State<TapStatAsync<T>> {
  late final Future<T> _cachedFuture;

  @override
  void initState() {
    super.initState();
    // Cache future once on init. Parent rebuilds won't re-trigger it.
    _cachedFuture = widget.fetcher();
  }

  @override
  Widget build(BuildContext context) {
    return TapStat(
      title: widget.title,
      child: FutureBuilder<T>(
        future: _cachedFuture,
        builder: (context, snapshot) {
          return Text(
            widget.formatData(snapshot.data),
            style: context.labelS.copyWith(color: AppColors.textSecondary),
          );
        },
      ),
    );
  }
}
