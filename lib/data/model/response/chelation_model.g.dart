// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chelation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChelationModelImpl _$$ChelationModelImplFromJson(Map<String, dynamic> json) =>
    _$ChelationModelImpl(
      id: json['id'] as int,
      chelationTypeId: json['chelationTypeId'] as int,
      chelationTypeDescr: json['chelationTypeDescr'] as String,
      dateStarted: json['dateStarted'] as String,
      dosage: (json['dosage'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ChelationModelImplToJson(
        _$ChelationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chelationTypeId': instance.chelationTypeId,
      'chelationTypeDescr': instance.chelationTypeDescr,
      'dateStarted': instance.dateStarted,
      'dosage': instance.dosage,
    };
