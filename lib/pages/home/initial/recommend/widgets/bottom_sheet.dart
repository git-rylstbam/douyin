import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../extensions/list_extensions.dart';
import '../../../../../utils/icon_util.dart';
import '../../../../../widgets/dismiss_scroll_bar.dart';
import '../../../../setting/widgets/setting_switch.dart';
import '../../model/model.dart';

/// CreateDate: 2025/2/5 9:54
/// Author: Lee
/// Description:

class RecommendBottomSheet extends StatefulWidget {
  const RecommendBottomSheet({super.key});

  @override
  State<RecommendBottomSheet> createState() => _RecommendBottomSheetState();
}

class _RecommendBottomSheetState extends State<RecommendBottomSheet> {
  final _barrageNotifier = ValueNotifier<bool>(false);
  final _backAudioNotifier = ValueNotifier<bool>(false);
  final _backWinPlayNotifier = ValueNotifier<bool>(false);
  final _autoNextNotifier = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _barrageNotifier.dispose();
    _backAudioNotifier.dispose();
    _backWinPlayNotifier.dispose();
    _autoNextNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10.0),
            _buildDragHandle(),
            Expanded(
              child: DismissScrollbar(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 10.0),
                      child: Text(
                        '分享给',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    _buildFriendList(),
                    _buildOperationLine01(),
                    const SizedBox(height: 20.0),
                    _buildOperationLine02(),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget _buildDragHandle() => Center(
        child: Container(
          width: 40.0,
          height: 4.0,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: Color(0xFFC7C7CA),
          ),
        ),
      );

  Widget _buildFriendList() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: SizedBox(
          height: 67.0,
          child: DismissScrollbar(
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(width: 10.0),
                ...friends
                    .map((e) => _buildFriendChild(e))
                    .toList()
                    .mapWithSeparator(
                      (e) => const SizedBox(width: 10.0),
                    ),
                const SizedBox(width: 10.0),
                _buildMoreButton(),
                const SizedBox(width: 10.0),
              ],
            ),
          ),
        ),
      );

  Widget _buildFriendChild(FriendEntity friend) => Column(
        spacing: 10.0,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipOval(
            child: FadeInImage(
              image: AssetImage(friend.avatar ?? IconUtil.icon_001),
              placeholder: const AssetImage(IconUtil.icon_placeholder),
              width: 40.0,
              height: 40.0,
              fit: BoxFit.cover,
              placeholderFit: BoxFit.cover,
            ),
          ),
          Text(
            friend.name ?? '--',
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );

  Widget _buildMoreButton() => Column(
        spacing: 10.0,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40.0,
            height: 40.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const Icon(Icons.keyboard_arrow_right, size: 40.0),
          ),
          const Text(
            '更多',
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );

  Widget _buildOperationLine01() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildRecommendLine(),
            _buildTransmitLine(),
          ].mapWithSeparator(
            (e) => const Divider(
              height: .4,
              color: Color(0xFFF2F2F3),
              indent: 50.0,
            ),
          ),
        ),
      );

  Widget _buildRecommendLine() => Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          spacing: 14.0,
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF22C15E),
              ),
              child: const Icon(
                Icons.thumb_up_alt,
                color: Colors.white,
                size: 14.0,
              ),
            ),
            const Text(
              '推荐',
              style: TextStyle(fontSize: 14.0, color: Colors.black),
            ),
          ],
        ),
      );

  Widget _buildTransmitLine() => const Padding(
        padding: EdgeInsets.all(14.0),
        child: Row(
          spacing: 14.0,
          children: [
            ClipOval(
              child: FadeInImage(
                placeholder: AssetImage(IconUtil.icon_placeholder),
                image: AssetImage(IconUtil.icon_012),
                width: 20.0,
                height: 20.0,
                fit: BoxFit.cover,
                placeholderFit: BoxFit.cover,
              ),
            ),
            Text(
              '转发到日常',
              style: TextStyle(fontSize: 14.0, color: Colors.black),
            ),
          ],
        ),
      );

  Widget _buildOperationLine02() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildNormalOperationLine(
              title: '不感兴趣',
              icon: CupertinoIcons.heart_slash,
            ),
            _buildSpeedLine(),
            _buildNormalOperationLine(
              title: '举报',
              icon: CupertinoIcons.exclamationmark_triangle,
            ),
            _buildNormalOperationLine(
              title: '清屏播放',
              icon: CupertinoIcons.viewfinder,
            ),
            _buildOperationTrailingLine(
              title: '识别图片',
              icon: CupertinoIcons.barcode_viewfinder,
              trailing: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                child: Image.asset(
                  IconUtil.icon_021,
                  width: 20.0,
                  height: 20.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            _buildNormalOperationLine(
              title: '缓存视频',
              icon: CupertinoIcons.cloud_download,
            ),
            _buildNormalOperationLine(
              title: '添加至稍后再看',
              icon: CupertinoIcons.rectangle_stack_badge_plus,
            ),
            _buildSwitchLine(
              title: '弹幕开关',
              icon: CupertinoIcons.drop,
              notifier: _barrageNotifier,
            ),
            _buildNormalOperationLine(
              title: '建群分享',
              icon: CupertinoIcons.person_3,
            ),
            _buildNormalOperationLine(
              title: '合拍',
              icon: CupertinoIcons.personalhotspot,
            ),
            _buildNormalOperationLine(
              title: '一起看视频',
              icon: CupertinoIcons.lab_flask,
            ),
            _buildSwitchLine(
              title: '后台播放音频',
              icon: CupertinoIcons.cloud_bolt_rain,
              notifier: _backAudioNotifier,
            ),
            _buildSwitchLine(
              title: '后台小窗播放',
              icon: CupertinoIcons.arrow_swap,
              notifier: _backWinPlayNotifier,
            ),
            _buildSwitchLine(
              title: '自动连播',
              icon: CupertinoIcons.book,
              notifier: _autoNextNotifier,
            ),
            _buildNormalOperationLine(
              title: '听抖音',
              icon: CupertinoIcons.waveform,
            ),
            _buildNormalOperationLine(
              title: '投屏',
              icon: CupertinoIcons.hammer,
            ),
            _buildNormalOperationLine(
              title: '电脑/Pad打开',
              icon: CupertinoIcons.paperplane,
            ),
            _buildNormalOperationLine(
              title: '帮上热门',
              icon: CupertinoIcons.perspective,
            ),
          ].mapWithSeparator(
            (e) => const Divider(
              height: .4,
              color: Color(0xFFF2F2F3),
              indent: 50.0,
            ),
          ),
        ),
      );

  Widget _buildSpeedLine() => const Padding(
        padding: EdgeInsets.all(14.0),
        child: Row(
          spacing: 14.0,
          children: [
            Icon(CupertinoIcons.arrowtriangle_right_circle, size: 20.0),
            Text(
              '倍速',
              style: TextStyle(fontSize: 14.0, color: Colors.black),
            ),
            Expanded(child: _SpeedChild()),
          ],
        ),
      );

  Widget _buildNormalOperationLine({
    required String title,
    required IconData icon,
  }) =>
      Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          spacing: 14.0,
          children: [
            Icon(icon, size: 20.0),
            Text(
              title,
              style: const TextStyle(fontSize: 14.0, color: Colors.black),
            ),
          ],
        ),
      );

  Widget _buildOperationTrailingLine({
    required String title,
    required IconData icon,
    required Widget trailing,
  }) =>
      Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 14.0,
              children: [
                Icon(icon, size: 20.0),
                Text(
                  title,
                  style: const TextStyle(fontSize: 14.0, color: Colors.black),
                ),
              ],
            ),
            trailing,
          ],
        ),
      );

  Widget _buildSwitchLine({
    required String title,
    required IconData icon,
    required ValueNotifier notifier,
  }) =>
      _buildOperationTrailingLine(
        title: title,
        icon: icon,
        trailing: ValueListenableBuilder(
          valueListenable: notifier,
          builder: (_, value, __) => SettingSwitch(
            value: value,
            onChanged: (value) => notifier.value = value,
          ),
        ),
      );
}

class _SpeedChild extends StatefulWidget {
  const _SpeedChild();

  @override
  State<_SpeedChild> createState() => _SpeedChildState();
}

class _SpeedChildState extends State<_SpeedChild> {
  int _select = 1;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildSpeedChild('0.75x', 0),
          _buildSpeedChild('1.0x', 1),
          _buildSpeedChild('1.25x', 2),
          _buildSpeedChild('2.0x', 3),
          _buildSpeedChild('3.0x', 4),
        ],
      );

  Widget _buildSpeedChild(String speed, int index) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => setState(() => _select = index),
          child: Text(
            speed,
            style: TextStyle(
              fontSize: 12.0,
              color: _select == index ? const Color(0xFFFC2958) : Colors.black,
            ),
          ),
        ),
      );
}
