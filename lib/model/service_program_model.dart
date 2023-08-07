// To parse this JSON data, do
//
//     final serviceProgramModel = serviceProgramModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ServiceProgramModel serviceProgramModelFromJson(String str) => ServiceProgramModel.fromJson(json.decode(str));

String serviceProgramModelToJson(ServiceProgramModel data) => json.encode(data.toJson());

class ServiceProgramModel {
  String msg;
  String serviceName;
  String serviceIconname;
  String catUid;
  bool programAdded;
  bool facilityAdded;
  List<Myfacility> myfacility;
  List<Myprogram> myprogram;

  ServiceProgramModel({
    required this.msg,
    required this.serviceName,
    required this.serviceIconname,
    required this.catUid,
    required this.programAdded,
    required this.facilityAdded,
    required this.myfacility,
    required this.myprogram,
  });

  factory ServiceProgramModel.fromJson(Map<String, dynamic> json) => ServiceProgramModel(
    msg: json["msg"],
    serviceName: json["service_name"],
    serviceIconname: json["service_iconname"],
    catUid: json["cat_uid"],
    programAdded: json["program_added"],
    facilityAdded: json["facility_added"],
    myfacility: List<Myfacility>.from(json["myfacility"].map((x) => Myfacility.fromJson(x))),
    myprogram: List<Myprogram>.from(json["myprogram"].map((x) => Myprogram.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "service_name": serviceName,
    "service_iconname": serviceIconname,
    "cat_uid": catUid,
    "program_added": programAdded,
    "facility_added": facilityAdded,
    "myfacility": List<dynamic>.from(myfacility.map((x) => x.toJson())),
    "myprogram": List<dynamic>.from(myprogram.map((x) => x.toJson())),
  };
}

class Myfacility {
  String id;
  String uid;
  String academyUid;
  String catName;
  String catUid;
  String serviceName;
  String serviceUid;
  String facilityUid;
  String inputtextname;
  String inputtextdata;
  List<Checkboxwithselectoption> checkboxwithselectoption;
  String checkboxwithselectoptionname;
  List<Other> other;
  String cDate;
  String cTime;
  String addedByProfileUid;
  List<String> images;

  Myfacility({
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
    required this.images,
  });

  factory Myfacility.fromJson(Map<String, dynamic> json) => Myfacility(
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
    other: List<Other>.from(json["other"].map((x) => Other.fromJson(x))),
    cDate: json["cDate"],
    cTime: json["cTime"],
    addedByProfileUid: json["added_by_profile_uid"],
    images: List<String>.from(json["images"].map((x) => x)),
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
    "other": List<dynamic>.from(other.map((x) => x.toJson())),
    "cDate": cDate,
    "cTime": cTime,
    "added_by_profile_uid": addedByProfileUid,
    "images": List<dynamic>.from(images.map((x) => x)),
  };
}

class Checkboxwithselectoption {
  String name;
  String quantity;

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

class Other {
  String name;

  Other({
    required this.name,
  });

  factory Other.fromJson(Map<String, dynamic> json) => Other(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}

class Myprogram {
  String id;
  String uid;
  String academyUid;
  String serviceName;
  String serviceUid;
  String catUid;
  String catName;
  String name;
  bool custom;
  List<Program> programs;
  String cDate;
  String cTime;
  String addedByProfileUid;

  Myprogram({
    required this.id,
    required this.uid,
    required this.academyUid,
    required this.serviceName,
    required this.serviceUid,
    required this.catUid,
    required this.catName,
    required this.name,
    required this.custom,
    required this.programs,
    required this.cDate,
    required this.cTime,
    required this.addedByProfileUid,
  });

  factory Myprogram.fromJson(Map<String, dynamic> json) => Myprogram(
    id: json["_id"],
    uid: json["uid"],
    academyUid: json["academy_uid"],
    serviceName: json["service_name"],
    serviceUid: json["service_uid"],
    catUid: json["cat_uid"],
    catName: json["cat_name"],
    name: json["name"],
    custom: json["custom"],
    programs: List<Program>.from(json["programs"].map((x) => Program.fromJson(x))),
    cDate: json["cDate"],
    cTime: json["cTime"],
    addedByProfileUid: json["added_by_profile_uid"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "uid": uid,
    "academy_uid": academyUid,
    "service_name": serviceName,
    "service_uid": serviceUid,
    "cat_uid": catUid,
    "cat_name": catName,
    "name": name,
    "custom": custom,
    "programs": List<dynamic>.from(programs.map((x) => x.toJson())),
    "cDate": cDate,
    "cTime": cTime,
    "added_by_profile_uid": addedByProfileUid,
  };
}

class Program {
  String uid;
  String programName;
  var amount;
  var registrationfee;
  String curriculumTitle;
  String curriculumDesc;

  Program({
    required this.uid,
    required this.programName,
    required this.amount,
    required this.registrationfee,
    required this.curriculumTitle,
    required this.curriculumDesc,
  });

  factory Program.fromJson(Map<String, dynamic> json) => Program(
    uid: json["uid"],
    programName: json["program_name"],
    amount: json["amount"],
    registrationfee: json["registrationfee"],
    curriculumTitle: json["curriculum_title"],
    curriculumDesc: json["curriculum_desc"],
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "program_name": programName,
    "amount": amount,
    "registrationfee": registrationfee,
    "curriculum_title": curriculumTitle,
    "curriculum_desc": curriculumDesc,
  };
}
