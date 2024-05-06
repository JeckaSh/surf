import 'package:flutter/material.dart';

extension HexToColor on String {
  /// Преобразовать строку в объект [Color]
  Color hexToColor() {
    final hexCode = replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }
}
