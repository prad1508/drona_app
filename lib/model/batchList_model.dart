//model class BatchListListModel
class BatchListListModel {
  String? msg;
  String? academyUid;
  String? academyName;
  List<Data>? data;

  BatchListListModel({this.msg, this.academyUid, this.academyName, this.data});

  BatchListListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    academyUid = json['academy_uid'];
    academyName = json['academy_name'];
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
    data['academy_uid'] = this.academyUid;
    data['academy_name'] = this.academyName;
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? uid;
  String? serviceUid;
  String? serviceName;
  String? serviceIconname;
  String? catUid;
  String? batchName;
  String? timestamp;
  String? cDate;
  String? cTime;
  String? programUid;
  String? academyUid;
  String? programName;
  String? fees;
  String? cdd;
  String? cmm;
  String? cyy;
  String? status;
  String? batchTimingFrom;
  String? batchTimingTo;
  List<String>? batchDays;

  Data(
      {this.sId,
      this.uid,
      this.serviceUid,
      this.serviceName,
      this.serviceIconname,
      this.catUid,
      this.batchName,
      this.timestamp,
      this.cDate,
      this.cTime,
      this.programUid,
      this.academyUid,
      this.programName,
      this.fees,
      this.cdd,
      this.cmm,
      this.cyy,
      this.status,
      this.batchTimingFrom,
      this.batchTimingTo,
      this.batchDays});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    uid = json['uid'];
    serviceUid = json['service_uid'];
    serviceName = json['service_name'];
    serviceIconname = json['service_iconname'];
    catUid = json['cat_uid'];
    batchName = json['batch_name'];
    timestamp = json['timestamp'];
    cDate = json['cDate'];
    cTime = json['cTime'];
    programUid = json['program_uid'];
    academyUid = json['academy_uid'];
    programName = json['program_name'];
    fees = json['fees'];
    cdd = json['cdd'];
    cmm = json['cmm'];
    cyy = json['cyy'];
    status = json['status'];
    batchTimingFrom = json['batch_timing_from'];
    batchTimingTo = json['batch_timing_to'];
    batchDays = json['batch_days'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['uid'] = this.uid;
    data['service_uid'] = this.serviceUid;
    data['service_name'] = this.serviceName;
    data['service_iconname'] = this.serviceIconname;
    data['cat_uid'] = this.catUid;
    data['batch_name'] = this.batchName;
    data['timestamp'] = this.timestamp;
    data['cDate'] = this.cDate;
    data['cTime'] = this.cTime;
    data['program_uid'] = this.programUid;
    data['academy_uid'] = this.academyUid;
    data['program_name'] = this.programName;
    data['fees'] = this.fees;
    data['cdd'] = this.cdd;
    data['cmm'] = this.cmm;
    data['cyy'] = this.cyy;
    data['status'] = this.status;
    data['batch_timing_from'] = this.batchTimingFrom;
    data['batch_timing_to'] = this.batchTimingTo;
    data['batch_days'] = this.batchDays;
    return data;
  }
}
