import 'dart:convert';

class ProfileTransfusionModel {
  String? id;
  double? volume;
  String? date;

  ProfileTransfusionModel({
    this.id,
    this.volume,
    this.date,
  });

  factory ProfileTransfusionModel.fromJson(Map<String, dynamic> jsonData) {
    return ProfileTransfusionModel(
      id: jsonData['id'],
      volume: jsonData['volume'],
      date: jsonData['date'],
    );
  }

  static Map<String, dynamic> toMap(ProfileTransfusionModel profileTransfusion) => {
        'id': profileTransfusion.id,
        'volume': profileTransfusion.volume,
        'date': profileTransfusion.date,
      };

  static String encode(List<ProfileTransfusionModel> profileTransfusions) => json.encode(
        profileTransfusions
            .map<Map<String, dynamic>>(
              (profileTransfusion) => ProfileTransfusionModel.toMap(profileTransfusion),
            )
            .toList(),
      );

  static List<ProfileTransfusionModel> decode(String profileTransfusions) => (json.decode(profileTransfusions) as List<dynamic>)
      .map<ProfileTransfusionModel>(
        (profileTransfusion) => ProfileTransfusionModel.fromJson(profileTransfusion),
      )
      .toList();

  @override
  String toString() {
    return toMap(this).toString();
  }
}
