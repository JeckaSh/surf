import 'package:json_annotation/json_annotation.dart';

/// Сгенерировнная часть
part 'prediction_dto.g.dart';

/// Модель предсказания
@JsonSerializable()
class PredictionDTO {
  final String reading;

  final bool isErrorMessage;

  PredictionDTO({
    required this.reading,
    this.isErrorMessage = false,
  });

  factory PredictionDTO.fromJson(Map<String, dynamic> json) =>
      _$PredictionDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PredictionDTOToJson(this);
}
