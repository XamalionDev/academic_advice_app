import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void openDialog(BuildContext context, String title, String content) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        FilledButton(onPressed: () => context.pop(), child: const Text('Aceptar'))
      ],
    ),
  );
}