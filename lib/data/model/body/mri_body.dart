import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'mri_body.freezed.dart';
part 'mri_body.g.dart';

@freezed
class AddMriBody with _$AddMriBody {
  const factory AddMriBody({
    required String dateMri,
    required int micSeverityId,
    required double mic,
    required int licSeverityId,
    required double lic,
  }) = _AddMriBody;

  factory AddMriBody.fromJson(Map<String, Object?> json) => _$AddMriBodyFromJson(json);
}

@freezed
class EditMriBody with _$EditMriBody {
  const factory EditMriBody({
    required int id,
    required String dateMri,
    required int micSeverityId,
    required double mic,
    required int licSeverityId,
    required double lic,
    int? patientId,
  }) = _EditMriBody;

  factory EditMriBody.fromJson(Map<String, Object?> json) => _$EditMriBodyFromJson(json);
}
