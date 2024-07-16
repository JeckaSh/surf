import 'package:surf_flutter_courses_template/core/entity/prediction_entity.dart';
import 'package:surf_flutter_courses_template/core/network/client/rest.dart';
import 'package:surf_flutter_courses_template/core/network/dto/prediction_dto.dart';

/// Интерфейс источника данны с предсказаниями
interface class InterfacePredictionRepository {
  /// Получить предсказание
  Future<PredictionEntity> getPrediction() {
    throw UnimplementedError();
  }
}

/// Реализация интерфейса источника данных с предсказаниями
class PredictionRepository implements InterfacePredictionRepository {
  /// Клиент сетевого взаимодействия
  final RestClient client;

  PredictionRepository(this.client);

  @override
  Future<PredictionEntity> getPrediction() async {
    PredictionDTO dto;
    try {
      dto = await client.getPrediction();
    } catch (_) {
      dto = PredictionDTO(reading: 'Error. Try again', isErrorMessage: true);
    }
    return PredictionEntity.fromDto(dto);
  }
}
