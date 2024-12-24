// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'growth_chart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GrowthChartModelImpl _$$GrowthChartModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GrowthChartModelImpl(
      id: json['id'] as int,
      height3: (json['height3'] as num).toDouble(),
      height50: (json['height50'] as num).toDouble(),
      height97: (json['height97'] as num).toDouble(),
      weight3: (json['weight3'] as num).toDouble(),
      weight50: (json['weight50'] as num).toDouble(),
      weight97: (json['weight97'] as num).toDouble(),
      ageYear: (json['ageYear'] as num).toDouble(),
    );

Map<String, dynamic> _$$GrowthChartModelImplToJson(
        _$GrowthChartModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'height3': instance.height3,
      'height50': instance.height50,
      'height97': instance.height97,
      'weight3': instance.weight3,
      'weight50': instance.weight50,
      'weight97': instance.weight97,
      'ageYear': instance.ageYear,
    };
