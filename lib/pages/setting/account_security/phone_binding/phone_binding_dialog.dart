import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../routes.dart';

/// CreateDate: 2025/2/19 11:00
/// Author: Lee
/// Description:

class PhoneBindingDialog extends StatelessWidget {
  const PhoneBindingDialog({super.key});

  @override
  Widget build(BuildContext context) => CupertinoAlertDialog(
        title: const Text(
          '更换已绑定的手机号？',
          style: TextStyle(
            fontSize: 14.0,
            color: Color(0xFF161823),
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10.0),
            Text(
              '当前绑定的手机号码为 159****1028',
              style: TextStyle(fontSize: 12.0, color: Color(0xFF4F5159)),
            ),
          ],
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: Navigator.of(context).pop,
            child: const Text(
              '取消',
              style: TextStyle(fontSize: 14.0, color: Color(0xFF4F5159)),
            ),
          ),
          CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).pop();
              Get.toNamed(Routes.phone_binding);
            },
            child: const Text(
              '更换',
              style: TextStyle(fontSize: 14.0, color: Color(0xFF161823)),
            ),
          ),
        ],
      );
}
