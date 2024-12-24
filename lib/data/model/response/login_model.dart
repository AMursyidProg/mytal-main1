import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:mytal/util/app_constants.dart';
part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
class LoginModel with _$LoginModel {
  const LoginModel._();

  const factory LoginModel({
    required String? token,
    required String? refreshToken,
    required String? expiration,
    required String? name,
    required String? username,
    required String? tenantId,
    required int? statusCode,
    required String? message,
    required List<String>? privileges,
  }) = _LoginModel;

  bool get isAdmin => privileges!.contains(AppConstants.roleAdmin);
  bool get isCentreUser => privileges!.contains(AppConstants.roleCentreUser);
  bool get isUser => privileges!.contains(AppConstants.roleUser);

  factory LoginModel.fromJson(Map<String, Object?> json) => _$LoginModelFromJson(json);

  static List<LoginModel> decode(List<dynamic> v) => v
      .map<LoginModel>(
        (v) => LoginModel.fromJson(v),
      )
      .toList();
}
