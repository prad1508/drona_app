// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class CoachActivate_Page extends StatefulWidget {
  const CoachActivate_Page({super.key});

  @override
  State<CoachActivate_Page> createState() => _CoachActivate_PageState();
}

class _CoachActivate_PageState extends State<CoachActivate_Page> {
  List<String> c_service = [
    "Golf",
    "Cricket",
    "Tennis",
    "Football",
    "Bedminton"
  ];
  List selectService = [];

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
                                Container(
                                  width: 67,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: Color(0xffEDF9F3),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4))),
                                  child: Center(
                                    child: Text(
                                      "Onboarded",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xff47C088)),
                                    ),
                                  ),
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
                        widthFactor: 4.5,
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
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: '+91-999 999 9999',
                                contentPadding: EdgeInsets.all(15),
                                hintStyle: TextStyle(fontSize: 14),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                fillColor: Colors.grey.shade300),
                          )),
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

                      //Multi-Select DropDown Button;
                     
                      SizedBox(height: 16),
                      Text(
                        "Salary/Month",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w600,
                            color: Color(0xff39404A)),
                      ),
                      SizedBox(height: 4),
                      //Fees Selected;
                      Row(
                        children: [
                          Container(
                            width: 51,
                            height: 41,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff2A62B8)),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topLeft: Radius.circular(10)),
                              color: Color(0xff2A62B8),
                            ),
                            child: Center(
                              child: Text(
                                "₹/M",
                                style: TextStyle(
                                    color: Color(0xffFBFBFC),
                                    fontSize: 14,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 291,
                            height: 41,
                            child: Center(
                              child: TextField(
                                cursorHeight: 20,
                                cursorRadius: Radius.circular(10),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.start,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xff2A62B8)),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xff2A62B8)),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ]),
              ),

              //Button Submit;
              Align(
                alignment: Alignment.bottomCenter,
                heightFactor: 9.5,
                child: SizedBox(
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
                                                              Color(0xff47C088),
                                                          child: Icon(
                                                            Icons.check_sharp,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                      title: Text(
                                                        "Send Invite",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 17,
                                                            fontFamily: 'Lato',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      alignment:
                                                          Alignment.center,
                                                      content: Wrap(children: [
                                                        Center(
                                                          child: SizedBox(
                                                            width: 209,
                                                            height: 48,
                                                            child: Text(
                                                              "Send Invitation To Riyaz Mohammed!",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff626D7E),
                                                                  fontSize: 16,
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
                                                          child: ElevatedButton(
                                                              style: ElevatedButton.styleFrom(
                                                                  backgroundColor:
                                                                      Color(
                                                                          0xffDFE1E4),
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(8)))),
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Text(
                                                                "Cancel",
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xff23282E),
                                                                    fontSize:
                                                                        15,
                                                                    fontFamily:
                                                                        'Lato',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
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
                                                          child: ElevatedButton(
                                                              style: ElevatedButton.styleFrom(
                                                                  backgroundColor:
                                                                      Color(
                                                                          0xff2A62B8),
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(8)))),
                                                              onPressed: () {},
                                                              child: Text(
                                                                "Confirm",
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xffFBFBFC),
                                                                    fontSize:
                                                                        15,
                                                                    fontFamily:
                                                                        'Lato',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
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
                                                fontWeight: FontWeight.w600),
                                          )),
                                    )
                                  ],
                                ),
                              );
                            });
                      },
                      child: const Text(
                        "Submit & Send Invite",
                        style: TextStyle(fontSize: 15, fontFamily: 'Lato'),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
