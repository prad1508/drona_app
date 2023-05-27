// ignore_for_file: prefer_const_constructors

import 'package:drona/view/acedamy/academy_details.dart';
import 'package:drona/view/acedamy/bank_detail.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class academy_setting extends StatefulWidget {
  const academy_setting({super.key});

  @override
  State<academy_setting> createState() => _academy_settingState();
}

class _academy_settingState extends State<academy_setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Academy Setting',
            style: TextStyle(color: Colors.black, fontSize: 18)),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: const Color.fromARGB(255, 244, 247, 245),
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  'abc Academy',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Row(
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.only(left: 12),
                                      child: Text(
                                        'Services',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            height: 2),
                                      ),
                                    ),
                                    Image(
                                      image: AssetImage(
                                          'assets/images/tennis.png'),
                                      width: 30,
                                    ),
                                    Image(
                                      image:
                                          AssetImage('assets/images/Golf.png'),
                                      width: 30,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Image(
                                  image:
                                      AssetImage('assets/images/coachlogo.png'),
                                  width: 80,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Process"),
                              Text("60%"),
                            ],
                          ),
                        ),
                        LinearPercentIndicator(
                          barRadius: Radius.circular(20),
                          lineHeight: 6,
                          percent: 0.6,
                          progressColor: Color(0xff2A62B8),
                        )
                      ],
                    ),
                  )),
              //Acadeny Report.
              Padding(
                padding: const EdgeInsets.only(left: 6.0, right: 6.0),
                child: Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  margin: EdgeInsets.only(bottom: 1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Academy Details",
                            style: TextStyle(
                                color: Color(0xff39404A),
                                fontSize: 14,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        title: Text(
                          "Add 10%",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Color(0xffB48A3F),
                              fontSize: 10,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const Academy_Detail_Page()),
                          );
                        },
                      ),
                      ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Service, Program & Facility",
                            style: TextStyle(
                                color: Color(0xff39404A),
                                fontSize: 14,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        title: Text(
                          "Add 10%",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Color(0xffB48A3F),
                              fontSize: 10,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Bank Details",
                            style: TextStyle(
                                color: Color(0xff39404A),
                                fontSize: 14,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        title: Text(
                          "Add 10%",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Color(0xffB48A3F),
                              fontSize: 10,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Bank_Details()),
                          );
                        },
                      ),
                      ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Communicatio",
                            style: TextStyle(
                                color: Color(0xff39404A),
                                fontSize: 14,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        title: Text(
                          "Add 10%",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Color(0xffB48A3F),
                              fontSize: 10,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Billing And Invoices",
                            style: TextStyle(
                                color: Color(0xff39404A),
                                fontSize: 14,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        title: Text(
                          "Complete",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Color(0xff47C088),
                              fontSize: 10,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 215,
              ),
              SizedBox(
                width: 120.4,
                height: 40,
                child: Image(
                  alignment: Alignment.bottomCenter,
                  image: AssetImage('assets/images/logo2.png'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}