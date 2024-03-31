import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mapd722_group2_project/models/register_model.dart';

class RegisterService {
  static const String baseUrl = "https://patients-app-api-herokuapp.onrender.com";

  static Future<RegisterModel> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      Map<String, String> headers = {
        "Accept": "application/json",
        'Content-Type': "application/json",
      };

      final response = await http.post(
        Uri.parse('$baseUrl/users'),
        headers: headers,
        body: jsonEncode({
          "first_name": firstName,
          "last_name": lastName,
          "email": email,
          "password": password,
        }),
      );

      if (kDebugMode) {
        print(response.statusCode);
        print(response.body);
      }

      switch (response.statusCode) {
        case 200:
          return registerModelFromJson(response.body);
        case 201:
          return registerModelFromJson(response.body);
        case 500:
          throw ("Failed to create user");
        default:
          throw ("Failed to create user");
      }
    } on SocketException catch (_) {
      throw ('No Internet connection available');
    } on Exception catch (err) {
      if (kDebugMode) {
        print(err);
      }
      throw ("Failed to create user");
    }
  }
}
