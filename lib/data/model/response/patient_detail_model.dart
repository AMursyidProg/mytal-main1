import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'patient_detail_model.freezed.dart';
part 'patient_detail_model.g.dart';

@freezed
class PatientDetailModel with _$PatientDetailModel {
  const factory PatientDetailModel({
    required String name,
    String? sexDescr,
    required String dob,
    String? dateRegistration,
    required int sexId,
    int? ethnicId,
    String? ethnicDescr,
    int? centreId,
    String? centreDescr,
    String? nric,
    String? profession,
    String? email,
  }) = _PatientDetailModel;

  factory PatientDetailModel.fromJson(Map<String, Object?> json) => _$PatientDetailModelFromJson(json);

  static String getGenderText(int sexId) {
    return sexId == 1 ? "Male" : "Female";
  }

  static int getGenderId(String gender) {
    return gender == "Male" ? 1 : 2;
  }
}
