import 'package:bartender/common_widgets/icon_widget.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/app_icons.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Future<SvgPicture> pumpIcon(WidgetTester tester, IconWidget icon) async {
    await tester.pumpWidget(
      Directionality(textDirection: TextDirection.ltr, child: icon),
    );
    return tester.widget<SvgPicture>(find.byType(SvgPicture));
  }

  group('IconWidget', () {
    testWidgets('tints icons with the resolved colour by default', (
      tester,
    ) async {
      final svg = await pumpIcon(
        tester,
        const IconWidget(assetName: brewIcon, color: AppColors.primary),
      );
      expect(
        svg.colorFilter,
        const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
      );
    });

    testWidgets('keeps the SVG colours when tinted is false', (tester) async {
      final svg = await pumpIcon(
        tester,
        const IconWidget(assetName: appIcon, tinted: false),
      );
      expect(svg.colorFilter, isNull);
    });
  });
}
