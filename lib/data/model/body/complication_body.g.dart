// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complication_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EditComplicationBodyImpl _$$EditComplicationBodyImplFromJson(
        Map<String, dynamic> json) =>
    _$EditComplicationBodyImpl(
      id: json['id'] as int,
      complicationStatusId: json['complicationStatusId'] as int,
      complicationStatusTypeId: json['complicationStatusTypeId'] as int,
      complicationTypeDescr: json['complicationTypeDescr'] as String,
      complicationTypeId: json['complicationTypeId'] as int,
      dateComplication: json['dateComplication'] as String?,
    );

Map<String, dynamic> _$$EditComplicationBodyImplToJson(
        _$EditComplicationBodyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'complicationStatusId': instance.complicationStatusId,
      'complicationStatusTypeId': instance.complicationStatusTypeId,
      'complicationTypeDescr': instance.complicationTypeDescr,
      'complicationTypeId': instance.complicationTypeId,
      'dateComplication': instance.dateComplication,
    };
