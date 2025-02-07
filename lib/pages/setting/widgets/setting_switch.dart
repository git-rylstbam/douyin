import 'package:flutter/cupertino.dart';

/// CreateDate: 2025/2/7 15:21
/// Author: Lee
/// Description:

class SettingSwitch extends StatelessWidget {
  const SettingSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final void Function(bool value) onChanged;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 20.0,
        child: Transform.scale(
          scale: .9,
          child: CupertinoSwitch(value: value, onChanged: onChanged),
        ),
      );
}
