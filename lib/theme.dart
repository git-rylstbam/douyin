import 'package:flutter/material.dart';

import 'utils/storage_util.dart';

/// CreateDate: 2025/1/16 13:54
/// Author: Lee
/// Description:

const kZhDefaultFont = '青鸟华光繁仿宋';
const kEnDefaultFont = 'NoteScript-SemiBold';

const fonts = [
  '汉仪篆书繁',
  '思源黑体',
  '青鸟华光繁仿宋',
  '鼎猎宋刻体',
  '鼎猎伙伴体',
  '周字方体',
  '鼎猎珠海体',
  '周字宋体',
  '猫啃忘形圆',
  '文鼎PL简报宋',
  '文鼎PL细上海宋',
  '小可奶酪体',
  '飞花宋体',
  '三极素纤简体',
];

class ThemeController {
  String? font = StorageUtil.read(StorageKeyEnum.font) ?? kZhDefaultFont;

  ThemeData get light => ThemeData(
        fontFamily: kEnDefaultFont,
        fontFamilyFallback: [font ?? kZhDefaultFont],
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            hoverColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            overlayColor: Colors.transparent,
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const Color(0xFFFC2958);
            }
            return Colors.transparent;
          }),
          checkColor: WidgetStateProperty.all(Colors.white),
          side: const BorderSide(color: Color(0xFFC8C9CB)),
          shape: const CircleBorder(),
          splashRadius: .0,
        ),
      );
}
