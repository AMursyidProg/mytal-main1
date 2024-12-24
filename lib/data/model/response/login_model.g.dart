// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginModelImpl _$$LoginModelImplFromJson(Map<String, dynamic> json) =>
    _$LoginModelImpl(
      token: json['token'] as String?,
      refreshToken: json['refreshToken'] as String?,
      expiration: json['expiration'] as String?,
      name: json['name'] as String?,
      username: json['username'] as String?,
      tenantId: json['tenantId'] as String?,
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
      privileges: (json['privileges'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$LoginModelImplToJson(_$LoginModelImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'expiration': instance.expiration,
      'name': instance.name,
      'username': instance.username,
      'tenantId': instance.tenantId,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'privileges': instance.privileges,
    };
