import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:mytal/data/api/api_client.dart';
part 'admin_patient_model.freezed.dart';
part 'admin_patient_model.g.dart';

@freezed
class AdminPatientModel with _$AdminPatientModel {
  const factory AdminPatientModel({
    required int id,
    required String name,
    required String dateRegistration,
    required String dob,
    String? nric,
    required int sexId,
    required String sexDescr,
    required String tenantId,
    int? ethnicId,
    String? ethnicDescr,
    int? centreId,
    String? centreDescr,
  }) = _AdminPatientModel;

  factory AdminPatientModel.fromJson(Map<String, Object?> json) => _$AdminPatientModelFromJson(json);

  static List<AdminPatientModel> decode(List<dynamic> v) => v
      .map<AdminPatientModel>(
        (v) => AdminPatientModel.fromJson(v),
      )
      .toList();
}

class AdminPatientResponse {
  List<AdminPatientModel> patients;
  MetaDataResponse? metaData;
  AdminPatientResponse({required this.patients, this.metaData});
}
