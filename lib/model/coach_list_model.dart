class CoachlistModel {
  CoachlistModel({
    required this.msg,
    required this.search,
    required this.nextPageAvailable,
    required this.pagesize,
    required this.currentPageno,
    required this.dataCount,
    required this.totalDataCount,
    required this.data,
  });
  late final String msg;
  late final String search;
  late final bool nextPageAvailable;
  late final int pagesize;
  late final int currentPageno;
  late final int dataCount;
  late final int totalDataCount;
  late final List<CoachData> data;

  CoachlistModel.fromJson(Map<String, dynamic> json){
    msg = json['msg'];
    search = json['search'];
    nextPageAvailable = json['next_page_available'];
    pagesize = json['pagesize'];
    currentPageno = json['current_pageno'];
    dataCount = json['data_count'];
    totalDataCount = json['total_data_count'];
    data = List.from(json['Data']).map((e)=>CoachData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['msg'] = msg;
    _data['search'] = search;
    _data['next_page_available'] = nextPageAvailable;
    _data['pagesize'] = pagesize;
    _data['current_pageno'] = currentPageno;
    _data['data_count'] = dataCount;
    _data['total_data_count'] = totalDataCount;
    _data['Data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class CoachData {
  CoachData({
    required this.uid,
    required this.userid,
    required this.name,
    required this.timestamp,
    required this.cDate,
    required this.cTime,
    required this.gender,
    required this.email,
    required this.type,
    required this.role,
    required this.relation,
    required this.academyUid,
    required this.img,
    required this.imgStatus,
    required this.status,
    required this.salaryMonthly,
    required this.dateOfJoining,
    required this.invitecode,
    required this.invitecodeExpire,
    required this.totalBatch,
    required this.totalTrainee,
    required this.joinStatus,
    required this.dob,
    required this.services,
  });
  late final String uid;
  late final String userid;
  late final String name;
  late final String timestamp;
  late final String cDate;
  late final String cTime;
  late final String gender;
  late final String email;
  late final int type;
  late final int role;
  late final String relation;
  late final String academyUid;
  late final String img;
  late final String imgStatus;
  late final String status;
  late final String salaryMonthly;
  late final String dateOfJoining;
  late final String invitecode;
  late final String invitecodeExpire;
  late final int totalBatch;
  late final int totalTrainee;
  late final String joinStatus;
  late final String dob;
  late final List<Services> services;

  CoachData.fromJson(Map<String, dynamic> json){
    uid = json['uid'];
    userid = json['userid'];
    name = json['name'];
    timestamp = json['timestamp'];
    cDate = json['cDate'];
    cTime = json['cTime'];
    gender = json['gender'];
    email = json['email'];
    type = json['type'];
    role = json['role'];
    relation = json['relation'];
    academyUid = json['academy_uid'];
    img = json['img'];
    imgStatus = json['img_status'];
    status = json['status'];
    salaryMonthly = json['salary_monthly'];
    dateOfJoining = json['date_of_joining'];
    invitecode = json['invitecode'];
    invitecodeExpire = json['invitecode_expire'];
    totalBatch = json['total_batch'];
    totalTrainee = json['total_trainee'];
    joinStatus = json['join_status'];
    dob = json['dob'];
    services = List.from(json['services']).map((e)=>Services.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['uid'] = uid;
    _data['userid'] = userid;
    _data['name'] = name;
    _data['timestamp'] = timestamp;
    _data['cDate'] = cDate;
    _data['cTime'] = cTime;
    _data['gender'] = gender;
    _data['email'] = email;
    _data['type'] = type;
    _data['role'] = role;
    _data['relation'] = relation;
    _data['academy_uid'] = academyUid;
    _data['img'] = img;
    _data['img_status'] = imgStatus;
    _data['status'] = status;
    _data['salary_monthly'] = salaryMonthly;
    _data['date_of_joining'] = dateOfJoining;
    _data['invitecode'] = invitecode;
    _data['invitecode_expire'] = invitecodeExpire;
    _data['total_batch'] = totalBatch;
    _data['total_trainee'] = totalTrainee;
    _data['join_status'] = joinStatus;
    _data['dob'] = dob;
    _data['services'] = services.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Services {
  Services({
    required this.serviceName,
    required this.serviceIconname,
  });
  late final String serviceName;
  late final String serviceIconname;

  Services.fromJson(Map<String, dynamic> json){
    serviceName = json['service_name'];
    serviceIconname = json['service_iconname'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['service_name'] = serviceName;
    _data['service_iconname'] = serviceIconname;
    return _data;
  }
}