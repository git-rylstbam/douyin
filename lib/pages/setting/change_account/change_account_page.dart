import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/icon_util.dart';
import '../../../widgets/dismiss_scroll_bar.dart';
import '../../../widgets/just_tap.dart';
import '../widgets/setting_topbar.dart';

/// CreateDate: 2025/2/10 11:25
/// Author: Lee
/// Description:

class ChangeAccountPage extends StatefulWidget {
  const ChangeAccountPage({super.key});

  @override
  State<ChangeAccountPage> createState() => _ChangeAccountPageState();
}

class _ChangeAccountPageState extends State<ChangeAccountPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: SettingTopBar(title: '切换账号'),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: DismissScrollbar(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const _AccountLineList(),
                const SizedBox(height: 20.0),
                _buildNewAccountLine(),
              ],
            ),
          ),
        ),
      );

  Widget _buildNewAccountLine() => JustTap(
        onPressed: () {},
        child: Row(
          spacing: 10.0,
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF3F3F4),
              ),
              padding: const EdgeInsets.all(14.0),
              child: const Icon(CupertinoIcons.add, color: Color(0xFFA8A9AD)),
            ),
            const Text(
              '添加或注册新账号',
              style: TextStyle(
                fontSize: 14.0,
                color: Color(0xFF161823),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
}

class _AccountLineList extends StatefulWidget {
  const _AccountLineList();

  @override
  State<_AccountLineList> createState() => _AccountLineListState();
}

class _AccountLineListState extends State<_AccountLineList> {
  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 10.0,
        children: [
          _buildAccountChildLine(
            name: '林落凝',
            icon: IconUtil.icon_010,
            fansCount: 29,
            index: 0,
          ),
          _buildAccountChildLine(
            name: '陆若柒',
            icon: IconUtil.icon_020,
            fansCount: 12,
            index: 1,
          ),
          _buildAccountChildLine(
            name: '落小剑',
            icon: IconUtil.icon_030,
            fansCount: 5000,
            index: 2,
          ),
        ],
      );

  Widget _buildAccountChildLine({
    required String name,
    required String icon,
    required int fansCount,
    required int index,
  }) =>
      JustTap(
        onPressed: () => setState(() => _selectIndex = index),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 10.0,
              children: [
                ClipOval(
                  child: Image.asset(
                    icon,
                    width: 50.0,
                    height: 50.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFF161823),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$fansCount 粉丝',
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Color(0xFF73747B),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Checkbox(
              value: _selectIndex == index,
              onChanged: (value) {
                if (value == null) return;
                setState(() => _selectIndex = index);
              },
            ),
          ],
        ),
      );
}
