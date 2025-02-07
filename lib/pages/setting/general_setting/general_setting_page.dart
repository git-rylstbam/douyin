import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../extensions/list_extensions.dart';
import '../../../widgets/dismiss_scroll_bar.dart';
import '../widgets/setting_section.dart';
import '../widgets/setting_switch.dart';
import '../widgets/setting_topbar.dart';

/// CreateDate: 2025/2/7 15:11
/// Author: Lee
/// Description:

class GeneralSettingPage extends StatefulWidget {
  const GeneralSettingPage({super.key});

  @override
  State<GeneralSettingPage> createState() => _GeneralSettingPageState();
}

class _GeneralSettingPageState extends State<GeneralSettingPage> {
  final _dynamicCoverNotifier = ValueNotifier<bool>(false);
  final _timeNotifier = ValueNotifier<bool>(true);
  final _saveNotifier = ValueNotifier<bool>(false);
  final _memoryNotifier = ValueNotifier<bool>(true);
  final _shareNotifier = ValueNotifier<bool>(true);
  final _showNotifier = ValueNotifier<bool>(false);
  final _pauseNotifier = ValueNotifier<bool>(true);
  final _supportNotifier = ValueNotifier<bool>(true);
  final _changeNotifier = ValueNotifier<bool>(false);
  final _refreshNotifier = ValueNotifier<bool>(true);

  @override
  void dispose() {
    _dynamicCoverNotifier.dispose();
    _timeNotifier.dispose();
    _saveNotifier.dispose();
    _memoryNotifier.dispose();
    _shareNotifier.dispose();
    _showNotifier.dispose();
    _pauseNotifier.dispose();
    _supportNotifier.dispose();
    _changeNotifier.dispose();
    _refreshNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFFF3F3F4),
        appBar: SettingTopBar(title: '通用设置'),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: DismissScrollbar(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                _buildArtworkSection(),
                _buildFunctionSection(),
                _buildOtherSection(),
              ].mapWithSeparator(
                (e) => const SizedBox(height: 20.0),
              ),
            ),
          ),
        ),
      );

  Widget _buildArtworkSection() => SettingSection(
        title: '作品',
        children: [
          const SettingSectionChild(
            icon: CupertinoIcons.chat_bubble_2,
            title: '作品视图',
          ),
          SettingSectionChild(
            icon: CupertinoIcons.snow,
            title: '动态封面',
            trailing: ValueListenableBuilder(
              valueListenable: _dynamicCoverNotifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _dynamicCoverNotifier.value = value,
              ),
            ),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.alarm,
            title: '提前上传作品，减少等待时间',
            trailing: ValueListenableBuilder(
              valueListenable: _timeNotifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _timeNotifier.value = value,
              ),
            ),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.arrow_2_circlepath,
            title: '保存自己内容带水印',
            trailing: ValueListenableBuilder(
              valueListenable: _saveNotifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _saveNotifier.value = value,
              ),
            ),
          ),
          const SettingSectionChild(
            icon: CupertinoIcons.arrow_3_trianglepath,
            title: '管理我发布视频的评论区',
          ),
        ],
      );

  Widget _buildFunctionSection() => SettingSection(
        title: '功能',
        children: [
          SettingSectionChild(
            icon: CupertinoIcons.barcode,
            title: '往日回忆',
            trailing: ValueListenableBuilder(
              valueListenable: _memoryNotifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _memoryNotifier.value = value,
              ),
            ),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.bandage,
            title: '抖一抖打开面对面分享视频',
            trailing: ValueListenableBuilder(
              valueListenable: _shareNotifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _shareNotifier.value = value,
              ),
            ),
          ),
          const SettingSectionChild(
            icon: CupertinoIcons.at,
            title: '截图后功能面板',
            right: Text('已开启', style: kSettingSectionChildRightStyle),
          ),
          const SettingSectionChild(
            icon: CupertinoIcons.barcode_viewfinder,
            title: '首页展示双列快捷入口',
            right: Text('关闭', style: kSettingSectionChildRightStyle),
          ),
          const SettingSectionChild(
            icon: CupertinoIcons.bars,
            title: '护眼模式',
            right: Text('未开启', style: kSettingSectionChildRightStyle),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.umbrella,
            title: '个人页展示未成年人模式快捷入口',
            trailing: ValueListenableBuilder(
              valueListenable: _showNotifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _showNotifier.value = value,
              ),
            ),
          ),
          const SettingSectionChild(
            icon: CupertinoIcons.waveform,
            title: '观看历史',
            right: Text('开启', style: kSettingSectionChildRightStyle),
          ),
          const SettingSectionChild(
            icon: CupertinoIcons.cloud_sun_bolt,
            title: '作品标题支持文字搜索',
            right: Text('开启', style: kSettingSectionChildRightStyle),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.cube,
            title: '作品暂停时出识别标签',
            trailing: ValueListenableBuilder(
              valueListenable: _pauseNotifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _pauseNotifier.value = value,
              ),
            ),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.compass,
            title: '发布的图片评论支持他人保存',
            trailing: ValueListenableBuilder(
              valueListenable: _supportNotifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _supportNotifier.value = value,
              ),
            ),
          ),
        ],
      );

  Widget _buildOtherSection() => SettingSection(
        title: '其他',
        children: [
          const SettingSectionChild(
            icon: CupertinoIcons.circle_grid_hex_fill,
            title: 'Siri语音指令',
          ),
          SettingSectionChild(
            icon: CupertinoIcons.dial,
            title: '使用移动网络改善播放体验',
            trailing: ValueListenableBuilder(
              valueListenable: _changeNotifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _changeNotifier.value = value,
              ),
            ),
          ),
          SettingSectionChild(
            icon: CupertinoIcons.dot_radiowaves_left_right,
            title: '打开抖音时刷新视频',
            trailing: ValueListenableBuilder(
              valueListenable: _refreshNotifier,
              builder: (_, value, __) => SettingSwitch(
                value: value,
                onChanged: (value) => _refreshNotifier.value = value,
              ),
            ),
            bottom: const Text(
              '可能会在首位展示直播、广告等内容',
              style: kSettingSectionChildBottomStyle,
            ),
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ],
      );
}
