import 'package:flutter/material.dart';

extension ListWidgetExtension on List<Widget> {
  List<Widget> separated(Widget separator) {
    if (isEmpty) {
      return this;
    }

    List<Widget> result = [];
    for (int i = 0; i < length; i++) {
      result.add(this[i]);
      if (i < length - 1) {
        result.add(separator);
      }
    }
    return result;
  }
}
