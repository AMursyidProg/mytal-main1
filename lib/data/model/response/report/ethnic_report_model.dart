import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'ethnic_report_model.freezed.dart';
part 'ethnic_report_model.g.dart';

@freezed
class EthnicReportModel with _$EthnicReportModel {
  const factory EthnicReportModel({
    required int id,
    required int categoryId,
    required int quantity,
    required String description,
  }) = _EthnicReportModel;

  factory EthnicReportModel.fromJson(Map<String, Object?> json) => _$EthnicReportModelFromJson(json);

  static List<EthnicReportModel> decode(List<dynamic> v) => v
      .map<EthnicReportModel>(
        (v) => EthnicReportModel.fromJson(v),
      )
      .toList();
}
