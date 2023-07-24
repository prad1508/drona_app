// To parse this JSON data, do
//
//     final activeDeactiveModel = activeDeactiveModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ActiveDeactiveModel activeDeactiveModelFromJson(String str) => ActiveDeactiveModel.fromJson(json.decode(str));

String activeDeactiveModelToJson(ActiveDeactiveModel data) => json.encode(data.toJson());

class ActiveDeactiveModel {
  String msg;

  ActiveDeactiveModel({
    required this.msg,
  });

  factory ActiveDeactiveModel.fromJson(Map<String, dynamic> json) => ActiveDeactiveModel(
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
  };
}
