import 'package:flutter/material.dart';

class AddTapDialog extends StatelessWidget {
  final ValueChanged<String> onAddTap;

  const AddTapDialog({
    super.key,
    required this.onAddTap,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return AlertDialog(
      title: const Text('Add Tap'),
      content: TextField(
        controller: controller,
        decoration: const InputDecoration(
          hintText: 'user/repo or URL',
          border: OutlineInputBorder(),
        ),
        autofocus: true,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (controller.text.isNotEmpty) {
              onAddTap(controller.text);
            }
            Navigator.of(context).pop();
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
