class ChangePasswordModel {
  int? statusCode;
  String? message;

  ChangePasswordModel({
    required this.statusCode,
    required this.message,
  });

  factory ChangePasswordModel.fromJson(Map<String, dynamic> jsonData) {
    return ChangePasswordModel(
      statusCode: jsonData['statusCode'],
      message: jsonData['message'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['message'] = message;
    return data;
  }
}
