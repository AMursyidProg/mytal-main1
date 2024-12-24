// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ferritin_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddFerritinBodyImpl _$$AddFerritinBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$AddFerritinBodyImpl(
      dateMeasured: json['dateMeasured'] as String,
      level: (json['level'] as num).toDouble(),
    );

Map<String, dynamic> _$$AddFerritinBodyImplToJson(
        _$AddFerritinBodyImpl instance) =>
    <String, dynamic>{
      'dateMeasured': instance.dateMeasured,
      'level': instance.level,
    };

_$EditFerritinBodyImpl _$$EditFerritinBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$EditFerritinBodyImpl(
      id: json['id'] as int,
      dateMeasured: json['dateMeasured'] as String,
      level: (json['level'] as num).toDouble(),
      patientId: json['patientId'] as int?,
    );

Map<String, dynamic> _$$EditFerritinBodyImplToJson(
        _$EditFerritinBodyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dateMeasured': instance.dateMeasured,
      'level': instance.level,
      'patientId': instance.patientId,
    };
