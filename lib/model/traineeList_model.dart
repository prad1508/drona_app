

class TraineeListListModel {
  String? msg;
  String? search;
  String? filter_batch_uid;
  bool? next_page_available;
  int? pagesize;
  int? current_pageno;
  int? data_count;
  int? total_data_count;

  List<Data>? data;

  TraineeListListModel({this.msg, this.search="",this.filter_batch_uid,this.next_page_available=false,this.pagesize=10, this.current_pageno=1,this.data_count=1 ,this.total_data_count=1, this.data});

  TraineeListListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    filter_batch_uid = json['filter_batch_uid'];
    next_page_available = json['next_page_available'];
    pagesize = json['pagesize'];
    current_pageno = json['current_pageno'];
    data_count = json['data_count'];
    total_data_count = json['total_data_count'];

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
    data['filter_batch_uid'] = this.filter_batch_uid;
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

class Data {
  String? id;
  String? uid;
  String? academy_uid;
  String? batch_uid;
  String? trainee_profile_uid;
  String? trainee_name;
  String? trainee_userid;
  String? timestamp;
  String? gender='';
  String? batchname='';
  String? dob;
  String? cDate;
  String? cTime;
  String? cdd;
  String? cmm;
  String? cyy;

  Data(
      {this.id,
        this.uid,
        this.academy_uid,
        this.batch_uid,
        this.trainee_profile_uid,
        this.trainee_name,
        this.trainee_userid,
        this.batchname,
        this.gender='',
        this.dob='',
        this.timestamp,
        this.cDate,
        this.cTime,
        this.cdd,
        this.cmm,
        this.cyy,
      });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    uid = json['uid'];
    academy_uid = json['academy_uid'];
    batch_uid = json['batch_uid'];
    trainee_profile_uid = json['trainee_profile_uid'];
    trainee_name = json['trainee_name'];
    batchname = json['batch_name'];
    gender = json['gender'];
    trainee_userid = json['trainee_userid'];
    timestamp = json['timestamp'];
    dob = json['dob'];
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
    data['trainee_profile_uid'] = this.trainee_profile_uid;
    data['trainee_name'] = this.trainee_name;
    data['batch_name'] = this.batchname;
    data['gender'] = this.gender;
    data['trainee_userid'] = this.trainee_userid;
    data['timestamp'] = this.timestamp;
    data['dob'] = this.dob;
    data['cDate'] = this.cDate;
    data['cTime'] = this.cTime;
    data['cdd'] = this.cdd;
    data['cmm'] = this.cmm;
    data['cyy'] = this.cyy;
    return data;
  }
}
