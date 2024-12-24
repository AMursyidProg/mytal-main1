import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mytal/data/model/response/profile_appointment_model.dart';
import 'package:mytal/data/model/response/profile_prescription_model.dart';
import 'package:mytal/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsProvider extends StateNotifier<Map<String, dynamic>> {
  PrefsProvider() : super({}) {
    state[AppConstants.isLoading] = true;
    _init();
  }

  late SharedPreferences prefs;

  Future _init() async {
    prefs = await SharedPreferences.getInstance();

    state[AppConstants.profileName] = prefs.getString(AppConstants.profileName) ?? "";
    state[AppConstants.username] = prefs.getString(AppConstants.username) ?? "";
    state[AppConstants.apiToken] = prefs.getString(AppConstants.apiToken) ?? "";
    state[AppConstants.tenantId] = prefs.getString(AppConstants.tenantId) ?? "";
    state[AppConstants.privileges] = prefs.getString(AppConstants.privileges) ?? AppConstants.roleUser;
    state[AppConstants.profilePrescriptions] = prefs.getString(AppConstants.profilePrescriptions) != null
        ? ProfilePrescriptionModel.decode(
            json.decode(
              prefs.getString(AppConstants.profilePrescriptions)!,
            ),
          )
        : <ProfilePrescriptionModel>[];
    state[AppConstants.profileAppointments] = prefs.getString(AppConstants.profileAppointments) != null
        ? ProfileAppointmentModel.decode(
            json.decode(
              prefs.getString(AppConstants.profileAppointments)!,
            ),
          )
        : <ProfileAppointmentModel>[];

    state = {...state, AppConstants.isLoading: false};
  }

  void remove(String key) {
    state = {...state, key: null};
    prefs.remove(key);
  }

  void setString(String key, String value) {
    state = {...state, key: value};
    prefs.setString(key, value);
  }

  void setList(String key, value) {
    String encodedValue = '';

    switch (key) {
      case AppConstants.profilePrescriptions:
        encodedValue = ProfilePrescriptionModel.encode(value);
        break;
      case AppConstants.profileAppointments:
        encodedValue = ProfileAppointmentModel.encode(value);
        break;
    }

    state = {...state, key: value};
    prefs.setString(key, encodedValue);
  }

  reset() async {
    prefs.clear();
    _init();
  }
}

final prefsProvider = StateNotifierProvider<PrefsProvider, Map<String, dynamic>>(
  (ref) => PrefsProvider(),
);
