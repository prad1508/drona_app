// To parse this JSON data, do
//
//     final invoiceModel = invoiceModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

InvoiceModel invoiceModelFromJson(String str) => InvoiceModel.fromJson(json.decode(str));

String invoiceModelToJson(InvoiceModel data) => json.encode(data.toJson());

class InvoiceModel {
  String msg;
  String filter;
  String billingDate;
  String academyName;
  bool nextPageAvailable;
  int pagesize;
  int currentPageno;
  int dataCount;
  int totalDataCount;
  List<Datum> data;

  InvoiceModel({
    required this.msg,
    required this.filter,
    required this.billingDate,
    required this.academyName,
    required this.nextPageAvailable,
    required this.pagesize,
    required this.currentPageno,
    required this.dataCount,
    required this.totalDataCount,
    required this.data,
  });

  factory InvoiceModel.fromJson(Map<String, dynamic> json) => InvoiceModel(
    msg: json["msg"],
    filter: json["filter"],
    billingDate: json["billing_date"],
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
    "billing_date": billingDate,
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
  String createDd;
  String createMm;
  String createYy;
  int totalAmount;
  int totalDue;
  int totalCollection;
  int totalTrainee;
  int totalTraineeFeeDue;
  int totalTraineeFeePaid;

  Datum({
    required this.id,
    required this.academyUid,
    required this.mm,
    required this.yy,
    required this.createDd,
    required this.createMm,
    required this.createYy,
    required this.totalAmount,
    required this.totalDue,
    required this.totalCollection,
    required this.totalTrainee,
    required this.totalTraineeFeeDue,
    required this.totalTraineeFeePaid,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    academyUid: json["academy_uid"],
    mm: json["mm"],
    yy: json["yy"],
    createDd: json["create_dd"],
    createMm: json["create_mm"],
    createYy: json["create_yy"],
    totalAmount: json["total_amount"],
    totalDue: json["total_due"],
    totalCollection: json["total_collection"],
    totalTrainee: json["total_trainee"],
    totalTraineeFeeDue: json["total_trainee_fee_due"],
    totalTraineeFeePaid: json["total_trainee_fee_paid"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "academy_uid": academyUid,
    "mm": mm,
    "yy": yy,
    "create_dd": createDd,
    "create_mm": createMm,
    "create_yy": createYy,
    "total_amount": totalAmount,
    "total_due": totalDue,
    "total_collection": totalCollection,
    "total_trainee": totalTrainee,
    "total_trainee_fee_due": totalTraineeFeeDue,
    "total_trainee_fee_paid": totalTraineeFeePaid,
  };
}
