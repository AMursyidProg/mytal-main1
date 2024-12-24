import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'centre_model.freezed.dart';
part 'centre_model.g.dart';

@freezed
class CentreModel with _$CentreModel {
  const factory CentreModel({
    required int id,
    required int stateId,
    required String tenantId,
    required String centreName,
    required String shortName,
    required bool active,
  }) = _CentreModel;

  factory CentreModel.fromJson(Map<String, Object?> json) => _$CentreModelFromJson(json);

  static List<CentreModel> decode(List<dynamic> v) => v
      .map<CentreModel>(
        (v) => CentreModel.fromJson(v),
      )
      .toList();
}
