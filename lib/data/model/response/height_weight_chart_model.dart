import 'dart:convert';

class HeightWeightChartModel {
  int? id;
  double? height;
  double? weight;
  double? age;

  HeightWeightChartModel({
    this.id,
    this.height,
    this.weight,
    this.age,
  });

  factory HeightWeightChartModel.fromJson(Map<String, dynamic> jsonData) {
    return HeightWeightChartModel(
      id: jsonData['id'],
      height: jsonData['height']?.toDouble(),
      weight: jsonData['weight']?.toDouble(),
      age: jsonData['age']?.toDouble(),
    );
  }

  static Map<String, dynamic> toMap(HeightWeightChartModel heightWeight) => {
        'id': heightWeight.id,
        'height': heightWeight.height,
        'weight': heightWeight.weight,
        'age': heightWeight.age,
      };

  static String encode(List<HeightWeightChartModel> v) => json.encode(
        v
            .map<Map<String, dynamic>>(
              (item) => HeightWeightChartModel.toMap(item),
            )
            .toList(),
      );

  static List<HeightWeightChartModel> decode(List<dynamic> v) => v
      .map<HeightWeightChartModel>(
        (v) => HeightWeightChartModel.fromJson(v),
      )
      .toList();

  @override
  String toString() {
    return toMap(this).toString();
  }
}
