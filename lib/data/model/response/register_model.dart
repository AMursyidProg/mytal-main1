class RegisterModel {
  int? statusCode;
  String? message;

  RegisterModel({
    required this.statusCode,
    required this.message,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> jsonData) {
    return RegisterModel(
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
