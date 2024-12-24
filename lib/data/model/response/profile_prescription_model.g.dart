// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_prescription_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfilePrescriptionModelImpl _$$ProfilePrescriptionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfilePrescriptionModelImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      startDate: json['startDate'] as String,
      interval: json['interval'] as String,
      totalDoses: json['totalDoses'] as int,
      prescriptionEntries: (json['prescriptionEntries'] as List<dynamic>)
          .map((e) => PrescriptionEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProfilePrescriptionModelImplToJson(
        _$ProfilePrescriptionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'startDate': instance.startDate,
      'interval': instance.interval,
      'totalDoses': instance.totalDoses,
      'prescriptionEntries': instance.prescriptionEntries,
    };

_$PrescriptionEntryImpl _$$PrescriptionEntryImplFromJson(
        Map<String, dynamic> json) =>
    _$PrescriptionEntryImpl(
      id: json['id'] as int,
      prescriptionId: json['prescriptionId'] as int,
      date: json['date'] as String,
      taken: json['taken'] as bool,
    );

Map<String, dynamic> _$$PrescriptionEntryImplToJson(
        _$PrescriptionEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prescriptionId': instance.prescriptionId,
      'date': instance.date,
      'taken': instance.taken,
    };
