class SessionDetailsModel {
  SessionDetailsModel({
    required this.msg,
    required this.academyUid,
    required this.batchUid,
    required this.serviceUid,
    required this.serviceName,
    required this.catUid,
    required this.batchName,
    required this.programName,
    required this.status,
    required this.sdd,
    required this.smm,
    required this.syy,
    required this.dayCode,
    required this.dayShort,
    required this.batchTimingFrom,
    required this.batchTimingTo,
    required this.feedbackTrainee,
    required this.feedbackAcademy,
    required this.attachfileStatus,
    required this.attachfile,
    required this.data,
  });

  final String msg;
  final String academyUid;
  final String batchUid;
  final String serviceUid;
  final String serviceName;
  final String catUid;
  final String batchName;
  final String programName;
  final String status;
  final String sdd;
  final String smm;
  final String syy;
  final String dayCode;
  final String dayShort;
  final String batchTimingFrom;
  final String batchTimingTo;
  final String feedbackTrainee;
  final String feedbackAcademy;
  final bool attachfileStatus;
  final List<dynamic> attachfile;
  final List<Data> data;

  factory SessionDetailsModel.fromJson(Map<String, dynamic> json) {
    return SessionDetailsModel(
      msg: json['msg'],
      academyUid: json['academy_uid'],
      batchUid: json['batch_uid'],
      serviceUid: json['service_uid'],
      serviceName: json['service_name'],
      catUid: json['cat_uid'],
      batchName: json['batch_name'],
      programName: json['program_name'],
      status: json['status'],
      sdd: json['sdd'],
      smm: json['smm'],
      syy: json['syy'],
      dayCode: json['day_code'],
      dayShort: json['day_short'],
      batchTimingFrom: json['batch_timing_from'],
      batchTimingTo: json['batch_timing_to'],
      feedbackTrainee: json['feedback_trainee'],
      feedbackAcademy: json['feedback_academy'],
      attachfileStatus: json['attachfile_status'],
      attachfile: List.castFrom<dynamic, dynamic>(json['attachfile']),
      data: List<Data>.from(json['Data'].map((e) => Data.fromJson(e))),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    data['academy_uid'] = academyUid;
    data['batch_uid'] = batchUid;
    data['service_uid'] = serviceUid;
    data['service_name'] = serviceName;
    data['cat_uid'] = catUid;
    data['batch_name'] = batchName;
    data['program_name'] = programName;
    data['status'] = status;
    data['sdd'] = sdd;
    data['smm'] = smm;
    data['syy'] = syy;
    data['day_code'] = dayCode;
    data['day_short'] = dayShort;
    data['batch_timing_from'] = batchTimingFrom;
    data['batch_timing_to'] = batchTimingTo;
    data['feedback_trainee'] = feedbackTrainee;
    data['feedback_academy'] = feedbackAcademy;
    data['attachfile_status'] = attachfileStatus;
    data['attachfile'] = attachfile;
    data['Data'] = data.map((key, value) => MapEntry(key.toString(), value));
    return data;
  }

}

class Data {
  Data({
    required this.id,
    required this.uid,
    required this.batchUid,
    required this.traineeProfileUid,
    required this.traineeName,
    required this.traineeUserid,
    required this.sessionUid,
    required this.attendance,
    required this.attendanceStatus,
    required this.status,
    required this.batchTimingFrom,
    required this.batchTimingTo,
    required this.sdd,
    required this.smm,
    required this.syy,
    required this.dayCode,
    required this.dayShort,
    /*required this.gender,
    required this.fees,*/
  });

  final String id;
  final String uid;
  final String batchUid;
  final String traineeProfileUid;
  final String traineeName;
  final String traineeUserid;
  final String sessionUid;
  final String attendance;
  final bool attendanceStatus;
  final String status;
  final String batchTimingFrom;
  final String batchTimingTo;
  final String sdd;
  final String smm;
  final String syy;
  final String dayCode;
  final String dayShort;
 /* final String gender;
  final int fees;*/

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['_id'],
      uid: json['uid'],
      batchUid: json['batch_uid'],
      traineeProfileUid: json['trainee_profile_uid'],
      traineeName: json['trainee_name'],
      traineeUserid: json['trainee_userid'],
      sessionUid: json['session_uid'],
      attendance: json['attendance'],
      attendanceStatus: json['attendance_status'],
      status: json['status'],
      batchTimingFrom: json['batch_timing_from'],
      batchTimingTo: json['batch_timing_to'],
      sdd: json['sdd'],
      smm: json['smm'],
      syy: json['syy'],
      dayCode: json['day_code'],
      dayShort: json['day_short'],
      /*gender: json['gender'],
      fees: json['fees'],*/
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['uid'] = uid;
    data['batch_uid'] = batchUid;
    data['trainee_profile_uid'] = traineeProfileUid;
    data['trainee_name'] = traineeName;
    data['trainee_userid'] = traineeUserid;
    data['session_uid'] = sessionUid;
    data['attendance'] = attendance;
    data['attendance_status'] = attendanceStatus;
    data['status'] = status;
    data['batch_timing_from'] = batchTimingFrom;
    data['batch_timing_to'] = batchTimingTo;
    data['sdd'] = sdd;
    data['smm'] = smm;
    data['syy'] = syy;
    data['day_code'] = dayCode;
    data['day_short'] = dayShort;
    /*data['gender'] = gender;
    data['fees'] = fees;*/
    return data;
  }
}
