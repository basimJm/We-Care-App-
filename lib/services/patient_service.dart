import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mapd722_group2_project/models/create_patient_model.dart';
import 'package:mapd722_group2_project/models/patient_critical_model.dart';
import 'package:mapd722_group2_project/models/patient_list_model.dart';

class PatientService {
  static const String baseUrl = "https://smarthealth2.herokuapp.com";

  static Future<CreatePatientModel> createNewPatient({
    required String firstName,
    required String lastName,
    required String email,
    required String mobileNumber,
    required String address,
    required String sex,
    required String dob,
  }) async {
    try {
      Map<String, String> headers = {
        "Accept": "application/json",
        'Content-Type': "application/json",
      };

      final response = await http.post(
        Uri.parse('$baseUrl/patients'),
        headers: headers,
        body: jsonEncode({
          "first_name": firstName,
          "last_name": lastName,
          "email": email,
          "mobile_number": mobileNumber,
          "address": address,
          "sex": sex,
          "date_of_birth": dob
        }),
      );

      if (kDebugMode) {
        print(response.statusCode);
        print(response.body);
      }

      switch (response.statusCode) {
        case 200:
          return createPatientModelFromJson(response.body);
        case 201:
          return createPatientModelFromJson(response.body);
        case 500:
          throw ("Failed to create patient");
        default:
          throw ("Failed to create patient");
      }
    } on SocketException catch (_) {
      throw ('No Internet connection available');
    } on Exception catch (err) {
      if (kDebugMode) {
        print(err);
      }
      throw ("Failed to create patient");
    }
  }

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

  static Future<List<PatientCriticalModel>>
      getPatientsWithCriticalConditions() async {
    try {
      Map<String, String> headers = {
        "Accept": "application/json",
        'Content-Type': "application/json",
      };

      final response = await http.get(
        Uri.parse('$baseUrl/patients/conditions'),
        headers: headers,
      );

      if (kDebugMode) {
        print(response.statusCode);
        print(response.body);
      }

      switch (response.statusCode) {
        case 200:
          return patientCriticalModelFromJson(response.body);
        case 201:
          return patientCriticalModelFromJson(response.body);
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
