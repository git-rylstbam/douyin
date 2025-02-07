import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../extensions/list_extensions.dart';
import '../../../widgets/dismiss_scroll_bar.dart';
import '../widgets/setting_section.dart';
import '../widgets/setting_switch.dart';
import '../widgets/setting_topbar.dart';

/// CreateDate: 2025/2/7 11:18
/// Author: Lee
/// Description:

class AccountSecurityPage extends StatefulWidget {
  const AccountSecurityPage({super.key});

  @override
  State<AccountSecurityPage> createState() => _AccountSecurityPageState();
}

class _AccountSecurityPageState extends State<AccountSecurityPage> {
  final _saveLoginInfoNotifier = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _saveLoginInfoNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFFF3F3F4),
        appBar: SettingTopBar(title: '账号与安全'),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: DismissScrollbar(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                _buildAccountManageSection(),
                _buildBindingAuthSection(),
                _buildCertifyFillingSection(),
                _buildRetrievalCancelSection(),
              ].mapWithSeparator(
                (e) => const SizedBox(height: 20.0),
              ),
            ),
          ),
        ),
      );

  Widget _buildAccountManageSection() => SettingSection(
        title: '账号管理',
        children: [
          const SettingSectionChild(
            icon: Icons.multiple_stop,
            title: '切换账号',
            right: Text('林落凝', style: kSettingSectionChildRightStyle),
          ),
          const SettingSectionChild(
            icon: CupertinoIcons.pencil,
            title: '抖音号',
            trailing: Text(
              'HGS.rylstbam.Lln',
              style: TextStyle(fontSize: 14.0, color: Color(0xFF8A8B90)),
            ),
          ),
          const SettingSectionChild(
            icon: CupertinoIcons.qrcode,
            title: '我的抖音码',
          ),
          const SettingSectionChild(
            icon: CupertinoIcons.device_phone_portrait,
            title: '手机号绑定',
            right: Text('159******28', style: kSettingSectionChildRightStyle),
          ),
          const SettingSectionChild(
            icon: CupertinoIcons.paw,
            title: '抖音密码',
            right: Text('未设置', style: kSettingSectionChildRightStyle),
          ),
          const SettingSectionChild(
            icon: CupertinoIcons.map_pin_ellipse,
            title: '登录设备管理',
          ),
          SettingSectionChild(
            icon: CupertinoIcons.money_yen_circle,
            title: '保存登录信息',
            trailing: ValueListenableBuilder(
              valueListenable: _saveLoginInfoNotifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _saveLoginInfoNotifier.value = value,
              ),
            ),
          ),
        ],
      );

  Widget _buildBindingAuthSection() => const SettingSection(
        title: '绑定与授权',
        children: [
          SettingSectionChild(icon: CupertinoIcons.dial, title: '第三方账号绑定'),
          SettingSectionChild(icon: CupertinoIcons.alarm, title: '授权管理'),
          SettingSectionChild(icon: CupertinoIcons.app_badge, title: '我的合作码'),
        ],
      );

  Widget _buildCertifyFillingSection() => const SettingSection(
        title: '认证与备案',
        children: [
          SettingSectionChild(
            icon: CupertinoIcons.antenna_radiowaves_left_right,
            title: '实名认证',
            right: Text('未认证', style: kSettingSectionChildRightStyle),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.book,
            title: '申请官方认证',
            bottom: Text(
              '个人、企业机构的账号认证',
              style: kSettingSectionChildBottomStyle,
            ),
          ),
        ],
      );

  Widget _buildRetrievalCancelSection() => const SettingSection(
        title: '找回与注销',
        children: [
          SettingSectionChild(
            icon: CupertinoIcons.bandage,
            title: '找回账号',
            bottom: Text(
              '无法登录其他账号，找回登录',
              style: kSettingSectionChildBottomStyle,
            ),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.chat_bubble_2,
            title: '注销账号',
          ),
          SettingSectionChild(
            icon: CupertinoIcons.money_dollar_circle,
            title: '抖音安全中心',
            bottom: Text(
              '包含账号信息泄露、诈骗等账号问题',
              style: kSettingSectionChildBottomStyle,
            ),
          ),
        ],
      );
}
