import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base_view_model.dart';

/// A base view that binds a [BaseViewModel] to the UI.
/// It automatically provides the ViewModel using `ChangeNotifierProvider`,
/// exposes the current state via the builder, and listens to the effect stream.
class BaseView<ViewModel extends BaseViewModel<S, E>, S, E>
    extends StatefulWidget {
  /// A function to create the View Model. Used if [viewModel] is not provided.
  final ViewModel Function(BuildContext context)? viewModelBuilder;

  /// An existing View Model instance. If provided, the view will not dispose it.
  final ViewModel? viewModel;

  /// A function to build the UI based on the current View Model and State.
  final Widget Function(BuildContext context, ViewModel viewModel, S state)
  builder;

  /// A callback to handle side effects emitted from the View Model's effectStream.
  final void Function(BuildContext context, E effect)? onEffect;

  /// A callback fired once during initialization.
  final void Function(ViewModel viewModel)? onModelReady;

  const BaseView({
    super.key,
    this.viewModelBuilder,
    this.viewModel,
    required this.builder,
    this.onEffect,
    this.onModelReady,
  }) : assert(
         viewModelBuilder != null || viewModel != null,
         'Either viewModelBuilder or viewModel must be provided',
       ),
       assert(
         !(viewModelBuilder != null && viewModel != null),
         'Provide only one: viewModelBuilder or viewModel',
       );

  @override
  State<BaseView<ViewModel, S, E>> createState() =>
      _BaseViewState<ViewModel, S, E>();
}

class _BaseViewState<ViewModel extends BaseViewModel<S, E>, S, E>
    extends State<BaseView<ViewModel, S, E>> {
  late ViewModel _viewModel;
  StreamSubscription<E>? _effectSubscription;

  @override
  void initState() {
    super.initState();
    _viewModel = widget.viewModel ?? widget.viewModelBuilder!(context);
    widget.onModelReady?.call(_viewModel);

    _subscribeToEffects();
  }

  @override
  void didUpdateWidget(covariant BaseView<ViewModel, S, E> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.viewModel != null && widget.viewModel != oldWidget.viewModel) {
      _effectSubscription?.cancel();
      _viewModel = widget.viewModel!;
      _subscribeToEffects();
    }
  }

  void _subscribeToEffects() {
    if (widget.onEffect != null) {
      _effectSubscription = _viewModel.effectStream.listen((effect) {
        if (mounted) {
          widget.onEffect!(context, effect);
        }
      });
    }
  }

  @override
  void dispose() {
    _effectSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget child = Consumer<ViewModel>(
      builder: (context, viewModel, _) {
        return widget.builder(context, viewModel, viewModel.state);
      },
    );
    if (widget.viewModel != null) {
      return ChangeNotifierProvider<ViewModel>.value(
        value: _viewModel,
        child: child,
      );
    } else {
      return ChangeNotifierProvider<ViewModel>(
        create: (_) => _viewModel,
        child: child,
      );
    }
  }
}
