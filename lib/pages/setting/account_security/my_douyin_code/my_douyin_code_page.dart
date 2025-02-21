import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/icon_util.dart';
import '../../widgets/setting_topbar.dart';

/// CreateDate: 2025/2/10 14:03
/// Author: Lee
/// Description:

class MyDouyinCodePage extends StatefulWidget {
  const MyDouyinCodePage({super.key});

  @override
  State<MyDouyinCodePage> createState() => _MyDouyinCodePageState();
}

class _MyDouyinCodePageState extends State<MyDouyinCodePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFF79B29B),
        appBar: SettingTopBar(
          leadingColor: Colors.white,
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Icon(
                CupertinoIcons.arrowshape_turn_up_right,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 20.0,
                  children: [
                    _buildQrcode(),
                    const Text(
                      '林落凝',
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Row(
                      spacing: 4.0,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '抖音号: HGS.rylstbam.Lln',
                          style: TextStyle(fontSize: 14.0, color: Colors.white),
                        ),
                        Icon(
                          CupertinoIcons.layers,
                          size: 20.0,
                          color: Color(0xFFBDD8CD),
                        ),
                      ],
                    ),
                    const Text(
                      '抖音扫一扫，立即关注我',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Color(0xFFDDECE6),
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 100.0,
                horizontal: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildOperationChild(
                    icon: CupertinoIcons.scope,
                    title: '扫一扫',
                  ),
                  _buildOperationChild(
                    icon: CupertinoIcons.wand_rays,
                    title: '换样式',
                  ),
                  _buildOperationChild(icon: CupertinoIcons.drop, title: '保存'),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildQrcode() => Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        width: 400.0,
        height: 400.0,
        child: Center(
          child: ClipOval(
            child: Image.asset(
              IconUtil.icon_024,
              width: 340.0,
              height: 340.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );

  Widget _buildOperationChild({
    required IconData icon,
    required String title,
  }) =>
      Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 10.0,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF8DBDAA),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(14.0),
            child: Center(
              child: Icon(icon, color: Colors.white, size: 30.0),
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12.0,
              color: Color(0xFFF2F7F5),
            ),
          ),
        ],
      );
}
