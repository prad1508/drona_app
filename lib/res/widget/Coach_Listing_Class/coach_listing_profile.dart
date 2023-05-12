// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Coach_Listing_Profile extends StatefulWidget {
  const Coach_Listing_Profile({super.key});

  @override
  State<Coach_Listing_Profile> createState() => _Coach_Listing_ProfileState();
}

class _Coach_Listing_ProfileState extends State<Coach_Listing_Profile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: 400,
              height: 137,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 24.0, top: 15.0, right: 15),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 41,
                          height: 46,
                          child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/user_profile.png')),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          //heightFactor: 3.4,
                          child: Container(
                            width: 44,
                            height: 20,
                            decoration: BoxDecoration(
                                color: Color(0xff47C088),
                                borderRadius: BorderRadius.circular(4)),
                            child: Center(
                              child: Text(
                                "Active",
                                style: TextStyle(
                                    color: Color(0xffFBFBFC),
                                    fontSize: 10,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Rayaz Mohammed",
                                style: TextStyle(
                                    color: Color(0xff39404A),
                                    fontSize: 15,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.left,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 100),
                                child: Container(
                                  width: 67,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: Color(0xffEDF9F3),
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Center(
                                    child: Text(
                                      "Onboarded",
                                      style: TextStyle(
                                          color: Color(0xff47C088),
                                          fontSize: 10,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Male",
                                      style: TextStyle(
                                          color: Color(0xff39404A),
                                          fontSize: 14,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      " |",
                                      style: TextStyle(
                                          color: Color(0xff39404A),
                                          fontSize: 14,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      " 34 Years",
                                      style: TextStyle(
                                          color: Color(0xff39404A),
                                          fontSize: 14,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      " |",
                                      style: TextStyle(
                                          color: Color(0xff39404A),
                                          fontSize: 14,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      " 9876512345",
                                      style: TextStyle(
                                          color: Color(0xff39404A),
                                          fontSize: 14,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                widthFactor: 3.5,
                                child: SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/images/Golf.png'),
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/tennis.png'),
                                  backgroundColor: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/Golf.png'),
                                  backgroundColor: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/Golf.png'),
                                  backgroundColor: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Total Batch : ",
                                    style: TextStyle(
                                        color: Color(0xff39404A),
                                        fontSize: 14,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    "1",
                                    style: TextStyle(
                                        color: Color(0xff39404A),
                                        fontSize: 14,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                              SizedBox(width: 121),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Total Trainee : ",
                                    style: TextStyle(
                                        color: Color(0xff39404A),
                                        fontSize: 14,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "40",
                                    style: TextStyle(
                                        color: Color(0xff39404A),
                                        fontSize: 14,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Date Of Joining : ",
                                    style: TextStyle(
                                        color: Color(0xff39404A),
                                        fontSize: 14,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "20-Mar-2023",
                                    style: TextStyle(
                                        color: Color(0xff39404A),
                                        fontSize: 14,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              SizedBox(width: 45),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Salary : ",
                                    style: TextStyle(
                                        color: Color(0xff39404A),
                                        fontSize: 14,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "₹10,000",
                                    style: TextStyle(
                                        color: Color(0xff39404A),
                                        fontSize: 14,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(),
            SizedBox(
              width: 400,
              height: 137,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 24.0, top: 15.0, right: 15),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 41,
                          height: 46,
                          child: CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/user_profile.png')),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          //heightFactor: 3.4,
                          child: Container(
                            width: 44,
                            height: 20,
                            decoration: BoxDecoration(
                                color: Color(0xffF15E53),
                                borderRadius: BorderRadius.circular(4)),
                            child: Center(
                              child: Text(
                                "Inactive",
                                style: TextStyle(
                                    color: Color(0xffFBFBFC),
                                    fontSize: 10,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Rayaz Mohammed",
                                style: TextStyle(
                                    color: Color(0xff39404A),
                                    fontSize: 15,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.left,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 100),
                                child: Container(
                                  width: 67,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: Color(0xffFFE8E7),
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Center(
                                    child: Text(
                                      "Not Onboarded",
                                      style: TextStyle(
                                          color: Color(0xffFD1D0D),
                                          fontSize: 10,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Male",
                                      style: TextStyle(
                                          color: Color(0xff39404A),
                                          fontSize: 14,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      " |",
                                      style: TextStyle(
                                          color: Color(0xff39404A),
                                          fontSize: 14,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      " 34 Years",
                                      style: TextStyle(
                                          color: Color(0xff39404A),
                                          fontSize: 14,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      " |",
                                      style: TextStyle(
                                          color: Color(0xff39404A),
                                          fontSize: 14,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      " 9876512345",
                                      style: TextStyle(
                                          color: Color(0xff39404A),
                                          fontSize: 14,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                widthFactor: 3.5,
                                child: SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircleAvatar(
                                    backgroundImage:
                                        AssetImage('assets/images/Golf.png'),
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/tennis.png'),
                                  backgroundColor: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/Golf.png'),
                                  backgroundColor: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/Golf.png'),
                                  backgroundColor: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Total Batch : ",
                                    style: TextStyle(
                                        color: Color(0xff39404A),
                                        fontSize: 14,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    "1",
                                    style: TextStyle(
                                        color: Color(0xff39404A),
                                        fontSize: 14,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                              SizedBox(width: 121),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Total Trainee : ",
                                    style: TextStyle(
                                        color: Color(0xff39404A),
                                        fontSize: 14,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "40",
                                    style: TextStyle(
                                        color: Color(0xff39404A),
                                        fontSize: 14,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Date Of Joining : ",
                                    style: TextStyle(
                                        color: Color(0xff39404A),
                                        fontSize: 14,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "20-Mar-2023",
                                    style: TextStyle(
                                        color: Color(0xff39404A),
                                        fontSize: 14,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              SizedBox(width: 45),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Salary : ",
                                    style: TextStyle(
                                        color: Color(0xff39404A),
                                        fontSize: 14,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "₹10,000",
                                    style: TextStyle(
                                        color: Color(0xff39404A),
                                        fontSize: 14,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
