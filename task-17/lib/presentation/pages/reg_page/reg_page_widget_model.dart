import 'dart:async';

import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/core/domain/animals.dart';
import 'package:surf_flutter_courses_template/core/domain/base_widget_model/base_widget_model.dart';

/// Объект бизнес-логики окна регистрации
class RegPageWidgetModel extends BaseWidgetModel {
  /// Ключ формы регистрации
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// Контроллер поля ввода клички животного
  final TextEditingController nameController = TextEditingController();

  /// Контроллер поля ввода даты рождения животного
  final TextEditingController birthdayController = TextEditingController();

  /// Контроллер поля ввода веса животного
  final TextEditingController weightController = TextEditingController();

  /// Контроллер поля ввода эл. почты владельца животного
  final TextEditingController emailController = TextEditingController();

  /// Контроллер поля ввода последней прививки от бешенства
  final TextEditingController rabiesController = TextEditingController();

  /// Контроллер поля ввода последней прививки от ковида
  final TextEditingController covidController = TextEditingController();

  /// Контроллер поля ввода последней прививки от малярии
  final TextEditingController malariaController = TextEditingController();

  /// Значение текущего выбранного типа животного
  Animals _currentPet = Animals.values[0];

  /// Текущий тип животного
  Animals get currentPet => _currentPet;

  /// Значение состояния окна регистрации животного (загрузка/ожидание)
  bool _isLoading = false;

  /// Состояние окна регистрации животного (загрузка/ожидание)
  bool get isLoading => _isLoading;

  /// Контроллер потока значений состояния окна регистрации животного
  final StreamController<bool> _loadingStatusController =
      StreamController<bool>.broadcast();

  /// Поток значений состояния окна регистрации животного
  Stream<bool> get loadingStatusStream => _loadingStatusController.stream;

  /// Значение доступности кнопки отправки данных
  bool _isDeactivated = false;

  /// Доступность кнопки отправки данных
  bool get isDeactivated => _isDeactivated;

  /// Контроллер потока значения доступности кнопки отправки данных
  final StreamController<bool> _isDeactivatedController =
      StreamController<bool>.broadcast();

  /// Поток значения доступности кнопки отправки данных
  Stream<bool> get isDeactivatedStream => _isDeactivatedController.stream;

  @override
  void init() {}

  @override
  void dispose() {
    _loadingStatusController.close();
    _isDeactivatedController.close();
    nameController.dispose();
    birthdayController.dispose();
    weightController.dispose();
    emailController.dispose();
    rabiesController.dispose();
    covidController.dispose();
    malariaController.dispose();
  }

  /// Установить текущий тип животного
  void setCurrentPet(Animals pet) {
    if (_currentPet != pet) {
      _currentPet = pet;
    }
  }

  /// Проверить валидацию формы
  void checkValidForm() {
    if (_isDeactivated && formKey.currentState!.validate()) {
      _changeDeactivatedStatus(false);
      return;
    }
  }

  /// Имитировать отправку данных
  Future<void> sendData() async {
    if (!formKey.currentState!.validate()) {
      _changeDeactivatedStatus(true);
      return;
    }
    _changeDeactivatedStatus(false);
    _changeLoadingStatus();
    await Future.delayed(const Duration(seconds: 2));
    _changeLoadingStatus();
  }

  /// Изменить состояние окна формы регистрации и отправить его в контроллер
  void _changeLoadingStatus() {
    _isLoading = !_isLoading;
    _loadingStatusController.sink.add(_isLoading);
  }

  /// Изменить состояние  доступности кнопки отправки данных и  отправить его в контроллер
  void _changeDeactivatedStatus(bool newStatus) {
    if (_isDeactivated == newStatus) {
      return;
    }
    _isDeactivated = newStatus;
    _loadingStatusController.sink.add(_isDeactivated);
  }
}
