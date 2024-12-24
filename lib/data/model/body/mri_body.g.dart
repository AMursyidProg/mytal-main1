// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mri_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddMriBodyImpl _$$AddMriBodyImplFromJson(Map<String, dynamic> json) =>
    _$AddMriBodyImpl(
      dateMri: json['dateMri'] as String,
      micSeverityId: json['micSeverityId'] as int,
      mic: (json['mic'] as num).toDouble(),
      licSeverityId: json['licSeverityId'] as int,
      lic: (json['lic'] as num).toDouble(),
    );

Map<String, dynamic> _$$AddMriBodyImplToJson(_$AddMriBodyImpl instance) =>
    <String, dynamic>{
      'dateMri': instance.dateMri,
      'micSeverityId': instance.micSeverityId,
      'mic': instance.mic,
      'licSeverityId': instance.licSeverityId,
      'lic': instance.lic,
    };

_$EditMriBodyImpl _$$EditMriBodyImplFromJson(Map<String, dynamic> json) =>
    _$EditMriBodyImpl(
      id: json['id'] as int,
      dateMri: json['dateMri'] as String,
      micSeverityId: json['micSeverityId'] as int,
      mic: (json['mic'] as num).toDouble(),
      licSeverityId: json['licSeverityId'] as int,
      lic: (json['lic'] as num).toDouble(),
      patientId: json['patientId'] as int?,
    );

Map<String, dynamic> _$$EditMriBodyImplToJson(_$EditMriBodyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dateMri': instance.dateMri,
      'micSeverityId': instance.micSeverityId,
      'mic': instance.mic,
      'licSeverityId': instance.licSeverityId,
      'lic': instance.lic,
      'patientId': instance.patientId,
    };
