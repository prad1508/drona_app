import 'package:dotted_border/dotted_border.dart';
import 'package:drona/data/response/status.dart';
import 'package:drona/view_model/academy_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../res/app_url.dart';
import '../../utils/no_data.dart';
import '../../view_model/bankdetails_view_model.dart';
import '../Academy_Listing/edit_bank_details.dart';

class Bank_Details extends StatefulWidget {
  const Bank_Details(
      {super.key,
        this.editData = const
        ['',
          '',
          '',
          '',
          '',
          '',
          '',
          '',]
      });

  final List<dynamic>? editData;

  @override
  State<Bank_Details> createState() => _Bank_DetailsState();
}

class _Bank_DetailsState extends State<Bank_Details> {

  AcademyViewViewModel academyviewmodel = AcademyViewViewModel();
  @override
  void initState() {
    academyviewmodel.fetchAcademyListApi();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Bank Details',
            style: TextStyle(color: Colors.black, fontSize: 18)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                onPressed: () {
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Edit_Bank_Details()),
                  );*/
                  Get.off(() => const Edit_Bank_Details(
                  ),
                      transition: Transition.rightToLeft);
                },
                icon: Icon(Icons.edit)),
          )
        ],
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 24.0, right: 24.0, top: 10, bottom: 10),
            child:  ChangeNotifierProvider<AcademyViewViewModel>(
              create: (BuildContext context) => academyviewmodel,
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
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                              readOnly: true,
                              initialValue: widget.editData![0],
                              style: TextStyle(
                                  color: Color(0xffC0C4CB),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  height: 2),
                              decoration: InputDecoration(
                                hintText: '${value.dataList.data?.academyname}',
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  height: 3,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff626D7E),
                                ),
                                contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius
                                      .circular(8),
                                  borderSide: BorderSide(
                                      color: Color(0xffD0D3D8)),
                                ),
                                filled: true,
                                // Add this line
                                fillColor: Colors
                                    .grey[200],
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
                              readOnly: true,
                              initialValue: widget.editData![1],
                              style: TextStyle(
                                  color: Color(0xffC0C4CB),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  height: 2),
                              decoration: InputDecoration(
                                hintText: value.dataList.data!.bankDetails.isNotEmpty ?'${value.dataList.data?.bankDetails[0].bankName}' :'',
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  height: 3,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff626D7E),
                                ),
                                contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius
                                      .circular(8),
                                  borderSide: BorderSide(
                                      color: Color(0xffD0D3D8)),
                                ),
                                filled: true,
                                // Add this line
                                fillColor: Colors
                                    .grey[200],
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
                              readOnly: true,
                              initialValue: widget.editData![2],
                              style: TextStyle(
                                  color: Color(0xffC0C4CB),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  height: 2),
                              decoration: InputDecoration(
                                hintText: value.dataList.data!.bankDetails.isNotEmpty ?'${value.dataList.data?.bankDetails[0].acNumber}' : '',
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  height: 3,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff626D7E),
                                ),
                                contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius
                                      .circular(8),
                                  borderSide: BorderSide(
                                      color: Color(0xffD0D3D8)),
                                ),
                                filled: true,
                                // Add this line
                                fillColor: Colors
                                    .grey[200],
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
                              readOnly: true,
                              initialValue: widget.editData![3],
                              style: TextStyle(
                                  color: Color(0xffC0C4CB),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  height: 2),
                              decoration: InputDecoration(
                                hintText: value.dataList.data!.bankDetails.isNotEmpty ? '${value.dataList.data?.bankDetails[0].ifscCode}' : '',
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  height: 3,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff626D7E),
                                ),
                                contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius
                                      .circular(8),
                                  borderSide: BorderSide(
                                      color: Color(0xffD0D3D8)),
                                ),
                                filled: true,
                                // Add this line
                                fillColor: Colors
                                    .grey[200],
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
                              readOnly: true,

                              initialValue: widget.editData![4],
                              style: TextStyle(
                                  color: Color(0xffC0C4CB),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  height: 2),
                              decoration: InputDecoration(
                                hintText: value.dataList.data!.bankDetails.isNotEmpty ? '${value.dataList.data?.bankDetails[0].bankBranch}' : '',
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  height: 3,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff626D7E),
                                ),
                                contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius
                                      .circular(8),
                                  borderSide: BorderSide(
                                      color: Color(0xffD0D3D8)),
                                ),
                                filled: true,
                                // Add this line
                                fillColor: Colors
                                    .grey[200],
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
                              readOnly: true,

                              initialValue: widget.editData![5],
                              style: TextStyle(
                                  color: Color(0xffC0C4CB),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  height: 2),
                              decoration: InputDecoration(
                                hintText: value.dataList.data!.bankDetails.isNotEmpty ? '${value.dataList.data?.bankDetails[0].googlepayNo}' : '',
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  height: 3,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff626D7E),
                                ),
                                contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius
                                      .circular(8),
                                  borderSide: BorderSide(
                                      color: Color(0xffD0D3D8)),
                                ),
                                filled: true,
                                // Add this line
                                fillColor: Colors
                                    .grey[200],
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
                              readOnly: true,

                              initialValue: widget.editData![6],
                              style: TextStyle(
                                  color: Color(0xffC0C4CB),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  height: 2),
                              decoration: InputDecoration(
                                hintText: value.dataList.data!.bankDetails.isNotEmpty ?  '${value.dataList.data?.bankDetails[0].paytmNo}' : '',
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  height: 3,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff626D7E),
                                ),
                                contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius
                                      .circular(8),
                                  borderSide: BorderSide(
                                      color: Color(0xffD0D3D8)),
                                ),
                                filled: true,
                                // Add this line
                                fillColor: Colors
                                    .grey[200],
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
                              readOnly: true,

                              initialValue: widget.editData![7],
                              style: TextStyle(
                                  color: Color(0xffC0C4CB),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  height: 2),
                              decoration: InputDecoration(
                                hintText: value.dataList.data!.bankDetails.isNotEmpty ?  '${value.dataList.data?.bankDetails[0].upi}' : '',
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  height: 3,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff626D7E),
                                ),
                                contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius
                                      .circular(8),
                                  borderSide: BorderSide(
                                      color: Color(0xffD0D3D8)),
                                ),
                                filled: true,
                                // Add this line
                                fillColor: Colors
                                    .grey[200],
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
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  decoration: BoxDecoration(color: Colors.grey[200]),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                                width: 40,
                                                height: 40,
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.grey[300],
                                                  child: Icon(
                                                    Icons.attach_file,
                                                  ),
                                                )),
                                            SizedBox(width: 10),
                                            Text(
                                              "Qr.jpg",
                                              style: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Lato'),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(6),
                                              border: Border.all(
                                                width: 1,
                                                color: Colors.grey[350]!,
                                              )
                                          ),
                                          child: Text(
                                            "View File",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Lato'),
                                          ),
                                        ),

                                        SizedBox(
                                          height: 50,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: () {},
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                              child:
                              value.dataList.data!.bankDetails.isNotEmpty &&
                                  value.dataList.data!.bankDetails[0].qrStatus ?
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0), // You can adjust the radius as needed
                                child: Container(
                                    width: 130, // Set your desired width
                                    height: 100, // Set your desired height
                                    color: Colors.white, // Background color for the container
                                    child: Image.network(AppUrl.uploadQr + value.dataList.data!.bankDetails[0].qr, // Add your URL or leave it empty if needed
                                      fit: BoxFit.cover, // You can set the desired image fit
                                    )

                                ),
                              ) : Text('')
                          ),
                        ],
                      );
                    case Status.error:
                      return Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.error_outline,
                                color: Theme.of(context).primaryColorDark,
                                size: 100.0,
                              ),
                              const NoData()
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
            ),
          ),
        ),
      ),
    );
  }
}