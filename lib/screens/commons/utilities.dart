import 'package:flutter/material.dart';

enum MessageType { warning, error, info }

void showMessageDialog(BuildContext context, String title, MessageType type) {
  IconData icon;
  Color color;

  switch (type) {
    case MessageType.warning:
      icon = Icons.warning;
      color = Colors.orange;
      break;
    case MessageType.error:
      icon = Icons.error;
      color = Colors.red;
      break;
    case MessageType.info:
      icon = Icons.info;
      color = Colors.blue;
      break;
  }

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Row(
        children: [
          Icon(icon, color: color),
          SizedBox(width: 10),
          Text(title),
        ],
      ),
      content: Text('This is a $title message.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('OK'),
        ),
      ],
    ),
  );
}
