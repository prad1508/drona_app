// To parse this JSON data, do
//
//     final batchFilterModel = batchFilterModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BatchFilterModel batchFilterModelFromJson(String str) => BatchFilterModel.fromJson(json.decode(str));

String batchFilterModelToJson(BatchFilterModel data) => json.encode(data.toJson());

class BatchFilterModel {
  String msg;
  String search;
  String filterServiceUid;
  String filterStatus;
  bool nextPageAvailable;
  int pagesize;
  int currentPageno;
  int dataCount;
  int totalDataCount;
  List<Datum> data;

  BatchFilterModel({
    required this.msg,
    required this.search,
    required this.filterServiceUid,
    required this.filterStatus,
    required this.nextPageAvailable,
    required this.pagesize,
    required this.currentPageno,
    required this.dataCount,
    required this.totalDataCount,
    required this.data,
  });

  factory BatchFilterModel.fromJson(Map<String, dynamic> json) => BatchFilterModel(
    msg: json["msg"],
    search: json["search"],
    filterServiceUid: json["filter_service_uid"],
    filterStatus: json["filter_status"],
    nextPageAvailable: json["next_page_available"],
    pagesize: json["pagesize"],
    currentPageno: json["current_pageno"],
    dataCount: json["data_count"],
    totalDataCount: json["total_data_count"],
    data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "search": search,
    "filter_service_uid": filterServiceUid,
    "filter_status": filterStatus,
    "next_page_available": nextPageAvailable,
    "pagesize": pagesize,
    "current_pageno": currentPageno,
    "data_count": dataCount,
    "total_data_count": totalDataCount,
    "Data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String id;
  String uid;
  String coachProfileUid;
  String coachName;
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
  int fees;
  String typeBatch;
  String cdd;
  String cmm;
  String cyy;
  String status;
  String batchTimingFrom;
  String batchTimingTo;
  List<String> batchDays;
  List<String> batchDaysShort;
  String onlineSessionUrl;
  bool provideOnlineSessions;
  int totalTrainee;

  Datum({
    required this.id,
    required this.uid,
    required this.coachProfileUid,
    required this.coachName,
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
    required this.fees,
    required this.typeBatch,
    required this.cdd,
    required this.cmm,
    required this.cyy,
    required this.status,
    required this.batchTimingFrom,
    required this.batchTimingTo,
    required this.batchDays,
    required this.batchDaysShort,
    required this.onlineSessionUrl,
    required this.provideOnlineSessions,
    required this.totalTrainee,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    uid: json["uid"],
    coachProfileUid: json["coach_profile_uid"],
    coachName: json["coach_name"],
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
    fees: json["fees"],
    typeBatch: json["type_batch"],
    cdd: json["cdd"],
    cmm: json["cmm"],
    cyy: json["cyy"],
    status: json["status"],
    batchTimingFrom: json["batch_timing_from"],
    batchTimingTo: json["batch_timing_to"],
    batchDays: List<String>.from(json["batch_days"].map((x) => x)),
    batchDaysShort: List<String>.from(json["batch_days_short"].map((x) => x)),
    onlineSessionUrl: json["online_session_url"],
    provideOnlineSessions: json["provide_online_sessions"],
    totalTrainee: json["total_trainee"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "uid": uid,
    "coach_profile_uid": coachProfileUid,
    "coach_name": coachName,
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
    "fees": fees,
    "type_batch": typeBatch,
    "cdd": cdd,
    "cmm": cmm,
    "cyy": cyy,
    "status": status,
    "batch_timing_from": batchTimingFrom,
    "batch_timing_to": batchTimingTo,
    "batch_days": List<dynamic>.from(batchDays.map((x) => x)),
    "batch_days_short": List<dynamic>.from(batchDaysShort.map((x) => x)),
    "online_session_url": onlineSessionUrl,
    "provide_online_sessions": provideOnlineSessions,
    "total_trainee": totalTrainee,
  };
}
