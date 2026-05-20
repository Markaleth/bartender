import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/features/library/view_models/library_view_model.dart';
import 'package:bartender/features/library/widgets/global_health_status_widget.dart';
import 'package:bartender/features/library/widgets/explorer_pane.dart';
import 'package:bartender/features/library/widgets/inspector_pane.dart';
import 'package:bartender/data/db/database_interface.dart';
import 'package:bartender/data/repository/package_repository.dart';
import 'package:bartender/data/shell/brew_service.dart';

import 'package:bartender/core/services/install_status_notifiers.dart';
import 'package:bartender/core/base_view.dart';
import 'package:bartender/core/effects/screen_effect.dart';
import 'package:bartender/features/library/models/library_state.dart';
import 'package:bartender/features/queue/view_models/queue_view_model.dart';
import 'package:bartender/core/models/operation_task/operation_task.dart';
import 'package:bartender/features/library/widgets/health_dashboard_modal.dart';

class LibraryView extends StatelessWidget {
  const LibraryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<LibraryViewModel, LibraryState, ScreenEffect>(
      viewModelBuilder: (context) => LibraryViewModel(
        db: context.read<DatabaseInterface>(),
        brewService: context.read<BrewService>(),
        statusNotifier: context.read<PackageStatusNotifier>(),
        packageRepository: context.read<PackageRepository>(),
      )..init(),
      builder: (context, viewModel, state) =>
          _LibraryCommandCenterContent(state: state),
    );
  }
}

class _LibraryCommandCenterContent extends StatelessWidget {
  final LibraryState state;

  const _LibraryCommandCenterContent({required this.state});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(spacingM),
      child: Column(
        spacing: spacingM,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalHealthStatusWidget(
            healthState: state.healthState,
            onAutoremove: () {
              context.read<QueueViewModel>().queueOperation(
                packageId: 'system',
                type: PackageType.system,
                operation: OperationType.autoremove,
              );
            },
            onOpenDashboard: () {
              showDialog(
                context: context,
                builder: (dialogContext) => HealthDashboardModal(
                  healthState: state.healthState,
                  onUpdateAll: () {
                    context.read<QueueViewModel>().queueOperation(
                      packageId: 'all',
                      type: PackageType.system,
                      operation: OperationType.upgrade,
                    );
                  },
                  onCleanup: () {
                    context.read<QueueViewModel>().queueOperation(
                      packageId: 'system',
                      type: PackageType.system,
                      operation: OperationType.cleanup,
                    );
                  },
                  onRemoveOrphans: () {
                    context.read<QueueViewModel>().queueOperation(
                      packageId: 'system',
                      type: PackageType.system,
                      operation: OperationType.autoremove,
                    );
                  },
                ),
              );
            },
          ),
          // Dual-Pane View
          Expanded(
            child: Row(
              children: [
                const Expanded(flex: 1, child: ExplorerPane()),
                const SizedBox(width: spacingM),
                const Expanded(flex: 2, child: InspectorPane()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
