import 'dart:convert';

class ProfileComplicationsModel {
  String? id;
  String? result;
  String? date;

  ProfileComplicationsModel({
    this.id,
    this.result,
    this.date,
  });

  factory ProfileComplicationsModel.fromJson(Map<String, dynamic> jsonData) {
    return ProfileComplicationsModel(
      id: jsonData['id'],
      result: jsonData['result'],
      date: jsonData['date'],
    );
  }

  static Map<String, dynamic> toMap(ProfileComplicationsModel profileComplication) => {
        'id': profileComplication.id,
        'result': profileComplication.result,
        'date': profileComplication.date,
      };

  static String encode(Map<String, ProfileComplicationsModel> profileComplications) => json.encode(
        profileComplications.map(
          (key, value) => MapEntry(
            key,
            ProfileComplicationsModel.toMap(value),
          ),
        ),
      );

  static Map<String, ProfileComplicationsModel> decode(String profileComplications) =>
      (json.decode(profileComplications) as Map<String, dynamic>).map(
        (key, value) => MapEntry(
          key,
          ProfileComplicationsModel.fromJson(value),
        ),
      );

  @override
  String toString() {
    return toMap(this).toString();
  }
}
