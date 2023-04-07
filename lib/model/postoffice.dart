class PostofficeListModel {
  String? message;
  String? status;
  List<PostOffice>? postOffice;

  PostofficeListModel({this.message, this.status, this.postOffice});

  PostofficeListModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    status = json['Status'];
    if (json['PostOffice'] != null) {
      postOffice = <PostOffice>[];
      json['PostOffice'].forEach((v) {
        postOffice!.add(PostOffice.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Message'] = message;
    data['Status'] = status;
    if (postOffice != null) {
      data['PostOffice'] = postOffice!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PostOffice {
  String? name;
  String? description;
  String? branchType;
  String? deliveryStatus;
  String? circle;
  String? district;
  String? division;
  String? region;
  String? block;
  String? state;
  String? country;
  String? pincode;

  PostOffice(
      {this.name,
      this.description,
      this.branchType,
      this.deliveryStatus,
      this.circle,
      this.district,
      this.division,
      this.region,
      this.block,
      this.state,
      this.country,
      this.pincode});

  PostOffice.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    description = json['Description'];
    branchType = json['BranchType'];
    deliveryStatus = json['DeliveryStatus'];
    circle = json['Circle'];
    district = json['District'];
    division = json['Division'];
    region = json['Region'];
    block = json['Block'];
    state = json['State'];
    country = json['Country'];
    pincode = json['Pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Name'] = name;
    data['Description'] = description;
    data['BranchType'] = branchType;
    data['DeliveryStatus'] = deliveryStatus;
    data['Circle'] = circle;
    data['District'] = district;
    data['Division'] = division;
    data['Region'] = region;
    data['Block'] = block;
    data['State'] = state;
    data['Country'] = country;
    data['Pincode'] = pincode;
    return data;
  }
}
