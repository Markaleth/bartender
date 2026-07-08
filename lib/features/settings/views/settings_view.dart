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
        final settings = context.watch<SettingsService>();

        return Scaffold(
          appBar: AppBar(title: const Text(settingsViewTitle)),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(spacingL),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth >= widthBreakpoint;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SettingsBentoCard(
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
                    ),
                    const SizedBox(height: spacingL),
                    if (isWide)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: _EnvironmentCard(
                              settings: settings,
                              viewModel: viewModel,
                            ),
                          ),
                          const SizedBox(width: spacingL),
                          Expanded(
                            flex: 1,
                            child: _AppearanceCard(
                              settings: settings,
                              viewModel: viewModel,
                            ),
                          ),
                        ],
                      )
                    else ...[
                      _EnvironmentCard(
                        settings: settings,
                        viewModel: viewModel,
                      ),
                      const SizedBox(height: spacingL),
                      _AppearanceCard(settings: settings, viewModel: viewModel),
                    ],
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class _EnvironmentCard extends StatelessWidget {
  final SettingsService settings;
  final SettingsViewModel viewModel;

  const _EnvironmentCard({required this.settings, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return SettingsBentoCard(
      title: environmentSectionTitle,
      leadingIcon: Icons.account_tree,
      accentColor: AppColors.secondary,
      child: Column(
        children: [
          GlowyPathInput(
            path: settings.brewExecutablePath,
            onBrowse: () => _showEditPathDialog(context),
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

  void _showEditPathDialog(BuildContext context) {
    final controller = TextEditingController(text: settings.brewExecutablePath);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(editBrewPathTitle),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: editBrewPathHint,
              helperText: editBrewPathHelper,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(cancelButtonLabel),
            ),
            TextButton(
              onPressed: () {
                viewModel.setBrewExecutablePath(controller.text.trim());
                Navigator.pop(context);
              },
              child: const Text(saveButtonLabel),
            ),
          ],
        );
      },
    );
  }
}

class _AppearanceCard extends StatelessWidget {
  final SettingsService settings;
  final SettingsViewModel viewModel;

  const _AppearanceCard({required this.settings, required this.viewModel});

  @override
  Widget build(BuildContext context) {
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
