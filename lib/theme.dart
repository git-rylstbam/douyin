import 'package:flutter/material.dart';

import 'utils/storage_util.dart';

/// CreateDate: 2025/1/16 13:54
/// Author: Lee
/// Description:

const fonts = ['汉仪篆书繁', '思源黑体'];

class ThemeController {
  String? font = StorageUtil.read(StorageKeyEnum.font);

  ThemeData get light => ThemeData(
        fontFamily: font ?? '汉仪篆书繁',
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            hoverColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            overlayColor: Colors.transparent,
          ),
        ),
      );
}
