// class CoachlistModel {
//   CoachlistModel({
//     required this.msg,
//     required this.academyUid,
//     required this.academyName,
//     required this.coachlist,
//   });
//   late final String msg;
//   late final String academyUid;
//   late final String academyName;
//   late final List<Coachlist> coachlist;
//
//   CoachlistModel.fromJson(Map<String, dynamic> json) {
//     msg = json['msg'];
//     academyUid = json['academy_uid'];
//     academyName = json['academy_name'];
//     coachlist =
//         List.from(json['coachlist']).map((e) => Coachlist.fromJson(e)).toList();
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['msg'] = msg;
//     _data['academy_uid'] = academyUid;
//     _data['academy_name'] = academyName;
//     _data['coachlist'] = coachlist.map((e) => e.toJson()).toList();
//     return _data;
//   }
// }
//
// class Coachlist {
//   Coachlist({
//     required this.uid,
//     required this.userid,
//     required this.name,
//     required this.timestamp,
//     required this.cDate,
//     required this.cTime,
//     required this.gender,
//     required this.email,
//     required this.type,
//     required this.role,
//     required this.relation,
//     required this.academyUid,
//     this.img = '',
//     required this.imgStatus,
//     required this.status,
//     this.dob = '' ,
//     this.join_status ='',
//     this.totalTrainee = 0,
//     this.totalBatch =0,
//     required this.salaryMonthly,
//     required this.dateOfJoining,
//     required this.services,
//   });
//   late final String uid;
//   late final String userid;
//   late final String name;
//   late final String timestamp;
//   late final String cDate;
//   late final String cTime;
//   late final String gender;
//   late final String email;
//   late final int type;
//   late final int role;
//   late final String relation;
//   late final String academyUid;
//   late final String img;
//   late final String dob;
//   late final bool imgStatus;
//   late final String status;
//   late final String join_status;
//   late final int totalTrainee;
//   late final int totalBatch;
//   late final int salaryMonthly;
//   late final String dateOfJoining;
//   late final List<Services> services;
//
//   Coachlist.fromJson(Map<String, dynamic> json) {
//     uid = json['uid'];
//     userid = json['userid'];
//     name = json['name'];
//     timestamp = json['timestamp'];
//     cDate = json['cDate'];
//     cTime = json['cTime'];
//     gender = json['gender'];
//     email = json['email'];
//     type = json['type'];
//     role = json['role'];
//     dob = json['dob'];
//     relation = json['relation'];
//     academyUid = json['academy_uid'];
//     img = json['img'];
//     imgStatus = json['img_status'];
//     status = json['status'];
//     join_status = json['join_status'];
//     totalTrainee = json['total_trainee'];
//     totalBatch = json['total_batch'];
//     salaryMonthly = json['salary_monthly'];
//     dateOfJoining =  json['date_of_joining'];
//     services =
//         List.from(json['services']).map((e) => Services.fromJson(e)).toList();
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['uid'] = uid;
//     _data['userid'] = userid;
//     _data['name'] = name;
//     _data['timestamp'] = timestamp;
//     _data['cDate'] = cDate;
//     _data['cTime'] = cTime;
//     _data['gender'] = gender;
//     _data['email'] = email;
//     _data['type'] = type;
//     _data['role'] = role;
//     _data['dob'] = dob;
//     _data['relation'] = relation;
//     _data['academy_uid'] = academyUid;
//     _data['img'] = img;
//     _data['img_status'] = imgStatus;
//     _data['status'] = status;
//     _data['total_batch'] = totalBatch;
//     _data['total_trainee'] = totalTrainee;
//     _data['join_status'] = join_status;
//     _data['salary_monthly'] = salaryMonthly;
//     _data['date_of_joining'] = dateOfJoining;
//     _data['services'] = services.map((e) => e.toJson()).toList();
//     return _data;
//   }
// }
//
// class Services {
//   Services({
//     required this.id,
//     required this.serviceName,
//     required this.serviceIconname,
//   });
//   late final String id;
//   late final String serviceName;
//   late final String serviceIconname;
//
//   Services.fromJson(Map<String, dynamic> json) {
//     id = json['_id'];
//     serviceName = json['service_name'];
//     serviceIconname = json['service_iconname'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['_id'] = id;
//     _data['service_name'] = serviceName;
//     _data['service_iconname'] = serviceIconname;
//     return _data;
//   }
// }
//
//
//
//
//
//
//
//
//


// To parse this JSON data, do
//
//     final coachlistModel = coachlistModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CoachlistModel coachlistModelFromJson(String str) => CoachlistModel.fromJson(json.decode(str));

String coachlistModelToJson(CoachlistModel data) => json.encode(data.toJson());

class CoachlistModel {
  final String msg;
  final String search;
  final bool nextPageAvailable;
  final int pagesize;
  final int currentPageno;
  final int dataCount;
  final int totalDataCount;
  final List<Datum> data;

  CoachlistModel({
    required this.msg,
    required this.search,
    required this.nextPageAvailable,
    required this.pagesize,
    required this.currentPageno,
    required this.dataCount,
    required this.totalDataCount,
    required this.data,
  });

  factory CoachlistModel.fromJson(Map<String, dynamic> json) => CoachlistModel(
    msg: json["msg"],
    search: json["search"],
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
    "next_page_available": nextPageAvailable,
    "pagesize": pagesize,
    "current_pageno": currentPageno,
    "data_count": dataCount,
    "total_data_count": totalDataCount,
    "Data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  final String id;
  final String uid;
  final String userid;
  final String name;
  final String timestamp;
  final String cDate;
  final String cTime;
  final String gender;
  final String email;
  final int type;
  final int role;
  final String relation;
  final String academyUid;
  final String img;
  final bool imgStatus;
  final String status;
  final int salaryMonthly;
  final String dateOfJoining;
  //final String invitecode;
  //final bool invitecodeExpire ;
  final int totalBatch;
  final int totalTrainee;
  final String joinStatus;
  final String dob;

  Datum({
    required this.id,
    required this.uid,
    required this.userid,
    required this.name,
    required this.timestamp,
    required this.cDate,
    required this.cTime,
    required this.gender,
    required this.email,
    required this.type,
    required this.role,
    required this.relation,
    required this.academyUid,
    this.img = '',
    required this.imgStatus,
    required this.status,
    this.salaryMonthly = 0,
    this.dateOfJoining = '',
    // this.invitecode = '',
    // this.invitecodeExpire = false,
    required this.totalBatch,
    required this.totalTrainee,
    required this.joinStatus,
    required this.dob,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    uid: json["uid"],
    userid: json["userid"],
    name: json["name"],
    timestamp: json["timestamp"],
    cDate: json["cDate"],
    cTime: json["cTime"],
    gender: json["gender"],
    email: json["email"],
    type: json["type"],
    role: json["role"],
    relation: json["relation"],
    academyUid: json["academy_uid"],
    img: json["img"]!=null ? json['img'] : '',
    imgStatus: json["img_status"],
    status: json["status"],
    salaryMonthly: json["salary_monthly"],
    dateOfJoining: json["date_of_joining"]!=null ? json['date_of_joining'] : '',
   // invitecode: json["invitecode"],
   // invitecodeExpire: json["invitecode_expire"],
    totalBatch: json["total_batch"],
    totalTrainee: json["total_trainee"],
    joinStatus: json["join_status"],
    dob: json["dob"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "uid": uid,
    "userid": userid,
    "name": name,
    "timestamp": timestamp,
    "cDate": cDate,
    "cTime": cTime,
    "gender": gender,
    "email": email,
    "type": type,
    "role": role,
    "relation": relation,
    "academy_uid": academyUid,
    "img": img,
    "img_status": imgStatus,
    "status": status,
    "salary_monthly": salaryMonthly,
    "date_of_joining": dateOfJoining,
   // "invitecode": invitecode,
   // "invitecode_expire": invitecodeExpire,
    "total_batch": totalBatch,
    "total_trainee": totalTrainee,
    "join_status": joinStatus,
    "dob": dob,
  };
}
