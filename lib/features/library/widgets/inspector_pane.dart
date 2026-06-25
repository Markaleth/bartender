import 'package:bartender/features/library/models/library_state.dart';
import 'package:bartender/features/library/widgets/inspector_pane/inspector_pane_empty_widget.dart';
import 'package:bartender/features/library/widgets/inspector_pane/inspector_pane_package_widget.dart';
import 'package:bartender/features/library/widgets/inspector_pane/inspector_pane_tap_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bartender/features/library/view_models/library_view_model.dart';

class InspectorPane extends StatelessWidget {
  const InspectorPane({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LibraryViewModel>();
    final state = viewModel.state;

    return state.inspectorState.map(
      empty: (_) => const InspectorPaneEmptyWidget(),
      tap: (tapState) => InspectorPaneTapWidget(
        state: tapState,
        packagesByTap: state.packagesByTap,
      ),
      package: (packageState) =>
          InspectorPanePackageWindget(state: packageState),
    );
  }
}
