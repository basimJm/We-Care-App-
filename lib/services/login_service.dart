import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mapd722_group2_project/models/login_model.dart';

class LoginService {
  static const String baseUrl = "https://patients-app-api-herokuapp.onrender.com";

  static Future<LoginModel> login({
    required String email,
    required String password,
  }) async {
    try {
      Map<String, String> headers = {
        "Accept": "application/json",
        'Content-Type': "application/json",
      };

      final response = await http.post(
        Uri.parse('$baseUrl/users/login'),
        headers: headers,
        body: jsonEncode({
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
          return loginModelFromJson(response.body);
        case 201:
          return loginModelFromJson(response.body);
        case 500:
          throw ("Failed to login");
        default:
          throw ("Failed to login");
      }
    } on SocketException catch (_) {
      throw ('No Internet connection available');
    } on Exception catch (err) {
      if (kDebugMode) {
        print(err);
      }
      throw ("Failed to login");
    }
  }
}
