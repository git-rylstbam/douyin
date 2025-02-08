import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../extensions/list_extensions.dart';
import '../../../widgets/dismiss_scroll_bar.dart';
import '../widgets/setting_section.dart';
import '../widgets/setting_switch.dart';
import '../widgets/setting_topbar.dart';

/// CreateDate: 2025/2/7 17:53
/// Author: Lee
/// Description:

class ChatSettingPage extends StatefulWidget {
  const ChatSettingPage({super.key});

  @override
  State<ChatSettingPage> createState() => _ChatSettingPageState();
}

class _ChatSettingPageState extends State<ChatSettingPage> {
  final _showNotifier = ValueNotifier<bool>(true);
  final _changeNotifier = ValueNotifier<bool>(true);
  final _recommendNotifier = ValueNotifier<bool>(true);
  final _shareNotifier = ValueNotifier<bool>(true);

  @override
  void dispose() {
    _showNotifier.dispose();
    _changeNotifier.dispose();
    _recommendNotifier.dispose();
    _shareNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFFF3F3F4),
        appBar: SettingTopBar(title: '聊天设置'),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: DismissScrollbar(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                _buildMessagePageSection(),
                _buildOtherSection(),
              ].mapWithSeparator(
                (e) => const SizedBox(height: 20.0),
              ),
            ),
          ),
        ),
      );

  Widget _buildMessagePageSection() => SettingSection(
        title: '消息页',
        children: [
          SettingSectionChild(
            icon: CupertinoIcons.heart_circle,
            title: '消息页展示密友时刻',
            trailing: ValueListenableBuilder(
              valueListenable: _showNotifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _showNotifier.value = value,
              ),
            ),
          ),
          const SettingSectionChild(
            icon: CupertinoIcons.paperplane,
            title: '私信和通话通知',
            right: Text('全部', style: kSettingSectionChildRightStyle),
          ),
        ],
      );

  Widget _buildOtherSection() => SettingSection(
        title: '其他',
        children: [
          SettingSectionChild(
            icon: CupertinoIcons.pencil_slash,
            title: '使用移动网络改善通话质量',
            trailing: ValueListenableBuilder(
              valueListenable: _changeNotifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _changeNotifier.value = value,
              ),
            ),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.pencil_outline,
            title: '聊天时推荐表情和功能',
            trailing: ValueListenableBuilder(
              valueListenable: _recommendNotifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _recommendNotifier.value = value,
              ),
            ),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.pencil,
            title: '播放视频时推荐分享给朋友',
            trailing: ValueListenableBuilder(
              valueListenable: _shareNotifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _shareNotifier.value = value,
              ),
            ),
          ),
          const SettingSectionChild(
            icon: CupertinoIcons.chat_bubble_2,
            title: '聊天数据修复',
          ),
        ],
      );
}
