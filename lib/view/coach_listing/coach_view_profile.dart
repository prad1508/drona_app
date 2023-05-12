// ignore_for_file: prefer_const_constructors

import 'package:drona/view/coach_listing/coach_personal_datails.dart';
import 'package:flutter/material.dart';

class View_Profile extends StatefulWidget {
  const View_Profile({super.key});

  @override
  State<View_Profile> createState() => _View_ProfileState();
}

class _View_ProfileState extends State<View_Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'View Profile',
          style: TextStyle(
              fontSize: 18,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w700,
              color: Color(0xff39404A)),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Prfile View;
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.98,
              height: 215,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    widthFactor: 12,
                    child: SizedBox(
                      height: 26,
                      width: 26,
                      child: InkWell(
                        child: Image(
                            image: AssetImage('assets/images/edit_icon.png')),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Personal_Details()),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 2),
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: const SizedBox(
                          width: 76,
                          height: 81,
                          child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/user_profile.png')),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        heightFactor: 4.5,
                        child: Container(
                          width: 44,
                          height: 20,
                          decoration: BoxDecoration(
                              color: Color(0xff47C088),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          child: Center(
                              child: Text(
                            "Active",
                            style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w400,
                                color: Color(0xffFFFFFF)),
                          )),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),
                  Text("Riyaz Mohammad"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                  //Tel.No & Joining Date;
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 155,
                          height: 21,
                          child: Row(
                            children: const [
                              Text(
                                "Tel :",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff39404A)),
                              ),
                              Text(
                                " 9876512345",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff39404A)),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 140,
                          height: 21,
                          child: Row(
                            children: const [
                              Text(
                                "Joined On :",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff39404A)),
                              ),
                              Text(
                                " 20 March 2023",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff39404A)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 200,
                          height: 21,
                          child: Row(
                            children: const [
                              Text(
                                "Email :",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff39404A)),
                              ),
                              Text(
                                " riyazmohammed9@gmail.com",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff39404A)),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 140,
                          height: 21,
                          child: Row(
                            children: const [
                              Text(
                                "Salary :",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff39404A)),
                              ),
                              Text(
                                " ₹10,000",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff39404A)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(
              thickness: 1,
            ),
            SizedBox(height: 10),
            //Service Select;
            SizedBox(
              width: 389,
              height: 55,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tennis, Cricket, Golt",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w700,
                          color: Color(0xff39404A)),
                    ),
                    SizedBox(height: 9),
                    Text(
                      "Service",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                          color: Color(0xff39404A)),
                    ),
                  ],
                ),
              ),
            ),
            Divider(thickness: 1),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Row(
                children: const [
                  Text(
                    "Batch List",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w700,
                        color: Color(0xff39404A)),
                  ),
                  SizedBox(width: 8),
                  SizedBox(
                    width: 22,
                    height: 22,
                    child: CircleAvatar(
                      backgroundColor: Color(0xffEAEFF8),
                      child: Text(
                        "03",
                        style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400,
                            color: Color(0xff2A62B8)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            //Batch Listing;
            SizedBox(
              width: 390,
              height: 86,
              child: ListTile(
                leading: SizedBox(
                    width: 40,
                    height: 40,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/tennis.png'),
                      backgroundColor: Colors.white,
                    )),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Text(
                          "Tennis Batch",
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w700,
                              color: Color(0xff39404A)),
                        ),
                        SizedBox(width: 8),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5.0),
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircleAvatar(
                              backgroundColor: Color(0xffEAEFF8),
                              child: Text(
                                "06",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff23282E)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 44,
                      height: 20,
                      decoration: BoxDecoration(
                          color: Color(0xff47C088),
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      child: Center(
                        child: Text(
                          "Active",
                          style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400,
                              color: Color(0xffFFFFFF)),
                        ),
                      ),
                    ),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Advance - M,W,F - 09:15am to 10:15am",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                          color: Color(0xff23282E)),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [Text("Fee : "), Text("₹15,000")],
                    )
                  ],
                ),
                isThreeLine: true,
                onTap: () {},
              ),
            ),
            Divider(thickness: 1),
            SizedBox(
              width: 390,
              height: 86,
              child: ListTile(
                leading: SizedBox(
                    width: 40,
                    height: 40,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/Golf.png'),
                      backgroundColor: Colors.white,
                    )),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Text(
                          "Golf Batch",
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w700,
                              color: Color(0xff39404A)),
                        ),
                        SizedBox(width: 8),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5.0),
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircleAvatar(
                              backgroundColor: Color(0xffEAEFF8),
                              child: Text(
                                "06",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff23282E)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 44,
                      height: 20,
                      decoration: BoxDecoration(
                          color: Color(0xff47C088),
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      child: Center(
                        child: Text(
                          "Active",
                          style: TextStyle(
                              fontSize: 10,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400,
                              color: Color(0xffFFFFFF)),
                        ),
                      ),
                    ),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Advance - M,W,F - 09:15am to 10:15am",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                          color: Color(0xff23282E)),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [Text("Fee : "), Text("₹15,000")],
                    )
                  ],
                ),
                isThreeLine: true,
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
