import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'mic_severity_model.freezed.dart';
part 'mic_severity_model.g.dart';

@freezed
class MicSeverityModel with _$MicSeverityModel {
  const factory MicSeverityModel({
    required int id,
    required String severityDescr,
  }) = _MicSeverityModel;

  factory MicSeverityModel.fromJson(Map<String, Object?> json) => _$MicSeverityModelFromJson(json);

  static List<MicSeverityModel> decode(List<dynamic> v) => v
      .map<MicSeverityModel>(
        (v) => MicSeverityModel.fromJson(v),
      )
      .toList();
}
