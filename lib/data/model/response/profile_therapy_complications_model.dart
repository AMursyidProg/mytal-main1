import 'dart:convert';

class ProfileTherapyComplicationsModel {
  String? id;
  String? date;
  List<String>? complications;

  ProfileTherapyComplicationsModel({
    this.id,
    this.complications,
    this.date,
  });

  factory ProfileTherapyComplicationsModel.fromJson(Map<String, dynamic> jsonData) {
    return ProfileTherapyComplicationsModel(
      id: jsonData['id'],
      // complications: jsonData['complications'],
      complications: jsonData["complications"] == null ? null : List<String>.from(jsonData['complications'].map((x) => x)),
      date: jsonData['date'],
    );
  }

  static Map<String, dynamic> toMap(ProfileTherapyComplicationsModel profileTherapyComplications) => {
        'id': profileTherapyComplications.id,
        // 'complications': profileTherapyComplications.complications,
        'complications':
            profileTherapyComplications.complications == null ? null : List<dynamic>.from(profileTherapyComplications.complications!.map((x) => x)),
        'date': profileTherapyComplications.date,
      };

  static String encode(List<ProfileTherapyComplicationsModel> profileTherapyComplications) => json.encode(
        profileTherapyComplications
            .map<Map<String, dynamic>>(
              (profileTherapyComplication) => ProfileTherapyComplicationsModel.toMap(profileTherapyComplication),
            )
            .toList(),
      );

  static List<ProfileTherapyComplicationsModel> decode(String profileTherapyComplications) =>
      (json.decode(profileTherapyComplications) as List<dynamic>)
          .map<ProfileTherapyComplicationsModel>(
            (item) => ProfileTherapyComplicationsModel.fromJson(item),
          )
          .toList();

  @override
  String toString() {
    return toMap(this).toString();
  }
}
