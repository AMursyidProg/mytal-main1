import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'transfusion_body.freezed.dart';
part 'transfusion_body.g.dart';

@freezed
class AddTransfusionBody with _$AddTransfusionBody {
  const factory AddTransfusionBody({
    required String dateTransfusion,
    required int volume,
  }) = _AddTransfusionBody;

  factory AddTransfusionBody.fromJson(Map<String, Object?> json) => _$AddTransfusionBodyFromJson(json);
}

@freezed
class EditTransfusionBody with _$EditTransfusionBody {
  const factory EditTransfusionBody({
    required int id,
    required String dateTransfusion,
    required int volume,
  }) = _EditTransfusionBody;

  factory EditTransfusionBody.fromJson(Map<String, Object?> json) => _$EditTransfusionBodyFromJson(json);
}
