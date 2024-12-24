// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'height_weight_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HeightWeightModelImpl _$$HeightWeightModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HeightWeightModelImpl(
      id: json['id'] as int,
      measuredDate: json['measuredDate'] as String,
      height: (json['height'] as num?)?.toDouble() ?? 0,
      weight: (json['weight'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$HeightWeightModelImplToJson(
        _$HeightWeightModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'measuredDate': instance.measuredDate,
      'height': instance.height,
      'weight': instance.weight,
    };
