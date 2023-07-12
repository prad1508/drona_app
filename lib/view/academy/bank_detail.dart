// ignore_for_file: prefer_const_constructors

import 'package:dotted_border/dotted_border.dart';
import 'package:drona/res/widget/Academy_Listing/edit_bank_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  @override
  void initState() {
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
                  Get.off(() => const Edit_Bank_Details(),
                      transition: Transition.leftToRight);
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
            child: Column(
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
                      hintText: 'Abc Academy',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffC0C4CB)),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Color(0xffD0D3D8))),
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
                    readOnly: true,
                    initialValue: widget.editData![1],
                    style: TextStyle(
                        color: Color(0xffC0C4CB),
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
                          borderSide: BorderSide(color: Color(0xffD0D3D8))),
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
                    readOnly: true,
                    initialValue: widget.editData![2],
                    style: TextStyle(
                        color: Color(0xffC0C4CB),
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
                          borderSide: BorderSide(color: Color(0xffD0D3D8))),
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
                    readOnly: true,
                    initialValue: widget.editData![3],
                    style: TextStyle(
                        color: Color(0xffC0C4CB),
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
                          borderSide: BorderSide(color: Color(0xffD0D3D8))),
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
                    readOnly: true,

                    initialValue: widget.editData![4],
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
                          borderSide: BorderSide(color: Color(0xffD0D3D8))),
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
                    readOnly: true,

                    initialValue: widget.editData![5],
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
                          borderSide: BorderSide(color: Color(0xffD0D3D8))),
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
                    readOnly: true,

                    initialValue: widget.editData![6],
                    style: TextStyle(
                        color: Color(0xffC0C4CB),
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
                          borderSide: BorderSide(color: Color(0xffD0D3D8))),
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
                    readOnly: true,

                    initialValue: widget.editData![7],
                    style: TextStyle(
                        color: Color(0xffC0C4CB),
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
                          borderSide: BorderSide(color: Color(0xffD0D3D8))),
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
                        decoration: BoxDecoration(color: Color(0xffEAEFF8)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: CircleAvatar(
                                    backgroundColor: Color(0xffCCD9EE),
                                    child: Icon(
                                      Icons.qr_code_scanner,
                                      color: Color(0xff2A62B8),
                                    ),
                                  )),
                              SizedBox(width: 10),
                              Text(
                                "Upload Qr Code",
                                style: TextStyle(
                                    color: Color(0xff2A62B8),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Lato'),
                              )
                            ],
                          ),
                        ),
                      ),
                      onTap: () {},
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
                      onPressed: () {},
                      child: const Text(
                        "Submit",
                        style: TextStyle(fontSize: 15, fontFamily: 'Lato'),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
