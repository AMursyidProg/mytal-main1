import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'profile_appointment_model.freezed.dart';
part 'profile_appointment_model.g.dart';

@freezed
class ProfileAppointmentModel with _$ProfileAppointmentModel {
  const factory ProfileAppointmentModel({
    required int id,
    required String date,
    required String name,
    String? location,
  }) = _ProfileAppointmentModel;

  factory ProfileAppointmentModel.fromJson(Map<String, Object?> json) => _$ProfileAppointmentModelFromJson(json);

  static List<ProfileAppointmentModel> decode(List<dynamic> v) => v
      .map<ProfileAppointmentModel>(
        (v) => ProfileAppointmentModel.fromJson(v),
      )
      .toList();

  static String encode(List<ProfileAppointmentModel> appointments) => jsonEncode(
        appointments
            .map<Map<String, dynamic>>(
              (appointment) => appointment.toJson(),
            )
            .toList(),
      );
}
