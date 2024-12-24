// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagnosis_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiagnosisModelImpl _$$DiagnosisModelImplFromJson(Map<String, dynamic> json) =>
    _$DiagnosisModelImpl(
      patientId: json['patientId'] as int,
      dateDiagnosed: json['dateDiagnosed'] as String,
      diagnosisDescr: json['diagnosisDescr'] as String,
      clinical: json['clinical'] as bool?,
      lab: json['lab'] as bool?,
    );

Map<String, dynamic> _$$DiagnosisModelImplToJson(
        _$DiagnosisModelImpl instance) =>
    <String, dynamic>{
      'patientId': instance.patientId,
      'dateDiagnosed': instance.dateDiagnosed,
      'diagnosisDescr': instance.diagnosisDescr,
      'clinical': instance.clinical,
      'lab': instance.lab,
    };
