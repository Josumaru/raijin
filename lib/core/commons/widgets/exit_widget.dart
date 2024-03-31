import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showExitDialog({
  required BuildContext context,
  required String title,
  required String content,
  required VoidCallback onPressed,
}) {
  showDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel')),
        CupertinoDialogAction(
          onPressed: () {
            onPressed();
          },
          child: const Text('Yes'),
        ),
      ],
    ),
  );
}