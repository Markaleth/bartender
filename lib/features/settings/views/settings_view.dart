import 'package:bartender/core/base_view.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/core/effects/screen_effect.dart';
import 'package:bartender/core/services/settings_service.dart';
import 'package:bartender/features/settings/view_models/settings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SettingsViewModel, SettingsState, ScreenEffect>(
      viewModelBuilder: (context) => SettingsViewModel(context.read<SettingsService>()),
      builder: (context, viewModel, state) {
        // Watch the SettingsService directly to rebuild when settings change
        final settings = context.watch<SettingsService>();

        return Scaffold(
          appBar: AppBar(
            title: const Text('Settings & Preferences'),
          ),
          body: ListView(
            padding: const EdgeInsets.all(spacingL),
            children: [
              _buildSectionHeader(context, 'Homebrew Behavior'),
              SwitchListTile(
                title: const Text('Background Fetching'),
                subtitle: const Text('Automatically check for updates on startup'),
                value: settings.backgroundFetching,
                onChanged: viewModel.setBackgroundFetching,
              ),
              SwitchListTile(
                title: const Text('Greedy Upgrades'),
                subtitle: const Text('Include auto-updating casks in upgrades (--greedy)'),
                value: settings.greedyUpgrades,
                onChanged: viewModel.setGreedyUpgrades,
              ),
              SwitchListTile(
                title: const Text('Zap Uninstall Default'),
                subtitle: const Text('Remove all files associated with a cask by default (--zap)'),
                value: settings.zapUninstallDefault,
                onChanged: viewModel.setZapUninstallDefault,
              ),
              SwitchListTile(
                title: const Text('Auto Cleanup'),
                subtitle: const Text('Run brew cleanup automatically after batch operations'),
                value: settings.autoCleanup,
                onChanged: viewModel.setAutoCleanup,
              ),
              const Divider(),
              _buildSectionHeader(context, 'Environment'),
              SwitchListTile(
                title: const Text('Suppress Environment Hints'),
                subtitle: const Text('Hide HOMEBREW_NO_ENV_HINTS messages'),
                value: settings.suppressEnvHints,
                onChanged: viewModel.setSuppressEnvHints,
              ),
              SwitchListTile(
                title: const Text('Disable Analytics'),
                subtitle: const Text('Opt out of Homebrew analytics (HOMEBREW_NO_ANALYTICS)'),
                value: settings.disableAnalytics,
                onChanged: viewModel.setDisableAnalytics,
              ),
              ListTile(
                title: const Text('Custom Brew Executable Path'),
                subtitle: Text(settings.brewExecutablePath.isEmpty ? 'Auto-resolved' : settings.brewExecutablePath),
                trailing: const Icon(Icons.edit, size: 20),
                onTap: () {
                  _showEditPathDialog(context, settings, viewModel);
                },
              ),
              const Divider(),
              _buildSectionHeader(context, 'Appearance'),
              ListTile(
                title: const Text('Terminal Font Size'),
                subtitle: Text('${settings.terminalFontSize.toInt()} pt'),
                trailing: DropdownButton<double>(
                  value: settings.terminalFontSize,
                  items: [10.0, 12.0, 14.0, 16.0, 18.0].map((size) {
                    return DropdownMenuItem<double>(
                      value: size,
                      child: Text(size.toString()),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) viewModel.setTerminalFontSize(value);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: spacingM, horizontal: spacingM),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  void _showEditPathDialog(BuildContext context, SettingsService settings, SettingsViewModel viewModel) {
    final controller = TextEditingController(text: settings.brewExecutablePath);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Brew Path'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'e.g. /opt/homebrew/bin/brew',
              helperText: 'Leave empty for auto-resolution',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                viewModel.setBrewExecutablePath(controller.text.trim());
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
