import 'package:bartender/core/constants/app_strings.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/core/utils/shell_utils.dart';
import 'package:bartender/core/utils/string_utils.dart';
import 'package:bartender/core/utils/url_launcer_utils.dart';
import 'package:bartender/data/models/tap/tap_model.dart';
import 'package:bartender/domain/repositories/homebrew_repository_interface.dart';
import 'package:bartender/features/taps/widgets/tap_card_widgets/tap_card_stats_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TapCardBody extends StatelessWidget {
  final TapModel tap;

  const TapCardBody({super.key, required this.tap});

  @override
  Widget build(BuildContext context) {
    final pkgCount = [
      if (tap.formulaNames.isNotEmpty) '${tap.formulaNames.length} formulae',
      if (tap.caskTokens.isNotEmpty) '${tap.caskTokens.length} casks',
    ].join(', ');

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(spacingM),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final itemWidth = (constraints.maxWidth - spacingM) / 2;
            return Wrap(
              spacing: spacingM,
              runSpacing: spacingM,
              children: [
                SizedBox(
                  width: itemWidth,
                  child: TapStatText(
                    title: tapCardPackagesTitle,
                    value: pkgCount,
                  ),
                ),
                SizedBox(
                  width: itemWidth,
                  child: TapStatAsync<int>(
                    title: tapInstallSizeLabel,
                    // Closure ensures Future is only created once inside initState
                    fetcher: () => context
                        .read<HomebrewRepositoryInterface>()
                        .getTapInstalledSize(tap.name),
                    formatData: StringUtils.formatSize,
                  ),
                ),
                SizedBox(
                  width: itemWidth,
                  child: TapStatAsync<DateTime?>(
                    title: tapLastModifiedLabel,
                    fetcher: () => ShellUtils.getModifiedDate(tap.path),
                    formatData: StringUtils.formatTimeAgo,
                  ),
                ),
                SizedBox(
                  width: itemWidth,
                  child: TapStatClickable(
                    title: tapInstallPathLabel,
                    value: tap.path,
                    onTap: () => ShellUtils.openDirectory(tap.path),
                  ),
                ),
                if (tap.remote != null)
                  SizedBox(
                    width: itemWidth,
                    child: TapStatClickable(
                      title: tapSourceLabel,
                      value: tap.remote!,
                      onTap: () => UrlLauncherUtils.launch(tap.remote!),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
