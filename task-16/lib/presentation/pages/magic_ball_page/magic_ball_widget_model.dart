import 'dart:async';

import 'package:surf_flutter_courses_template/assets/duration_time.dart';
import 'package:surf_flutter_courses_template/core/di/injectable.dart';
import 'package:surf_flutter_courses_template/core/domain/base_widget_model/base_widget_model.dart';
import 'package:surf_flutter_courses_template/core/domain/widget_status_model/widget_status_model.dart';
import 'package:surf_flutter_courses_template/core/entity/prediction_entity.dart';
import 'package:surf_flutter_courses_template/core/repository/prediction_repository.dart';

/// Модель логики поведения магического шара
class MagicBallWidgetModel extends BaseWidgetModel {
  MagicBallWidgetModel();

  /// Состояние виджета
  late WidgetStatusModel _widgetStatus;

  WidgetStatusModel get widgetStatus => _widgetStatus;

  /// Контроллер состояний виджета
  final _widgetStatusController =
      StreamController<WidgetStatusModel>.broadcast();

  Stream<WidgetStatusModel> get widgetStatusController =>
      _widgetStatusController.stream;

  /// Текущее предсказание
  PredictionEntity? _currentPrediction;

  PredictionEntity? get currentPrediction => _currentPrediction;

  @override
  void init() {
    _widgetStatus = WidgetStatusModel.init;
  }

  @override
  void dispode() {
    _widgetStatusController.close();
  }

  /// Установить новое состояние виджета
  void setWidgetStatus(WidgetStatusModel newStatus) {
    if (_widgetStatus == newStatus) {
      return;
    }
    _widgetStatus = newStatus;
    _widgetStatusController.sink.add(newStatus);
  }

  /// Установить новое предсказание
  void setPrediction(PredictionEntity? newPrediction) {
    if (_currentPrediction == newPrediction) {
      return;
    }
    _currentPrediction = newPrediction;
  }

  /// Отправить запрос для получения нового предсказания
  Future<void> sendRequestForPrediction() async {
    setWidgetStatus(WidgetStatusModel.loading);
    await Future.delayed(DurationTime.base);
    final prediction =
        await injector.get<InterfacePredictionRepository>().getPrediction();
    setPrediction(prediction);
    if (prediction.isErrorMessage) {
      setWidgetStatus(WidgetStatusModel.error);
    } else {
      setWidgetStatus(WidgetStatusModel.wait);
    }
  }

  /// Получить новое предсказание
  Future<void> getPrediction() async {
    if (_widgetStatus == WidgetStatusModel.loading) {
      return;
    }
    setWidgetStatus(WidgetStatusModel.init);
    setPrediction(null);
    await Future.delayed(DurationTime.base);
    sendRequestForPrediction();
  }
}
