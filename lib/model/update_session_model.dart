// To parse this JSON data, do
//
//     final updateSessionModel = updateSessionModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UpdateSessionModel updateSessionModelFromJson(String str) => UpdateSessionModel.fromJson(json.decode(str));

String updateSessionModelToJson(UpdateSessionModel data) => json.encode(data.toJson());

class UpdateSessionModel {
  String msg;

  UpdateSessionModel({
    required this.msg,
  });

  factory UpdateSessionModel.fromJson(Map<String, dynamic> json) => UpdateSessionModel(
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
  };
}
