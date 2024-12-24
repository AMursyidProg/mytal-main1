// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'therapy_complications_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TherapyComplicationsModelImpl _$$TherapyComplicationsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TherapyComplicationsModelImpl(
      id: json['id'] as int,
      selected: json['selected'] as bool,
      therapyComplicationDescr: json['therapyComplicationDescr'] as String,
      therapyComplicationTypeID: json['therapyComplicationTypeID'] as int,
      therapyComplicationTypeDescr:
          json['therapyComplicationTypeDescr'] as String,
    );

Map<String, dynamic> _$$TherapyComplicationsModelImplToJson(
        _$TherapyComplicationsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'selected': instance.selected,
      'therapyComplicationDescr': instance.therapyComplicationDescr,
      'therapyComplicationTypeID': instance.therapyComplicationTypeID,
      'therapyComplicationTypeDescr': instance.therapyComplicationTypeDescr,
    };
