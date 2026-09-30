import 'package:bartender/core/base_view.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/effects/screen_effect.dart';
import 'package:bartender/core/services/settings_service.dart';
import 'package:bartender/data/shell/brew_service.dart';
import 'package:bartender/domain/repositories/homebrew_repository_interface.dart';
import 'package:bartender/features/queue/view_models/queue_view_model.dart';
import 'package:bartender/features/startup/models/startup_state.dart';
import 'package:bartender/features/startup/view_models/startup_view_model.dart';
import 'package:bartender/features/startup/widgets/homebrew_install_dialog.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class StartupView extends StatelessWidget {
  const StartupView({super.key});

  void _onEffect(BuildContext context, ScreenEffect effect) {
    if (effect is NavigateToScreenEffect) {
      Navigator.of(
        context,
      ).pushReplacementNamed(effect.routeName, arguments: effect.arguments);
    } else if (effect is ShowToastEffect) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(effect.message),
          backgroundColor: effect.isError ? AppColors.error : null,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<StartupViewModel, StartupState, ScreenEffect>(
      viewModelBuilder: (context) => StartupViewModel(
        context.read<HomebrewRepositoryInterface>(),
        context.read<QueueViewModel>(),
        context.read<SettingsService>(),
        context.read<BrewService>(),
      ),
      onModelReady: (viewModel) => viewModel.initialize(),
      onEffect: _onEffect,
      builder: (context, viewModel, state) {
        return CallbackShortcuts(
          bindings: {
            const SingleActivator(LogicalKeyboardKey.escape): () {
              if (state.isBrewMissing) {
                viewModel.exitApp();
              }
            },
          },
          child: Focus(
            autofocus: true,
            child: Scaffold(
              body: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (state.isLoading) ...[
                          const CircularProgressIndicator(),
                          const SizedBox(height: spacingL),
                        ],
                        Text(state.statusText, style: context.titleM),
                      ],
                    ),
                  ),
                  if (state.isBrewMissing) ...[
                    ModalBarrier(
                      dismissible: false,
                      color: AppColors.background.withValues(alpha: 0.7),
                    ),
                    Center(
                      child: HomebrewInstallDialog(
                        isInstalling: state.isInstallingBrew,
                        onInstall: viewModel.installHomebrew,
                        onExit: viewModel.exitApp,
                        onCheckAgain: viewModel.checkBrewInstalledAgain,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
