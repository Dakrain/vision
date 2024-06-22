import 'package:flutter/material.dart';

class TextUtils {
  static double calculatedTextHeight(TextStyle style) {
    const text = 'Sample text';
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
      maxLines: 1,
    );
    textPainter.layout(maxWidth: 200);
    return textPainter.size.height;
  }
}
