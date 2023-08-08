class MyProgramListModel {
  String? msg;
  List<Data>? data;

  MyProgramListModel({this.msg, this.data});

  MyProgramListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? uid;
  String? academyUid;
  String? serviceName;
  String? serviceUid;
  String? catUid;
  String? catName;
  String? name;
  bool? custom;
  List<Programs>? programs;
  String? cDate;
  String? cTime;
  String? addedByProfileUid;

  Data(
      {this.sId,
        this.uid,
        this.academyUid,
        this.serviceName,
        this.serviceUid,
        this.catUid,
        this.catName,
        this.name,
        this.custom,
        this.programs,
        this.cDate,
        this.cTime,
        this.addedByProfileUid});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    uid = json['uid'];
    academyUid = json['academy_uid'];
    serviceName = json['service_name'];
    serviceUid = json['service_uid'];
    catUid = json['cat_uid'];
    catName = json['cat_name'];
    name = json['name'];
    custom = json['custom'];
    if (json['programs'] != null) {
      programs = <Programs>[];
      json['programs'].forEach((v) {
        programs!.add(new Programs.fromJson(v));
      });
    }
    cDate = json['cDate'];
    cTime = json['cTime'];
    addedByProfileUid = json['added_by_profile_uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['uid'] = this.uid;
    data['academy_uid'] = this.academyUid;
    data['service_name'] = this.serviceName;
    data['service_uid'] = this.serviceUid;
    data['cat_uid'] = this.catUid;
    data['cat_name'] = this.catName;
    data['name'] = this.name;
    data['custom'] = this.custom;
    if (this.programs != null) {
      data['programs'] = this.programs!.map((v) => v.toJson()).toList();
    }
    data['cDate'] = this.cDate;
    data['cTime'] = this.cTime;
    data['added_by_profile_uid'] = this.addedByProfileUid;
    return data;
  }
}

class Programs {
  String? uid;
  String? programName;
  String? curriculumTitle;
  String? curriculumDescription;
  dynamic? amount;
  dynamic? registrationfee;

  Programs({this.uid, this.programName, this.amount, this.registrationfee , this.curriculumDescription='',this.curriculumTitle=''});

  Programs.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    programName = json['program_name'];
    amount = json['amount'];
    registrationfee = json['registrationfee'];
    curriculumTitle = json['curriculum_title'];
    curriculumDescription = json['curriculum_desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['program_name'] = this.programName;
    data['amount'] = this.amount;
    data['registrationfee'] = this.registrationfee;
    data['curriculum_title'] = this.curriculumTitle;
    data['curriculum_desc'] = this.curriculumDescription;
    return data;
  }
}
