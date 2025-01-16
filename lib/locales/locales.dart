import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// CreateDate: 2025/1/6 9:51
/// Author: Lee
/// Description:

class Locales extends Translations {
  static const cn = Locale('zh', 'CN');
  static const en = Locale('en', 'US');

  static const supported = [cn, en];

  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': _buildCNTranslations(),
        'en_US': _buildUSTranslations(),
      };

  Map<String, String> _buildCNTranslations() => {
        'initial': '首页',
        'shop': '商城',
        'publish': '发布',
        'message': '消息',
        'individual': '我',
        'change_font': '切换字体',
      };

  Map<String, String> _buildUSTranslations() => {
        'initial': 'Initial',
        'shop': 'Shop',
        'publish': 'Publish',
        'message': 'Message',
        'individual': 'Individual',
        'change_font': 'Change Font',
      };
}
