import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/dismiss_scroll_bar.dart';
import '../../widgets/just_tap.dart';

/// CreateDate: 2025/2/6 16:57
/// Author: Lee
/// Description:

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFFEFEFEF),
        appBar: _buildAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: DismissScrollbar(
            child: ListView(
              children: [
                _buildSearchLine(),
              ],
            ),
          ),
        ),
      );

  AppBar _buildAppBar() => AppBar(
        backgroundColor: const Color(0xFFEFEFEF),
        leading: JustTap(
          onPressed: Get.back,
          child: const Icon(CupertinoIcons.chevron_left),
        ),
        leadingWidth: 40.0,
        title: const Text(
          '设置',
          style: TextStyle(
            fontSize: 14.0,
            color: Color(0xFF161823),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      );

  Widget _buildSearchLine() => Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Color(0xFFE4E4E4),
        ),
        padding: const EdgeInsets.all(10.0),
        child: const Row(
          spacing: 4.0,
            children: [
            Icon(CupertinoIcons.search, size: 20.0, color: Color(0xFF686970)),
            Text(
              '搜索',
              style: TextStyle(fontSize: 14.0, color: Color(0xFF686970)),
            ),
          ],
        ),
      );
}
