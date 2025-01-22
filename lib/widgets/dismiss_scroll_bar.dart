import 'package:flutter/material.dart';

/// CreateDate: 2025/1/21 10:26
/// Author: Lee
/// Description:

class DismissScrollbar extends StatelessWidget {
  const DismissScrollbar({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: child,
      );
}
