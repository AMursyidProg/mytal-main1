// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_patient_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminPatientBodyImpl _$$AdminPatientBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$AdminPatientBodyImpl(
      name: json['name'] as String,
      dateRegistration: json['dateRegistration'] as String,
      dob: json['dob'] as String,
      nric: json['nric'] as String?,
      sexId: json['sexId'] as int?,
      ethnicId: json['ethnicId'] as int?,
      ethnicDescr: json['ethnicDescr'] as String?,
      centreId: json['centreId'] as int?,
      centreDescr: json['centreDescr'] as String?,
    );

Map<String, dynamic> _$$AdminPatientBodyImplToJson(
        _$AdminPatientBodyImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'dateRegistration': instance.dateRegistration,
      'dob': instance.dob,
      'nric': instance.nric,
      'sexId': instance.sexId,
      'ethnicId': instance.ethnicId,
      'ethnicDescr': instance.ethnicDescr,
      'centreId': instance.centreId,
      'centreDescr': instance.centreDescr,
    };
