import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'thal_code_report_model.freezed.dart';
part 'thal_code_report_model.g.dart';

@freezed
class ThalCodeReportModel with _$ThalCodeReportModel {
  const factory ThalCodeReportModel({
    required int id,
    required int categoryId,
    required int quantity,
    required String description,
    required String code,
  }) = _ThalCodeReportModel;

  factory ThalCodeReportModel.fromJson(Map<String, Object?> json) => _$ThalCodeReportModelFromJson(json);

  static List<ThalCodeReportModel> decode(List<dynamic> v) => v
      .map<ThalCodeReportModel>(
        (v) => ThalCodeReportModel.fromJson(v),
      )
      .toList();
}
