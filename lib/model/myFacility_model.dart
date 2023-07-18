// To parse this JSON data, do
//
//     final myFacilityListModel = myFacilityListModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MyFacilityListModel myFacilityListModelFromJson(String str) => MyFacilityListModel.fromJson(json.decode(str));

String myFacilityListModelToJson(MyFacilityListModel data) => json.encode(data.toJson());

class MyFacilityListModel {
  final String msg;
  final List<Datum> data;

  MyFacilityListModel({
    required this.msg,
    required this.data,
  });

  factory MyFacilityListModel.fromJson(Map<String, dynamic> json) => MyFacilityListModel(
    msg: json["msg"],
    data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "Data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  final String id;
  final String uid;
  final String academyUid;
  final String catName;
  final String catUid;
  final String serviceName;
  final String serviceUid;
  final String facilityUid;
  final String inputtextname;
  final String inputtextdata;
  final List<Checkboxwithselectoption> checkboxwithselectoption;
  final String checkboxwithselectoptionname;
  final List<String> other;
  final String cDate;
  final String cTime;
  final String addedByProfileUid;

  Datum({
    required this.id,
    required this.uid,
    required this.academyUid,
    required this.catName,
    required this.catUid,
    required this.serviceName,
    required this.serviceUid,
    required this.facilityUid,
    required this.inputtextname,
    required this.inputtextdata,
    required this.checkboxwithselectoption,
    required this.checkboxwithselectoptionname,
    required this.other,
    required this.cDate,
    required this.cTime,
    required this.addedByProfileUid,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    uid: json["uid"],
    academyUid: json["academy_uid"],
    catName: json["cat_name"],
    catUid: json["cat_uid"],
    serviceName: json["service_name"],
    serviceUid: json["service_uid"],
    facilityUid: json["facility_uid"],
    inputtextname: json["inputtextname"],
    inputtextdata: json["inputtextdata"],
    checkboxwithselectoption: List<Checkboxwithselectoption>.from(json["checkboxwithselectoption"].map((x) => Checkboxwithselectoption.fromJson(x))),
    checkboxwithselectoptionname: json["checkboxwithselectoptionname"],
    other: List<String>.from(json["other"].map((x) => x)),
    cDate: json["cDate"],
    cTime: json["cTime"],
    addedByProfileUid: json["added_by_profile_uid"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "uid": uid,
    "academy_uid": academyUid,
    "cat_name": catName,
    "cat_uid": catUid,
    "service_name": serviceName,
    "service_uid": serviceUid,
    "facility_uid": facilityUid,
    "inputtextname": inputtextname,
    "inputtextdata": inputtextdata,
    "checkboxwithselectoption": List<dynamic>.from(checkboxwithselectoption.map((x) => x.toJson())),
    "checkboxwithselectoptionname": checkboxwithselectoptionname,
    "other": List<dynamic>.from(other.map((x) => x)),
    "cDate": cDate,
    "cTime": cTime,
    "added_by_profile_uid": addedByProfileUid,
  };
}

class Checkboxwithselectoption {
  final String name;
  final String quantity;

  Checkboxwithselectoption({
    required this.name,
    required this.quantity,
  });

  factory Checkboxwithselectoption.fromJson(Map<String, dynamic> json) => Checkboxwithselectoption(
    name: json["name"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "quantity": quantity,
  };
}
