class DashboardListModel {
  dynamic? totalCount;
  dynamic? pageCount;
  List<Requests>? requests;

  DashboardListModel({this.totalCount, this.pageCount, this.requests});

  DashboardListModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    pageCount = json['page_count'];
    if (json['requests'] != null) {
      requests = <Requests>[];
      json['requests'].forEach((v) {
        requests!.add(new Requests.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_count'] = this.totalCount;
    data['page_count'] = this.pageCount;
    if (this.requests != null) {
      data['requests'] = this.requests!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Requests {
  dynamic? bessId;
  dynamic? createdAt;
  dynamic? iB;
  dynamic? iR;
  dynamic? iY;
  dynamic? kva;
  dynamic? kvah;
  dynamic? kwh;
  dynamic? sequesnceId;
dynamic? source;
  dynamic? updatedAt;
dynamic? vR;

  Requests(
      {
      this.bessId,
      this.createdAt,
      this.iB,
      this.iR,
      this.iY,
      this.kva,
      this.kvah,
      this.kwh,
      this.sequesnceId,
      this.source,
      this.updatedAt,
      this.vR});

  Requests.fromJson(Map<String, dynamic> json) {
    bessId = json['bess_id'];
    createdAt = json['created_at'];
    iB = json['i_b'];
    iR = json['i_r'];
    iY = json['i_y'];
    kva = json['kva'];
    kvah = json['kvah'];
    kwh = json['kwh'];
    sequesnceId = json['sequesnce_id'];
    source = json['source'];
    updatedAt = json['updated_at'];
    vR = json['v_r'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bess_id'] = this.bessId;
    data['created_at'] = this.createdAt;
    data['i_b'] = this.iB;
    data['i_r'] = this.iR;
    data['i_y'] = this.iY;
    data['kva'] = this.kva;
    data['kvah'] = this.kvah;
    data['kwh'] = this.kwh;
    data['sequesnce_id'] = this.sequesnceId;
    data['source'] = this.source;
    data['updated_at'] = this.updatedAt;
    data['v_r'] = this.vR;
    return data;
  }
}

class Id {
  String? oid;

  Id({this.oid});

  Id.fromJson(Map<String, dynamic> json) {
    oid = json['$oid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$oid'] = this.oid;
    return data;
  }
}
