import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'diagnosis_model.freezed.dart';
part 'diagnosis_model.g.dart';

@freezed
class DiagnosisModel with _$DiagnosisModel {
  const factory DiagnosisModel({
    required int patientId,
    required String dateDiagnosed,
    required String diagnosisDescr,
    bool? clinical,
    bool? lab,
  }) = _DiagnosisModel;

  factory DiagnosisModel.fromJson(Map<String, Object?> json) => _$DiagnosisModelFromJson(json);
}
