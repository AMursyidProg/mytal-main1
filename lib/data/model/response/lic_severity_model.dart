import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'lic_severity_model.freezed.dart';
part 'lic_severity_model.g.dart';

@freezed
class LicSeverityModel with _$LicSeverityModel {
  const factory LicSeverityModel({
    required int id,
    required String severityDescr,
  }) = _LicSeverityModel;

  factory LicSeverityModel.fromJson(Map<String, Object?> json) => _$LicSeverityModelFromJson(json);

  static List<LicSeverityModel> decode(List<dynamic> v) => v
      .map<LicSeverityModel>(
        (v) => LicSeverityModel.fromJson(v),
      )
      .toList();
}
