// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_patient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminPatientModelImpl _$$AdminPatientModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AdminPatientModelImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      dateRegistration: json['dateRegistration'] as String,
      dob: json['dob'] as String,
      nric: json['nric'] as String?,
      sexId: json['sexId'] as int,
      sexDescr: json['sexDescr'] as String,
      tenantId: json['tenantId'] as String,
      ethnicId: json['ethnicId'] as int?,
      ethnicDescr: json['ethnicDescr'] as String?,
      centreId: json['centreId'] as int?,
      centreDescr: json['centreDescr'] as String?,
    );

Map<String, dynamic> _$$AdminPatientModelImplToJson(
        _$AdminPatientModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dateRegistration': instance.dateRegistration,
      'dob': instance.dob,
      'nric': instance.nric,
      'sexId': instance.sexId,
      'sexDescr': instance.sexDescr,
      'tenantId': instance.tenantId,
      'ethnicId': instance.ethnicId,
      'ethnicDescr': instance.ethnicDescr,
      'centreId': instance.centreId,
      'centreDescr': instance.centreDescr,
    };
