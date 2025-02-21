import 'package:get/get.dart';

import 'pages/font/change_font_page.dart';
import 'pages/home/home_page.dart';
import 'pages/home/initial/recommend/recommend_detail_page.dart';
import 'pages/setting/about_douyin/about_douyin_page.dart';
import 'pages/setting/account_security/account_security_page.dart';
import 'pages/setting/account_security/login_device/login_device_page.dart';
import 'pages/setting/account_security/my_douyin_code/my_douyin_code_page.dart';
import 'pages/setting/account_security/phone_binding/input_sms_code_page.dart';
import 'pages/setting/account_security/phone_binding/phone_binding_page.dart';
import 'pages/setting/account_security/third_account_binding/third_account_binding_page.dart';
import 'pages/setting/background_setting/background_setting_page.dart';
import 'pages/setting/change_account/change_account_page.dart';
import 'pages/setting/chat_setting/chat_setting_page.dart';
import 'pages/setting/elder_model/elder_model_page.dart';
import 'pages/setting/font_size/font_size_page.dart';
import 'pages/setting/general_setting/general_setting_page.dart';
import 'pages/setting/notification_message/notification_message_page.dart';
import 'pages/setting/notification_setting/notification_setting_page.dart';
import 'pages/setting/payment_setting/payment_setting_page.dart';
import 'pages/setting/personal_info_manage/personal_info_manage_page.dart';
import 'pages/setting/play_setting/play_setting_page.dart';
import 'pages/setting/privacy_setting/privacy_setting_page.dart';
import 'pages/setting/setting_page.dart';
import 'pages/setting/top_speed_performance_mode/top_speed_performance_mode_page.dart';
import 'pages/web/common_web_page.dart';

/// CreateDate: 2025/1/7 16:36
/// Author: Lee
/// Description:

abstract class Routes {
  static const home = '/';

  static const change_font = '/change_font';

  static const recommend_detail = '/recommend_detail';

  static const setting = '/setting';

  static const account_security = '/account_security';
  static const change_account = '/change_acount';
  static const my_douyin_code = '/my_douyin_code';
  static const phone_binding = '/phone_binding';
  static const input_sms_code = '/input_sms_code';
  static const login_device = '/login_device';
  static const third_account_binding = '/third_account_binding';

  static const privacy_setting = '/privacy_setting';
  static const payment_setting = '/payment_setting';
  static const general_setting = '/general_setting';
  static const notification_setting = '/notification_setting';
  static const notification_message = '/notification_message';
  static const chat_setting = '/chat_setting';
  static const play_setting = '/play_setting';
  static const background_setting = '/background_setting';
  static const elder_model = '/elder_model';
  static const font_size = '/font_size';
  static const top_speed_performance_mode = '/top_speed_performance_mode';
  static const feedback_help = '/feedback_help';
  static const advertise_push = '/advertise_push';
  static const rule_center = '/rule_center';
  static const qualification_certificate = '/qualification_certificate';
  static const user_agreement = '/user_agreement';
  static const privacy_policy = '/privacy_policy';
  static const application_authority = '/application_authority';
  static const personal_info_list = '/personal_info_list';
  static const third_info_list = '/third_info_list';
  static const personal_info_manage = '/personal_info_manage';
  static const open_source_statement = '/open_source_statement';
  static const about_douyin = '/about_douyin';

  static final routes = [
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: change_font, page: () => const ChangeFontPage()),
    GetPage(name: recommend_detail, page: () => const RecommendDetailPage()),
    GetPage(name: setting, page: () => const SettingPage()),
    GetPage(name: account_security, page: () => const AccountSecurityPage()),
    GetPage(name: change_account, page: () => const ChangeAccountPage()),
    GetPage(name: my_douyin_code, page: () => const MyDouyinCodePage()),
    GetPage(name: phone_binding, page: () => const PhoneBindingPage()),
    GetPage(
      name: input_sms_code,
      page: () => InputSmsCodePage(
        phone: Get.parameters['phone']!,
      ),
    ),
    GetPage(name: login_device, page: () => const LoginDevicePage()),
    GetPage(
      name: third_account_binding,
      page: () => const ThirdAccountBindingPage(),
    ),
    GetPage(name: privacy_setting, page: () => const PrivacySettingPage()),
    GetPage(name: payment_setting, page: () => const PaymentSettingPage()),
    GetPage(name: general_setting, page: () => const GeneralSettingPage()),
    GetPage(
      name: notification_setting,
      page: () => const NotificationSettingPage(),
    ),
    GetPage(
      name: notification_message,
      page: () => const NotificationMessagePage(),
    ),
    GetPage(name: chat_setting, page: () => const ChatSettingPage()),
    GetPage(name: play_setting, page: () => const PlaySettingPage()),
    GetPage(
      name: background_setting,
      page: () => const BackgroundSettingPage(),
    ),
    GetPage(name: elder_model, page: () => const ElderModelPage()),
    GetPage(name: font_size, page: () => const FontSizePage()),
    GetPage(
      name: top_speed_performance_mode,
      page: () => const TopSpeedPerformanceModePage(),
    ),
    _forWeb(feedback_help),
    _forWeb(advertise_push),
    _forWeb(rule_center),
    _forWeb(qualification_certificate),
    _forWeb(user_agreement),
    _forWeb(privacy_policy),
    _forWeb(application_authority),
    _forWeb(personal_info_list),
    _forWeb(third_info_list),
    GetPage(
      name: personal_info_manage,
      page: () => const PersonalInfoManagePage(),
    ),
    _forWeb(open_source_statement),
    GetPage(name: about_douyin, page: () => const AboutDouyinPage()),
  ];

  static GetPage _forWeb(String name) => GetPage(
        name: name,
        page: () => CommonWebPage(title: Get.parameters['title']!),
      );
}
