import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'complication_model.freezed.dart';
part 'complication_model.g.dart';

@freezed
class ComplicationModel with _$ComplicationModel {
  const factory ComplicationModel({
    required int id,
    required int complicationTypeId,
    required int complicationStatusId,
    required String complicationStatusDescr,
    required String complicationTypeDescr,
    String? dateComplication,
  }) = _ComplicationModel;

  factory ComplicationModel.fromJson(Map<String, Object?> json) => _$ComplicationModelFromJson(json);

  static List<ComplicationModel> decode(List<dynamic> v) => v
      .map<ComplicationModel>(
        (v) => ComplicationModel.fromJson(v),
      )
      .toList();
}
