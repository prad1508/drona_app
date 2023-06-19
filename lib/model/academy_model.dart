//model class AcademyListModel
class AcademyListModel {
  String? msg;
  String? academyUid;
  String? academyname;
  String? address;
  String? city;
  String? email;
  String? website;
  String? state;
  String? pincode;
  String? billingDate;
  String? bcatname;
  String? busscategoryid;
  int? onboardingCompleted;
  int? totalOnboardingStep;
  bool? onboardingSetupFinish;
  String? cDate;
  String? cTime;
  String? uDate;
  String? uTime;
  int? totalService;
  List<Services>? services;

  AcademyListModel(
      {this.msg,
      this.academyUid,
      this.academyname,
      this.address,
      this.city,
      this.state,
      this.pincode,
      this.billingDate,
      this.bcatname,
      this.busscategoryid,
      this.onboardingCompleted,
      this.totalOnboardingStep,
      this.onboardingSetupFinish,
      this.cDate,
      this.email = 'demo',
      this.website = 'demo',
      this.cTime,
      this.uDate,
      this.uTime,
      this.totalService,
      this.services});

  AcademyListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    academyUid = json['academy_uid'];
    academyname = json['academyname'];
    address = json['address'];
    city = json['city'];
    email = json['email'];
    website = json['website'];
    state = json['state'];
    pincode = json['pincode'];
    billingDate = json['billing_date'];
    bcatname = json['bcatname'];
    busscategoryid = json['busscategoryid'];
    onboardingCompleted = json['onboarding_completed'];
    totalOnboardingStep = json['total_onboarding_step'];
    onboardingSetupFinish = json['onboarding_setup_finish'];
    cDate = json['cDate'];
    cTime = json['cTime'];
    uDate = json['uDate'];
    uTime = json['uTime'];
    totalService = json['total_service'];
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['academy_uid'] = this.academyUid;
    data['academyname'] = this.academyname;
    data['address'] = this.address;
    data['email'] = this.email;
    data['website'] = this.website;
    data['city'] = this.city;
    data['state'] = this.state;
    data['pincode'] = this.pincode;
    data['billing_date'] = this.billingDate;
    data['bcatname'] = this.bcatname;
    data['busscategoryid'] = this.busscategoryid;
    data['onboarding_completed'] = this.onboardingCompleted;
    data['total_onboarding_step'] = this.totalOnboardingStep;
    data['onboarding_setup_finish'] = this.onboardingSetupFinish;
    data['cDate'] = this.cDate;
    data['cTime'] = this.cTime;
    data['uDate'] = this.uDate;
    data['uTime'] = this.uTime;
    data['total_service'] = this.totalService;
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Services {
  String? sId;
  String? uid;
  String? academyUid;
  String? catUid;
  String? serviceName;
  String? serviceIconname;
  bool? programAdded;
  bool? facilityAdded;
  String? status;
  String? cDate;
  String? cTime;
  String? uDate;
  String? uTime;

  Services(
      {this.sId,
      this.uid,
      this.academyUid,
      this.catUid,
      this.serviceName,
      this.serviceIconname,
      this.programAdded,
      this.facilityAdded,
      this.status,
      this.cDate,
      this.cTime,
      this.uDate,
      this.uTime});

  Services.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    uid = json['uid'];
    academyUid = json['academy_uid'];
    catUid = json['cat_uid'];
    serviceName = json['service_name'];
    serviceIconname = json['service_iconname'];
    programAdded = json['program_added'];
    facilityAdded = json['facility_added'];
    status = json['status'];
    cDate = json['cDate'];
    cTime = json['cTime'];
    uDate = json['uDate'];
    uTime = json['uTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['uid'] = this.uid;
    data['academy_uid'] = this.academyUid;
    data['cat_uid'] = this.catUid;
    data['service_name'] = this.serviceName;
    data['service_iconname'] = this.serviceIconname;
    data['program_added'] = this.programAdded;
    data['facility_added'] = this.facilityAdded;
    data['status'] = this.status;
    data['cDate'] = this.cDate;
    data['cTime'] = this.cTime;
    data['uDate'] = this.uDate;
    data['uTime'] = this.uTime;
    return data;
  }
}
