import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'ferritin_chart_model.freezed.dart';
part 'ferritin_chart_model.g.dart';

@freezed
class FerritinChartModel with _$FerritinChartModel {
  const factory FerritinChartModel({
    required int id,
    required String dateMeasured,
    required double level,
  }) = _FerritinChartModel;

  factory FerritinChartModel.fromJson(Map<String, Object?> json) => _$FerritinChartModelFromJson(json);

  static List<FerritinChartModel> decode(List<dynamic> v) => v
      .map<FerritinChartModel>(
        (v) => FerritinChartModel.fromJson(v),
      )
      .toList();
}
