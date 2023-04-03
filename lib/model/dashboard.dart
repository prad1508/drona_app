class DashboardListModel {
  dynamic totalCount;
  dynamic pageCount;
  List<Requests>? requests;

  DashboardListModel({this.totalCount, this.pageCount, this.requests});

  DashboardListModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    pageCount = json['page_count'];
    if (json['requests'] != null) {
      requests = <Requests>[];
      json['requests'].forEach((v) {
        requests!.add(Requests.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_count'] = totalCount;
    data['page_count'] = pageCount;
    if (requests != null) {
      data['requests'] = requests!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Requests {
  dynamic bessId;
  dynamic createdAt;
  dynamic iB;
  dynamic iR;
  dynamic iY;
  dynamic kva;
  dynamic kvah;
  dynamic kwh;
  dynamic sequesnceId;
dynamic source;
  dynamic updatedAt;
dynamic vR;

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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bess_id'] = bessId;
    data['created_at'] = createdAt;
    data['i_b'] = iB;
    data['i_r'] = iR;
    data['i_y'] = iY;
    data['kva'] = kva;
    data['kvah'] = kvah;
    data['kwh'] = kwh;
    data['sequesnce_id'] = sequesnceId;
    data['source'] = source;
    data['updated_at'] = updatedAt;
    data['v_r'] = vR;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['$oid'] = oid;
    return data;
  }
}
