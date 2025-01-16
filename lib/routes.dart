import 'package:get/get.dart';

import 'pages/font/change_font_page.dart';
import 'pages/home/home_page.dart';

/// CreateDate: 2025/1/7 16:36
/// Author: Lee
/// Description:

abstract class Routes {
  static const home = '/';
  static const change_font = '/change_font';

  static final routes = [
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: change_font, page: () => const ChangeFontPage()),
  ];
}
