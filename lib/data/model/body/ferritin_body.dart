import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'ferritin_body.freezed.dart';
part 'ferritin_body.g.dart';

@freezed
class AddFerritinBody with _$AddFerritinBody {
  const factory AddFerritinBody({
    required String dateMeasured,
    required double level,
  }) = _AddFerritinBody;

  factory AddFerritinBody.fromJson(Map<String, Object?> json) => _$AddFerritinBodyFromJson(json);
}

@freezed
class EditFerritinBody with _$EditFerritinBody {
  const factory EditFerritinBody({
    required int id,
    required String dateMeasured,
    required double level,
    int? patientId,
  }) = _EditFerritinBody;

  factory EditFerritinBody.fromJson(Map<String, Object?> json) => _$EditFerritinBodyFromJson(json);
}
