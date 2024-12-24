import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'laboratory_body.freezed.dart';
part 'laboratory_body.g.dart';

@freezed
class EditLaboratoryBody with _$EditLaboratoryBody {
  const factory EditLaboratoryBody({
    double? hbA,
    double? hbA2,
    double? hbE,
    double? hbF,
    double? hbH,
    double? hbNA,
    double? hbOthers,
    String? lab,
    int? patientId,
  }) = _EditLaboratoryBody;

  factory EditLaboratoryBody.fromJson(Map<String, Object?> json) => _$EditLaboratoryBodyFromJson(json);
}
