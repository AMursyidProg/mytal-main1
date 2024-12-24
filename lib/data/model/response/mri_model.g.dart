// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mri_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MriModelImpl _$$MriModelImplFromJson(Map<String, dynamic> json) =>
    _$MriModelImpl(
      id: json['id'] as int,
      dateMri: json['dateMri'] as String,
      micSeverityId: json['micSeverityId'] as int,
      mic: (json['mic'] as num).toDouble(),
      licSeverityId: json['licSeverityId'] as int,
      lic: (json['lic'] as num).toDouble(),
      micSeverityDescr: json['micSeverityDescr'] as String?,
      licSeverityDescr: json['licSeverityDescr'] as String?,
    );

Map<String, dynamic> _$$MriModelImplToJson(_$MriModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dateMri': instance.dateMri,
      'micSeverityId': instance.micSeverityId,
      'mic': instance.mic,
      'licSeverityId': instance.licSeverityId,
      'lic': instance.lic,
      'micSeverityDescr': instance.micSeverityDescr,
      'licSeverityDescr': instance.licSeverityDescr,
    };
