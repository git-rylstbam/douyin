import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../extensions/list_extensions.dart';
import '../../../widgets/dismiss_scroll_bar.dart';
import '../widgets/setting_section.dart';
import '../widgets/setting_topbar.dart';

/// CreateDate: 2025/2/7 14:21
/// Author: Lee
/// Description:

class PaymentSettingPage extends StatefulWidget {
  const PaymentSettingPage({super.key});

  @override
  State<PaymentSettingPage> createState() => _PaymentSettingPageState();
}

class _PaymentSettingPageState extends State<PaymentSettingPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFFF1F1F2),
        appBar: SettingTopBar(title: '抖音支付设置'),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: DismissScrollbar(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                _buildSection01(),
                _buildSection02(),
                _buildSection03(),
                _buildSection04(),
                _buildSection05(),
                _buildBottomLine(),
              ].mapWithSeparator(
                (e) => const SizedBox(height: 20.0),
              ),
            ),
          ),
        ),
      );

  Widget _buildSection01() => const SettingSection(
        children: [
          SettingSectionChild(
            icon: CupertinoIcons.snow,
            title: '身份信息',
            right: Text('**凝', style: kSettingSectionChildRightStyle),
            bottom: Text(
              '管理实名、证件、职业等信息',
              style: kSettingSectionChildBottomStyle,
            ),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.app_badge,
            title: '手机号',
            right: Text('159****1028', style: kSettingSectionChildRightStyle),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.alarm_fill,
            title: '安全中心',
            right: Text('保障中', style: kSettingSectionChildRightStyle),
          ),
        ],
      );

  Widget _buildSection02() => const SettingSection(
        children: [
          SettingSectionChild(
            icon: CupertinoIcons.waveform,
            title: '抖音支付/抖音月付默认付款',
            right: Text('去设置', style: kSettingSectionChildRightStyle),
            bottom: Text(
              '同步修改 普通支付/自动扣款/极速付 付款顺序',
              style: kSettingSectionChildBottomStyle,
            ),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.paperplane,
            title: '自动付款',
            bottom: Text(
              '含自动续费/还款/充值等',
              style: kSettingSectionChildBottomStyle,
            ),
          ),
        ],
      );

  Widget _buildSection03() => const SettingSection(
        children: [
          SettingSectionChild(icon: CupertinoIcons.info_circle, title: '支付密码'),
          SettingSectionChild(
            icon: CupertinoIcons.infinite,
            title: '面容支付',
            right: Text('去开通', style: kSettingSectionChildRightStyle),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.qrcode_viewfinder,
            title: '免密支付',
            bottom: Text(
              '含极速付，支持一键快速付款',
              style: kSettingSectionChildBottomStyle,
            ),
          ),
        ],
      );

  Widget _buildSection04() => const SettingSection(
        children: [
          SettingSectionChild(
            icon: CupertinoIcons.layers_alt,
            title: '绑定账号',
            bottom: Text(
              '含今日头条/番茄/支付宝等账号绑定',
              style: kSettingSectionChildBottomStyle,
            ),
          ),
        ],
      );

  Widget _buildSection05() => const SettingSection(
        children: [
          SettingSectionChild(
            icon: CupertinoIcons.question_circle,
            title: '常见问题',
          ),
          SettingSectionChild(icon: CupertinoIcons.book, title: '用户协议'),
          SettingSectionChild(icon: CupertinoIcons.house, title: '参与调研'),
          SettingSectionChild(icon: CupertinoIcons.power, title: '注销抖音支付'),
        ],
      );

  Widget _buildBottomLine() => const Padding(
        padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.bell_circle_fill,
              size: 14.0,
              color: Color(0xFFC7C8CA),
            ),
            SizedBox(width: 4.0),
            Text(
              '抖音支付',
              style: TextStyle(fontSize: 12.0, color: Color(0xFFC7C8CA)),
            ),
            SizedBox(width: 10.0),
            SizedBox(
              height: 20.0,
              child: VerticalDivider(
                width: .4,
                thickness: .4,
                color: Color(0xFFDDDDDE),
              ),
            ),
            SizedBox(width: 10.0),
            Text(
              '过亿人都在用',
              style: TextStyle(fontSize: 12.0, color: Color(0xFFB9BABD)),
            ),
          ],
        ),
      );
}
