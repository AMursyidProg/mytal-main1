import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'diagnosis_report_model.freezed.dart';
part 'diagnosis_report_model.g.dart';

@freezed
class DiagnosisReportModel with _$DiagnosisReportModel {
  const factory DiagnosisReportModel({
    required int id,
    required int categoryId,
    required int quantity,
    required String description,
  }) = _DiagnosisReportModel;

  factory DiagnosisReportModel.fromJson(Map<String, Object?> json) => _$DiagnosisReportModelFromJson(json);

  static List<DiagnosisReportModel> decode(List<dynamic> v) => v
      .map<DiagnosisReportModel>(
        (v) => DiagnosisReportModel.fromJson(v),
      )
      .toList();
}
