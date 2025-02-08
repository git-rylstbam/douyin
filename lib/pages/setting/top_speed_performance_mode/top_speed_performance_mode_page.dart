import 'package:flutter/material.dart';

import '../widgets/setting_section.dart';
import '../widgets/setting_topbar.dart';

/// CreateDate: 2025/2/8 15:32
/// Author: Lee
/// Description:

class TopSpeedPerformanceModePage extends StatefulWidget {
  const TopSpeedPerformanceModePage({super.key});

  @override
  State<TopSpeedPerformanceModePage> createState() =>
      _TopSpeedPerformanceModePageState();
}

class _TopSpeedPerformanceModePageState
    extends State<TopSpeedPerformanceModePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: SettingTopBar(title: '极速性能模式'),
        body: const Column(
          children: [
            SettingSectionChild(
              title: '省电优化',
              right: Text('智能开启', style: kSettingSectionChildRightStyle),
            ),
            Divider(
              height: .4,
              thickness: .4,
              color: Color(0xFFE3E3E4),
            ),
          ],
        ),
      );
}
