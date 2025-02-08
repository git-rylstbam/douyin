import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../extensions/list_extensions.dart';
import '../../../widgets/dismiss_scroll_bar.dart';
import '../widgets/setting_section.dart';
import '../widgets/setting_switch.dart';
import '../widgets/setting_topbar.dart';

/// CreateDate: 2025/2/8 9:19
/// Author: Lee
/// Description:

class PlaySettingPage extends StatefulWidget {
  const PlaySettingPage({super.key});

  @override
  State<PlaySettingPage> createState() => _PlaySettingPageState();
}

class _PlaySettingPageState extends State<PlaySettingPage> {
  final _line01Notifier = ValueNotifier<bool>(false);
  final _line02Notifier = ValueNotifier<bool>(false);
  final _line03Notifier = ValueNotifier<bool>(true);
  final _line04Notifier = ValueNotifier<bool>(false);
  final _line05Notifier = ValueNotifier<bool>(true);
  final _line06Notifier = ValueNotifier<bool>(true);
  final _line07Notifier = ValueNotifier<bool>(true);

  @override
  void dispose() {
    _line01Notifier.dispose();
    _line02Notifier.dispose();
    _line03Notifier.dispose();
    _line04Notifier.dispose();
    _line05Notifier.dispose();
    _line06Notifier.dispose();
    _line07Notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFFF3F3F4),
        appBar: SettingTopBar(title: '播放设置'),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: DismissScrollbar(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                _buildLine01Section(),
                _buildLine02Section(),
                _buildLine03Section(),
                _buildLine04Section(),
                _buildLine05Section(),
                _buildLine06Section(),
              ].mapWithSeparator(
                (e) => const SizedBox(height: 20.0),
              ),
            ),
          ),
        ),
      );

  Widget _buildLine01Section() => SettingSection(
        children: [
          SettingSectionChild(
            icon: CupertinoIcons.perspective,
            title: '退出抖音时继续后台播放音频',
            trailing: ValueListenableBuilder(
              valueListenable: _line01Notifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _line01Notifier.value = value,
              ),
            ),
            bottom: const Text(
              '看视频时退出抖音生效',
              style: kSettingSectionChildBottomStyle,
            ),
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ],
      );

  Widget _buildLine02Section() => SettingSection(
        children: [
          SettingSectionChild(
            icon: CupertinoIcons.paw,
            title: '退出抖音时继续小窗播放',
            trailing: ValueListenableBuilder(
              valueListenable: _line02Notifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _line02Notifier.value = value,
              ),
            ),
            bottom: const Text(
              '看视频时退出抖音生效',
              style: kSettingSectionChildBottomStyle,
            ),
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          SettingSectionChild(
            icon: CupertinoIcons.paperclip,
            title: '从一起看退出抖音继续小窗播放',
            trailing: ValueListenableBuilder(
              valueListenable: _line03Notifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _line03Notifier.value = value,
              ),
            ),
            bottom: const Text(
              '仅从一起看退出抖音时生效',
              style: kSettingSectionChildBottomStyle,
            ),
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ],
      );

  Widget _buildLine03Section() => SettingSection(
        children: [
          SettingSectionChild(
            icon: CupertinoIcons.rays,
            title: '开启抖音时默认静音',
            trailing: ValueListenableBuilder(
              valueListenable: _line04Notifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _line04Notifier.value = value,
              ),
            ),
          ),
        ],
      );

  Widget _buildLine04Section() => SettingSection(
        children: [
          SettingSectionChild(
            icon: CupertinoIcons.question,
            title: '开启抖音时自动调节音量',
            trailing: ValueListenableBuilder(
              valueListenable: _line05Notifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _line05Notifier.value = value,
              ),
            ),
          ),
        ],
      );

  Widget _buildLine05Section() => SettingSection(
        children: [
          SettingSectionChild(
            icon: CupertinoIcons.power,
            title: '自动旋转进全屏',
            trailing: ValueListenableBuilder(
              valueListenable: _line06Notifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _line06Notifier.value = value,
              ),
            ),
          ),
        ],
      );

  Widget _buildLine06Section() => SettingSection(
        children: [
          SettingSectionChild(
            icon: CupertinoIcons.recordingtape,
            title: '设备间未播完的内容自动同步',
            trailing: ValueListenableBuilder(
              valueListenable: _line07Notifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _line07Notifier.value = value,
              ),
            ),
          ),
        ],
      );
}
