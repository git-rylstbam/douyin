import 'package:flutter/material.dart';

import '../../main.dart';
import '../../theme.dart';

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
        backgroundColor: Colors.white,
        body: ListView(
          children: fonts
              .map(
                (e) => ListTile(
                  title: Text(e),
                  onTap: () => MyApp.of(context).changeFont(e),
                ),
              )
              .toList(),
        ),
      );
}
