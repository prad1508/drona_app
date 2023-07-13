// To parse this JSON data, do
//
//     final academyListModel = academyListModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AcademyListModel academyListModelFromJson(String str) => AcademyListModel.fromJson(json.decode(str));

String academyListModelToJson(AcademyListModel data) => json.encode(data.toJson());

class AcademyListModel {
  final String msg;
  final String academyUid;
  final String academyname;
  final String address;
  final String city;
  final String state;
  final String pincode;
  final String billingDate;
  final String bcatname;
  final String busscategoryid;
  final int onboardingCompleted;
  final int totalOnboardingStep;
  final bool onboardingSetupFinish;
  final String altMobno;
  final String email;
  final String website;
  final String academyOpenTime;
  final String academyCloseTime;
  final String logo;
  final bool islogo;
  final List<WorkingDay> workingDays;
  final String registeredNumber;
  final int academyProgress;
  final bool academyDetailsCompleted;
  final bool serviceProgramFacilityCompleted;
  final bool bankDetailsCompleted;
  final bool communicationCompleted;
  final bool billingInvoiceCompleted;
  final String cDate;
  final String cTime;
  final String uDate;
  final String uTime;
  final int totalService;
  final List<Service> services;
  final List<dynamic> bankDetails;

  AcademyListModel({
    required this.msg,
    required this.academyUid,
    required this.academyname,
    required this.address,
    required this.city,
    required this.state,
    required this.pincode,
    required this.billingDate,
    required this.bcatname,
    required this.busscategoryid,
    required this.onboardingCompleted,
    required this.totalOnboardingStep,
    required this.onboardingSetupFinish,
    required this.altMobno,
    required this.email,
    required this.website,
    required this.academyOpenTime,
    required this.academyCloseTime,
    required this.logo,
    required this.islogo,
    required this.workingDays,
    required this.registeredNumber,
    required this.academyProgress,
    required this.academyDetailsCompleted,
    required this.serviceProgramFacilityCompleted,
    required this.bankDetailsCompleted,
    required this.communicationCompleted,
    required this.billingInvoiceCompleted,
    required this.cDate,
    required this.cTime,
    required this.uDate,
    required this.uTime,
    required this.totalService,
    required this.services,
    required this.bankDetails,
  });

  factory AcademyListModel.fromJson(Map<String, dynamic> json) => AcademyListModel(
    msg: json["msg"],
    academyUid: json["academy_uid"],
    academyname: json["academyname"],
    address: json["address"],
    city: json["city"],
    state: json["state"],
    pincode: json["pincode"],
    billingDate: json["billing_date"],
    bcatname: json["bcatname"],
    busscategoryid: json["busscategoryid"],
    onboardingCompleted: json["onboarding_completed"],
    totalOnboardingStep: json["total_onboarding_step"],
    onboardingSetupFinish: json["onboarding_setup_finish"],
    altMobno: json["alt_mobno"],
    email: json["email"],
    website: json["website"],
    academyOpenTime: json["academy_open_time"],
    academyCloseTime: json["academy_close_time"],
    logo: json["logo"],
    islogo: json["islogo"],
    workingDays: List<WorkingDay>.from(json["working_days"].map((x) => WorkingDay.fromJson(x))),
    registeredNumber: json["registered_number"],
    academyProgress: json["academy_progress"],
    academyDetailsCompleted: json["academy_details_completed"],
    serviceProgramFacilityCompleted: json["service_program_facility_completed"],
    bankDetailsCompleted: json["bank_details_completed"],
    communicationCompleted: json["communication_completed"],
    billingInvoiceCompleted: json["billing_invoice_completed"],
    cDate: json["cDate"],
    cTime: json["cTime"],
    uDate: json["uDate"],
    uTime: json["uTime"],
    totalService: json["total_service"],
    services: List<Service>.from(json["services"].map((x) => Service.fromJson(x))),
    bankDetails: List<dynamic>.from(json["bank_details"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "academy_uid": academyUid,
    "academyname": academyname,
    "address": address,
    "city": city,
    "state": state,
    "pincode": pincode,
    "billing_date": billingDate,
    "bcatname": bcatname,
    "busscategoryid": busscategoryid,
    "onboarding_completed": onboardingCompleted,
    "total_onboarding_step": totalOnboardingStep,
    "onboarding_setup_finish": onboardingSetupFinish,
    "alt_mobno": altMobno,
    "email": email,
    "website": website,
    "academy_open_time": academyOpenTime,
    "academy_close_time": academyCloseTime,
    "logo": logo,
    "islogo": islogo,
    "working_days": List<dynamic>.from(workingDays.map((x) => x.toJson())),
    "registered_number": registeredNumber,
    "academy_progress": academyProgress,
    "academy_details_completed": academyDetailsCompleted,
    "service_program_facility_completed": serviceProgramFacilityCompleted,
    "bank_details_completed": bankDetailsCompleted,
    "communication_completed": communicationCompleted,
    "billing_invoice_completed": billingInvoiceCompleted,
    "cDate": cDate,
    "cTime": cTime,
    "uDate": uDate,
    "uTime": uTime,
    "total_service": totalService,
    "services": List<dynamic>.from(services.map((x) => x.toJson())),
    "bank_details": List<dynamic>.from(bankDetails.map((x) => x)),
  };
}

class Service {
  final String id;
  final String uid;
  final String academyUid;
  final String catUid;
  final String serviceName;
  final String serviceIconname;
  final bool programAdded;
  final bool facilityAdded;
  final String status;
  final String cDate;
  final String cTime;
  final String uDate;
  final String uTime;

  Service({
    required this.id,
    required this.uid,
    required this.academyUid,
    required this.catUid,
    required this.serviceName,
    required this.serviceIconname,
    required this.programAdded,
    required this.facilityAdded,
    required this.status,
    required this.cDate,
    required this.cTime,
    required this.uDate,
    required this.uTime,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    id: json["_id"],
    uid: json["uid"],
    academyUid: json["academy_uid"],
    catUid: json["cat_uid"],
    serviceName: json["service_name"],
    serviceIconname: json["service_iconname"],
    programAdded: json["program_added"],
    facilityAdded: json["facility_added"],
    status: json["status"],
    cDate: json["cDate"],
    cTime: json["cTime"],
    uDate: json["uDate"],
    uTime: json["uTime"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "uid": uid,
    "academy_uid": academyUid,
    "cat_uid": catUid,
    "service_name": serviceName,
    "service_iconname": serviceIconname,
    "program_added": programAdded,
    "facility_added": facilityAdded,
    "status": status,
    "cDate": cDate,
    "cTime": cTime,
    "uDate": uDate,
    "uTime": uTime,
  };
}

class WorkingDay {
  final dynamic code;
  final String dayNameShort;

  WorkingDay({
    required this.code,
    required this.dayNameShort,
  });

  factory WorkingDay.fromJson(Map<String, dynamic> json) => WorkingDay(
    code: json["code"],
    dayNameShort: json["day_name_short"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "day_name_short": dayNameShort,
  };
}
