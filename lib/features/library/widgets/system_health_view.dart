import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bartender/core/base_view.dart';
import 'package:bartender/core/effects/screen_effect.dart';
import 'package:bartender/data/shell/brew_service.dart';
import 'package:bartender/core/services/install_status_notifiers.dart';
import 'package:bartender/features/library/models/system_health_state.dart';
import 'package:bartender/features/library/view_models/health_view_model.dart';
import 'package:bartender/features/library/widgets/global_health_status_widget.dart';
import 'package:bartender/features/library/widgets/health_dashboard_modal.dart';
import 'package:bartender/features/queue/view_models/queue_view_model.dart';
import 'package:bartender/core/models/operation_task/operation_task.dart';

class SystemHealthView extends StatelessWidget {
  const SystemHealthView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HealthViewModel, SystemHealthState, ScreenEffect>(
      viewModelBuilder: (context) => HealthViewModel(
        brewService: context.read<BrewService>(),
        statusNotifier: context.read<PackageStatusNotifier>(),
        systemStatusNotifier: context.read<SystemStatusNotifier>(),
      )..fetchSystemHealth(),
      builder: (context, viewModel, state) {
        return GlobalHealthStatusWidget(
          healthState: state,
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
              builder: (dialogContext) =>
                  ChangeNotifierProvider<HealthViewModel>.value(
                    value: viewModel,
                    child: Consumer<HealthViewModel>(
                      builder: (context, vm, _) => HealthDashboardModal(
                        healthState: vm.state,
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
                    ),
                  ),
            );
          },
        );
      },
    );
  }
}
