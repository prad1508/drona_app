//model class MyservicesListModel
class MyservicesListModel {
  String? msg;
  String? academyname;
  String? bcatname;
  String? busscategoryid;
  List<Services>? services;

  MyservicesListModel(
      {this.msg,
      this.academyname,
      this.bcatname,
      this.busscategoryid,
      this.services});

  MyservicesListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    academyname = json['academyname'];
    bcatname = json['bcatname'];
    busscategoryid = json['busscategoryid'];
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
    data['academyname'] = this.academyname;
    data['bcatname'] = this.bcatname;
    data['busscategoryid'] = this.busscategoryid;
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
