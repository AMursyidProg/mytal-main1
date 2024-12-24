/*import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:mytal/data/api/api_client.dart';
part 'mri_chart_model.freezed.dart';
part 'mri_chart_model.g.dart';

@freezed
class MriModel with _$MriModel {
  const factory MriModel({
    required int id,
    required String dateMri,
    required int micSeverityId,
    required double mic,
    required int licSeverityId,
    required double lic,
    String? micSeverityDescr,
    String? licSeverityDescr,
  }) = _MriChartModel;

  factory MriModel.fromJson(Map<String, Object?> json) =>
      _$MriChartModelFromJson(json);

  static List<MriModel> decode(List<dynamic> v) => v
      .map<MriModel>(
        (v) => MriModel.fromJson(v),
      )
      .toList();
}

class MriResponse {
  List<MriModel> mri;
  MetaDataResponse? metaData;
  MriResponse({required this.mri, this.metaData});
}*/
