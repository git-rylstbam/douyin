import 'package:flutter/material.dart';

import '../../../utils/icon_util.dart';
import '../../../widgets/just_tap.dart';
import '../widgets/setting_switch.dart';
import '../widgets/setting_topbar.dart';

/// CreateDate: 2025/2/8 9:32
/// Author: Lee
/// Description:

class BackgroundSettingPage extends StatefulWidget {
  const BackgroundSettingPage({super.key});

  @override
  State<BackgroundSettingPage> createState() => _BackgroundSettingPageState();
}

class _BackgroundSettingPageState extends State<BackgroundSettingPage> {
  final _autoChangeNotifier = ValueNotifier<bool>(false);
  final _effectNotifier = ValueNotifier<bool>(true);

  @override
  void dispose() {
    _autoChangeNotifier.dispose();
    _effectNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFFF3F3F4),
        appBar: SettingTopBar(title: '背景设置'),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: _SelectBackgroundSection()),
            _buildBottomLine(),
          ],
        ),
      );

  Widget _buildBottomLine() => Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 20.0,
          children: [
            _buildAutoChangeLine(),
            _buildEffectLine(),
          ],
        ),
      );

  Widget _buildAutoChangeLine() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            '自动切换',
            style: TextStyle(fontSize: 14.0, color: Color(0xFF161823)),
          ),
          ValueListenableBuilder(
            valueListenable: _autoChangeNotifier,
            builder: (_, value, __) => SettingSwitch(
              value: value,
              onChanged: (value) => _autoChangeNotifier.value = value,
            ),
          ),
        ],
      );

  Widget _buildEffectLine() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            '对评论区生效',
            style: TextStyle(fontSize: 14.0, color: Color(0xFF161823)),
          ),
          ValueListenableBuilder(
            valueListenable: _effectNotifier,
            builder: (_, value, __) => SettingSwitch(
              value: value,
              onChanged: (value) => _effectNotifier.value = value,
            ),
          ),
        ],
      );
}

class _SelectBackgroundSection extends StatefulWidget {
  const _SelectBackgroundSection();

  @override
  State<_SelectBackgroundSection> createState() =>
      _SelectBackgroundSectionState();
}

class _SelectBackgroundSectionState extends State<_SelectBackgroundSection> {
  BackgroundModeEnum _mode = BackgroundModeEnum.undertint;

  @override
  Widget build(BuildContext context) => Row(
        spacing: 10.0,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _SelectBackgroundChild(
            path: IconUtil.icon_020,
            mode: BackgroundModeEnum.undertint,
            title: '浅色',
            isSelect: _mode == BackgroundModeEnum.undertint,
            onChanged: (value) => setState(() => _mode = value),
          ),
          _SelectBackgroundChild(
            path: IconUtil.icon_028,
            mode: BackgroundModeEnum.classic,
            title: '经典',
            isSelect: _mode == BackgroundModeEnum.classic,
            onChanged: (value) => setState(() => _mode = value),
          ),
        ],
      );
}

class _SelectBackgroundChild extends StatefulWidget {
  const _SelectBackgroundChild({
    required this.path,
    required this.mode,
    required this.title,
    required this.isSelect,
    required this.onChanged,
  });

  final String path;
  final BackgroundModeEnum mode;
  final String title;
  final bool isSelect;
  final void Function(BackgroundModeEnum mode) onChanged;

  @override
  State<_SelectBackgroundChild> createState() => _SelectBackgroundChildState();
}

class _SelectBackgroundChildState extends State<_SelectBackgroundChild> {
  @override
  Widget build(BuildContext context) => JustTap(
        onPressed: () => widget.onChanged(widget.mode),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 10.0,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              child: Image.asset(widget.path, height: 400.0, fit: BoxFit.cover),
            ),
            Row(
              children: [
                Checkbox(
                  value: widget.isSelect,
                  onChanged: (value) {
                    if (value == null) return;
                    widget.onChanged(widget.mode);
                  },
                ),
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: widget.isSelect
                        ? const Color(0xFF161823)
                        : const Color(0xFF85868B),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}

enum BackgroundModeEnum { undertint, classic }
