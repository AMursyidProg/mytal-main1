// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sex_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SexReportModelImpl _$$SexReportModelImplFromJson(Map<String, dynamic> json) =>
    _$SexReportModelImpl(
      id: json['id'] as int,
      categoryId: json['categoryId'] as int,
      quantity: json['quantity'] as int,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$SexReportModelImplToJson(
        _$SexReportModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'quantity': instance.quantity,
      'description': instance.description,
    };
