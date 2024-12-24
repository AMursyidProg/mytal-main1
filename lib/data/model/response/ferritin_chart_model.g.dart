// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ferritin_chart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FerritinChartModelImpl _$$FerritinChartModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FerritinChartModelImpl(
      id: json['id'] as int,
      dateMeasured: json['dateMeasured'] as String,
      level: (json['level'] as num).toDouble(),
    );

Map<String, dynamic> _$$FerritinChartModelImplToJson(
        _$FerritinChartModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dateMeasured': instance.dateMeasured,
      'level': instance.level,
    };
