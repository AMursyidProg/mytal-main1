import 'dart:convert';

class LoginBody {
  String username;
  String password;

  LoginBody({required this.username, required this.password});

  // factory LoginBody.fromJson(Map<String, dynamic> json) {
  //   username = json['username'];
  //   password = json['password'];
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    return data;
  }

  @override
  String toString() {
    return json.encode(toJson());
  }
}
