// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ethnic_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EthnicReportModelImpl _$$EthnicReportModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EthnicReportModelImpl(
      id: json['id'] as int,
      categoryId: json['categoryId'] as int,
      quantity: json['quantity'] as int,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$EthnicReportModelImplToJson(
        _$EthnicReportModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'quantity': instance.quantity,
      'description': instance.description,
    };
