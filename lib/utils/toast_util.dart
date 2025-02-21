import 'package:flutter/material.dart';

/// CreateDate: 2025/2/10 13:55
/// Author: Lee
/// Description:

class ToastUtil {
  static bool _isToastVisible = false;

  static void showToast(BuildContext context, String message) {
    if (_isToastVisible) return;
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Center(
        child: Material(
          color: Colors.transparent,
          elevation: 10.0,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: Text(
              message,
              style: const TextStyle(fontSize: 14.0, color: Colors.white),
            ),
          ),
        ),
      ),
    );
    overlay.insert(overlayEntry);
    _isToastVisible = true;
    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
      _isToastVisible = false;
    });
  }
}
