//model class CategoryListModel
class CategoryListModel {
  String? msg;
  List<Data>? data;

  CategoryListModel({this.msg, this.data});

  CategoryListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
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
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? name;
  String? uid;
  bool? status;
  String? timestamp;
  String? cDate;
  String? cTime;

  Data(
      {this.sId,
      this.name,
      this.uid,
      this.status,
      this.timestamp,
      this.cDate,
      this.cTime});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    uid = json['uid'];
    status = json['status'];
    timestamp = json['timestamp'];
    cDate = json['cDate'];
    cTime = json['cTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['uid'] = uid;
    data['status'] = status;
    data['timestamp'] = timestamp;
    data['cDate'] = cDate;
    data['cTime'] = cTime;
    return data;
  }
}
