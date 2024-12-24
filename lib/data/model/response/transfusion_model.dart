import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:mytal/data/api/api_client.dart';
part 'transfusion_model.freezed.dart';
part 'transfusion_model.g.dart';

@freezed
class TransfusionModel with _$TransfusionModel {
  const factory TransfusionModel({
    required int id,
    required String dateTransfusion,
    required int volume,
  }) = _TransfusionModel;

  factory TransfusionModel.fromJson(Map<String, Object?> json) => _$TransfusionModelFromJson(json);

  static List<TransfusionModel> decode(List<dynamic> v) => v
      .map<TransfusionModel>(
        (v) => TransfusionModel.fromJson(v),
      )
      .toList();
}

class TransfusionResponse {
  List<TransfusionModel> transfusion;
  MetaDataResponse? metaData;
  TransfusionResponse({required this.transfusion, this.metaData});
}
