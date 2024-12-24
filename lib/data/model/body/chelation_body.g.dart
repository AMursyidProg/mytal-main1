// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chelation_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddChelationBodyImpl _$$AddChelationBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$AddChelationBodyImpl(
      dateStarted: json['dateStarted'] as String,
      chelationTypeId: json['chelationTypeId'] as int,
      chelationTypeDescr: json['chelationTypeDescr'] as String,
      dosage: (json['dosage'] as num).toDouble(),
    );

Map<String, dynamic> _$$AddChelationBodyImplToJson(
        _$AddChelationBodyImpl instance) =>
    <String, dynamic>{
      'dateStarted': instance.dateStarted,
      'chelationTypeId': instance.chelationTypeId,
      'chelationTypeDescr': instance.chelationTypeDescr,
      'dosage': instance.dosage,
    };

_$EditChelationBodyImpl _$$EditChelationBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$EditChelationBodyImpl(
      id: json['id'] as int,
      dateStarted: json['dateStarted'] as String,
      chelationTypeId: json['chelationTypeId'] as int,
      chelationTypeDescr: json['chelationTypeDescr'] as String,
      dosage: (json['dosage'] as num).toDouble(),
      patientId: json['patientId'] as int?,
    );

Map<String, dynamic> _$$EditChelationBodyImplToJson(
        _$EditChelationBodyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dateStarted': instance.dateStarted,
      'chelationTypeId': instance.chelationTypeId,
      'chelationTypeDescr': instance.chelationTypeDescr,
      'dosage': instance.dosage,
      'patientId': instance.patientId,
    };
