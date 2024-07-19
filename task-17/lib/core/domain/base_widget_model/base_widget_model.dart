import 'package:flutter/material.dart';

/// Базовая модель бизнес-логики
abstract class BaseWidgetModel {
  @mustCallSuper
  void init();

  @mustCallSuper
  void dispose();
}
