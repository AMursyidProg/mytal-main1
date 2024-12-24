// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thal_code_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ThalCodeReportModelImpl _$$ThalCodeReportModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ThalCodeReportModelImpl(
      id: json['id'] as int,
      categoryId: json['categoryId'] as int,
      quantity: json['quantity'] as int,
      description: json['description'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$$ThalCodeReportModelImplToJson(
        _$ThalCodeReportModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'quantity': instance.quantity,
      'description': instance.description,
      'code': instance.code,
    };
