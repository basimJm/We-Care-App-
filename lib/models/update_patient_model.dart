// To parse this JSON data, do
//
//     final updatePatientModel = updatePatientModelFromJson(jsonString);

import 'dart:convert';

UpdatePatientModel updatePatientModelFromJson(String str) =>
    UpdatePatientModel.fromJson(json.decode(str));

String updatePatientModelToJson(UpdatePatientModel data) =>
    json.encode(data.toJson());

class UpdatePatientModel {
  UpdatePatientModel({
    this.message,
  });

  String? message;

  factory UpdatePatientModel.fromJson(Map<String, dynamic> json) =>
      UpdatePatientModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
