// To parse this JSON data, do
//
//     final clinicalRecordsModel = clinicalRecordsModelFromJson(jsonString);

import 'dart:convert';

List<ClinicalRecordsModel> clinicalRecordsModelFromJson(String str) =>
    List<ClinicalRecordsModel>.from(
        json.decode(str).map((x) => ClinicalRecordsModel.fromJson(x)));

String clinicalRecordsModelToJson(List<ClinicalRecordsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClinicalRecordsModel {
  ClinicalRecordsModel({
    this.id,
    this.patientId,
    this.category,
    this.date,
    this.nurseName,
    this.readings,
    this.v,
  });

  String? id;
  String? patientId;
  String? category;
  String? date;
  String? nurseName;
  Readings? readings;
  int? v;

  factory ClinicalRecordsModel.fromJson(Map<String, dynamic> json) =>
      ClinicalRecordsModel(
        id: json["_id"],
        patientId: json["patient_id"],
        category: json["category"],
        date: json["date"],
        nurseName: json["nurse_name"],
        readings: json["readings"] == null
            ? null
            : Readings.fromJson(json["readings"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "patient_id": patientId,
        "category": category,
        "date": date,
        "nurse_name": nurseName,
        "readings": readings?.toJson(),
        "__v": v,
      };
}

class Readings {
  Readings({
    this.systolic,
    this.diastolic,
    this.isVisible,
    this.bpm,
    this.percentage,
  });

  dynamic systolic;
  dynamic diastolic;
  bool? isVisible;
  String? bpm;
  String? percentage;

  factory Readings.fromJson(Map<String, dynamic> json) => Readings(
        systolic: json["systolic"],
        diastolic: json["diastolic"],
        isVisible: json["isVisible"],
        bpm: json["bpm"],
        percentage: json["percentage"],
      );

  Map<String, dynamic> toJson() => {
        "systolic": systolic,
        "diastolic": diastolic,
        "isVisible": isVisible,
        "bpm": bpm,
        "percentage": percentage,
      };
}
