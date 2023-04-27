//model class MyprofiListModel
class MyprofiListModel {
  String? msg;
  int? total;
  List<Data>? data;

  MyprofiListModel({this.msg, this.total, this.data});

  MyprofiListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    total = json['total'];
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
    data['total'] = this.total;
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? uid;
  String? userid;
  String? name;
  String? timestamp;
  String? cDate;
  String? cTime;
  String? gender;
  String? email;
  int? type;
  int? role;
  String? relation;
  String? academyUid;
  String? img;
  bool? imgStatus;

  Data(
      {this.sId,
      this.uid,
      this.userid,
      this.name,
      this.timestamp,
      this.cDate,
      this.cTime,
      this.gender,
      this.email,
      this.type,
      this.role,
      this.relation,
      this.academyUid,
      this.img,
      this.imgStatus});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['uid'] = this.uid;
    data['userid'] = this.userid;
    data['name'] = this.name;
    data['timestamp'] = this.timestamp;
    data['cDate'] = this.cDate;
    data['cTime'] = this.cTime;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['type'] = this.type;
    data['role'] = this.role;
    data['relation'] = this.relation;
    data['academy_uid'] = this.academyUid;
    data['img'] = this.img;
    data['img_status'] = this.imgStatus;
    return data;
  }
}
