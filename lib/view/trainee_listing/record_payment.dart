// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:drona/res/widget/customradio.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';

import '../../data/response/status.dart';
import '../../res/language/language.dart';
import '../../res/widget/progress_pills.dart';
import '../../view_model/postoffice_view_model.dart';

class Record_Payment extends StatefulWidget {
  const Record_Payment({super.key});

  @override
  State<Record_Payment> createState() => _Record_PaymentState();
}

class _Record_PaymentState extends State<Record_Payment> {
  List<DropdownMenuItem<String>> get sportsItem {
    List<DropdownMenuItem<String>> serviceDetails = [
      const DropdownMenuItem(value: "Tennis", child: Text("Tennis")),
      const DropdownMenuItem(value: "Golf", child: Text("Golf")),
    ];
    return serviceDetails;
  }

  List<DropdownMenuItem<String>> get batchTime {
    List<DropdownMenuItem<String>> sportsTiming = [
      const DropdownMenuItem(
          value: "Tennis Batch Morning", child: Text("Tennis Batch Morning")),
      const DropdownMenuItem(
          value: "Golf Batch Morning", child: Text("Golf Batch Morning")),
      const DropdownMenuItem(
          value: "Tennis Batch Evening", child: Text("Tennis Batch Evening")),
      const DropdownMenuItem(
          value: "Golf Batch Evening", child: Text("Golf Batch Evening")),
    ];
    return sportsTiming;
  }

  // ignore: non_constant_identifier_names
  List<String> PMode = ["Cash", "Online", "Cheque/Draft"];
  String selectedItem = 'Tennis';
  String selectedTiming = "Tennis Batch Morning";
  bool isCheckBox = false;
  String? payment = 'p';
  ValueChanged<String?> Record_Payment() {
    return (value) => setState(() => payment = value!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Record A Payment',
          style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              fontFamily: 'Lato'),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  "Trainee's Full Name",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff39404A),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Lato'),
                ),
                SizedBox(height: 4),
                SizedBox(
                  width: 342,
                  height: 48,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Service",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff39404A),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Lato'),
                ),
                SizedBox(height: 4),
                SizedBox(
                    width: 342,
                    height: 48,
                    child: InputDecorator(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5))),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                              icon: Icon(Icons.expand_more),
                              isExpanded: true,
                              value: selectedItem,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedItem = newValue!;
                                });
                              },
                              items: sportsItem),
                        ))),
                SizedBox(height: 16),
                //Batch Timing Selected;
                Text(
                  "Batch",
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff39404A),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Lato'),
                ),
                SizedBox(height: 4),
                SizedBox(
                    width: 342,
                    height: 48,
                    child: InputDecorator(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5))),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                              icon: Icon(Icons.expand_more),
                              isExpanded: true,
                              value: selectedTiming,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedTiming = newValue!;
                                });
                              },
                              items: batchTime),
                        ))),
                SizedBox(height: 16),
                Text(
                  "Last 6 Months Payment Status",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Lato'),
                ),
                SizedBox(height: 5),
                //Color Step Line
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProgressPills(
                          number: 7,
                          active: 0,
                          color: Theme.of(context).primaryColorLight),
                    ],
                  ),
                ),

                SizedBox(height: 20),
                Container(
                  width: 342,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff2A62B8)),
                      borderRadius: BorderRadius.circular(8)),
                  child: ExpansionTile(
                    childrenPadding: EdgeInsets.all(8),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Fees",
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Color(0xff39404A),
                            fontFamily: 'Lato',
                          ),
                        ),
                        Text(
                          "₹1,000",
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Color(0xff39404A),
                            fontFamily: 'Lato',
                          ),
                        )
                      ],
                    ),
                    children: <Widget>[
                      SizedBox(
                        width: 342,
                        height: 256,
                        child: Column(
                          children: [
                            SizedBox(height: 17),
                            Row(
                              children: [
                                Checkbox(
                                  value: isCheckBox,
                                  onChanged: (value) {
                                    setState(() {
                                      value = value;
                                    });
                                  },
                                ),
                                Text(
                                  "Add Fee",
                                  style: TextStyle(
                                      color: Color(0xff39404A),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Lato'),
                                ),
                                SizedBox(width: 77),
                                Container(
                                  width: 33,
                                  height: 41,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xff2A62B8)),
                                      color: Color(0xff2A62B8),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          bottomLeft: Radius.circular(8))),
                                  child: Center(
                                    child: Text(
                                      "₹",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 118,
                                  height: 41,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xff2A62B8)),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(8),
                                          bottomRight: Radius.circular(8))),
                                  child: Container(
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: UnderlineInputBorder(
                                              borderSide: BorderSide.none)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Row(
                              children: [
                                Checkbox(
                                  value: isCheckBox,
                                  onChanged: (value) {
                                    setState(() {
                                      value = value;
                                    });
                                  },
                                ),
                                Text(
                                  "Service Fee",
                                  style: TextStyle(
                                      color: Color(0xff39404A),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Lato'),
                                ),
                                SizedBox(width: 59),
                                Container(
                                  width: 33,
                                  height: 41,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xff2A62B8)),
                                      color: Color(0xff2A62B8),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          bottomLeft: Radius.circular(8))),
                                  child: Center(
                                    child: Text(
                                      "₹",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 118,
                                  height: 41,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xff2A62B8)),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(8),
                                          bottomRight: Radius.circular(8))),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        border: UnderlineInputBorder(
                                            borderSide: BorderSide.none)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Row(
                              children: [
                                Checkbox(
                                  value: isCheckBox,
                                  onChanged: (value) {
                                    setState(() {
                                      value = value;
                                    });
                                  },
                                ),
                                Text(
                                  "MISC. Fee",
                                  style: TextStyle(
                                      color: Color(0xff39404A),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Lato'),
                                ),
                                SizedBox(width: 66),
                                Container(
                                  width: 33,
                                  height: 41,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xff2A62B8)),
                                      color: Color(0xff2A62B8),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          bottomLeft: Radius.circular(8))),
                                  child: Center(
                                    child: Text(
                                      "₹",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 118,
                                  height: 41,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xff2A62B8)),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(8),
                                          bottomRight: Radius.circular(8))),
                                  child: Container(
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: UnderlineInputBorder(
                                              borderSide: BorderSide.none)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Row(
                              children: [
                                Checkbox(
                                  value: isCheckBox,
                                  onChanged: (value) {
                                    setState(() {
                                      value = value;
                                    });
                                  },
                                ),
                                Text(
                                  "Concession",
                                  style: TextStyle(
                                      color: Color(0xff39404A),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Lato'),
                                ),
                                SizedBox(width: 57),
                                Container(
                                  width: 33,
                                  height: 41,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xff2A62B8)),
                                      color: Color(0xff2A62B8),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          bottomLeft: Radius.circular(8))),
                                  child: Center(
                                    child: Text(
                                      "₹",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 118,
                                  height: 41,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xff2A62B8)),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(8),
                                          bottomRight: Radius.circular(8))),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        border: UnderlineInputBorder(
                                            borderSide: BorderSide.none)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                //Payment Mode;
                Text(
                  "Payment Through",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: Color(0xff39404A),
                      fontFamily: 'Lato'),
                ),
                SizedBox(height: 4),
                //Payment Custom Radio Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomRadio<String>(
                        value: 'c',
                        label: PMode[0],
                        groupValue: payment,
                        onChanged: Record_Payment(),
                        btnColor: Colors.black),
                    CustomRadio<String>(
                        value: 'o',
                        label: PMode[1],
                        groupValue: payment,
                        onChanged: Record_Payment(),
                        btnColor: Colors.black),
                    CustomRadio<String>(
                        value: 'd',
                        label: PMode[2],
                        groupValue: payment,
                        onChanged: Record_Payment(),
                        btnColor: Colors.black)
                  ],
                ),
                SizedBox(height: 30),
                //Date of Payment;
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Date Of Transation",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color(0xff39404A),
                              fontFamily: 'Lato'),
                        ),
                        SizedBox(height: 4),
                        SizedBox(
                            width: 163,
                            height: 48,
                            child: TextField(
                              readOnly: true,
                              decoration: InputDecoration(
                                  suffixIcon:
                                      Icon(Icons.calendar_month_outlined),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xffDFE1E4)),
                                      borderRadius: BorderRadius.circular(8))),
                            ))
                      ],
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fees Collected",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color(0xff39404A),
                              fontFamily: 'Lato'),
                        ),
                        SizedBox(height: 4),
                        SizedBox(
                          width: 163,
                          height: 48,
                          child: Row(
                            children: [
                              Container(
                                width: 51,
                                height: 48,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xff2A62B8)),
                                    color: Color(0xff2A62B8),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        bottomLeft: Radius.circular(8))),
                                child: Center(
                                  child: Text(
                                    "₹/M",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                              Container(
                                width: 112,
                                height: 48,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xff2A62B8)),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(8),
                                        bottomRight: Radius.circular(8))),
                                child: Container(
                                  child: TextField(
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(5),
                                        border: UnderlineInputBorder(
                                            borderSide: BorderSide.none)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20),
                //Payment Proof Uploder
                Center(
                  child: DottedBorder(
                    color: Color(0xffEAEFF8),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xffEAEFF8),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: CircleAvatar(
                                backgroundColor: Color(0xffCCD9EE),
                                child: Icon(
                                  Icons.file_upload_outlined,
                                  color: Color(0xff2A62B8),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Click To Upload Payment Proof",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff2A62B8),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Lato'),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "or just drag and drop",
                                    style: TextStyle(
                                        color: Color(0xff626D7E),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Lato'),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 47),

                SizedBox(
                  width: 342,
                  height: 45,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          backgroundColor: Color(0xff2A62B8)),
                      onPressed: () {
                        //Dialog Box;
                        showDialog(
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                width: 342,
                                height: 266,
                                child: AlertDialog(
                                  icon: SizedBox(
                                    width: 44,
                                    height: 44,
                                    child: CircleAvatar(
                                      backgroundColor: Color(0xff47C088),
                                      child: Icon(
                                        Icons.check_sharp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    "Record Payment",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w600),
                                  ),
                                  alignment: Alignment.center,
                                  content: Wrap(children: [
                                    Center(
                                      child: SizedBox(
                                        width: 209,
                                        height: 48,
                                        child: Text(
                                          "Please Confirm Payment Record Of Riyaz Mohammed!",
                                          style: TextStyle(
                                              color: Color(0xff626D7E),
                                              fontSize: 16,
                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.w600),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ]),
                                  // contentPadding: EdgeInsets.all(24),
                                  actions: [
                                    Container(
                                      width: 139,
                                      height: 48,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xffDFE1E4),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(8)))),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "Cancel",
                                            style: TextStyle(
                                                color: Color(0xff23282E),
                                                fontSize: 15,
                                                fontFamily: 'Lato',
                                                fontWeight: FontWeight.w600),
                                          )),
                                    ),
                                    Container(
                                      width: 139,
                                      height: 48,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xff2A62B8),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(8)))),
                                          onPressed: () {},
                                          child: Text(
                                            "Confirm",
                                            style: TextStyle(
                                                color: Color(0xffFBFBFC),
                                                fontSize: 15,
                                                fontFamily: 'Lato',
                                                fontWeight: FontWeight.w600),
                                          )),
                                    )
                                  ],
                                ),
                              );
                            });
                      },
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
