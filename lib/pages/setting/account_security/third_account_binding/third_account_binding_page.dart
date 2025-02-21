import 'package:flutter/material.dart';

import '../../../../extensions/list_extensions.dart';
import '../../../../widgets/dismiss_scroll_bar.dart';
import '../../widgets/setting_switch.dart';
import '../../widgets/setting_topbar.dart';

/// CreateDate: 2025/2/21 11:25
/// Author: Lee
/// Description:

class ThirdAccountBindingPage extends StatefulWidget {
  const ThirdAccountBindingPage({super.key});

  @override
  State<ThirdAccountBindingPage> createState() =>
      _ThirdAccountBindingPageState();
}

class _ThirdAccountBindingPageState extends State<ThirdAccountBindingPage> {
  final _syncInfoNotifier = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _syncInfoNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: SettingTopBar(title: '第三方账号绑定'),
        body: DismissScrollbar(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(20.0),
            children: [
              const Text(
                '第三方登录方式',
                style: TextStyle(fontSize: 14.0, color: Color(0xFF73747B)),
              ),
              _buildThirdAccountLine(title: '微信'),
              _buildThirdAccountLine(title: 'QQ'),
              _buildThirdAccountLine(title: '微博'),
              _buildThirdAccountLine(title: 'Apple ID'),
              const Divider(
                height: 1.0,
                thickness: 1.0,
                color: Color(0xFFE3E4E5),
              ),
              const Text(
                '第三方内容同步平台',
                style: TextStyle(fontSize: 14.0, color: Color(0xFF73747B)),
              ),
              _buildThirdAccountLine(
                title: '今日头条 / 西瓜视频 / 懂车帝',
                operation: '查看详情',
              ),
              _buildThirdAccountLine(
                title: '—同步抖音头像和昵称信息',
                trailing: ValueListenableBuilder(
                  valueListenable: _syncInfoNotifier,
                  builder: (_, value, __) => SettingSwitch(
                    value: value,
                    onChanged: (value) => _syncInfoNotifier.value = value,
                  ),
                ),
              ),
            ].mapWithSeparator(
              (e) => const SizedBox(height: 30.0),
            ),
          ),
        ),
      );

  Widget _buildThirdAccountLine({
    required String title,
    String operation = '未绑定',
    Widget? trailing,
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14.0,
              color: Color(0xFF161823),
              fontWeight: FontWeight.bold,
            ),
          ),
          if (trailing == null)
            Row(
              spacing: 4.0,
              children: [
                Text(
                  operation,
                  style:
                      const TextStyle(fontSize: 14.0, color: Color(0xFF8A8B90)),
                ),
                const Icon(
                  Icons.keyboard_arrow_right_outlined,
                  size: 14.0,
                  color: Color(0xFF8A8588),
                ),
              ],
            )
          else
            trailing,
        ],
      );
}
