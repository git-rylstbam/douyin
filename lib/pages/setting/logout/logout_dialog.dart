import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// CreateDate: 2025/2/10 11:49
/// Author: Lee
/// Description:

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) => CupertinoAlertDialog(
        title: const Text(
          '退出？',
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
          '@林落凝',
          style: TextStyle(fontSize: 12.0, color: Colors.black),
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: Navigator.of(context).pop,
            child: const Text(
              '取消',
              style: TextStyle(
                fontSize: 14.0,
                color: Color(0xFF157CFC),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CupertinoDialogAction(
            onPressed: Navigator.of(context).pop,
            child: const Text(
              '确认',
              style: TextStyle(
                fontSize: 14.0,
                color: Color(0xFF157CFC),
              ),
            ),
          ),
        ],
      );
}
