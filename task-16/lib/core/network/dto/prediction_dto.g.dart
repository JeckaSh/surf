// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prediction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PredictionDTO _$PredictionDTOFromJson(Map<String, dynamic> json) =>
    PredictionDTO(
      reading: json['reading'] as String,
      isErrorMessage: json['isErrorMessage'] as bool? ?? false,
    );

Map<String, dynamic> _$PredictionDTOToJson(PredictionDTO instance) =>
    <String, dynamic>{
      'reading': instance.reading,
      'isErrorMessage': instance.isErrorMessage,
    };
