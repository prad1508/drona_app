class BankDetailsModel {
  String? acHolderName;
  String? ifscCode;
  String? acNumber;
  String? upi;
  String? bankName;
  String? bankBranch;
  String? googlePayNo;
  String? paytmNo;
  String? qr;

  BankDetailsModel(
      {this.acHolderName,
        this.ifscCode,
        this.acNumber,
        this.upi,
        this.bankName,
        this.bankBranch,
        this.googlePayNo,
        this.paytmNo,
        this.qr});

  BankDetailsModel.fromJson(Map<String, dynamic> json) {
    acHolderName = json['ac_holder_name'];
    ifscCode = json['ifsc_code'];
    acNumber = json['ac_number'];
    upi = json['upi'];
    bankName = json['bank_name'];
    bankBranch = json['bank_branch'];
    googlePayNo = json['googlepay_no'];
    paytmNo = json['paytm_no'];
    qr = json['qr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ac_holder_name'] = this.acHolderName;
    data['ifsc_code'] = this.ifscCode;
    data['ac_number'] = this.acNumber;
    data['upi'] = this.upi;
    data['bank_name'] = this.bankName;
    data['bank_branch'] = this.bankBranch;
    data['googlepay_no'] = this.googlePayNo;
    data['paytm_no'] = this.paytmNo;
    data['qr'] = this.qr;
    return data;
  }
}
