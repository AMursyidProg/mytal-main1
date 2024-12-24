import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:mytal/data/api/api_client.dart';
import 'package:mytal/data/model/response/growth_chart_model.dart';
import 'package:mytal/data/model/response/height_weight_chart_model.dart';
part 'height_weight_model.freezed.dart';
part 'height_weight_model.g.dart';

@freezed
class HeightWeightModel with _$HeightWeightModel {
  const factory HeightWeightModel({
    required int id,
    required String measuredDate,
    @Default(0) double? height,
    @Default(0) double? weight,
  }) = _HeightWeightModel;

  factory HeightWeightModel.fromJson(Map<String, Object?> json) => _$HeightWeightModelFromJson(json);

  static List<HeightWeightModel> decode(List<dynamic> v) => v.map<HeightWeightModel>(
        (v) {
          HeightWeightModel heightWeight = HeightWeightModel.fromJson(v);
          double height = heightWeight.height ?? 0;
          double weight = heightWeight.weight ?? 0;
          return heightWeight.copyWith(
            height: double.parse(height.toStringAsFixed(1)),
            weight: double.parse(
              weight.toStringAsFixed(1),
            ),
          );
        },
      ).toList();
}

class HeightWeightResponse {
  List<HeightWeightModel> heightWeight;
  List<HeightWeightChartModel>? heightWeightChart;
  List<GrowthChartModel>? growthChart;
  MetaDataResponse? metaData;
  HeightWeightResponse({required this.heightWeight, this.heightWeightChart, this.growthChart, this.metaData});
}
