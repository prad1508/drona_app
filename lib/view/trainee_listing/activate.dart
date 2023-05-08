// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:drona/res/widget/datefield.dart';
import 'package:drona/view/trainee_listing/deactivate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

class Activate_Page extends StatefulWidget {
  const Activate_Page({super.key});

  @override
  State<Activate_Page> createState() => _Activate_PageState();
}

class _Activate_PageState extends State<Activate_Page> {
  final TextEditingController contact = TextEditingController();

  final TextEditingController fees = TextEditingController();

  List<DropdownMenuItem<String>> get sportsItem {
    List<DropdownMenuItem<String>> serviceDetails = [
      DropdownMenuItem(value: "Tennis", child: Text("Tennis")),
      DropdownMenuItem(value: "Golf", child: Text("Golf")),
    ];
    return serviceDetails;
  }

  List<DropdownMenuItem<String>> get batchTime {
    List<DropdownMenuItem<String>> sportsTiming = [
      DropdownMenuItem(
          value: "Tennis Batch Morning", child: Text("Tennis Batch Morning")),
      DropdownMenuItem(
          value: "Golf Batch Morning", child: Text("Golf Batch Morning")),
      DropdownMenuItem(
          value: "Tennis Batch Evening", child: Text("Tennis Batch Evening")),
      DropdownMenuItem(
          value: "Golf Batch Evening", child: Text("Golf Batch Evening")),
    ];
    return sportsTiming;
  }

  String selectedItem = 'Tennis';
  String selectedTiming = "Tennis Batch Morning";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Acivate',
          style: TextStyle(
              fontSize: 18,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w700,
              color: Color(0xff39404A)),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 20.0),
                child: SizedBox(
                  width: 390,
                  height: 64,
                  child: Row(
                    children: [
                      //Profile Image;
                      SizedBox(
                        height: 46,
                        width: 41,
                        child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/user_profile.png')),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.5, top: 12, right: 8, bottom: 3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Riyaz mohammed",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff39404A)),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "Onboarded",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff47C088)),
                                ),
                              ],
                            ),
                            //Gender and Age;
                            SizedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Male",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff39404A)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "|",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff39404A)),
                                    ),
                                  ),
                                  Text(
                                    "34 Year",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff39404A)),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        widthFactor: 5.5,
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/tennis.png'),
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(height: 20),
              Padding(
                padding:
                    const EdgeInsets.only(top: 12.0, left: 22.0, right: 26.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Phone Number",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w600,
                              color: Color(0xff39404A)),
                        ),
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              "Change",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffFD685D)),
                            ),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),

                    SizedBox(height: 4),
                    SizedBox(
                        width: 342,
                        height: 48,
                        child: TextField(
                          style: TextStyle(fontSize: 14),
                          controller: contact,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: '+91-999 999 9999',
                              contentPadding: EdgeInsets.all(15),
                              hintStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              fillColor: Colors.grey.shade300),
                        )),
                    //Service selected;
                    SizedBox(height: 16),
                    Text(
                      "Service",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w600,
                          color: Color(0xff39404A)),
                    ),
                    SizedBox(height: 4),
                    SizedBox(
                        width: 342,
                        height: 48,
                        child: InputDecorator(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff39404A)),
                                  icon: Icon(Icons.expand_more,
                                      size: Checkbox.width),
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
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w600,
                          color: Color(0xff39404A)),
                    ),
                    SizedBox(height: 4),
                    SizedBox(
                        width: 342,
                        height: 48,
                        child: InputDecorator(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff39404A)),
                                  icon: Icon(Icons.expand_more,
                                      size: Checkbox.width),
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
                      "Fees/Month",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w600,
                          color: Color(0xff39404A)),
                    ),
                    SizedBox(height: 4),
                    //Fees Selected;
                    SizedBox(
                      width: 342,
                      height: 41,
                      child: Row(
                        children: [
                          Container(
                            width: 51,
                            height: 41,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    topLeft: Radius.circular(8)),
                                color: Color(0xff2A62B8)),
                            child: Center(
                              child: Text(
                                "₹/M",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xffFBFBFC)),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.74,
                            height: 41,
                            child: Center(
                              child: TextField(
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff121417)),
                                controller: fees,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      left: 15, top: 15, bottom: 15),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xff2A62B8)),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(8),
                                          bottomRight: Radius.circular(8))),
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xff2A62B8)),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(8),
                                        bottomRight: Radius.circular(8)),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Activation Date",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w600,
                          color: Color(0xff39404A)),
                    ),
                    SizedBox(height: 4),
                    SizedBox(
                      width: 342,
                      height: 48,
                      child: TextField(
                        readOnly: true,
                        textAlign: TextAlign.start,
                        cursorHeight: double.infinity,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          suffixIcon: InkWell(
                            child: Icon(Icons.calendar_month_outlined),
                            onTap: () {},
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.26),
                    SizedBox(
                      width: 342,
                      height: 45,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              backgroundColor: Color(0xff2A62B8)),
                          onPressed: () {
                            //Activation DialogBox;
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
                                        "Activate",
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
                                              "Please Confirm Activation Of Riyaz Mohammed!",
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
                                        SizedBox(
                                          width: 139,
                                          height: 48,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Color(0xffDFE1E4),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8)))),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Cancel",
                                                style: TextStyle(
                                                    color: Color(0xff23282E),
                                                    fontSize: 15,
                                                    fontFamily: 'Lato',
                                                    fontWeight:
                                                        FontWeight.w600),
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
                                                              Radius.circular(
                                                                  8)))),
                                              onPressed: () {
                                                //Invitation to Coach;
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
                                                              backgroundColor:
                                                                  Color(
                                                                      0xff47C088),
                                                              child: Icon(
                                                                Icons
                                                                    .check_sharp,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                          title: Text(
                                                            "Send Invite",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 17,
                                                                fontFamily:
                                                                    'Lato',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                          alignment:
                                                              Alignment.center,
                                                          content:
                                                              Wrap(children: [
                                                            Center(
                                                              child: SizedBox(
                                                                width: 209,
                                                                height: 48,
                                                                child: Text(
                                                                  "Send Invitation To Riyaz Mohammed!",
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                          0xff626D7E),
                                                                      fontSize:
                                                                          16,
                                                                      fontFamily:
                                                                          'Lato',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ),
                                                            ),
                                                          ]),
                                                          // contentPadding: EdgeInsets.all(24),
                                                          actions: [
                                                            SizedBox(
                                                              width: 139,
                                                              height: 48,
                                                              child:
                                                                  ElevatedButton(
                                                                      style: ElevatedButton.styleFrom(
                                                                          backgroundColor: Color(
                                                                              0xffDFE1E4),
                                                                          shape: RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.all(Radius.circular(
                                                                                  8)))),
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        "Cancel",
                                                                        style: TextStyle(
                                                                            color: Color(
                                                                                0xff23282E),
                                                                            fontSize:
                                                                                15,
                                                                            fontFamily:
                                                                                'Lato',
                                                                            fontWeight:
                                                                                FontWeight.w600),
                                                                      )),
                                                            ),
                                                            Container(
                                                              width: 139,
                                                              height: 48,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8)),
                                                              child:
                                                                  ElevatedButton(
                                                                      style: ElevatedButton.styleFrom(
                                                                          backgroundColor: Color(
                                                                              0xff2A62B8),
                                                                          shape: RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.all(Radius.circular(
                                                                                  8)))),
                                                                      onPressed:
                                                                          () {},
                                                                      child:
                                                                          Text(
                                                                        "Confirm",
                                                                        style: TextStyle(
                                                                            color: Color(
                                                                                0xffFBFBFC),
                                                                            fontSize:
                                                                                15,
                                                                            fontFamily:
                                                                                'Lato',
                                                                            fontWeight:
                                                                                FontWeight.w600),
                                                                      )),
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    });
                                              },
                                              child: Text(
                                                "Confirm",
                                                style: TextStyle(
                                                    color: Color(0xffFBFBFC),
                                                    fontSize: 15,
                                                    fontFamily: 'Lato',
                                                    fontWeight:
                                                        FontWeight.w600),
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
            ],
          ),
        ),
      ),
    );
  }
}
