// To parse this JSON data, do
//
//     final fixPatientModel = fixPatientModelFromJson(jsonString);

import 'dart:convert';

FixPatientModel fixPatientModelFromJson(String str) =>
    FixPatientModel.fromJson(json.decode(str));

String fixPatientModelToJson(FixPatientModel data) =>
    json.encode(data.toJson());

class FixPatientModel {
  FixPatientModel({
    this.success,
  });

  bool? success;

  factory FixPatientModel.fromJson(Map<String, dynamic> json) =>
      FixPatientModel(
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
      };
}
