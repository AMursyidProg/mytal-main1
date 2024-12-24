import 'dart:convert';

class ProfileMriModel {
  String? id;
  String? micSeverity;
  double? micValue;
  String? licSeverity;
  double? licValue;
  String? date;

  ProfileMriModel({
    this.id,
    this.micSeverity,
    this.micValue,
    this.licSeverity,
    this.licValue,
    this.date,
  });

  factory ProfileMriModel.fromJson(Map<String, dynamic> jsonData) {
    return ProfileMriModel(
      id: jsonData['id'],
      micSeverity: jsonData['micSeverity'],
      micValue: jsonData['micValue'],
      licSeverity: jsonData['licSeverity'],
      licValue: jsonData['licValue'],
      date: jsonData['date'],
    );
  }

  static Map<String, dynamic> toMap(ProfileMriModel profileMri) => {
        'id': profileMri.id,
        'micSeverity': profileMri.micSeverity,
        'micValue': profileMri.micValue,
        'licSeverity': profileMri.licSeverity,
        'licValue': profileMri.licValue,
        'date': profileMri.date,
      };

  static String encode(List<ProfileMriModel> profileMri) => json.encode(
        profileMri
            .map<Map<String, dynamic>>(
              (profileMri) => ProfileMriModel.toMap(profileMri),
            )
            .toList(),
      );

  static List<ProfileMriModel> decode(String profileMris) => (json.decode(profileMris) as List<dynamic>)
      .map<ProfileMriModel>(
        (item) => ProfileMriModel.fromJson(item),
      )
      .toList();

  @override
  String toString() {
    return toMap(this).toString();
  }
}
