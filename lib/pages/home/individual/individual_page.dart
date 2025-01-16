import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes.dart';

/// CreateDate: 2025/1/10 16:45
/// Author: Lee
/// Description:

class IndividualPage extends StatefulWidget {
  const IndividualPage({super.key});

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            ListTile(
              title: Text('change_font'.tr),
              onTap: () => Get.toNamed(Routes.change_font),
            ),
          ],
        ),
      );
}
