import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mapd722_group2_project/models/fix_patient_model.dart';

class FixPatientService {
  static const String baseUrl = "https://patients-app-api-herokuapp.onrender.com";

  static Future<FixPatientModel> fixPatient({
    required String patientId,
    required String testId,
    required String category,
    required String date,
    required String nurseName,
    required int systolic,
    required int diastolic,
  }) async {
    try {
      Map<String, String> headers = {
        "Accept": "application/json",
        'Content-Type': "application/json",
      };

      final response = await http.post(
        Uri.parse('$baseUrl/patients/$patientId/tests/$testId/fix'),
        headers: headers,
        body: jsonEncode({
          "category": category,
          "date": date,
          "nurse_name": nurseName,
          "readings": {"systolic": systolic, "diastolic": diastolic}
        }),
      );

      if (kDebugMode) {
        print('$baseUrl/patients/$patientId/tests/$testId/fix');
        print(response.statusCode);
        print(response.body);
      }

      switch (response.statusCode) {
        case 200:
          return fixPatientModelFromJson(response.body);
        case 201:
          return fixPatientModelFromJson(response.body);
        case 500:
          throw ("Failed to fix patient");
        default:
          throw ("Failed to fix patient");
      }
    } on SocketException catch (_) {
      throw ('No Internet connection available');
    } on Exception catch (err) {
      if (kDebugMode) {
        print(err);
      }
      throw ("Failed to fix patient");
    }
  }
}
