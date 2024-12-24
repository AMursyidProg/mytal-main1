import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'complication_body.freezed.dart';
part 'complication_body.g.dart';

@freezed
class EditComplicationBody with _$EditComplicationBody {
  const factory EditComplicationBody({
    required int id,
    required int complicationStatusId,
    required int complicationStatusTypeId,
    required String complicationTypeDescr,
    required int complicationTypeId,
    String? dateComplication,
  }) = _EditComplicationBody;

  factory EditComplicationBody.fromJson(Map<String, Object?> json) => _$EditComplicationBodyFromJson(json);
}
