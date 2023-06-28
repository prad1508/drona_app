//model class ProgramListModel
class ProgramListModel {
  String? msg;
  List<Data>? data;

  ProgramListModel({this.msg, this.data});

  ProgramListModel.fromJson(Map<String, dynamic> json) {
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
  String? catName;
  String? catUid;
  String? serviceName;
  String? uid;
  bool? custom;
  bool? status;
  String? timestamp;
  String? cDate;
  String? cTime;
  String? serviceUid;
  String? name;
  List<String>? programoption;

  Data(
      {this.sId,
      this.catName,
      this.catUid,
      this.serviceName,
      this.uid,
      this.custom,
      this.status,
      this.timestamp,
      this.cDate,
      this.cTime,
      this.serviceUid,
      this.name ='',
      this.programoption = const [''], });

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    catName = json['cat_name'];
    catUid = json['cat_uid'];
    serviceName = json['service_name'];
    uid = json['uid'];
    custom = json['custom'];
    status = json['status'];
    timestamp = json['timestamp'];
    cDate = json['cDate'];
    cTime = json['cTime'];
    serviceUid = json['service_uid'];
    name = json['name'];
    programoption = json['programoption']!=null ? json['programoption ']: [''];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['cat_name'] = this.catName;
    data['cat_uid'] = this.catUid;
    data['service_name'] = this.serviceName;
    data['uid'] = this.uid;
    data['custom'] = this.custom;
    data['status'] = this.status;
    data['timestamp'] = this.timestamp;
    data['cDate'] = this.cDate;
    data['cTime'] = this.cTime;
    data['service_uid'] = this.serviceUid;
    data['name'] = this.name;
    data['programoption '] = this.programoption;
    return data;
  }
}
