// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chelation_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChelationTypeModelImpl _$$ChelationTypeModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChelationTypeModelImpl(
      id: json['id'] as int,
      chelationTypeDescr: json['chelationTypeDescr'] as String,
      shortname: json['shortname'] as String,
    );

Map<String, dynamic> _$$ChelationTypeModelImplToJson(
        _$ChelationTypeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chelationTypeDescr': instance.chelationTypeDescr,
      'shortname': instance.shortname,
    };
