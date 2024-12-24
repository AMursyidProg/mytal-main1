import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'therapy_complications_body.freezed.dart';
part 'therapy_complications_body.g.dart';

@freezed
class EditTherapyComplicationsBody with _$EditTherapyComplicationsBody {
  const factory EditTherapyComplicationsBody({
    required int id,
    required bool selected,
    required String therapyComplicationDescr,
    required int therapyComplicationTypeID,
    required String therapyComplicationTypeDescr,
    //required String dateComplication,
  }) = _EditTherapyComplicationsBody;

  factory EditTherapyComplicationsBody.fromJson(Map<String, Object?> json) =>
      _$EditTherapyComplicationsBodyFromJson(json);
}
