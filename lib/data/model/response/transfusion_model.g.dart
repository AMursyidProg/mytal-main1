// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfusion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransfusionModelImpl _$$TransfusionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransfusionModelImpl(
      id: json['id'] as int,
      dateTransfusion: json['dateTransfusion'] as String,
      volume: json['volume'] as int,
    );

Map<String, dynamic> _$$TransfusionModelImplToJson(
        _$TransfusionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dateTransfusion': instance.dateTransfusion,
      'volume': instance.volume,
    };
