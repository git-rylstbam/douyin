import 'package:flutter/material.dart';

import '../../../utils/icon_util.dart';
import '../../../widgets/just_tap.dart';
import '../widgets/setting_topbar.dart';

/// CreateDate: 2025/2/8 11:05
/// Author: Lee
/// Description:

class ElderModelPage extends StatelessWidget {
  const ElderModelPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: SettingTopBar(title: '长辈模式'),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                child: Image.asset(
                  IconUtil.icon_021,
                  width: 300.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                '长辈模式',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Color(0xFF161823),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                '文字更大，设计更简明\n看得更清晰',
                style: TextStyle(fontSize: 20.0, color: Color(0xFF4F5159)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 80.0),
              JustTap(
                onPressed: () {},
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    color: Color(0xFFFC2958),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 60.0,
                    vertical: 10.0,
                  ),
                  child: const Text(
                    '开启长辈模式',
                    style: TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
