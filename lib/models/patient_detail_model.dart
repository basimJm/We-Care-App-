// To parse this JSON data, do
//
//     final patientDetailModel = patientDetailModelFromJson(jsonString);

import 'dart:convert';

// Corrected: Function to handle a single JSON object, not a list
PatientDetailModel patientDetailModelFromJson(String str) =>
    PatientDetailModel.fromJson(json.decode(str));

// Corrected: Function to convert a single PatientDetailModel to JSON string
String patientDetailModelToJson(PatientDetailModel data) =>
    json.encode(data.toJson());

class PatientDetailModel {
  PatientDetailModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.mobileNumber,
    this.address,
    this.sex,
    this.dateOfBirth,
    this.v,
  });

  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? mobileNumber;
  String? address;
  String? sex;
  DateTime? dateOfBirth;
  int? v;

  factory PatientDetailModel.fromJson(Map<String, dynamic> json) =>
      PatientDetailModel(
        id: json["_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        mobileNumber: json["mobile_number"],
        address: json["address"],
        sex: json["sex"],
        dateOfBirth: json["date_of_birth"] == null
            ? null
            : DateTime.parse(json["date_of_birth"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "mobile_number": mobileNumber,
    "address": address,
    "sex": sex,
    "date_of_birth": dateOfBirth == null ? null :
    "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
    "__v": v,
  };
}
