// To parse this JSON data, do
//
//     final qrModel = qrModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

QrModel qrModelFromJson(String str) => QrModel.fromJson(json.decode(str));

String qrModelToJson(QrModel data) => json.encode(data.toJson());

class QrModel {
  final String msg;
  final String uploadByUserid;
  final String uid;
  final String pathUrl;
  final bool upload;
  final String filename;

  QrModel({
    required this.msg,
    required this.uploadByUserid,
    required this.uid,
    required this.pathUrl,
    required this.upload,
    required this.filename,
  });

  factory QrModel.fromJson(Map<String, dynamic> json) => QrModel(
    msg: json["msg"],
    uploadByUserid: json["upload_by_userid"],
    uid: json["uid"],
    pathUrl: json["path_url"],
    upload: json["upload"],
    filename: json["filename"],
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "upload_by_userid": uploadByUserid,
    "uid": uid,
    "path_url": pathUrl,
    "upload": upload,
    "filename": filename,
  };
}
