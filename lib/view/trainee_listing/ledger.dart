// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:drona/model/batchList_model.dart';
import 'package:drona/res/widget/data_table.dart';
import 'package:flutter/material.dart';

class Ledger_Page extends StatefulWidget {
  const Ledger_Page({super.key});

  @override
  State<Ledger_Page> createState() => _Ledger_PageState();
}

class _Ledger_PageState extends State<Ledger_Page> {
  String name = "Riyaz mohammed";
  @override
  Widget build(BuildContext context) {

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('View Ledger',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700)),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 27.0),
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
                                  "$name",
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "Onboarded",
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 10),
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
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "|",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    "34 Year",
                                    style: TextStyle(fontSize: 12),
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
              SizedBox(height: 20),
              Padding(
                padding:
                    const EdgeInsets.only(top: 12.0, left: 22.0, right: 26.0),
                child: Center(
                  child: SizedBox(
                    width: 342,
                    height: 68,
                    child: Column(children: [
                      Center(
                        child: Container(
                          width: 342,
                          height: 68,
                          decoration: BoxDecoration(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    '₹1800',
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 25,
                                    width: 25,
                                    child: CircleAvatar(
                                      backgroundColor: Color(0xff173564),
                                      child: Icon(
                                        Icons.currency_rupee,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Due on 06 July, 2023",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Divider(
                color: Color(0xff2A62B8),
                thickness: 1,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.57),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 342,
                  height: 45,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          backgroundColor: Color(0xff2A62B8)),
                      onPressed: () {
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
                                      backgroundColor: Color(0xffFEC259),
                                      child: Icon(
                                        Icons.priority_high_rounded,
                                        size: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    "Send Reminder",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w600),
                                  ),
                                  alignment: Alignment.center,
                                  content: Wrap(children: const [
                                    Center(
                                      child: SizedBox(
                                        width: 209,
                                        height: 48,
                                        child: Text(
                                          "Are You Sure You Want To Send Reminder To Riyaz Mohammed?",
                                          style: TextStyle(
                                              color: Color(0xff626D7E),
                                              fontSize: 16,
                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.w400),
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
                        "Reminder",
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
