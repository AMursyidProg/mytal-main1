import 'dart:convert';

class ProfileFerritinModel {
  String? id;
  double? ferritin;
  String? date;

  ProfileFerritinModel({
    this.id,
    this.ferritin,
    this.date,
  });

  factory ProfileFerritinModel.fromJson(Map<String, dynamic> jsonData) {
    return ProfileFerritinModel(
      id: jsonData['id'],
      ferritin: jsonData['ferritin'],
      date: jsonData['date'],
    );
  }

  static Map<String, dynamic> toMap(ProfileFerritinModel profileFerritin) => {
        'id': profileFerritin.id,
        'ferritin': profileFerritin.ferritin,
        'date': profileFerritin.date,
      };

  static String encode(List<ProfileFerritinModel> profileFerritins) => json.encode(
        profileFerritins
            .map<Map<String, dynamic>>(
              (profileFerritin) => ProfileFerritinModel.toMap(profileFerritin),
            )
            .toList(),
      );

  static List<ProfileFerritinModel> decode(String profileFerritins) => (json.decode(profileFerritins) as List<dynamic>)
      .map<ProfileFerritinModel>(
        (profileFerritin) => ProfileFerritinModel.fromJson(profileFerritin),
      )
      .toList();

  @override
  String toString() {
    return toMap(this).toString();
  }
}
