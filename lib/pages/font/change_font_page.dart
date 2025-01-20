import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';
import '../../theme.dart';
import '../../utils/storage_util.dart';
import '../home/enums.dart';

/// CreateDate: 2025/1/16 14:04
/// Author: Lee
/// Description:

class ChangeFontPage extends StatefulWidget {
  const ChangeFontPage({super.key});

  @override
  State<ChangeFontPage> createState() => _ChangeFontPageState();
}

class _ChangeFontPageState extends State<ChangeFontPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: Get.back,
            icon: const Icon(Icons.arrow_back_ios, size: 14.0),
          ),
          title: Text('change_font'.tr),
          centerTitle: true,
        ),
        body: ListView(
          children: fonts
              .map(
                (e) => ListTile(
                  title: Text(e),
                  onTap: () {
                    MyApp.of(context).changeFont(e);
                    StorageUtil.write(StorageKeyEnum.font, e);
                  },
                ),
              )
              .toList(),
        ),
      );
}
