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

  Map<String, String> _buildCNTranslations() => {};

  Map<String, String> _buildUSTranslations() => {};
}
