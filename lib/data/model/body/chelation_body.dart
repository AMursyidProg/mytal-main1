import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'chelation_body.freezed.dart';
part 'chelation_body.g.dart';

@freezed
class AddChelationBody with _$AddChelationBody {
  const factory AddChelationBody({
    required String dateStarted,
    required int chelationTypeId,
    required String chelationTypeDescr,
    required double dosage,
  }) = _AddChelationBody;

  factory AddChelationBody.fromJson(Map<String, Object?> json) => _$AddChelationBodyFromJson(json);

}
@freezed
class EditChelationBody with _$EditChelationBody {
  const factory EditChelationBody({
    required int id,
    required String dateStarted,
    required int chelationTypeId,
    required String chelationTypeDescr,
    required double dosage,
    int? patientId,
  }) = _EditChelationBody;

  factory EditChelationBody.fromJson(Map<String, Object?> json) => _$EditChelationBodyFromJson(json);
}
