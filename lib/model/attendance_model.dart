// To parse this JSON data, do
//
//     final markAttendanceModel = markAttendanceModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MarkAttendanceModel markAttendanceModelFromJson(String str) => MarkAttendanceModel.fromJson(json.decode(str));

String markAttendanceModelToJson(MarkAttendanceModel data) => json.encode(data.toJson());

class MarkAttendanceModel {
  String msg;

  MarkAttendanceModel({
    required this.msg,
  });

  factory MarkAttendanceModel.fromJson(Map<String, dynamic> json) => MarkAttendanceModel(
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
  };
}
