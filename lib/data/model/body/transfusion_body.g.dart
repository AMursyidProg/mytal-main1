// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfusion_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddTransfusionBodyImpl _$$AddTransfusionBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$AddTransfusionBodyImpl(
      dateTransfusion: json['dateTransfusion'] as String,
      volume: json['volume'] as int,
    );

Map<String, dynamic> _$$AddTransfusionBodyImplToJson(
        _$AddTransfusionBodyImpl instance) =>
    <String, dynamic>{
      'dateTransfusion': instance.dateTransfusion,
      'volume': instance.volume,
    };

_$EditTransfusionBodyImpl _$$EditTransfusionBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$EditTransfusionBodyImpl(
      id: json['id'] as int,
      dateTransfusion: json['dateTransfusion'] as String,
      volume: json['volume'] as int,
    );

Map<String, dynamic> _$$EditTransfusionBodyImplToJson(
        _$EditTransfusionBodyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dateTransfusion': instance.dateTransfusion,
      'volume': instance.volume,
    };
