import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:mytal/data/api/api_client.dart';
part 'chelation_model.freezed.dart';
part 'chelation_model.g.dart';

@freezed
class ChelationModel with _$ChelationModel {
  const factory ChelationModel({
    required int id,
    required int chelationTypeId,
    required String chelationTypeDescr,
    required String dateStarted,
    double? dosage,
  }) = _ChelationModel;

  factory ChelationModel.fromJson(Map<String, Object?> json) => _$ChelationModelFromJson(json);

  static List<ChelationModel> decode(List<dynamic> v) => v
      .map<ChelationModel>(
        (v) => ChelationModel.fromJson(v),
      )
      .toList();
}

class ChelationResponse {
  List<ChelationModel> chelation;
  MetaDataResponse? metaData;
  ChelationResponse({required this.chelation, this.metaData});
}
