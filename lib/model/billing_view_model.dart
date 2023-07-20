// To parse this JSON data, do
//
//     final invoiceViewModel = invoiceViewModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

InvoiceViewModel invoiceViewModelFromJson(String str) => InvoiceViewModel.fromJson(json.decode(str));

String invoiceViewModelToJson(InvoiceViewModel data) => json.encode(data.toJson());

class InvoiceViewModel {
  String msg;
  String filter;
  String academyName;
  bool nextPageAvailable;
  int pagesize;
  int currentPageno;
  int dataCount;
  int totalDataCount;
  List<Datum> data;

  InvoiceViewModel({
    required this.msg,
    required this.filter,
    required this.academyName,
    required this.nextPageAvailable,
    required this.pagesize,
    required this.currentPageno,
    required this.dataCount,
    required this.totalDataCount,
    required this.data,
  });

  factory InvoiceViewModel.fromJson(Map<String, dynamic> json) => InvoiceViewModel(
    msg: json["msg"],
    filter: json["filter"],
    academyName: json["academy_name"],
    nextPageAvailable: json["next_page_available"],
    pagesize: json["pagesize"],
    currentPageno: json["current_pageno"],
    dataCount: json["data_count"],
    totalDataCount: json["total_data_count"],
    data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "filter": filter,
    "academy_name": academyName,
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
  String academyUid;
  String mm;
  String yy;
  String traineeProfileUid;
  String traineeName;
  String traineeUserid;
  int fees;
  int paid;
  int due;
  int concession;
  int miscFee;

  Datum({
    required this.id,
    required this.academyUid,
    required this.mm,
    required this.yy,
    required this.traineeProfileUid,
    required this.traineeName,
    required this.traineeUserid,
    required this.fees,
    required this.paid,
    required this.due,
    required this.concession,
    required this.miscFee,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    academyUid: json["academy_uid"],
    mm: json["mm"],
    yy: json["yy"],
    traineeProfileUid: json["trainee_profile_uid"],
    traineeName: json["trainee_name"],
    traineeUserid: json["trainee_userid"],
    fees: json["fees"],
    paid: json["paid"],
    due: json["due"],
    concession: json["concession"],
    miscFee: json["misc_fee"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "academy_uid": academyUid,
    "mm": mm,
    "yy": yy,
    "trainee_profile_uid": traineeProfileUid,
    "trainee_name": traineeName,
    "trainee_userid": traineeUserid,
    "fees": fees,
    "paid": paid,
    "due": due,
    "concession": concession,
    "misc_fee": miscFee,
  };
}
