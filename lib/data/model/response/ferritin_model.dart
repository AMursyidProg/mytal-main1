import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:mytal/data/api/api_client.dart';
import 'package:mytal/data/model/response/ferritin_chart_model.dart';
part 'ferritin_model.freezed.dart';
part 'ferritin_model.g.dart';

@freezed
class FerritinModel with _$FerritinModel {
  const factory FerritinModel({
    required int id,
    required String dateMeasured,
    required double level,
  }) = _FerritinModel;

  factory FerritinModel.fromJson(Map<String, Object?> json) =>
      _$FerritinModelFromJson(json);

  static List<FerritinModel> decode(List<dynamic> v) => v.map<FerritinModel>(
        (v) {
          FerritinModel ferritin = FerritinModel.fromJson(v);
          double level = ferritin.level ?? 0;
          return ferritin.copyWith(
            level: double.parse(level.toStringAsFixed(1)),
          );
        },
      ).toList();
}

class FerritinResponse {
  List<FerritinModel> ferritin;
  List<FerritinChartModel>? ferritinChart;
  MetaDataResponse? metaData;
  FerritinResponse({required this.ferritin, this.ferritinChart, this.metaData});
}
