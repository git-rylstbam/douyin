import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../extensions/list_extensions.dart';
import '../../../widgets/dismiss_scroll_bar.dart';
import '../widgets/setting_section.dart';
import '../widgets/setting_topbar.dart';

/// CreateDate: 2025/2/7 17:32
/// Author: Lee
/// Description:

class NotificationMessagePage extends StatefulWidget {
  const NotificationMessagePage({super.key});

  @override
  State<NotificationMessagePage> createState() =>
      _NotificationMessagePageState();
}

class _NotificationMessagePageState extends State<NotificationMessagePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFFF3F3F4),
        appBar: SettingTopBar(title: '通知消息管理'),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: DismissScrollbar(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [_buildPlatformNotificationSection()].mapWithSeparator(
                (e) => const SizedBox(height: 20.0),
              ),
            ),
          ),
        ),
      );

  Widget _buildPlatformNotificationSection() => SettingSection(
        title: '平台通知消息',
        children: [
          _buildSectionChild(
            icon: CupertinoIcons.money_dollar,
            iconColor: const Color(0xFFFC2958),
            title: '广告服务评价',
          ),
          _buildSectionChild(
            icon: CupertinoIcons.option,
            iconColor: const Color(0xFF6694F5),
            title: '保险服务',
          ),
          _buildSectionChild(
            icon: CupertinoIcons.creditcard,
            iconColor: const Color(0xFFFD811F),
            title: '钱包服务',
          ),
          _buildSectionChild(
            icon: CupertinoIcons.news,
            iconColor: const Color(0xFF5794FC),
            title: '手机充值',
          ),
          _buildSectionChild(
            icon: CupertinoIcons.paperclip,
            iconColor: const Color(0xFF1796E6),
            title: '用户调研',
          ),
          _buildSectionChild(
            icon: CupertinoIcons.pencil,
            iconColor: const Color(0xFFFEB230),
            title: '支付助手',
          ),
          _buildSectionChild(
            icon: CupertinoIcons.number,
            iconColor: const Color(0xFF21CABE),
            title: '抖音月付',
          ),
          _buildSectionChild(
            icon: CupertinoIcons.music_note_2,
            iconColor: Colors.black,
            title: '抖音支付',
          ),
          _buildSectionChild(
            icon: CupertinoIcons.pencil_slash,
            iconColor: const Color(0xFF49BCFD),
            title: '信用卡服务',
          ),
          _buildSectionChild(
            icon: CupertinoIcons.percent,
            iconColor: const Color(0xFFFD2463),
            title: '系统通知',
          ),
          _buildSectionChild(
            icon: CupertinoIcons.personalhotspot,
            iconColor: const Color(0xFF7E12FC),
            title: '抖音游戏',
          ),
        ],
      );

  Widget _buildSectionChild({
    required IconData icon,
    required Color iconColor,
    required String title,
  }) =>
      SettingSectionChild(
        icon: icon,
        iconColor: iconColor,
        title: title,
        right: const Text('接收', style: kSettingSectionChildRightStyle),
        crossAxisAlignment: CrossAxisAlignment.center,
        fontWeight: FontWeight.normal,
      );
}
