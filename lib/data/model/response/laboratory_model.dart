import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'laboratory_model.freezed.dart';
part 'laboratory_model.g.dart';

@freezed
class LaboratoryModel with _$LaboratoryModel {
  const factory LaboratoryModel({
    required int patientId,
    double? hbA,
    double? hbA2,
    double? hbE,
    double? hbF,
    double? hbH,
    double? hbNA,
    double? hbOthers,
    bool? lab,
  }) = _LaboratoryModel;

  factory LaboratoryModel.fromJson(Map<String, Object?> json) => _$LaboratoryModelFromJson(json);
}
