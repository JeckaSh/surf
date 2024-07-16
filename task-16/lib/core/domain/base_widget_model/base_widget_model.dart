import 'package:flutter/material.dart';

/// Абстрактный объект для реализации бизнес логики
abstract class BaseWidgetModel {
  @mustCallSuper
  void init();

  @mustCallSuper
  void dispode();
}
