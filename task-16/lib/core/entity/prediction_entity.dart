import 'package:surf_flutter_courses_template/core/network/dto/prediction_dto.dart';

class PredictionEntity {
  final String message;

  final bool isErrorMessage;

  PredictionEntity({
    required this.message,
    this.isErrorMessage = false,
  });

  /// Получить сущность предсказания из DTO
  factory PredictionEntity.fromDto(PredictionDTO predictionDTO) {
    return PredictionEntity(
      message: predictionDTO.reading,
      isErrorMessage: predictionDTO.isErrorMessage,
    );
  }
}
