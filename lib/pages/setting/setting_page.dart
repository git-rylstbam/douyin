import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../extensions/list_extensions.dart';
import '../../routes.dart';
import '../../widgets/dismiss_scroll_bar.dart';
import 'widgets/setting_section.dart';
import 'widgets/setting_topbar.dart';

/// CreateDate: 2025/2/6 16:57
/// Author: Lee
/// Description:

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFFEFEFEF),
        appBar: SettingTopBar(title: '设置'),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: DismissScrollbar(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                _buildSearchLine(),
                _buildAccountSection(),
                _buildCommonSection(),
                _buildAboutSection(),
                _buildLogoutSection(),
                _buildVersionLine(),
              ].mapWithSeparator(
                (e) => const SizedBox(height: 20.0),
              ),
            ),
          ),
        ),
      );

  Widget _buildSearchLine() => Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Color(0xFFE4E4E4),
        ),
        padding: const EdgeInsets.all(10.0),
        child: const Row(
          spacing: 4.0,
          children: [
            Icon(CupertinoIcons.search, size: 20.0, color: Color(0xFF686970)),
            Text(
              '搜索',
              style: TextStyle(fontSize: 14.0, color: Color(0xFF686970)),
            ),
          ],
        ),
      );

  Widget _buildAccountSection() => SettingSection(
        title: '账号',
        children: [
          SettingSectionChild(
            icon: CupertinoIcons.person_crop_circle,
            title: '账号与安全',
            onPressed: () => Get.toNamed(Routes.account_security),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.lock,
            title: '隐私设置',
            onPressed: () => Get.toNamed(Routes.privacy_setting),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.money_yen_circle,
            title: '支付设置',
            onPressed: () => Get.toNamed(Routes.payment_setting),
          ),
        ],
      );

  Widget _buildCommonSection() => SettingSection(
        title: '通用',
        children: [
          SettingSectionChild(
            icon: Icons.settings_outlined,
            title: '通用设置',
            onPressed: () => Get.toNamed(Routes.general_setting),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.bell,
            title: '通知设置',
            onPressed: () => Get.toNamed(Routes.notification_setting),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.compass,
            title: '通知消息管理',
            onPressed: () => Get.toNamed(Routes.notification_message),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.chat_bubble,
            title: '聊天设置',
            onPressed: () => Get.toNamed(Routes.chat_setting),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.dot_radiowaves_left_right,
            title: '播放设置',
            onPressed: () => Get.toNamed(Routes.play_setting),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.ear,
            title: '背景设置',
            onPressed: () => Get.toNamed(Routes.background_setting),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.envelope_circle,
            title: '长辈模式',
            onPressed: () => Get.toNamed(Routes.elder_model),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.textformat,
            title: '字体大小',
            onPressed: () => Get.toNamed(Routes.font_size),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.rosette,
            title: '极速性能模式',
            onPressed: () => Get.toNamed(Routes.top_speed_performance_mode),
          ),
          const SettingSectionChild(
            icon: CupertinoIcons.scissors,
            title: '清理缓存',
            trailing: Text(
              '625MB',
              style: TextStyle(fontSize: 14.0, color: Color(0xFF73747B)),
            ),
          ),
        ],
      );

  Widget _buildAboutSection() => SettingSection(
        title: '关于',
        children: [
          SettingSectionChild(
            icon: CupertinoIcons.slowmo,
            title: '反馈与帮助',
            onPressed: () => Get.toNamed(
              Routes.feedback_help,
              parameters: {'title': '客服中心'},
            ),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.slider_horizontal_3,
            title: '了解与管理广告推送',
            onPressed: () => Get.toNamed(
              Routes.advertise_push,
              parameters: {'title': '了解与管理广告推送'},
            ),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.snow,
            title: '抖音规则中心',
            onPressed: () => Get.toNamed(
              Routes.rule_center,
              parameters: {'title': '规则中心'},
            ),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.sparkles,
            title: '资质证照',
            onPressed: () => Get.toNamed(
              Routes.qualification_certificate,
              parameters: {'title': '资质证照'},
            ),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.waveform,
            title: '用户协议',
            onPressed: () => Get.toNamed(
              Routes.user_agreement,
              parameters: {'title': '“抖音”用户服务协议'},
            ),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.wind_snow,
            title: '隐私政策及简明版',
            onPressed: () => Get.toNamed(
              Routes.privacy_policy,
              parameters: {'title': '“抖音”隐私政策简明版'},
            ),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.thermometer_snowflake,
            title: '应用权限',
            onPressed: () => Get.toNamed(
              Routes.application_authority,
              parameters: {'title': '抖音权限申请与使用情况说明'},
            ),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.umbrella,
            title: '个人信息收集清单',
            onPressed: () => Get.toNamed(
              Routes.personal_info_list,
              parameters: {'title': '个人信息收集清单'},
            ),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.scissors_alt,
            title: '第三方信息共享清单',
            onPressed: () => Get.toNamed(
              Routes.third_info_list,
              parameters: {'title': '【抖音】第三方信息共享清单'},
            ),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.qrcode_viewfinder,
            title: '个人信息管理',
          ),
          SettingSectionChild(
            icon: CupertinoIcons.pencil,
            title: '开源软件声明',
            onPressed: () => Get.toNamed(
              Routes.open_source_statement,
              parameters: {'title': '开源软件声明'},
            ),
          ),
          SettingSectionChild(icon: CupertinoIcons.helm, title: '关于抖音'),
        ],
      );

  Widget _buildLogoutSection() => const SettingSection(
        children: [
          SettingSectionChild(icon: Icons.multiple_stop, title: '切换账号'),
          SettingSectionChild(
            icon: CupertinoIcons.power,
            title: '退出登录',
            trailing: SizedBox.shrink(),
          ),
        ],
      );

  Widget _buildVersionLine() => const Padding(
        padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 10.0),
        child: Center(
          child: Text(
            '抖音 version 32.8.0',
            style: TextStyle(fontSize: 12.0, color: Color(0xFF6D6E70)),
          ),
        ),
      );
}
