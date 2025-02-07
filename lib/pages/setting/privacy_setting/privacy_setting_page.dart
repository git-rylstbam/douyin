import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../extensions/list_extensions.dart';
import '../../../widgets/dismiss_scroll_bar.dart';
import '../widgets/setting_section.dart';
import '../widgets/setting_topbar.dart';

/// CreateDate: 2025/2/7 13:54
/// Author: Lee
/// Description:

class PrivacySettingPage extends StatefulWidget {
  const PrivacySettingPage({super.key});

  @override
  State<PrivacySettingPage> createState() => _PrivacySettingPageState();
}

class _PrivacySettingPageState extends State<PrivacySettingPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFFF3F3F4),
        appBar: SettingTopBar(title: '隐私设置'),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: DismissScrollbar(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                _buildInteractSection(),
                _buildShortcutSettingSection(),
                _buildRelateAccountSection01(),
                _buildRelateAccountSection02(),
                _buildOtherSection(),
              ].mapWithSeparator(
                (e) => const SizedBox(height: 20.0),
              ),
            ),
          ),
        ),
      );

  Widget _buildInteractSection() => const SettingSection(
        title: '互动',
        children: [
          SettingSectionChild(
            icon: CupertinoIcons.paw,
            title: '同城展示',
            right: Text('开启', style: kSettingSectionChildRightStyle),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.paperplane,
            title: '在线状态',
            right: Text('开启', style: kSettingSectionChildRightStyle),
          ),
          SettingSectionChild(icon: CupertinoIcons.power, title: '浏览和访客'),
          SettingSectionChild(icon: CupertinoIcons.heart, title: '点赞'),
          SettingSectionChild(icon: CupertinoIcons.star, title: '收藏'),
          SettingSectionChild(
            icon: CupertinoIcons.qrcode_viewfinder,
            title: '私信',
          ),
          SettingSectionChild(
            icon: CupertinoIcons.question_circle,
            title: '推荐',
            right: Text('互关的人可见', style: kSettingSectionChildRightStyle),
          ),
          SettingSectionChild(icon: CupertinoIcons.waveform, title: '直播与电商'),
        ],
      );

  Widget _buildShortcutSettingSection() => const SettingSection(
        title: '快捷设置',
        children: [
          SettingSectionChild(
            icon: CupertinoIcons.tree,
            title: '一键隐私防护,',
            right: Text('关闭', style: kSettingSectionChildRightStyle),
          ),
        ],
      );

  Widget _buildRelateAccountSection01() => const SettingSection(
        title: '关系与账号',
        children: [
          SettingSectionChild(icon: CupertinoIcons.view_3d, title: '找到我的方式'),
          SettingSectionChild(icon: CupertinoIcons.view_2d, title: '推荐可能认识的人'),
          SettingSectionChild(
            icon: CupertinoIcons.snow,
            title: '关注的粉丝列表',
            right: Text('公开可见', style: kSettingSectionChildRightStyle),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.scissors_alt,
            title: '最近移除的朋友推荐',
          ),
        ],
      );

  Widget _buildRelateAccountSection02() => const SettingSection(
        children: [
          SettingSectionChild(
            icon: CupertinoIcons.slider_horizontal_3,
            title: '不看他(她)的作品',
          ),
          SettingSectionChild(
            icon: CupertinoIcons.signature,
            title: '不让他(她)看作品',
          ),
          SettingSectionChild(icon: CupertinoIcons.nosign, title: '黑名单'),
          SettingSectionChild(
            icon: CupertinoIcons.lock,
            title: '私密账号',
            right: Text('关闭', style: kSettingSectionChildRightStyle),
          ),
        ],
      );

  Widget _buildOtherSection() => const SettingSection(
        title: '其他',
        children: [
          SettingSectionChild(icon: Icons.settings_outlined, title: '系统权限'),
        ],
      );
}
