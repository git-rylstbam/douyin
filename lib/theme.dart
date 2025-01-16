import 'package:flutter/material.dart';

/// CreateDate: 2025/1/16 13:54
/// Author: Lee
/// Description:

const fonts = ['汉仪篆书繁', '思源黑体'];

class ThemeController {
  String? font;

  ThemeData get light => ThemeData(
        fontFamily: font ?? '汉仪篆书繁',
      );
}
