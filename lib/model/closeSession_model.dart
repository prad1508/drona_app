// To parse this JSON data, do
//
//     final closeSessionModel = closeSessionModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CloseSessionModel closeSessionModelFromJson(String str) => CloseSessionModel.fromJson(json.decode(str));

String closeSessionModelToJson(CloseSessionModel data) => json.encode(data.toJson());

class CloseSessionModel {
  String msg;

  CloseSessionModel({
    required this.msg,
  });

  factory CloseSessionModel.fromJson(Map<String, dynamic> json) => CloseSessionModel(
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
  };
}
