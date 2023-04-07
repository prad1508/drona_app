//model class FacilityListModel
class FacilityListModel {
  String? catName;
  String? catUid;
  String? serviceName;
  String? serviceId;
  String? uid;
  String? inputtextname;
  List<String>? checkboxwithselectoption;
  String? checkboxwithselectoptionname;
  List<String>? other;
  bool? status;

  FacilityListModel(
      {this.catName,
      this.catUid,
      this.serviceName,
      this.serviceId,
      this.uid,
      this.inputtextname,
      this.checkboxwithselectoption,
      this.checkboxwithselectoptionname,
      this.other,
      this.status});

  FacilityListModel.fromJson(Map<String, dynamic> json) {
    catName = json['cat_name'];
    catUid = json['cat_uid'];
    serviceName = json['service_name'];
    serviceId = json['service_id'];
    uid = json['uid'];
    inputtextname = json['inputtextname'];
    checkboxwithselectoption = json['checkboxwithselectoption'].cast<String>();
    checkboxwithselectoptionname = json['checkboxwithselectoptionname'];
    other = json['other'].cast<String>();
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cat_name'] = this.catName;
    data['cat_uid'] = this.catUid;
    data['service_name'] = this.serviceName;
    data['service_id'] = this.serviceId;
    data['uid'] = this.uid;
    data['inputtextname'] = this.inputtextname;
    data['checkboxwithselectoption'] = this.checkboxwithselectoption;
    data['checkboxwithselectoptionname'] = this.checkboxwithselectoptionname;
    data['other'] = this.other;
    data['status'] = this.status;
    return data;
  }
}
