import 'package:flutter/material.dart';

/// CreateDate: 2025/2/6 13:55
/// Author: Lee
/// Description:

class JustTap extends StatelessWidget {
  const JustTap({super.key, required this.onPressed, required this.child});

  final void Function() onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) => MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(onTap: onPressed, child: child),
      );
}
