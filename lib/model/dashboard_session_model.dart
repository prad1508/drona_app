// To parse this JSON data, do
//
//     final dashBoardSessionModel = dashBoardSessionModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DashBoardSessionModel dashBoardSessionModelFromJson(String str) => DashBoardSessionModel.fromJson(json.decode(str));

String dashBoardSessionModelToJson(DashBoardSessionModel data) => json.encode(data.toJson());

class DashBoardSessionModel {
  String msg;
  DateTime fromDate;
  int totalBatch;
  int totalDataCount;
  List<Datum> data;

  DashBoardSessionModel({
    required this.msg,
    required this.fromDate,
    required this.totalBatch,
    required this.totalDataCount,
    required this.data,
  });

  factory DashBoardSessionModel.fromJson(Map<String, dynamic> json) => DashBoardSessionModel(
    msg: json["msg"],
    fromDate: DateTime.parse(json["from_date"]),
    totalBatch: json["total_batch"],
    totalDataCount: json["total_data_count"],
    data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "from_date": "${fromDate.year.toString().padLeft(4, '0')}-${fromDate.month.toString().padLeft(2, '0')}-${fromDate.day.toString().padLeft(2, '0')}",
    "total_batch": totalBatch,
    "total_data_count": totalDataCount,
    "Data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String id;
  String uid;
  String batchUid;
  String serviceUid;
  String serviceName;
  String serviceIconname;
  String catUid;
  String batchName;
  String timestamp;
  String cDate;
  String cTime;
  String programUid;
  String academyUid;
  String programName;
  String cdd;
  String cmm;
  String cyy;
  String status;
  String batchTimingFrom;
  String batchTimingTo;
  String sdd;
  String smm;
  String syy;
  DateTime sessionDate;
  String dayCode;
  String dayShort;
  String feedbackTrainee;
  String feedbackAcademy;
  List<dynamic> attachfile;
  bool attachfileStatus;
  String onlineSessionUrl;
  bool provideOnlineSessions;
  String coachProfileUid;
  String coachName;
  int totalTrainee;

  Datum({
    required this.id,
    required this.uid,
    required this.batchUid,
    required this.serviceUid,
    required this.serviceName,
    required this.serviceIconname,
    required this.catUid,
    required this.batchName,
    required this.timestamp,
    required this.cDate,
    required this.cTime,
    required this.programUid,
    required this.academyUid,
    required this.programName,
    required this.cdd,
    required this.cmm,
    required this.cyy,
    required this.status,
    required this.batchTimingFrom,
    required this.batchTimingTo,
    required this.sdd,
    required this.smm,
    required this.syy,
    required this.sessionDate,
    required this.dayCode,
    required this.dayShort,
    required this.feedbackTrainee,
    required this.feedbackAcademy,
    required this.attachfile,
    required this.attachfileStatus,
    required this.onlineSessionUrl,
    required this.provideOnlineSessions,
    required this.coachProfileUid,
    required this.coachName,
    required this.totalTrainee,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    uid: json["uid"],
    batchUid: json["batch_uid"],
    serviceUid: json["service_uid"],
    serviceName: json["service_name"],
    serviceIconname: json["service_iconname"],
    catUid: json["cat_uid"],
    batchName: json["batch_name"],
    timestamp: json["timestamp"],
    cDate: json["cDate"],
    cTime: json["cTime"],
    programUid: json["program_uid"],
    academyUid: json["academy_uid"],
    programName: json["program_name"],
    cdd: json["cdd"],
    cmm: json["cmm"],
    cyy: json["cyy"],
    status: json["status"],
    batchTimingFrom: json["batch_timing_from"],
    batchTimingTo: json["batch_timing_to"],
    sdd: json["sdd"],
    smm: json["smm"],
    syy: json["syy"],
    sessionDate: DateTime.parse(json["session_date"]),
    dayCode: json["day_code"],
    dayShort: json["day_short"],
    feedbackTrainee: json["feedback_trainee"],
    feedbackAcademy: json["feedback_academy"],
    attachfile: List<dynamic>.from(json["attachfile"].map((x) => x)),
    attachfileStatus: json["attachfile_status"],
    onlineSessionUrl: json["online_session_url"],
    provideOnlineSessions: json["provide_online_sessions"],
    coachProfileUid: json["coach_profile_uid"],
    coachName: json["coach_name"],
    totalTrainee: json["total_trainee"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "uid": uid,
    "batch_uid": batchUid,
    "service_uid": serviceUid,
    "service_name": serviceName,
    "service_iconname": serviceIconname,
    "cat_uid": catUid,
    "batch_name": batchName,
    "timestamp": timestamp,
    "cDate": cDate,
    "cTime": cTime,
    "program_uid": programUid,
    "academy_uid": academyUid,
    "program_name": programName,
    "cdd": cdd,
    "cmm": cmm,
    "cyy": cyy,
    "status": status,
    "batch_timing_from": batchTimingFrom,
    "batch_timing_to": batchTimingTo,
    "sdd": sdd,
    "smm": smm,
    "syy": syy,
    "session_date": sessionDate.toIso8601String(),
    "day_code": dayCode,
    "day_short": dayShort,
    "feedback_trainee": feedbackTrainee,
    "feedback_academy": feedbackAcademy,
    "attachfile": List<dynamic>.from(attachfile.map((x) => x)),
    "attachfile_status": attachfileStatus,
    "online_session_url": onlineSessionUrl,
    "provide_online_sessions": provideOnlineSessions,
    "coach_profile_uid": coachProfileUid,
    "coach_name": coachName,
    "total_trainee": totalTrainee,
  };
}
