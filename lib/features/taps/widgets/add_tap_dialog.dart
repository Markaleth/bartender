import 'package:flutter/material.dart';
import 'package:bartender/core/constants/app_colors.dart';
import 'package:bartender/core/constants/dimensions.dart';
import 'package:bartender/core/utils/string_utils.dart';
import 'package:bartender/features/taps/widgets/add_tap_dialog_widgets/add_tap_dialog_header.dart';
import 'package:bartender/features/taps/widgets/add_tap_dialog_widgets/add_tap_dialog_body.dart';
import 'package:bartender/features/taps/widgets/add_tap_dialog_widgets/add_tap_dialog_footer.dart';

class AddTapDialog extends StatefulWidget {
  final void Function(String name, String? customUrl) onAddTap;

  const AddTapDialog({super.key, required this.onAddTap});

  @override
  State<AddTapDialog> createState() => _AddTapDialogState();
}

class _AddTapDialogState extends State<AddTapDialog> {
  final _repoController = TextEditingController();

  @override
  void dispose() {
    _repoController.dispose();
    super.dispose();
  }

  void _submit() {
    final input = _repoController.text.trim();
    if (input.isEmpty) return;

    final parsedName = StringUtils.parseTapName(input);
    final isCustomUrl = input.startsWith('http') || input.startsWith('git@');
    final customUrl = isCustomUrl ? input : null;

    widget.onAddTap(parsedName, customUrl);

    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(spacingM),
      child: Container(
        width: addTapDialogWidth,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(radiusL),
          border: Border.all(color: AppColors.borderNeutral),
          boxShadow: [
            BoxShadow(
              color: AppColors.background.withValues(alpha: 0.5),
              blurRadius: spacingL,
              offset: const Offset(0, radiusL),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AddTapDialogHeader(),
            AddTapDialogBody(controller: _repoController, onSubmit: _submit),
            AddTapDialogFooter(controller: _repoController, onSubmit: _submit),
          ],
        ),
      ),
    );
  }
}
