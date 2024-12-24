import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'patient_detail_body.freezed.dart';
part 'patient_detail_body.g.dart';

@freezed
class EditPatientDetailBody with _$EditPatientDetailBody {
  const factory EditPatientDetailBody({
    required String name,
    String? sexDescr,
    required String dob,
    String? dateRegistration,
    required int sexId,
    int? ethnicId,
    String? ethnicDescr,
    int? centreId,
    String? centreDescr,
    int? diagnosisId,
    String? nric,
    String? profession,
    String? email,
  }) = _EditPatientDetailBody;

  factory EditPatientDetailBody.fromJson(Map<String, Object?> json) => _$EditPatientDetailBodyFromJson(json);
}