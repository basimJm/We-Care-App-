// To parse this JSON data, do
//
//     final patientCriticalModel = patientCriticalModelFromJson(jsonString);

import 'dart:convert';

List<PatientCriticalModel> patientCriticalModelFromJson(String str) =>
    List<PatientCriticalModel>.from(
        json.decode(str).map((x) => PatientCriticalModel.fromJson(x)));

String patientCriticalModelToJson(List<PatientCriticalModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PatientCriticalModel {
  PatientCriticalModel({
    this.id,
    this.testId,
    this.dateTested,
    this.firstName,
    this.lastName,
    this.sex,
    this.dateOfBirth,
    this.conditions,
  });

  String? id;
  String? testId;
  DateTime? dateTested;
  String? firstName;
  String? lastName;
  String? sex;
  DateTime? dateOfBirth;
  List<String>? conditions;

  factory PatientCriticalModel.fromJson(Map<String, dynamic> json) =>
      PatientCriticalModel(
        id: json["_id"],
        testId: json["test_id"],
        dateTested: json["date_tested"] == null
            ? null
            : DateTime.parse(json["date_tested"]),
        firstName: json["first_name"],
        lastName: json["last_name"],
        sex: json["sex"],
        dateOfBirth: json["date_of_birth"] == null
            ? null
            : DateTime.parse(json["date_of_birth"]),
        conditions: json["conditions"] == null
            ? []
            : List<String>.from(json["conditions"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "test_id": testId,
        "date_tested":
            "${dateTested!.year.toString().padLeft(4, '0')}-${dateTested!.month.toString().padLeft(2, '0')}-${dateTested!.day.toString().padLeft(2, '0')}",
        "first_name": firstName,
        "last_name": lastName,
        "sex": sex,
        "date_of_birth":
            "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "conditions": conditions == null
            ? []
            : List<dynamic>.from(conditions!.map((x) => x)),
      };
}
