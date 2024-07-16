import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:surf_flutter_courses_template/core/network/dto/prediction_dto.dart';

/// Сгенерированная часть
part 'rest.g.dart';

/// Клиент для сетевого взаимодействия с сервером
@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  /// Метод получения предсказания с сервера
  @GET('/')
  Future<PredictionDTO> getPrediction();
}
