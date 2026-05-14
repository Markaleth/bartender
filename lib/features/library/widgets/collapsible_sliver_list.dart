import 'package:bartender/core/constants/durations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CollapsibleSliverList<T> extends StatefulWidget {
  final List<T> items;
  final bool isExpanded;
  final Widget Function(
    BuildContext context,
    T item,
    Animation<double> animation,
  )
  itemBuilder;

  const CollapsibleSliverList({
    super.key,
    required this.items,
    required this.isExpanded,
    required this.itemBuilder,
  });

  @override
  State<CollapsibleSliverList<T>> createState() =>
      _CollapsibleSliverListState<T>();
}

class _CollapsibleSliverListState<T> extends State<CollapsibleSliverList<T>> {
  GlobalKey<SliverAnimatedListState> _listKey =
      GlobalKey<SliverAnimatedListState>();
  late List<T> _items;

  @override
  void initState() {
    super.initState();
    _items = widget.isExpanded ? List.from(widget.items) : <T>[];
  }

  @override
  void didUpdateWidget(CollapsibleSliverList<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.isExpanded != widget.isExpanded) {
      if (widget.isExpanded) {
        // Expand
        _items = List.from(widget.items);
        if (_items.isNotEmpty) {
          _listKey.currentState?.insertAllItems(
            0,
            _items.length,
            duration: defaultAnimationDuration,
          );
        }
      } else {
        // Collapse
        final oldItems = List<T>.from(_items);
        for (int i = oldItems.length - 1; i >= 0; i--) {
          final itemToRemove = oldItems[i];
          _listKey.currentState?.removeItem(
            i,
            (context, animation) =>
                widget.itemBuilder(context, itemToRemove, animation),
            duration: defaultAnimationDuration,
          );
        }
        _items.clear();
      }
    } else if (widget.isExpanded &&
        !listEquals(oldWidget.items, widget.items)) {
      // If the list changes while expanded (e.g., via search filtering) Instantly rebuild the list with the new items to avoid complex diffing.
      _listKey = GlobalKey<SliverAnimatedListState>();
      _items = List.from(widget.items);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverAnimatedList(
      key: _listKey,
      initialItemCount: _items.length,
      itemBuilder: (context, index, animation) {
        return widget.itemBuilder(context, _items[index], animation);
      },
    );
  }
}
