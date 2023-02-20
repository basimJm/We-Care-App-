import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mapd722_group2_project/models/clinical_records_model.dart';

class ClincalRecordService {
  static const String baseUrl = "https://smarthealth2.herokuapp.com";

  static Future<List<ClinicalRecordsModel>> getClincalRecords({
    required String patientId,
  }) async {
    try {
      Map<String, String> headers = {
        "Accept": "application/json",
        'Content-Type': "application/json",
      };

      final response = await http.get(
        Uri.parse('$baseUrl/patients/$patientId/tests'),
        headers: headers,
      );

      if (kDebugMode) {
        print(response.statusCode);
        print(response.body);
      }

      final dummyData = """
[
    {
        "_id": "63928b4b1e1f7d0016077636",
        "patient_id": "637fff890754010016ab8b9c",
        "category": "Blood Pressure",
        "date": "2022-12-08",
        "nurse_name": "Amanda",
        "readings": {
            "systolic": "130",
            "diastolic": "90"
        },
        "__v": 0
    },
    {
        "_id": "639278e92523cd001661e8f9",
        "patient_id": "637fff890754010016ab8b9c",
        "category": "Blood Pressure",
        "date": "2022-12-08",
        "nurse_name": "Amanda fixer",
        "readings": {
            "systolic": "80",
            "diastolic": "70"
        },
        "__v": 0
    },
    {
        "_id": "639278e92523cd001661e8f8",
        "patient_id": "637fff890754010016ab8b9c",
        "category": "Blood Pressure",
        "date": "2022-12-05",
        "nurse_name": "Sam",
        "readings": {
            "isVisible": false,
            "systolic": "130",
            "diastolic": "90"
        },
        "__v": 0
    },
    {
        "_id": "638a4410f3cd30ec437bd373",
        "patient_id": "637fff890754010016ab8b9c",
        "category": "Blood Pressure",
        "date": "2022-10-07",
        "nurse_name": "test",
        "readings": {
            "systolic": 80,
            "diastolic": 70
        },
        "__v": 0
    },
    {
        "_id": "638a4410f3cd30ec437bd372",
        "patient_id": "637fff890754010016ab8b9c",
        "category": "Blood Pressure",
        "date": "2022-12-02",
        "nurse_name": "Amanda",
        "readings": {
            "isVisible": false,
            "systolic": "130",
            "diastolic": "90"
        },
        "__v": 0
    },
    {
        "_id": "638a35255091c80016e3771f",
        "patient_id": "637fff890754010016ab8b9c",
        "category": "Heart Beat Rate",
        "date": "2022-12-02",
        "nurse_name": "Amanda",
        "readings": {
            "bpm": "100"
        },
        "__v": 0
    },
    {
        "_id": "638a35195091c80016e3771e",
        "patient_id": "637fff890754010016ab8b9c",
        "category": "Blood Oxygen Level",
        "date": "2022-12-02",
        "nurse_name": "Amanda",
        "readings": {
            "percentage": "98"
        },
        "__v": 0
    },
    {
        "_id": "638a35045091c80016e3771d",
        "patient_id": "637fff890754010016ab8b9c",
        "category": "Respiratory rate",
        "date": "2022-12-02",
        "nurse_name": "Sam",
        "readings": {
            "bpm": "98"
        },
        "__v": 0
    }
]


""";

      switch (response.statusCode) {
        case 200:
          return clinicalRecordsModelFromJson(dummyData);
        case 201:
          return clinicalRecordsModelFromJson(dummyData);
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
