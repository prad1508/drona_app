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
  String? coachProfileUid;
  String? coachName;
  String? serviceUid;
  String? serviceName;
  String? serviceIconname;
  String? catUid;
  String? batchName;
  String? timestamp;
  String? cDate;
  String? cTime;
  String? batch_type;
  String? programUid;
  String? academyUid;
  String? programName;
  dynamic? fees;
  String? cdd;
  String? cmm;
  String? cyy;
  String? status;
  String? batchTimingFrom;
  String? batchTimingTo;
  String? onlineSessionUrl;
  bool? provideOnlineSessions;
  List? batchDaysShort;
  int? totalTrainee;
  List<String>? batchDays;

  Data(
      {this.sId,
      this.uid,
      this.coachProfileUid,
      this.coachName,
      this.serviceUid,
      this.serviceName,
      this.serviceIconname,
      this.catUid,
      this.batchName,
        this.batch_type,
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
      this.onlineSessionUrl,
        this.totalTrainee = 0,
      this.provideOnlineSessions,
      this.batchDaysShort,
      this.batchDays});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    uid = json['uid'];
    coachProfileUid = json['coach_profile_uid'];
    coachName = json['coach_name'];
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
    totalTrainee = json['total_trainee'];
    batch_type = json['type_batch'];
    batchTimingFrom = json['batch_timing_from'];
    batchTimingTo = json['batch_timing_to'];
    onlineSessionUrl = json['online_session_url'];
    provideOnlineSessions = json['provide_online_sessions'];
    batchDaysShort = json['batch_days_short'];
    batchDays = json['batch_days'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['uid'] = this.uid;
    data['coach_profile_uid'] = this.coachProfileUid;
    data['coach_name'] = this.coachName;
    data['service_uid'] = this.serviceUid;
    data['service_name'] = this.serviceName;
    data['service_iconname'] = this.serviceIconname;
    data['cat_uid'] = this.catUid;
    data['batch_name'] = this.batchName;
    data['timestamp'] = this.timestamp;
    data['type_batch'] = this.batch_type;
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
    data['total_trainee'] = this.totalTrainee;
    data['batch_timing_from'] = this.batchTimingFrom;
    data['batch_timing_to'] = this.batchTimingTo;
    data['online_session_url'] = this.onlineSessionUrl;
    data['provide_online_sessions'] = this.provideOnlineSessions;
    data['batch_days_short'] = this.batchDaysShort;
    data['batch_days'] = this.batchDays;
    return data;
  }
}
