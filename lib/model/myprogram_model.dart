//model class MyProgramListModel
class MyProgramListModel {
   String? msg;
  List<Data>? data;

  MyProgramListModel({
       this.msg, 
       this.data,});

  MyProgramListModel.fromJson(dynamic json) {
    msg = json['msg'];
    if (json['Data'] != null) {
      data = [];
      json['Data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
 
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = msg;
    if (data != null) {
      map['Data'] = data!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}


class Data {
  String? id;
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
  Data({
      this.id, 
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
      this.addedByProfileUid,});
  Data.fromJson(dynamic json) {
    id = json['_id'];
    uid = json['uid'];
    academyUid = json['academy_uid'];
    serviceName = json['service_name'];
    serviceUid = json['service_uid'];
    catUid = json['cat_uid'];
    catName = json['cat_name'];
    name = json['name'];
    custom = json['custom'];
    if (json['programs'] != null) {
      programs = [];
      json['programs'].forEach((v) {
        programs!.add(Programs.fromJson(v));
      });
    }
    cDate = json['cDate'];
    cTime = json['cTime'];
    addedByProfileUid = json['added_by_profile_uid'];
  }
 

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['uid'] = uid;
    map['academy_uid'] = academyUid;
    map['service_name'] = serviceName;
    map['service_uid'] = serviceUid;
    map['cat_uid'] = catUid;
    map['cat_name'] = catName;
    map['name'] = name;
    map['custom'] = custom;
    if (programs != null) {
      map['programs'] = programs!.map((v) => v.toJson()).toList();
    }
    map['cDate'] = cDate;
    map['cTime'] = cTime;
    map['added_by_profile_uid'] = addedByProfileUid;
    return map;
  }

}
class Programs {
  String? uid;
  String? programName;
  String? amount;
  String? registrationfee;
  Programs({
      this.uid, 
      this.programName, 
      this.amount, 
      this.registrationfee,});

  Programs.fromJson(dynamic json) {
    uid = json['uid'];
    programName = json['program_name'];
    amount = json['amount'];
    registrationfee = json['registrationfee'];
  }
  

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uid'] = uid;
    map['program_name'] = programName;
    map['amount'] = amount;
    map['registrationfee'] = registrationfee;
    return map;
  }

}