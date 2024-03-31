import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mapd722_group2_project/models/blood_pressure_model.dart';

class BloodPressureService {
  static const String baseUrl = "https://patients-app-api-herokuapp.onrender.com";

  static Future<BloodPressureModel> addBloodPressure({
    required String patientId,
    required String category,
    required String date,
    required String nurseName,
    required String systolic,
    required String diastolic,
  }) async {
    try {
      Map<String, String> headers = {
        "Accept": "application/json",
        'Content-Type': "application/json",
      };

      final response = await http.post(
        Uri.parse('$baseUrl/patients/$patientId/tests'),
        headers: headers,
        body: jsonEncode({
          "category": category,
          "date": date,
          "nurse_name": nurseName,
          "readings": {
            "systolic": int.parse(systolic),
            "diastolic": int.parse(diastolic)
          }
        }),
      );

      if (kDebugMode) {
        print(response.statusCode);
        print(response.body);
      }

      switch (response.statusCode) {
        case 200:
          return bloodPressureModelFromJson(response.body);
        case 201:
          return bloodPressureModelFromJson(response.body);
        case 500:
          throw ("Failed to create test");
        default:
          throw ("Failed to create test");
      }
    } on SocketException catch (_) {
      throw ('No Internet connection available');
    } on Exception catch (err) {
      if (kDebugMode) {
        print(err);
      }
      throw ("Failed to create test");
    }
  }
}
