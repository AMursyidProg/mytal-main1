import 'dart:convert';

class ProfileHeightModel {
  String? id;
  double? height;
  String? date;

  ProfileHeightModel({
    this.id,
    this.height,
    this.date,
  });

  factory ProfileHeightModel.fromJson(Map<String, dynamic> jsonData) {
    return ProfileHeightModel(
      id: jsonData['id'],
      height: jsonData['height'],
      date: jsonData['date'],
    );
  }

  static Map<String, dynamic> toMap(ProfileHeightModel profileHeight) => {
        'id': profileHeight.id,
        'height': profileHeight.height,
        'date': profileHeight.date,
      };

  static String encode(List<ProfileHeightModel> profileHeights) => json.encode(
        profileHeights
            .map<Map<String, dynamic>>(
              (profileHeight) => ProfileHeightModel.toMap(profileHeight),
            )
            .toList(),
      );

  static List<ProfileHeightModel> decode(String profileHeights) => (json.decode(profileHeights) as List<dynamic>)
      .map<ProfileHeightModel>(
        (item) => ProfileHeightModel.fromJson(item),
      )
      .toList();

  @override
  String toString() {
    return toMap(this).toString();
  }
}
