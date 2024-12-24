// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'therapy_complications_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EditTherapyComplicationsBodyImpl _$$EditTherapyComplicationsBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$EditTherapyComplicationsBodyImpl(
      id: json['id'] as int,
      selected: json['selected'] as bool,
      therapyComplicationDescr: json['therapyComplicationDescr'] as String,
      therapyComplicationTypeID: json['therapyComplicationTypeID'] as int,
      therapyComplicationTypeDescr:
          json['therapyComplicationTypeDescr'] as String,
    );

Map<String, dynamic> _$$EditTherapyComplicationsBodyImplToJson(
        _$EditTherapyComplicationsBodyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'selected': instance.selected,
      'therapyComplicationDescr': instance.therapyComplicationDescr,
      'therapyComplicationTypeID': instance.therapyComplicationTypeID,
      'therapyComplicationTypeDescr': instance.therapyComplicationTypeDescr,
    };
