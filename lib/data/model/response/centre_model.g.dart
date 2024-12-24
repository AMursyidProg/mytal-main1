// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'centre_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CentreModelImpl _$$CentreModelImplFromJson(Map<String, dynamic> json) =>
    _$CentreModelImpl(
      id: json['id'] as int,
      stateId: json['stateId'] as int,
      tenantId: json['tenantId'] as String,
      centreName: json['centreName'] as String,
      shortName: json['shortName'] as String,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$$CentreModelImplToJson(_$CentreModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'stateId': instance.stateId,
      'tenantId': instance.tenantId,
      'centreName': instance.centreName,
      'shortName': instance.shortName,
      'active': instance.active,
    };
