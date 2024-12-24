// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PatientDetailModelImpl _$$PatientDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PatientDetailModelImpl(
      name: json['name'] as String,
      sexDescr: json['sexDescr'] as String?,
      dob: json['dob'] as String,
      dateRegistration: json['dateRegistration'] as String?,
      sexId: json['sexId'] as int,
      ethnicId: json['ethnicId'] as int?,
      ethnicDescr: json['ethnicDescr'] as String?,
      centreId: json['centreId'] as int?,
      centreDescr: json['centreDescr'] as String?,
      nric: json['nric'] as String?,
      profession: json['profession'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$PatientDetailModelImplToJson(
        _$PatientDetailModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'sexDescr': instance.sexDescr,
      'dob': instance.dob,
      'dateRegistration': instance.dateRegistration,
      'sexId': instance.sexId,
      'ethnicId': instance.ethnicId,
      'ethnicDescr': instance.ethnicDescr,
      'centreId': instance.centreId,
      'centreDescr': instance.centreDescr,
      'nric': instance.nric,
      'profession': instance.profession,
      'email': instance.email,
    };
