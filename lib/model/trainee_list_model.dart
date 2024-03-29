// To parse this JSON data, do
//
//     final traineeListModel = traineeListModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

TraineeListModel traineeListModelFromJson(String str) =>
    TraineeListModel.fromJson(json.decode(str));

String traineeListModelToJson(TraineeListModel data) =>
    json.encode(data.toJson());

class TraineeListModel {
  String msg;
  String search;
  String filterBatchUid;
  bool nextPageAvailable;
  int pagesize;
  int currentPageno;
  int dataCount;
  int totalDataCount;
  List<Datum> data;

  TraineeListModel({
    required this.msg,
    required this.search,
    required this.filterBatchUid,
    required this.nextPageAvailable,
    required this.pagesize,
    required this.currentPageno,
    required this.dataCount,
    required this.totalDataCount,
    required this.data,
  });

  factory TraineeListModel.fromJson(Map<String, dynamic> json) =>
      TraineeListModel(
        msg: json["msg"],
        search: json["search"],
        filterBatchUid: json["filter_batch_uid"],
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
        "filter_batch_uid": filterBatchUid,
        "next_page_available": nextPageAvailable,
        "pagesize": pagesize,
        "current_pageno": currentPageno,
        "data_count": dataCount,
        "total_data_count": totalDataCount,
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
// "status": "active",
// "join_status": "not_onboarded",
// "batch_timing_from": "5:27 AM",
// "batch_timing_to": "5:27 PM"
class Datum {
  String id;
  String uid;
  String academyUid;
  String batchUid;
  String traineeProfileUid;
  String traineeName;
  String traineeUserid;
  String timestamp;
  String cDate;
  String gender;
  String dob;
  String batchname;
  String serviceicon;
  String serviceName;
  String image;
  String cTime;
  String cdd;
  String cmm;
  String cyy;
  String status;
  String join_status;
  String batch_timing_from;
  String batch_timing_to;
  int fees;
  String dateOfJoining;
  String monthOfBilling;

  Datum({
    required this.id,
    required this.uid,
    required this.academyUid,
    required this.batchUid,
    required this.traineeProfileUid,
    required this.traineeName,
    required this.traineeUserid,
    required this.timestamp,
    required this.cDate,
    required this.cTime,
    this.status ='',
    this.join_status ='',
    this.batch_timing_from ='',
    this.batch_timing_to ='',
    this.gender ='',
    this.serviceicon ='',
    this.serviceName ='',
    this.image ='',
    this.dob ='',
    this.batchname ='',
    required this.cdd,
    required this.cmm,
    required this.cyy,
    required this.fees,
    required this.dateOfJoining,
    required this.monthOfBilling,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        uid: json["uid"],
        academyUid: json["academy_uid"],
        batchUid: json["batch_uid"],
        traineeProfileUid: json["trainee_profile_uid"],
        traineeName: json["trainee_name"],
        traineeUserid: json["trainee_userid"],
        timestamp: json["timestamp"],
        gender: json["gender"],
        status: json["status"],
        join_status: json["join_status"],
        batch_timing_from: json["batch_timing_from"],
        batch_timing_to: json["batch_timing_to"],
        serviceicon: json["service_iconname"],
        serviceName: json['service_name'],
        image: json["img"],
        dob: json["dob"],
        batchname: json["batch_name"],
        cDate: json["cDate"],
        cTime: json["cTime"],
        cdd: json["cdd"],
        cmm: json["cmm"],
        cyy: json["cyy"],
        fees: json["fees"],
        dateOfJoining: json["date_of_joining"],
        monthOfBilling: json["month_of_billing"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "uid": uid,
        "academy_uid": academyUid,
        "batch_uid": batchUid,
        "trainee_profile_uid": traineeProfileUid,
        "trainee_name": traineeName,
        "trainee_userid": traineeUserid,
        "timestamp": timestamp,
        "gender": gender,
        "status": status,
        "join_status": join_status,
        "batch_timing_from": batch_timing_from,
        "batch_timing_to": batch_timing_to,
        "dob": dob,
        "service_iconname": batchname,
        "batch_name": serviceicon,
         "service_name": serviceName,
        "img": image,
        "cDate": cDate,
        "cTime": cTime,
        "cdd": cdd,
        "cmm": cmm,
        "cyy": cyy,
        "fees": fees,
        "date_of_joining": dateOfJoining,
        "month_of_billing": monthOfBilling,
      };
}
