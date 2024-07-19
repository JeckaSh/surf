import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:surf_flutter_courses_template/assets/app_strings.dart';
import 'package:surf_flutter_courses_template/core/domain/input_type_model/input_type_model.dart';
import 'package:surf_flutter_courses_template/core/utils/string_utils.dart';

/// Класс типа ввода имени
class NameType implements InputTypeModel {
  @override
  String get errorMsg => AppStrings.nameValid;

  @override
  List<TextInputFormatter>? get formatters => null;

  @override
  TextInputType get keyboardType => TextInputType.name;

  @override
  ValidationFunc get validator => _nameValidator;

  @override
  OnTapFunc? get onTapFunc => null;

  /// Валидатор имени
  String? _nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return errorMsg;
    }
    if (value.length < 3 || value.length > 20) {
      return errorMsg;
    }
    if (value[0] != value[0].toUpperCase()) {
      return AppStrings.nameUpperValid;
    }
    return null;
  }
}

/// Класс типа ввода веса
class WeightType implements InputTypeModel {
  @override
  String get errorMsg => AppStrings.weightValid;

  @override
  List<TextInputFormatter>? get formatters =>
      [FilteringTextInputFormatter.digitsOnly];

  @override
  TextInputType get keyboardType => TextInputType.number;

  @override
  ValidationFunc get validator => _weightValidator;

  @override
  OnTapFunc? get onTapFunc => null;

  /// Валидатор веса
  String? _weightValidator(String? value) {
    if (value == null || value.isEmpty) {
      return errorMsg;
    }
    if (int.parse(value) < 1) {
      return errorMsg;
    }
    return null;
  }
}

/// Класс типа ввода временных данных
class DateType implements InputTypeModel {
  @override
  String get errorMsg => AppStrings.birthdatValid;

  @override
  List<TextInputFormatter>? get formatters =>
      [FilteringTextInputFormatter.digitsOnly];

  @override
  TextInputType get keyboardType => TextInputType.none;

  @override
  ValidationFunc get validator => _dateValidator;

  @override
  OnTapFunc get onTapFunc => _openDatePicker;

  /// Метод открытия модального окна с календарем
  Future<void> _openDatePicker(
      BuildContext context, TextEditingController controller) async {
    DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));
    DateTime initDate = yesterday;
    if (controller.text.isNotEmpty) {
      initDate = StringUtils.dateReformat(controller.text);
    }
    final newDate = await showDatePicker(
      context: context,
      initialDate: initDate,
      firstDate: DateTime(1900),
      lastDate: yesterday,
    );
    if (newDate != null) {
      controller.text = StringUtils.dateFormat(newDate);
    }
  }

  /// Валидатор временных данных
  String? _dateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return errorMsg;
    }
    if (StringUtils.dateReformat(value)
        .isAfter(DateTime.now().subtract(const Duration(days: 1)))) {
      return errorMsg;
    }
    return null;
  }
}

/// Класс типа ввода почты
class EmailType implements InputTypeModel {
  @override
  String get errorMsg => AppStrings.emailValid;

  @override
  List<TextInputFormatter>? get formatters => null;

  @override
  TextInputType get keyboardType => TextInputType.emailAddress;

  @override
  ValidationFunc get validator => _emailValidator;

  @override
  OnTapFunc? get onTapFunc => null;

  /// Валидатор ввода почты
  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return errorMsg;
    }
    if (!StringUtils.emailFormat.hasMatch(value)) {
      return errorMsg;
    }
    return null;
  }
}
