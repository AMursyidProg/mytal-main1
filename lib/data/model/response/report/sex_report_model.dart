import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'sex_report_model.freezed.dart';
part 'sex_report_model.g.dart';

@freezed
class SexReportModel with _$SexReportModel {
  const factory SexReportModel({
    required int id,
    required int categoryId,
    required int quantity,
    required String description,
  }) = _SexReportModel;

  factory SexReportModel.fromJson(Map<String, Object?> json) => _$SexReportModelFromJson(json);

  static List<SexReportModel> decode(List<dynamic> v) => v
      .map<SexReportModel>(
        (v) => SexReportModel.fromJson(v),
      )
      .toList();
}
