import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'height_weight_body.freezed.dart';
part 'height_weight_body.g.dart';

@freezed
class AddHeightWeightBody with _$AddHeightWeightBody {
  const factory AddHeightWeightBody({
    required String measuredDate,
    required double height,
    required double weight,
  }) = _AddHeightWeightBody;

  factory AddHeightWeightBody.fromJson(Map<String, Object?> json) => _$AddHeightWeightBodyFromJson(json);
}

@freezed
class EditHeightWeightBody with _$EditHeightWeightBody {
  const factory EditHeightWeightBody({
    required int id,
    required String measuredDate,
    required double height,
    required double weight,
    int? patientID,
  }) = _EditHeightWeightBody;

  factory EditHeightWeightBody.fromJson(Map<String, Object?> json) => _$EditHeightWeightBodyFromJson(json);
}
