import 'package:flutter/material.dart';

/// CreateDate: 2025/2/6 10:26
/// Author: Lee
/// Description:

class NoBorderTextField extends StatelessWidget {
  const NoBorderTextField({
    super.key,
    required this.controller,
    this.hint = '',
    this.labelSize = 14.0,
    this.hintSize = 14.0,
    this.labelColor = Colors.black,
    this.hintColor = Colors.grey,
  });

  final TextEditingController controller;
  final String hint;
  final double labelSize;
  final double hintSize;
  final Color labelColor;
  final Color hintColor;

  @override
  Widget build(BuildContext context) => TextField(
        controller: controller,
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          labelStyle: TextStyle(fontSize: labelSize, color: labelColor),
          hintText: hint,
          hintStyle: TextStyle(fontSize: hintSize, color: hintColor),
          contentPadding: EdgeInsets.zero,
          isDense: true,
          errorBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          border: InputBorder.none,
        ),
      );
}
