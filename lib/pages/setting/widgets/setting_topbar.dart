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
    Color leadingColor = Colors.black,
    Color titleColor = const Color(0xFF161823),
    bool super.centerTitle = true,
    Color super.backgroundColor = Colors.transparent,
    super.actions,
  }) : super(
          leading: IconButton(
            onPressed: Get.back,
            icon: Icon(CupertinoIcons.chevron_left, color: leadingColor),
          ),
          title: Text(
            title ?? '',
            style: TextStyle(
              fontSize: 14.0,
              color: titleColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
}
