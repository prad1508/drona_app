

class SessionListListModel {
  String? msg;
  String? search;
  String? pagefilter;
  bool? next_page_available;
  int? pagesize;
  int? current_pageno;
  int? data_count;
  int? total_data_count;

  List<DataSessionList>? data;

  SessionListListModel({this.msg, this.search="",this.next_page_available=false,this.pagesize=10, this.current_pageno=1,this.data_count=1 ,this.total_data_count=1, this.data});

  SessionListListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    search = json['search'];
    pagefilter = json['pagefilter'];
    next_page_available = json['next_page_available'];
    pagesize = json['pagesize'];
    current_pageno = json['current_pageno'];
    data_count = json['data_count'];
    total_data_count = json['total_data_count'];

    if (json['Data'] != null) {
      data = <DataSessionList>[];
      json['Data'].forEach((v) {
        data!.add(new DataSessionList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['search'] = this.search;
    data['pagefilter'] = this.pagefilter;
    data['next_page_available'] = this.next_page_available;
    data['pagesize'] = this.pagesize;
    data['current_pageno'] = this.current_pageno;
    data['data_count'] = this.data_count;
    data['total_data_count'] = this.total_data_count;

    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataSessionList {
  String? id;
  String? uid;
  String? batch_uid;
  String? service_uid;
  String? service_name;
  String? service_iconname;
  String? cat_uid;
  String? batch_name;
  String? cDate;
  String? program_uid;
  String? academy_uid;
  String? program_name;
  String? status;
  String? trainee_name;
  String? trainee_userid;
  String? trainee_profile_uid;
  String? batch_timing_from;
  String? batch_timing_to;
  String? timestamp;
  String? cTime;
  String? sdd;
  String? smm;
  String? syy;
  String? day_code;
  String? day_short;
  String? cdd;
  String? cmm;
  String? cyy;

  DataSessionList(
      {this.id,
        this.uid,
        this.batch_uid,
        this.service_uid,
        this.service_name,
        this.service_iconname,
        this.cat_uid,
        this.batch_name,
        this.cDate,
        this.program_uid,
        this.academy_uid,
        this.program_name,
        this.trainee_name ='',
        this.trainee_profile_uid='',
        this.trainee_userid='',
        this.status,
        this.batch_timing_from,
        this.batch_timing_to,
        this.timestamp,
        this.cTime,
        this.sdd,
        this.smm,
        this.syy,
        this.day_code,
        this.day_short,
        this.cdd,
        this.cmm,
        this.cyy,
      });

  DataSessionList.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    uid = json['uid'];
    academy_uid = json['academy_uid'];
    batch_uid = json['batch_uid'];
    syy = json['syy'];
    smm = json['smm'];
    sdd = json['sdd'];
    batch_timing_to = json['batch_timing_to'];
    batch_timing_from = json['batch_timing_from'];
    status = json['status'];
    trainee_name = json['trainee_name'];
    trainee_profile_uid = json['trainee_profile_uid'];
    trainee_userid = json['trainee_userid'];
    program_name = json['program_name'];
    program_uid = json['program_uid'];
    batch_name = json['batch_name'];
    cat_uid = json['cat_uid'];
    service_iconname = json['service_iconname'];
    service_name = json['service_name'];
    service_uid = json['service_uid'];
    day_code = json['day_code'];
    day_short = json['day_short'];
    timestamp = json['timestamp'];
    cDate = json['cDate'];
    cTime = json['cTime'];
    cdd = json['cdd'];
    cmm = json['cmm'];
    cyy = json['cyy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['uid'] = this.uid;
    data['academy_uid'] = this.academy_uid;
    data['batch_uid'] = this.batch_uid;
    data['day_short'] = this.day_short;
    data['day_code'] = this.day_code;
    data['syy'] = this.syy;
    data['smm'] = this.smm;
    data['sdd'] = this.sdd;
    data['batch_timing_to'] = this.batch_timing_to;
    data['batch_timing_from'] = this.batch_timing_from;
    data['trainee_userid'] = this.trainee_userid;
    data['trainee_name'] = this.trainee_name;
    data['trainee_profile_uid'] = this.trainee_profile_uid;
    data['status'] = this.status;
    data['program_uid'] = this.program_uid;
    data['batch_name'] = this.batch_name;
    data['cat_uid'] = this.cat_uid;
    data['service_iconname'] = this.service_iconname;
    data['service_name'] = this.service_name;
    data['service_uid'] = this.service_uid;
    data['timestamp'] = this.timestamp;
    data['cDate'] = this.cDate;
    data['cTime'] = this.cTime;
    data['cdd'] = this.cdd;
    data['cmm'] = this.cmm;
    data['cyy'] = this.cyy;
    return data;
  }
}

