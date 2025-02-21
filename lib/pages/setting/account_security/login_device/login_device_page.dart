import 'package:flutter/material.dart';

import '../../../../extensions/list_extensions.dart';
import '../../../../widgets/dismiss_scroll_bar.dart';
import '../../widgets/setting_topbar.dart';
import '../model/model.dart';

/// CreateDate: 2025/2/19 16:07
/// Author: Lee
/// Description:

class LoginDevicePage extends StatelessWidget {
  const LoginDevicePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: SettingTopBar(title: '登录设备管理'),
        body: DismissScrollbar(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(20.0),
            children: [
              const Text(
                '登录设备管理显示最近登录过您账号的设备情况\n'
                '若您发现非本人操作的设备，请及时移除，并更换密码，以保障您的账号安全',
                style: TextStyle(fontSize: 14.0, color: Color(0xFF8A8B90)),
              ),
              ...devices.map(
                (e) => _LoginDeviceChild(
                  name: e.name ?? '--',
                  loginType: e.loginType ?? '--',
                  source: e.source ?? '--',
                  time: e.time ?? '--',
                  isLocal: e.isLocal,
                ),
              ),
            ].mapWithSeparator(
              (e) => const SizedBox(height: 20.0),
            ),
          ),
        ),
      );
}

class _LoginDeviceChild extends StatelessWidget {
  const _LoginDeviceChild({
    required this.name,
    required this.loginType,
    required this.source,
    required this.time,
    this.isLocal = false,
  });

  final String name;
  final String loginType;
  final String source;
  final String time;
  final bool isLocal;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4.0,
            children: [
              if (isLocal)
                Row(
                  spacing: 4.0,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFF161823),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    _buildLocalSign(),
                  ],
                )
              else
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFF161823),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              Row(
                children: [
                  Text(
                    loginType,
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Color(0xFF8A8B90),
                    ),
                  ),
                  const Text(
                    '·',
                    style: TextStyle(color: Color(0xFF8A8B90)),
                  ),
                  Text(
                    source,
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Color(0xFF8A8B90),
                    ),
                  ),
                ],
              ),
              Text(
                time,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Color(0xFF8A8B90),
                ),
              ),
            ],
          ),
          const Icon(
            Icons.keyboard_arrow_right_outlined,
            size: 14.0,
            color: Color(0xFF8A8B90),
          ),
        ],
      );

  Widget _buildLocalSign() => Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          color: Color(0xFFF3F3F4),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 2.0,
          horizontal: 4.0,
        ),
        child: const Text(
          '本机',
          style: TextStyle(
            fontSize: 10.0,
            color: Color(0xFF84858B),
          ),
        ),
      );
}
