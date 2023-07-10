// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:drona/view/academy/bank_detail.dart';
import 'package:drona/view_model/bankdetails_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class Edit_Bank_Details extends StatefulWidget {
  const Edit_Bank_Details({super.key});

  @override
  State<Edit_Bank_Details> createState() => _Edit_Bank_DetailsState();
}

class _Edit_Bank_DetailsState extends State<Edit_Bank_Details> {


//profille image picke
  File? imgFile;
  final imgPicker = ImagePicker();
  String? selectedService;
  void openCamera() async {
    var imgCamera = await imgPicker.pickImage(source: ImageSource.camera);
    // userViewModel.fetchouserProfileimg(imgCamera!.path, context);
    // ignore: use_build_context_synchronously

    setState(() {
      imgFile = File(imgCamera!.path);
      print("imgFile$imgFile");
    });
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }

  void openGallery() async {
    var imgGallery = await imgPicker.pickImage(source: ImageSource.gallery);

    // userViewModel.fetchouserProfileimg(imgGallery!.path, context);
    setState(() {
      imgFile = File(imgGallery!.path);
      print("imgFile$imgFile");
    });
    Navigator.of(context).pop();
  }

  //bottomsheet popup
  showcameraoption() {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 200,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0),
                    ),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          height: 3,
                          width: 50,
                          color: Colors.grey[400],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'QR Code',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Loto-Regular'),
                          ),
                          IconButton(
                            onPressed: (() {
                              setState(() {
                                imgFile = null;
                                Navigator.pop(context);
                              });
                            }),
                            icon: const Icon(Icons.delete_outline),
                            color: Colors.black,
                            iconSize: 30,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(color: Colors.grey),
                      const SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          onPressed: openCamera,
                          child: Text(
                            'Camera',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          onPressed: openGallery,
                          child: Text(
                            'Gallery',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  final TextEditingController bankName = TextEditingController();
  final TextEditingController accountNumber = TextEditingController();
  final TextEditingController ifsc = TextEditingController();
  final TextEditingController googlePayNo = TextEditingController();
  final TextEditingController paytmNo = TextEditingController();
  final TextEditingController upi = TextEditingController();
  final TextEditingController acHolderName = TextEditingController();
  final TextEditingController bankBranch = TextEditingController();
  final TextEditingController qr = TextEditingController();

  BankDetailsViewModel bankDetailsViewModel = BankDetailsViewModel();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Provider<BankDetailsViewModel>(
        create: (_) => BankDetailsViewModel(),
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              centerTitle: true,
              backgroundColor: Colors.white,
              title: const Text('Bank Details',
                  style: TextStyle(color: Colors.black, fontSize: 18)),
              elevation: 0,
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 24.0, right: 24.0, top: 10, bottom: 10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Academy Name As Per Bank",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Loto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              height: 2),
                        ),
                        SizedBox(height: 4),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 48,
                          child: TextFormField(
                            controller: acHolderName,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter valid academy name';
                              }
                              return null;
                            },
                            // readOnly: true,
                            style: TextStyle(
                                color: Color(0xff23282E),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                height: 2),
                            decoration: InputDecoration(
                              hintText: 'Abc Academy',
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffC0C4CB)),
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(color: Color(0xffD0D3D8))),
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Academy Bank Name",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Loto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              height: 2),
                        ),
                        SizedBox(height: 4),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 48,
                          child: TextFormField(
                            controller: bankName,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter valid bank name';
                              }
                              return null;
                            },
                            // readOnly: true,
                            style: TextStyle(
                                color: Color(0xff23282E),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                height: 2),
                            decoration: InputDecoration(
                              hintText: 'Bank Of India',
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffC0C4CB)),
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(color: Color(0xffD0D3D8))),
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Academy Bank Account No",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Loto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              height: 2),
                        ),
                        SizedBox(height: 4),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 48,
                          child: TextFormField(
                            controller: accountNumber,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter valid account number';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            // readOnly: true,
                            style: TextStyle(
                                color: Color(0xff23282E),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                height: 2),
                            decoration: InputDecoration(
                              hintText: '124545268751',
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffC0C4CB)),
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(color: Color(0xffD0D3D8))),
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Academy IFSC",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Loto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              height: 2),
                        ),
                        SizedBox(height: 4),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 48,
                          child: TextFormField(
                            controller: ifsc,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the ifsc code';
                              }
                              return null;
                            },
                            // readOnly: true,
                            style: TextStyle(
                                color: Color(0xff23282E),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                height: 2),
                            decoration: InputDecoration(
                              hintText: 'BOIGD2415781',
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffC0C4CB)),
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(color: Color(0xffD0D3D8))),
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Academy Bank Branch Address",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Loto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              height: 2),
                        ),
                        SizedBox(height: 4),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 48,
                          child: TextFormField(
                            controller: bankBranch,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the bank address';
                              }
                              return null;
                            },
                            // readOnly: true,
                            style: TextStyle(
                                color: Color(0xffC0C4CB),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                height: 2),
                            decoration: InputDecoration(
                              hintText: 'Sector 13, Chandigarh',
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffC0C4CB)),
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(color: Color(0xffD0D3D8))),
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Academy Google Pay No",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Loto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              height: 2),
                        ),
                        SizedBox(height: 4),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 48,
                          child: TextFormField(
                            controller: googlePayNo,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter academy Google Pay no.';
                              }
                              return null;
                            },

                            keyboardType: TextInputType.number,
                            // readOnly: true,
                            style: TextStyle(
                                color: Color(0xffC0C4CB),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                height: 2),
                            decoration: InputDecoration(
                              hintText: '9876543265',
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffC0C4CB)),
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(color: Color(0xffD0D3D8))),
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Academy Paytm No",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Loto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              height: 2),
                        ),
                        SizedBox(height: 4),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 48,
                          child: TextFormField(
                            controller: paytmNo,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter academy Phone Pay No.';
                              }
                              return null;
                            },

                            keyboardType: TextInputType.number,
                            // readOnly: true,
                            style: TextStyle(
                                color: Color(0xff23282E),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                height: 2),
                            decoration: InputDecoration(
                              hintText: '9856357899',
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffC0C4CB)),
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(color: Color(0xffD0D3D8))),
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Academy UPI No",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Loto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              height: 2),
                        ),
                        SizedBox(height: 4),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 48,
                          child: TextFormField(
                            controller: upi,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter upi number';
                              }
                              return null;
                            },
                            // readOnly: true,
                            style: TextStyle(
                                color: Color(0xff23282E),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                height: 2),
                            decoration: InputDecoration(
                              hintText: '9988558465',
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffC0C4CB)),
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(color: Color(0xffD0D3D8))),
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        DottedBorder(
                            color: Color(0xffEAEFF8),
                            child: InkWell(

                              child: Container(
                                width: 334,
                                height: 62,
                                decoration:
                                    BoxDecoration(color: Color(0xffECEEF0)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, right: 15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          SizedBox(
                                              width: 40,
                                              height: 40,
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    Color(0xffDFE1E4),
                                                child: Icon(
                                                  Icons.attach_file_outlined,
                                                  color: Color(0xff39404A),
                                                ),
                                              )),
                                          SizedBox(width: 10),
                                          Text(
                                            "Qr.jpg",
                                            style: TextStyle(
                                                color: Color(0xff626D7E),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Lato'),
                                          )
                                        ],
                                      ),
                                      Container(
                                        width: 70,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              "View File",
                                              style: TextStyle(
                                                  color: Color(0xff626D7E),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Lato'),
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () {
                                showcameraoption();
                              },
                            )),
                        SizedBox(height: 20),
                        SizedBox(
                          width: 342,
                          height: 45,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  backgroundColor: Color(0xff2A62B8)),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Map data = {
                                    'ac_holder_name': acHolderName.text,
                                    'ifsc_code': ifsc.text,
                                    'ac_number': accountNumber.text,
                                    'upi': upi.text,
                                    'bank_name': bankName.text,
                                    'bank_branch': bankBranch.text,
                                    'googlepay_no': googlePayNo.text,
                                    'paytm_no': paytmNo.text,
                                    'qr': '1234',
                                  };
                                  List editedData = [
                                    acHolderName.text,
                                    ifsc.text,
                                    accountNumber.text,
                                    upi.text,
                                    bankName.text,
                                    bankBranch.text,
                                    googlePayNo.text,
                                    paytmNo.text,
                                  ];
                                  print(data);
                                  bankDetailsViewModel.fetchBankDetailsApi(
                                      data, context);
                                  Get.off(
                                      () => Bank_Details(
                                            editData: editedData,
                                          ),
                                      transition: Transition.rightToLeft);
                                }
                              },
                              child: const Text(
                                "Submit",
                                style:
                                    TextStyle(fontSize: 15, fontFamily: 'Lato'),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
