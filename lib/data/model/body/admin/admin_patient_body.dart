import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'admin_patient_body.freezed.dart';
part 'admin_patient_body.g.dart';

@freezed
class AdminPatientBody with _$AdminPatientBody {
  const factory AdminPatientBody({
    required String name,
    required String dateRegistration,
    required String dob,
    String? nric,
    int? sexId,
    //required String sexDescr,
    // required String tenantId,
    int? ethnicId,
    String? ethnicDescr,
    int? centreId,
    String? centreDescr,
  }) = _AdminPatientBody;

  factory AdminPatientBody.fromJson(Map<String, Object?> json) => _$AdminPatientBodyFromJson(json);
}
