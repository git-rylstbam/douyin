import 'package:get/get.dart';

import 'pages/font/change_font_page.dart';
import 'pages/home/home_page.dart';
import 'pages/home/initial/recommend/recommend_detail_page.dart';
import 'pages/setting/account_security/account_security_page.dart';
import 'pages/setting/general_setting/general_setting_page.dart';
import 'pages/setting/payment_setting/payment_setting_page.dart';
import 'pages/setting/privacy_setting/privacy_setting_page.dart';
import 'pages/setting/setting_page.dart';

/// CreateDate: 2025/1/7 16:36
/// Author: Lee
/// Description:

abstract class Routes {
  static const home = '/';

  static const change_font = '/change_font';

  static const recommend_detail = '/recommend_detail';

  static const setting = '/setting';
  static const account_security = '/account_security';
  static const privacy_setting = '/privacy_setting';
  static const payment_setting = '/payment_setting';
  static const general_setting = '/general_setting';

  static final routes = [
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: change_font, page: () => const ChangeFontPage()),
    GetPage(name: recommend_detail, page: () => const RecommendDetailPage()),
    GetPage(name: setting, page: () => const SettingPage()),
    GetPage(name: account_security, page: () => const AccountSecurityPage()),
    GetPage(name: privacy_setting, page: () => const PrivacySettingPage()),
    GetPage(name: payment_setting, page: () => const PaymentSettingPage()),
    GetPage(name: general_setting, page: () => const GeneralSettingPage()),
  ];
}
