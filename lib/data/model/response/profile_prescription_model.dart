import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'profile_prescription_model.freezed.dart';
part 'profile_prescription_model.g.dart';

@freezed
class ProfilePrescriptionModel with _$ProfilePrescriptionModel {
  const factory ProfilePrescriptionModel({
    required int id,
    required String name,
    required String startDate,
    required String interval,
    required int totalDoses,
    required List<PrescriptionEntry> prescriptionEntries,
  }) = _ProfilePrescriptionModel;

  factory ProfilePrescriptionModel.fromJson(Map<String, Object?> json) => _$ProfilePrescriptionModelFromJson(json);

  static List<ProfilePrescriptionModel> decode(List<dynamic> v) => v
      .map<ProfilePrescriptionModel>(
        (v) => ProfilePrescriptionModel.fromJson(v),
      )
      .toList();

  static String encode(List<ProfilePrescriptionModel> prescriptions) => jsonEncode(
        prescriptions
            .map<Map<String, dynamic>>(
              (prescription) => prescription.toJson(),
            )
            .toList(),
      );
}

@freezed
class PrescriptionEntry with _$PrescriptionEntry {
  const factory PrescriptionEntry({
    required int id,
    required int prescriptionId,
    required String date,
    required bool taken,
  }) = _PrescriptionEntry;

  factory PrescriptionEntry.fromJson(Map<String, Object?> json) => _$PrescriptionEntryFromJson(json);

  static List<PrescriptionEntry> decode(List<dynamic> v) => v
      .map<PrescriptionEntry>(
        (v) => PrescriptionEntry.fromJson(v),
      )
      .toList();
}
