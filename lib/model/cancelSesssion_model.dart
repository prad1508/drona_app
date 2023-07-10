// To parse this JSON data, do
//
//     final cancelSessionModel = cancelSessionModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CancelSessionModel cancelSessionModelFromJson(String str) => CancelSessionModel.fromJson(json.decode(str));

String cancelSessionModelToJson(CancelSessionModel data) => json.encode(data.toJson());

class CancelSessionModel {
  String msg;

  CancelSessionModel({
    required this.msg,
  });

  factory CancelSessionModel.fromJson(Map<String, dynamic> json) => CancelSessionModel(
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
  };
}
