// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.v,
  });

  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  int? v;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        id: json["_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        password: json["password"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "password": password,
        "__v": v,
      };
}
