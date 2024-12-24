// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'height_weight_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddHeightWeightBodyImpl _$$AddHeightWeightBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$AddHeightWeightBodyImpl(
      measuredDate: json['measuredDate'] as String,
      height: (json['height'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
    );

Map<String, dynamic> _$$AddHeightWeightBodyImplToJson(
        _$AddHeightWeightBodyImpl instance) =>
    <String, dynamic>{
      'measuredDate': instance.measuredDate,
      'height': instance.height,
      'weight': instance.weight,
    };

_$EditHeightWeightBodyImpl _$$EditHeightWeightBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$EditHeightWeightBodyImpl(
      id: json['id'] as int,
      measuredDate: json['measuredDate'] as String,
      height: (json['height'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
      patientID: json['patientID'] as int?,
    );

Map<String, dynamic> _$$EditHeightWeightBodyImplToJson(
        _$EditHeightWeightBodyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'measuredDate': instance.measuredDate,
      'height': instance.height,
      'weight': instance.weight,
      'patientID': instance.patientID,
    };
