import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'chelation_type_model.freezed.dart';
part 'chelation_type_model.g.dart';

@freezed
class ChelationTypeModel with _$ChelationTypeModel {
  const factory ChelationTypeModel({
    required int id,
    required String chelationTypeDescr,
    required String shortname,
  }) = _ChelationTypeModel;

  factory ChelationTypeModel.fromJson(Map<String, Object?> json) => _$ChelationTypeModelFromJson(json);

  static List<ChelationTypeModel> decode(List<dynamic> v) => v
      .map<ChelationTypeModel>(
        (v) => ChelationTypeModel.fromJson(v),
      )
      .toList();
}
