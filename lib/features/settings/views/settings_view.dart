import 'package:bartender/core/base_view.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/core/effects/screen_effect.dart';
import 'package:bartender/core/services/settings_service.dart';
import 'package:bartender/features/settings/view_models/settings_view_model.dart';
import 'package:bartender/features/settings/widgets/cyber_font_slider_preview.dart';
import 'package:bartender/features/settings/widgets/glowy_path_input.dart';
import 'package:bartender/features/settings/widgets/ide_toggle_switch.dart';
import 'package:bartender/features/settings/widgets/settings_bento_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SettingsViewModel, SettingsState, ScreenEffect>(
      viewModelBuilder: (context) =>
          SettingsViewModel(context.read<SettingsService>()),
      builder: (context, viewModel, state) {
        return Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(spacingL),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _BehaviorCard(viewModel: viewModel),
                const SizedBox(height: spacingL),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final isWide = constraints.maxWidth >= widthBreakpoint;
                    if (isWide) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: _EnvironmentCard(viewModel: viewModel),
                          ),
                          const SizedBox(width: spacingL),
                          Expanded(
                            flex: 1,
                            child: _AppearanceCard(viewModel: viewModel),
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          _EnvironmentCard(viewModel: viewModel),
                          const SizedBox(height: spacingL),
                          _AppearanceCard(viewModel: viewModel),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _BehaviorCard extends StatelessWidget {
  final SettingsViewModel viewModel;

  const _BehaviorCard({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsService>();
    return SettingsBentoCard(
      title: behaviorSectionTitle,
      leadingIcon: Icons.memory,
      accentColor: AppColors.primary,
      child: Column(
        children: [
          IdeToggleSwitch(
            title: backgroundFetchingTitle,
            subtitle: backgroundFetchingSubtitle,
            value: settings.backgroundFetching,
            onChanged: viewModel.setBackgroundFetching,
          ),
          IdeToggleSwitch(
            title: greedyUpgradesTitle,
            subtitle: greedyUpgradesSubtitle,
            value: settings.greedyUpgrades,
            onChanged: viewModel.setGreedyUpgrades,
          ),
          IdeToggleSwitch(
            title: zapUninstallTitle,
            subtitle: zapUninstallSubtitle,
            value: settings.zapUninstallDefault,
            onChanged: viewModel.setZapUninstallDefault,
          ),
          IdeToggleSwitch(
            title: autoCleanupTitle,
            subtitle: autoCleanupSubtitle,
            value: settings.autoCleanup,
            onChanged: viewModel.setAutoCleanup,
          ),
        ],
      ),
    );
  }
}

class _EnvironmentCard extends StatelessWidget {
  final SettingsViewModel viewModel;

  const _EnvironmentCard({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsService>();
    return SettingsBentoCard(
      title: environmentSectionTitle,
      leadingIcon: Icons.account_tree,
      accentColor: AppColors.secondary,
      child: Column(
        children: [
          GlowyPathInput(
            path: settings.brewExecutablePath,
            onChanged: viewModel.setBrewExecutablePath,
          ),
          const SizedBox(height: spacingS),
          IdeToggleSwitch(
            title: suppressEnvHintsTitle,
            subtitle: suppressEnvHintsSubtitle,
            value: settings.suppressEnvHints,
            onChanged: viewModel.setSuppressEnvHints,
          ),
          IdeToggleSwitch(
            title: disableAnalyticsTitle,
            subtitle: disableAnalyticsSubtitle,
            value: settings.disableAnalytics,
            onChanged: viewModel.setDisableAnalytics,
          ),
        ],
      ),
    );
  }
}

class _AppearanceCard extends StatelessWidget {
  final SettingsViewModel viewModel;

  const _AppearanceCard({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsService>();
    return SettingsBentoCard(
      title: appearanceSectionTitle,
      leadingIcon: Icons.palette,
      accentColor: AppColors.tertiary,
      child: CyberFontSliderPreview(
        fontSize: settings.terminalFontSize,
        onChanged: viewModel.setTerminalFontSize,
      ),
    );
  }
}
