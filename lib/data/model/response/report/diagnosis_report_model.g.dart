// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagnosis_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiagnosisReportModelImpl _$$DiagnosisReportModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DiagnosisReportModelImpl(
      id: json['id'] as int,
      categoryId: json['categoryId'] as int,
      quantity: json['quantity'] as int,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$DiagnosisReportModelImplToJson(
        _$DiagnosisReportModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'quantity': instance.quantity,
      'description': instance.description,
    };
