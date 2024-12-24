import 'dart:convert';

class ProfileWeightModel {
  String? id;
  double? weight;
  String? date;

  ProfileWeightModel({
    this.id,
    this.weight,
    this.date,
  });

  factory ProfileWeightModel.fromJson(Map<String, dynamic> jsonData) {
    return ProfileWeightModel(
      id: jsonData['id'],
      weight: jsonData['weight'],
      date: jsonData['date'],
    );
  }

  static Map<String, dynamic> toMap(ProfileWeightModel profileWeight) => {
        'id': profileWeight.id,
        'weight': profileWeight.weight,
        'date': profileWeight.date,
      };

  static String encode(List<ProfileWeightModel> profileWeights) => json.encode(
        profileWeights
            .map<Map<String, dynamic>>(
              (profileWeight) => ProfileWeightModel.toMap(profileWeight),
            )
            .toList(),
      );

  static List<ProfileWeightModel> decode(String profileWeights) => (json.decode(profileWeights) as List<dynamic>)
      .map<ProfileWeightModel>(
        (profileWeight) => ProfileWeightModel.fromJson(profileWeight),
      )
      .toList();

  @override
  String toString() {
    return toMap(this).toString();
  }
}
