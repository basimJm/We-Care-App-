// To parse this JSON data, do
//
//     final heartBeatModel = heartBeatModelFromJson(jsonString);

import 'dart:convert';

HeartBeatModel heartBeatModelFromJson(String str) =>
    HeartBeatModel.fromJson(json.decode(str));

String heartBeatModelToJson(HeartBeatModel data) => json.encode(data.toJson());

class HeartBeatModel {
  HeartBeatModel({
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
  DateTime? date;
  String? nurseName;
  Readings? readings;
  int? v;

  factory HeartBeatModel.fromJson(Map<String, dynamic> json) => HeartBeatModel(
        id: json["_id"],
        patientId: json["patient_id"],
        category: json["category"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
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
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "nurse_name": nurseName,
        "readings": readings?.toJson(),
        "__v": v,
      };
}

class Readings {
  Readings({
    this.bpm,
  });

  int? bpm;

  factory Readings.fromJson(Map<String, dynamic> json) => Readings(
        bpm: json["bpm"],
      );

  Map<String, dynamic> toJson() => {
        "bpm": bpm,
      };
}
