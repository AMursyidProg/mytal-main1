// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileAppointmentModelImpl _$$ProfileAppointmentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfileAppointmentModelImpl(
      id: json['id'] as int,
      date: json['date'] as String,
      name: json['name'] as String,
      location: json['location'] as String?,
    );

Map<String, dynamic> _$$ProfileAppointmentModelImplToJson(
        _$ProfileAppointmentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'name': instance.name,
      'location': instance.location,
    };
