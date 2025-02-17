import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/setting_section.dart';
import '../widgets/setting_switch.dart';
import '../widgets/setting_topbar.dart';

/// CreateDate: 2025/2/8 18:01
/// Author: Lee
/// Description:

class PersonalInfoManagePage extends StatefulWidget {
  const PersonalInfoManagePage({super.key});

  @override
  State<PersonalInfoManagePage> createState() => _PersonalInfoManagePageState();
}

class _PersonalInfoManagePageState extends State<PersonalInfoManagePage> {
  final _individuationNotifier = ValueNotifier<bool>(true);

  @override
  void dispose() {
    _individuationNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFFF7F7F8),
        appBar: SettingTopBar(title: '个人信息管理', backgroundColor: Colors.white),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            spacing: 20.0,
            children: [
              const SettingSection(
                children: [
                  SettingSectionChild(
                    icon: CupertinoIcons.drop,
                    title: '个人信息下载',
                  ),
                ],
              ),
              SettingSection(
                children: [
                  SettingSectionChild(
                    icon: CupertinoIcons.escape,
                    title: '个性化内容推荐',
                    trailing: ValueListenableBuilder(
                      valueListenable: _individuationNotifier,
                      builder: (_, value, __) => SettingSwitch(
                        value: value,
                        onChanged: (value) =>
                            _individuationNotifier.value = value,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
