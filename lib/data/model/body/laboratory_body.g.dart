// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'laboratory_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EditLaboratoryBodyImpl _$$EditLaboratoryBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$EditLaboratoryBodyImpl(
      hbA: (json['hbA'] as num?)?.toDouble(),
      hbA2: (json['hbA2'] as num?)?.toDouble(),
      hbE: (json['hbE'] as num?)?.toDouble(),
      hbF: (json['hbF'] as num?)?.toDouble(),
      hbH: (json['hbH'] as num?)?.toDouble(),
      hbNA: (json['hbNA'] as num?)?.toDouble(),
      hbOthers: (json['hbOthers'] as num?)?.toDouble(),
      lab: json['lab'] as String?,
      patientId: json['patientId'] as int?,
    );

Map<String, dynamic> _$$EditLaboratoryBodyImplToJson(
        _$EditLaboratoryBodyImpl instance) =>
    <String, dynamic>{
      'hbA': instance.hbA,
      'hbA2': instance.hbA2,
      'hbE': instance.hbE,
      'hbF': instance.hbF,
      'hbH': instance.hbH,
      'hbNA': instance.hbNA,
      'hbOthers': instance.hbOthers,
      'lab': instance.lab,
      'patientId': instance.patientId,
    };
