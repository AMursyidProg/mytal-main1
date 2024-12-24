class PatientModel {
  int? id;
  String? name;
  String? centre;
  String? mykad;
  String? gender;
  String? dob;

  PatientModel({
    this.id,
    this.name,
    this.centre,
    this.mykad,
    this.gender,
    this.dob,
  });

  PatientModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    centre = json['centre'];
    mykad = json['mykad'];
    gender = json['gender'];
    dob = json['dob'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['centre'] = centre;
    data['mykad'] = mykad;
    data['gender'] = gender;
    data['dob'] = dob;
    return data;
  }
}
