class CoachlistListModel {
  CoachlistListModel({
    required this.msg,
    required this.academyUid,
    required this.academyName,
    required this.coachlist,
  });
  late final String msg;
  late final String academyUid;
  late final String academyName;
  late final List<Coachlist> coachlist;

  CoachlistListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    academyUid = json['academy_uid'];
    academyName = json['academy_name'];
    coachlist = List.from(json['coachlist']).map((e) => Coachlist.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['msg'] = msg;
    _data['academy_uid'] = academyUid;
    _data['academy_name'] = academyName;
    _data['coachlist'] = coachlist.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Coachlist {
  Coachlist({
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
     this.img = '',
    required this.imgStatus,
    required this.status,
    required this.salaryMonthly,
    this.dateOfJoining = '',
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
   String img = '';
  late final bool imgStatus;
  late final String status;
  late final String salaryMonthly;
  late final String dateOfJoining;
  late final List<Services> services;

  Coachlist.fromJson(Map<String, dynamic> json) {
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
    services =
        List.from(json['services']).map((e) => Services.fromJson(e)).toList();
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
    _data['services'] = services.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Services {
  Services({
    required this.id,
    required this.serviceName,
    required this.serviceIconname,
  });
  late final String id;
  late final String serviceName;
  late final String serviceIconname;

  Services.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    serviceName = json['service_name'];
    serviceIconname = json['service_iconname'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['service_name'] = serviceName;
    _data['service_iconname'] = serviceIconname;
    return _data;
  }
}
