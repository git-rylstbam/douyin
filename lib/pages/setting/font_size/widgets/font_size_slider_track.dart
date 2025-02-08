import 'package:flutter/material.dart';

import '../../../../theme.dart';

/// CreateDate: 2025/2/8 14:07
/// Author: Lee
/// Description:

class FontSizeSliderTrack extends CustomPainter {
  FontSizeSliderTrack({required this.mode});

  final FontSizeModeEnum mode;

  final _trackPaint = Paint()
    ..color = const Color(0xFFEDEDED)
    ..style = PaintingStyle.fill
    ..isAntiAlias = true
    ..strokeWidth = 4.0
    ..strokeCap = StrokeCap.round;

  final _dividerPaint = Paint()
    ..color = const Color(0xFFEDEDED)
    ..style = PaintingStyle.fill
    ..isAntiAlias = true
    ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
      Offset(.0, size.height / 2),
      Offset(size.width, size.height / 2),
      _trackPaint,
    );
    canvas.drawLine(
      Offset(.0, size.height / 2 - 10.0),
      Offset(.0, size.height / 2 + 10.0),
      _dividerPaint,
    );
    canvas.drawLine(
      Offset(size.width / 2, size.height / 2 - 10.0),
      Offset(size.width / 2, size.height / 2 + 10.0),
      _dividerPaint,
    );
    canvas.drawLine(
      Offset(size.width, size.height / 2 - 10.0),
      Offset(size.width, size.height / 2 + 10.0),
      _dividerPaint,
    );
    _drawStandardText(canvas, size);
    _drawLargeSizeText(canvas, size);
    _drawExtraLargeSizeText(canvas, size);
  }

  void _drawStandardText(Canvas canvas, Size size) {
    final standardTextPainter = TextPainter(
      text: TextSpan(
        text: '标准',
        style: TextStyle(
          fontSize: 14.0,
          color: mode == FontSizeModeEnum.standard
              ? const Color(0xFF161823)
              : const Color(0xFF73747B),
          fontFamily: ThemeController().font,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    standardTextPainter.paint(canvas, Offset(-14.0, size.height - 60.0));
  }

  void _drawLargeSizeText(Canvas canvas, Size size) {
    final largeSizeTextPainter = TextPainter(
      text: TextSpan(
        text: '大号',
        style: TextStyle(
          fontSize: 14.0,
          color: mode == FontSizeModeEnum.largeSize
              ? const Color(0xFF161823)
              : const Color(0xFF73747B),
          fontFamily: ThemeController().font,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    largeSizeTextPainter.paint(
      canvas,
      Offset(size.width / 2 - 14.0, size.height - 60.0),
    );
  }

  void _drawExtraLargeSizeText(Canvas canvas, Size size) {
    final extraLargeSizeTextPainter = TextPainter(
      text: TextSpan(
        text: '超大号',
        style: TextStyle(
          fontSize: 14.0,
          color: mode == FontSizeModeEnum.extraLargeSize
              ? const Color(0xFF161823)
              : const Color(0xFF73747B),
          fontFamily: ThemeController().font,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    extraLargeSizeTextPainter.paint(
      canvas,
      Offset(size.width - 10.0 - 10.0, size.height - 60.0),
    );
  }

  @override
  bool shouldRepaint(FontSizeSliderTrack oldDelegate) => false;
}

enum FontSizeModeEnum { standard, largeSize, extraLargeSize }
