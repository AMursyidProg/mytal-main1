import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'growth_chart_model.freezed.dart';
part 'growth_chart_model.g.dart';

@freezed
class GrowthChartModel with _$GrowthChartModel {
  const factory GrowthChartModel({
    required int id,
    required double height3,
    required double height50,
    required double height97,
    required double weight3,
    required double weight50,
    required double weight97,
    required double ageYear,
  }) = _GrowthChartModel;

  factory GrowthChartModel.fromJson(Map<String, Object?> json) => _$GrowthChartModelFromJson(json);

  static List<GrowthChartModel> decode(List<dynamic> v) => v
      .map<GrowthChartModel>(
        (v) => GrowthChartModel.fromJson(v),
      )
      .toList();
}
