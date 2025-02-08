import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/icon_util.dart';
import '../../../widgets/just_tap.dart';
import '../widgets/setting_switch.dart';
import '../widgets/setting_topbar.dart';
import 'widgets/font_size_slider_track.dart';

/// CreateDate: 2025/2/8 11:35
/// Author: Lee
/// Description:

class FontSizePage extends StatefulWidget {
  const FontSizePage({super.key});

  @override
  State<FontSizePage> createState() => _FontSizePageState();
}

class _FontSizePageState extends State<FontSizePage> {
  final _systemNotifier = ValueNotifier<bool>(true);
  final _fontSizeNotifier = ValueNotifier<double>(14.0);

  @override
  void dispose() {
    _systemNotifier.dispose();
    _fontSizeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFFF0F1F2),
        appBar: SettingTopBar(
          title: '字体大小',
          actions: [_buildConfirmButton()],
        ),
        body: Column(
          spacing: 40.0,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: _buildFontSizeShow(),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '跟随系统调整',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Color(0xFF161823),
                          ),
                        ),
                        ValueListenableBuilder(
                          valueListenable: _systemNotifier,
                          builder: (_, value, __) => SettingSwitch(
                            value: value,
                            onChanged: (value) => _systemNotifier.value = value,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 1.0,
                    thickness: 1.0,
                    color: Color(0xFFE3E4E5),
                  ),
                  _ChangeFontSizeSlider(
                    onChanged: (value) {
                      _fontSizeNotifier.value =
                          value == FontSizeModeEnum.standard
                              ? 14.0
                              : value == FontSizeModeEnum.largeSize
                                  ? 16.0
                                  : 18.0;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildFontSizeShow() => Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            child: Image.asset(
              IconUtil.icon_020,
              width: double.infinity,
              height: 400.0,
              fit: BoxFit.cover,
            ),
          ),
          ValueListenableBuilder(
            valueListenable: _fontSizeNotifier,
            builder: (_, value, __) => Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                    color: Colors.black.withAlpha(50),
                  ),
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 4.0,
                    children: [
                      Icon(
                        CupertinoIcons.location_solid,
                        size: value,
                        color: Colors.white,
                      ),
                      Text(
                        '北京市',
                        style: TextStyle(
                          fontSize: value - 2.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    '@调整字体大小',
                    style:
                        TextStyle(fontSize: value + 2.0, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    top: 10.0,
                    right: 10.0,
                    bottom: 20.0,
                  ),
                  child: Text(
                    '拖动下方滑杆档位查看放大效果，点击右上角确定即可生效',
                    style: TextStyle(fontSize: value, color: Colors.white),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                    ),
                    color: Colors.black.withAlpha(50),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    spacing: 4.0,
                    children: [
                      Icon(
                        CupertinoIcons.layers_alt_fill,
                        color: Colors.white,
                        size: value,
                      ),
                      Text(
                        '合集 · 好好爱护眼睛',
                        style: TextStyle(
                          fontSize: value - 2.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );

  Widget _buildConfirmButton() => Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: JustTap(
          onPressed: () {},
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              color: Color(0xFFF83856),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 10.0,
            ),
            child: const Text(
              '确定',
              style: TextStyle(fontSize: 12.0, color: Colors.white),
            ),
          ),
        ),
      );
}

class _ChangeFontSizeSlider extends StatefulWidget {
  const _ChangeFontSizeSlider({required this.onChanged});

  final void Function(FontSizeModeEnum mode) onChanged;

  @override
  State<_ChangeFontSizeSlider> createState() => _ChangeFontSizeSliderState();
}

class _ChangeFontSizeSliderState extends State<_ChangeFontSizeSlider> {
  double _value = .0;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(40.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              painter: FontSizeSliderTrack(mode: FontSizeModeEnum.standard),
              size: const Size(double.infinity, 40.0),
            ),
            Positioned.fill(
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: .0,
                  activeTrackColor: Colors.transparent,
                  inactiveTrackColor: Colors.transparent,
                  thumbShape: const RoundSliderThumbShape(),
                  trackShape: const RectangularSliderTrackShape(),
                  overlayShape: SliderComponentShape.noOverlay,
                  thumbColor: Colors.white,
                ),
                child: Slider(
                  value: _value,
                  max: 2.0,
                  divisions: 2,
                  onChanged: (value) {
                    setState(() => _value = value);
                    widget.onChanged(
                      value == .0
                          ? FontSizeModeEnum.standard
                          : value == 1.0
                              ? FontSizeModeEnum.largeSize
                              : FontSizeModeEnum.extraLargeSize,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      );
}
