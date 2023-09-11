// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:drona/res/language/language.dart';
import 'package:drona/view/academy/academy_setting.dart';
import 'package:drona/view/academy/bank_detail.dart';
import 'package:drona/view_model/bankdetails_view_model.dart';
import 'package:drona/view_model/trainee_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../data/response/status.dart';
import '../../../view_model/academy_view_model.dart';
import '../../model/Qr_model.dart';
import '../../res/app_url.dart';
import '../../utils/utils.dart';

class Edit_Bank_Details extends StatefulWidget {
  const Edit_Bank_Details({super.key});

  @override
  State<Edit_Bank_Details> createState() => _Edit_Bank_DetailsState();
}

class _Edit_Bank_DetailsState extends State<Edit_Bank_Details> {
  AcademyViewViewModel academyListViewViewModel = AcademyViewViewModel();

  initState() {
    super.initState();
    academyListViewViewModel.fetchAcademyListApi();
  }

//profille image picke
  File? imgFile;
  bool img = false;
  final imgPicker = ImagePicker();
  String? selectedService;
  String? response;



   openCamera() async {
    var imgCamera = await imgPicker.pickImage(source: ImageSource.camera);
    dynamic res =  academyListViewViewModel.fetchouserQrimg(imgCamera!.path, context);
    // ignore: use_build_context_synchronously
  //  response = res['filename'];
    setState(() {

      img = true;
      imgFile = File(imgCamera!.path);
      print("imgFile$imgFile");
    });
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }

   openGallery() async {
    var imgGallery = await imgPicker.pickImage(source: ImageSource.gallery);
    dynamic res =  academyListViewViewModel.fetchouserQrimg(imgGallery!.path, context);
   // response = await res['filename'];
    // userViewModel.fetchouserProfileimg(imgGallery!.path, context);
    setState(()  {

      img = true;
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
                          // IconButton(
                          //   onPressed: (() {
                          //     setState(() {
                          //       imgFile = null;
                          //       Navigator.pop(context);
                          //     });
                          //   }),
                          //   icon: const Icon(Icons.delete_outline),
                          //   color: Colors.black,
                          //   iconSize: 30,
                          // ),
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

   final  TextEditingController bankName = TextEditingController();
  final TextEditingController accountNumber = TextEditingController();
  final TextEditingController ifsc = TextEditingController();
  final TextEditingController googlePayNo = TextEditingController();
  final TextEditingController paytmNo = TextEditingController();
  final TextEditingController upi = TextEditingController();
  final TextEditingController acHolderName = TextEditingController();
  final TextEditingController bankBranch = TextEditingController();
  final TextEditingController qr = TextEditingController();

  BankDetailsViewModel bankDetailsViewModel = BankDetailsViewModel();
  TraineeViewModel traineeViewModel = TraineeViewModel();
  final _formKey = GlobalKey<FormState>();

   bool isset = false;


  @override
  Widget build(BuildContext context) {
    print("aaa");
    print(academyListViewViewModel.filename);
      // Provider<BankDetailsViewModel>(
      //   create: (_) => BankDetailsViewModel(),
      //   builder: (context, child) {

          return Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              centerTitle: true,
              backgroundColor: Colors.white,
              title:  Text(AppLocale.bankDetails.getString(context),
                  style: TextStyle(color: Colors.black, fontSize: 18)),
              elevation: 0,
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child:    ChangeNotifierProvider<AcademyViewViewModel>(
                  create: (BuildContext context) => academyListViewViewModel,
                  child: Consumer<AcademyViewViewModel>(
                    builder: (context, value, _) {
                      switch (value.dataList.status!) {
                        case Status.loading:
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.teal,
                            ),
                          );
                        case Status.completed:
                          if(!isset)
                          {
                            if(value.dataList.data!.bankDetails.isNotEmpty) {
                              bankName.text = value.dataList.data!.bankDetails[0].bankName;
                              accountNumber.text = value.dataList.data!.bankDetails[0].acNumber;
                              ifsc.text = value.dataList.data!.bankDetails[0].ifscCode;
                              googlePayNo.text =value.dataList.data!.bankDetails[0].googlepayNo ;
                              paytmNo.text = value.dataList.data!.bankDetails[0].paytmNo ;
                              upi.text = value.dataList.data!.bankDetails[0].upi ;
                              acHolderName.text = value.dataList.data!.bankDetails[0].acHolderName;
                              bankBranch.text = value.dataList.data!.bankDetails[0].bankBranch;
                              qr.text = value.dataList.data!.bankDetails[0].qr;
                              img =  value.dataList.data!.bankDetails[0].qrStatus;
                              print("value is ");
                              print(bankName.text);
                            }
                            isset = true;
                          }
                          return  Padding(
                            padding: const EdgeInsets.only(
                                left: 24.0, right: 24.0, top: 10, bottom: 10),
                            child:
                            Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    AppLocale.academyNameAsPerBank.getString(context),
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
                                      // validator: (value) {
                                      //   if (value == null || value.isEmpty) {
                                      //     return 'Please enter valid academy name';
                                      //   }
                                      //   return null;
                                      // },
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
                                    AppLocale.academyBankName.getString(context),
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
                                      // validator: (value) {
                                      //   if (value == null || value.isEmpty) {
                                      //     return 'Please enter valid bank name';
                                      //   }
                                      //   return null;
                                      // },
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
                                    AppLocale.academyBankAc.getString(context),
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
                                      // validator: (value) {
                                      //   if (value == null || value.isEmpty) {
                                      //     return 'Please enter valid account number';
                                      //   }
                                      //   return null;
                                      // },
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
                                    AppLocale.academyIfsc.getString(context),
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
                                      // validator: (value) {
                                      //   if (value == null || value.isEmpty) {
                                      //     return 'Please enter the ifsc code';
                                      //   }
                                      //   return null;
                                      // },

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
                                    AppLocale.academyBankBranchAdd.getString(context),
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
                                      // validator: (value) {
                                      //   if (value == null || value.isEmpty) {
                                      //     return 'Please enter the bank address';
                                      //   }
                                      //   return null;
                                      // },

                                      style: TextStyle(
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
                                    AppLocale.academyGpay.getString(context),
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
                                      // validator: (value) {
                                      //   if (value == null || value.isEmpty) {
                                      //     return 'Please enter academy Google Pay no.';
                                      //   }
                                      //   return null;
                                      // },

                                      keyboardType: TextInputType.number,
                                      style: TextStyle(
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
                                    AppLocale.academyPaytm.getString(context),
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
                                      // validator: (value) {
                                      //   if (value == null || value.isEmpty) {
                                      //     return 'Please enter academy Phone Pay No.';
                                      //   }
                                      //   return null;
                                      // },

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
                                    AppLocale.academyUPI.getString(context),
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
                                      // validator: (value) {
                                      //   if (value == null || value.isEmpty) {
                                      //     return 'Please enter upi number';
                                      //   }
                                      //   return null;
                                      // },

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
                                                        AppLocale.viewFile.getString(context),
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

                                  Center(
                                      child: img ?
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0), // You can adjust the radius as needed
                                        child: Container(
                                          width: 130, // Set your desired width
                                          height: 100, // Set your desired height
                                          color: Colors.white, // Background color for the container
                                          child: imgFile == null
                                              ? Image.network(AppUrl.uploadQr + value.dataList.data!.bankDetails[0].qr, // Add your URL or leave it empty if needed
                                            fit: BoxFit.cover, // You can set the desired image fit
                                          )
                                              : Image.file(
                                            imgFile!,
                                            fit: BoxFit.cover, // You can set the desired image fit
                                          ),
                                        ),
                                      ) : Text('')
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: 342,
                                    height: 45,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8)),
                                            backgroundColor: Color(0xff2A62B8)),
                                        onPressed: () {
                                            Map data = {
                                              'ac_holder_name': acHolderName.text,
                                              'bank_name': bankName.text,
                                              'ac_number': accountNumber.text,
                                              'ifsc_code': ifsc.text,
                                              'bank_branch': bankBranch.text,
                                              'googlepay_no': googlePayNo.text,
                                              'paytm_no': paytmNo.text,
                                              'upi': upi.text,
                                              'qr': academyListViewViewModel
                                                  .filename,
                                            };
                                            print(data);
                                            bankDetailsViewModel
                                                .fetchBankDetailsApi(
                                                data, context);
                                          /*  Get.to(() => academy_setting(pathofpage: "bankEdit"),
                                                transition: Transition
                                                    .rightToLeft);*/
                                        },
                                        child:  Text(
                                          AppLocale.submit.getString(context),
                                          style:
                                          TextStyle(fontSize: 15, fontFamily: 'Lato'),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          );
                        case Status.error:
                          return Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Icon(
                                  //   Icons.error_outline,
                                  //   color: Theme.of(context).primaryColorDark,
                                  //   size: 100.0,
                                  // ),
                                  // const NoData()
                                  // Text(
                                  //   value.dataList.message.toString(),
                                  //   style: TextStyle(
                                  //       color: Theme.of(context).primaryColor,
                                  //       fontSize: 20,
                                  //       height: 2),
                                  // )
                                ],
                              ));
                      }

                    },
                  ),
                )

              ),
            ),
          );
  }
}
