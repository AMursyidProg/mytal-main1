import 'dart:convert';

class ProfileChelationModel {
  String? id;
  String? chelation;
  double? dosage;
  String? date;

  ProfileChelationModel({
    this.id,
    this.chelation,
    this.dosage,
    this.date,
  });

  factory ProfileChelationModel.fromJson(Map<String, dynamic> jsonData) {
    return ProfileChelationModel(
      id: jsonData['id'],
      chelation: jsonData['chelation'],
      dosage: jsonData['dosage'],
      date: jsonData['date'],
    );
  }

  static Map<String, dynamic> toMap(ProfileChelationModel profileChelation) => {
        'id': profileChelation.id,
        'chelation': profileChelation.chelation,
        'dosage': profileChelation.dosage,
        'date': profileChelation.date,
      };

  static String encode(List<ProfileChelationModel> profileChelations) => json.encode(
        profileChelations
            .map<Map<String, dynamic>>(
              (profileChelation) => ProfileChelationModel.toMap(profileChelation),
            )
            .toList(),
      );

  static List<ProfileChelationModel> decode(String profileChelations) => (json.decode(profileChelations) as List<dynamic>)
      .map<ProfileChelationModel>(
        (profileChelation) => ProfileChelationModel.fromJson(profileChelation),
      )
      .toList();

  @override
  String toString() {
    return toMap(this).toString();
  }
}
