class CreateBatchListModel {
  String? serviceUid;
  String? batchName;
  String? coachProfileUid;
  String? programUid;
  String? programName;
  int? fees;
  String? typeBatch;
  bool? provideOnlineSessions;
  String? onlineSessionUrl;
  List<String>? batchDays;
  String? batchTimingFrom;
  String? batchTimingTo;

  CreateBatchListModel(
      {this.serviceUid,
      this.batchName,
      this.coachProfileUid,
      this.programUid,
      this.programName,
      this.fees,
      this.typeBatch,
      this.provideOnlineSessions,
      this.onlineSessionUrl,
      this.batchDays,
      this.batchTimingFrom,
      this.batchTimingTo});

  CreateBatchListModel.fromJson(Map<String, dynamic> json) {
    serviceUid = json['service_uid'];
    batchName = json['batch_name'];
    coachProfileUid = json['coach_profile_uid'];
    programUid = json['program_uid'];
    programName = json['program_name'];
    fees = json['fees'];
    typeBatch = json['type_batch'];
    provideOnlineSessions = json['provide_online_sessions'];
    onlineSessionUrl = json['online_session_url'];
    batchDays = json['batch_days'].cast<String>();
    batchTimingFrom = json['batch_timing_from'];
    batchTimingTo = json['batch_timing_to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_uid'] = this.serviceUid;
    data['batch_name'] = this.batchName;
    data['coach_profile_uid'] = this.coachProfileUid;
    data['program_uid'] = this.programUid;
    data['program_name'] = this.programName;
    data['fees'] = this.fees;
    data['type_batch'] = this.typeBatch;
    data['provide_online_sessions'] = this.provideOnlineSessions;
    data['online_session_url'] = this.onlineSessionUrl;
    data['batch_days'] = this.batchDays;
    data['batch_timing_from'] = this.batchTimingFrom;
    data['batch_timing_to'] = this.batchTimingTo;
    return data;
  }
}
