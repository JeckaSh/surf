import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Тип функции для валидации данных, где [value] - значение, которое проверяется.
typedef ValidationFunc = String? Function(String? value);

/// Тип функции для обработки нажатия на поле вода
typedef OnTapFunc = Future<void> Function(
  BuildContext context,
  TextEditingController controller,
);

/// Базовый класс типа ввода данных
abstract class InputTypeModel {
  /// Валидатор данных
  final ValidationFunc validator;

  /// Базовое сообщение об ошибке валидации
  final String errorMsg;

  /// Форматировщики для поля ввода данных
  final List<TextInputFormatter>? formatters;

  /// Тип используемой клавиатуры
  final TextInputType keyboardType;

  /// Обработчик нажатия на поле вода
  final OnTapFunc? onTapFunc;

  InputTypeModel({
    required this.validator,
    required this.errorMsg,
    required this.keyboardType,
    required this.formatters,
    this.onTapFunc,
  });
}
