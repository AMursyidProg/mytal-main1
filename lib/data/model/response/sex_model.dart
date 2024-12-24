import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'sex_model.freezed.dart';
part 'sex_model.g.dart';

@freezed
class SexModel with _$SexModel {
  const factory SexModel({
    required int id,
    required String sexDescr,
  }) = _SexModel;

  factory SexModel.fromJson(Map<String, Object?> json) => _$SexModelFromJson(json);

  static List<SexModel> decode(List<dynamic> v) => v
      .map<SexModel>(
        (v) => SexModel.fromJson(v),
      )
      .toList();
}