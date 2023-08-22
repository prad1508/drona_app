//model class RegistrationListModel
// To parse this JSON data, do
//
//     final chnagepassword = chnagepasswordFromJson(jsonString);

import 'dart:convert';

Changepassword ChangepasswordFromJson(String str) => Changepassword.fromJson(json.decode(str));

String ChangepasswordToJson(Changepassword data) => json.encode(data.toJson());

class Changepassword {
  String newpassword;
  String oldpassword;

  Changepassword({
    required this.newpassword,
    required this.oldpassword,
  });

  factory Changepassword.fromJson(Map<String, dynamic> json) => Changepassword(
    newpassword: json["newpassword"],
    oldpassword: json["oldpassword"],
  );

  Map<String, dynamic> toJson() => {
    "newpassword": newpassword,
    "oldpassword": oldpassword,
  };
}
