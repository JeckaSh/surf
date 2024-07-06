import 'package:flutter/widgets.dart';

/// Абстрактный объект бизнес-логики
abstract class BaseWidgetModel {
  @mustCallSuper
  void init();

  @mustCallSuper
  void dispose();
}
