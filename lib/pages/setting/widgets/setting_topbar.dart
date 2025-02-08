import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// CreateDate: 2025/2/7 14:29
/// Author: Lee
/// Description:

class SettingTopBar extends AppBar {
  SettingTopBar({
    super.key,
    String? title,
    bool super.centerTitle = true,
    Color super.backgroundColor = Colors.transparent,
    super.actions,
  }) : super(
          leading: IconButton(
            onPressed: Get.back,
            icon: const Icon(CupertinoIcons.chevron_left),
          ),
          title: Text(
            title ?? '',
            style: const TextStyle(
              fontSize: 14.0,
              color: Color(0xFF161823),
              fontWeight: FontWeight.bold,
            ),
          ),
        );
}
