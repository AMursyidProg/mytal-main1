// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ferritin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FerritinModelImpl _$$FerritinModelImplFromJson(Map<String, dynamic> json) =>
    _$FerritinModelImpl(
      id: json['id'] as int,
      dateMeasured: json['dateMeasured'] as String,
      level: (json['level'] as num).toDouble(),
    );

Map<String, dynamic> _$$FerritinModelImplToJson(_$FerritinModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dateMeasured': instance.dateMeasured,
      'level': instance.level,
    };
