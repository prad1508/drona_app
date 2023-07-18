//model class ServiceListModel
class ServiceListModel {
  String? msg;
  String? pathUrl;
  List<Data>? data;

  ServiceListModel({this.msg, this.pathUrl, this.data});

  ServiceListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    pathUrl = json['path_url'];
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    data['path_url'] = pathUrl;
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? catUid;
  String? catName;
  String? uid;
  String? serviceName;
  String? iconname;
  dynamic status;
  String? timestamp;
  String? cDate;
  String? cTime;

  Data(
      {this.sId,
      this.catUid,
      this.catName,
      this.uid,
      this.serviceName,
      this.iconname,
      this.status,
      this.timestamp,
      this.cDate,
      this.cTime});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    catUid = json['cat_uid'];
    catName = json['cat_name'];
    uid = json['uid'];
    serviceName = json['service_name'];
    iconname = json['iconname'];
    status = json['status'];
    timestamp = json['timestamp'];
    cDate = json['cDate'];
    cTime = json['cTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['cat_uid'] = catUid;
    data['cat_name'] = catName;
    data['uid'] = uid;
    data['service_name'] = serviceName;
    data['iconname'] = iconname;
    data['status'] = status;
    data['timestamp'] = timestamp;
    data['cDate'] = cDate;
    data['cTime'] = cTime;
    return data;
  }
}

