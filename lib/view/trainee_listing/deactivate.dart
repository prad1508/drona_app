// ignore_for_file: prefer_const_constructors
import 'package:drona/res/widget/customradio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Deactivate_Page extends StatefulWidget {
  const Deactivate_Page({super.key});

  @override
  State<Deactivate_Page> createState() => _Deactivate_PageState();
}

class _Deactivate_PageState extends State<Deactivate_Page> {
  List<String> PayMode = ["Pay", "Won't Pay"];
  String name = "Riyaz mohammed";
  String? ModePayment = 'p';
  ValueChanged<String?> Mode() {
    return (value) => setState(() => ModePayment = value!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Deactivate',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700)),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                            children: const [
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
              child: SizedBox(
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        width: 342,
                        height: 68,
                        decoration: BoxDecoration(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  '₹1800',
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Color(0xff23282E),
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
                                  color: Color(0xff626D7E)),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Will The Due Amount Be Paid?',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w600,
                            color: Color(0xff39404A)),
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 163,
                          height: 48,
                          child: CustomRadio<String>(
                              value: 'p',
                              label: PayMode[0],
                              groupValue: ModePayment,
                              onChanged: Mode(),
                              btnColor: Colors.black),
                        ),
                        SizedBox(width: 8),
                        SizedBox(
                          width: 163,
                          height: 48,
                          child: CustomRadio<String>(
                              value: 'w',
                              label: PayMode[1],
                              groupValue: ModePayment,
                              onChanged: Mode(),
                              btnColor: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Deactivation Date',
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w600,
                            color: Color(0xff39404A)),
                      ),
                    ),
                    SizedBox(height: 5),
                    SizedBox(
                      width: 344,
                      height: 48,
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            suffixIcon: Icon(Icons.calendar_month_outlined)),
                        onTap: () {},
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.42),
                    SizedBox(
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
                                        "Deactivate",
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
                                              "Please Confirm Deactivation Of Riyaz Mohammed!",
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
                                              onPressed: () {},
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
            ),
          ]),
        ),
      ),
    );
  }
}
