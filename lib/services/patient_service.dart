import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mapd722_group2_project/models/patient_list_model.dart';

class PatientService {
  static const String baseUrl = "https://smarthealth2.herokuapp.com";

  static Future<List<PatientListModel>> getPatientLists() async {
    try {
      Map<String, String> headers = {
        "Accept": "application/json",
        'Content-Type': "application/json",
      };

      final response = await http.get(
        Uri.parse('$baseUrl/patients'),
        headers: headers,
      );

      if (kDebugMode) {
        print(response.statusCode);
        print(response.body);
      }

      switch (response.statusCode) {
        case 200:
          return patientListModelFromJson(response.body);
        case 201:
          return patientListModelFromJson(response.body);
        case 500:
          throw ("Failed to load data");
        default:
          throw ("Failed to load data");
      }
    } on SocketException catch (_) {
      throw ('No Internet connection available');
    } on Exception catch (err) {
      if (kDebugMode) {
        print(err);
      }
      throw ("Failed to load data");
    }
  }
}
