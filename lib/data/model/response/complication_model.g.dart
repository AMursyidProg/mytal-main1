// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complication_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ComplicationModelImpl _$$ComplicationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ComplicationModelImpl(
      id: json['id'] as int,
      complicationTypeId: json['complicationTypeId'] as int,
      complicationStatusId: json['complicationStatusId'] as int,
      complicationStatusDescr: json['complicationStatusDescr'] as String,
      complicationTypeDescr: json['complicationTypeDescr'] as String,
      dateComplication: json['dateComplication'] as String?,
    );

Map<String, dynamic> _$$ComplicationModelImplToJson(
        _$ComplicationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'complicationTypeId': instance.complicationTypeId,
      'complicationStatusId': instance.complicationStatusId,
      'complicationStatusDescr': instance.complicationStatusDescr,
      'complicationTypeDescr': instance.complicationTypeDescr,
      'dateComplication': instance.dateComplication,
    };
