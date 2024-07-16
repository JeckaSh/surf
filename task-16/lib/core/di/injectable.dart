import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:surf_flutter_courses_template/core/network/client/dio.dart';
import 'package:surf_flutter_courses_template/core/network/client/rest.dart';
import 'package:surf_flutter_courses_template/core/repository/prediction_repository.dart';

final injector = GetIt.instance;

/// Настройка зависимостей
Future<void> initDependencyInjections() async {
  injector
    ..registerSingleton(DioClient.init())
    ..registerSingleton<RestClient>(RestClient(injector<Dio>()))
    ..registerSingleton<InterfacePredictionRepository>(
        PredictionRepository(injector.get<RestClient>()));
  await injector.allReady();
}
