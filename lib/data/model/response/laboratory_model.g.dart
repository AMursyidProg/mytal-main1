// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'laboratory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LaboratoryModelImpl _$$LaboratoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LaboratoryModelImpl(
      patientId: json['patientId'] as int,
      hbA: (json['hbA'] as num?)?.toDouble(),
      hbA2: (json['hbA2'] as num?)?.toDouble(),
      hbE: (json['hbE'] as num?)?.toDouble(),
      hbF: (json['hbF'] as num?)?.toDouble(),
      hbH: (json['hbH'] as num?)?.toDouble(),
      hbNA: (json['hbNA'] as num?)?.toDouble(),
      hbOthers: (json['hbOthers'] as num?)?.toDouble(),
      lab: json['lab'] as bool?,
    );

Map<String, dynamic> _$$LaboratoryModelImplToJson(
        _$LaboratoryModelImpl instance) =>
    <String, dynamic>{
      'patientId': instance.patientId,
      'hbA': instance.hbA,
      'hbA2': instance.hbA2,
      'hbE': instance.hbE,
      'hbF': instance.hbF,
      'hbH': instance.hbH,
      'hbNA': instance.hbNA,
      'hbOthers': instance.hbOthers,
      'lab': instance.lab,
    };
