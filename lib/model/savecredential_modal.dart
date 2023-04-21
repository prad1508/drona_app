class SavecredentialModel {
  String? userid;
  String? password;

  SavecredentialModel({this.userid, this.password});
  
  SavecredentialModel.fromJson(Map<String, dynamic> json) {
    userid = json['userid'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userid'] = this.userid;
    data['password'] = this.password;
    return data;
  }
}
