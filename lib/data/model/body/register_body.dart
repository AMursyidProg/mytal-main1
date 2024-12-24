//import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';

class RegisterBody {
  String name;
  String username;
  String email;
  String password;
  String sexId;
  int countryId;
  String dob;

  RegisterBody(
      {required this.name,
      required this.username,
      required this.email,
      required this.password,
      required this.sexId,
      required this.countryId,
      required this.dob});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    data['sexId'] = sexId;
    data['countryId'] = countryId;
    data['dob'] = dob;

    return data;
  }
}
