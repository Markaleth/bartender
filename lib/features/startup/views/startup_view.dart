import 'package:bartender/core/base_view.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/core/effects/screen_effect.dart';
import 'package:bartender/data/repository/homebrew_repository.dart';
import 'package:bartender/data/repository/package_repository.dart';
import 'package:bartender/features/startup/models/startup_state.dart';
import 'package:bartender/features/startup/view_models/startup_view_model.dart';
import 'package:bartender/theme/bartender_context.dart';
import 'package:flutter/material.dart';
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
          backgroundColor: effect.isError ? Colors.red : null,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<StartupViewModel, StartupState, ScreenEffect>(
      viewModelBuilder: (context) => StartupViewModel(
        context.read<HomebrewRepository>(),
        context.read<PackageRepository>(),
      ),
      onModelReady: (viewModel) => viewModel.initialize(),
      onEffect: _onEffect,
      builder: (context, viewModel, state) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (state.isLoading) ...[
                  const CircularProgressIndicator(),
                  const SizedBox(height: spacingL),
                ],
                Text(
                  state.statusText,
                  style: context.titleM,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
