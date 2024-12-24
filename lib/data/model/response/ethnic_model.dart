import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'ethnic_model.freezed.dart';
part 'ethnic_model.g.dart';

@freezed
class EthnicModel with _$EthnicModel {
  const factory EthnicModel({
    required int id,
    required String ethnicDescr,
    required String tenantId,
  }) = _EthnicModel;

  factory EthnicModel.fromJson(Map<String, Object?> json) => _$EthnicModelFromJson(json);

  static List<EthnicModel> decode(List<dynamic> v) => v
      .map<EthnicModel>(
        (v) => EthnicModel.fromJson(v),
      )
      .toList();
}
