// To parse this JSON data, do
//
//     final createPatientModel = createPatientModelFromJson(jsonString);

import 'dart:convert';

CreatePatientModel createPatientModelFromJson(String str) =>
    CreatePatientModel.fromJson(json.decode(str));

String createPatientModelToJson(CreatePatientModel data) =>
    json.encode(data.toJson());

class CreatePatientModel {
  CreatePatientModel({
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

  factory CreatePatientModel.fromJson(Map<String, dynamic> json) =>
      CreatePatientModel(
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
        "date_of_birth":
            "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "__v": v,
      };
}
