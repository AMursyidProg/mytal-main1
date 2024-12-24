import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'therapy_complications_model.freezed.dart';
part 'therapy_complications_model.g.dart';

@freezed
class TherapyComplicationsModel with _$TherapyComplicationsModel {
  const factory TherapyComplicationsModel({
    required int id,
    required bool selected,
    required String therapyComplicationDescr,
    required int therapyComplicationTypeID,
    required String therapyComplicationTypeDescr,
    //required String dateComplication,
  }) = _TherapyComplicationsModel;

  factory TherapyComplicationsModel.fromJson(Map<String, Object?> json) =>
      _$TherapyComplicationsModelFromJson(json);

  static List<TherapyComplicationsModel> decode(List<dynamic> v) => v
      .map<TherapyComplicationsModel>(
        (v) => TherapyComplicationsModel.fromJson(v),
      )
      .toList();
}
