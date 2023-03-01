// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.success,
    this.message,
    this.firstName,
  });

  bool? success;
  String? message;
  String? firstName;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        success: json["success"],
        message: json["message"],
        firstName: json["first_name"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "first_name": firstName,
      };
}
