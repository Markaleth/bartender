import 'package:bartender/features/library/models/library_state.dart';
import 'package:bartender/features/library/widgets/inspector_pane/emprt_inspector_pane_widget.dart';
import 'package:bartender/features/library/widgets/inspector_pane/package_pane_widget.dart';
import 'package:bartender/features/library/widgets/inspector_pane/tap_pane_widget.dart';
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
      empty: (_) => const EmptyInspectorPaneWidget(),
      tap: (tapState) =>
          TapPaneWidget(state: tapState, packagesByTap: state.packagesByTap),
      package: (packageState) => PackagePaneWindget(state: packageState),
    );
  }
}
