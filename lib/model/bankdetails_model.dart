import 'dart:convert';

//
// BankDetailsModel bankDetailsModelFromJson(String str) => BankDetailsModel.fromJson(json.decode(str));
//
// String bankDetailsModelToJson(BankDetailsModel data) => json.encode(data.toJson());

class BankDetailsModel {
  final dynamic acHolderName;
  final dynamic ifscCode;
  final dynamic acNumber;
  final dynamic upi;
  final dynamic bankName;
  final dynamic bankBranch;
  final dynamic googlepayNo;
  final dynamic paytmNo;
  final dynamic qr;

  BankDetailsModel({
    this.acHolderName = '',
    this.ifscCode = '',
    this.acNumber = '',
    this.upi = '',
    this.bankName = '',
    this.bankBranch = '',
    this.googlepayNo = '',
    this.paytmNo = '',
    this.qr = '',
  });

  factory BankDetailsModel.fromJson(Map<String, dynamic> json) =>
      BankDetailsModel(
        acHolderName: json["ac_holder_name"],
        ifscCode: json["ifsc_code"],
        acNumber: json["ac_number"],
        upi: json["upi"],
        bankName: json["bank_name"],
        bankBranch: json["bank_branch"],
        googlepayNo: json["googlepay_no"],
        paytmNo: json["paytm_no"],
        qr: json["qr"],
      );

  Map<String, dynamic> toJson() =>
      {
        "ac_holder_name": acHolderName,
        "ifsc_code": ifscCode,
        "ac_number": acNumber,
        "upi": upi,
        "bank_name": bankName,
        "bank_branch": bankBranch,
        "googlepay_no": googlepayNo,
        "paytm_no": paytmNo,
        "qr": qr,
      };
}