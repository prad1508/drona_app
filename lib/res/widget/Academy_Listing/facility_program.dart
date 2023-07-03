// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FacilityProgram extends StatefulWidget {
  const FacilityProgram({super.key});

  @override
  State<FacilityProgram> createState() => _FacilityProgramState();
}

class _FacilityProgramState extends State<FacilityProgram> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Service And Program',
            style: TextStyle(color: Colors.black, fontSize: 18)),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Center(
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child:
                          Image(image: AssetImage('assets/images/tennis.png')),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 15)),
                  Text("Tennis")
                ],
              ),
              SizedBox(height: 30),
              Text(
                "Facility Details",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.95,
                height: 215,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Text(
                                "Number Of Facilites : ",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w700),
                              ),
                              Text("4"),
                            ],
                          ),
                          SizedBox(
                              width: 17,
                              height: 17,
                              child: SvgPicture.asset(
                                'assets/images/edit_square.svg',
                                color: Color(0xff99A0AB),
                              )),
                        ]),
                    SizedBox(height: 15),
                    Text(
                      "Surface",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Container(
                          width: 70,
                          height: 20,
                          decoration: BoxDecoration(
                              color: Color(0xffEAEFF8),
                              borderRadius: BorderRadius.circular(4)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Center(
                                child: Text(
                                  "Synthetic : ",
                                  style: TextStyle(
                                    color: Color(0xff2A62B8),
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              Text(
                                " 3",
                                style: TextStyle(
                                  color: Color(0xff2A62B8),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Container(
                          width: 54,
                          height: 20,
                          decoration: BoxDecoration(
                              color: Color(0xffEAEFF8),
                              borderRadius: BorderRadius.circular(4)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Grass : ",
                                style: TextStyle(
                                  color: Color(0xff2A62B8),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                " 1",
                                style: TextStyle(
                                  color: Color(0xff2A62B8),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Others",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Container(
                          width: 70,
                          height: 20,
                          decoration: BoxDecoration(
                              color: Color(0xffEAEFF8),
                              borderRadius: BorderRadius.circular(4)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Center(
                                child: Text(
                                  "Mini Tennis",
                                  style: TextStyle(
                                    color: Color(0xff2A62B8),
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Container(
                          width: 54,
                          height: 20,
                          decoration: BoxDecoration(
                              color: Color(0xffEAEFF8),
                              borderRadius: BorderRadius.circular(4)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Pedal Tennis",
                                style: TextStyle(
                                  color: Color(0xff2A62B8),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Gallrey",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        SizedBox(width: 5),
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        SizedBox(width: 5),
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(8)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Divider(),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Programe Details",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  Icon(
                    Icons.add,
                    color: Colors.black,
                  )
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.95,
                height: 280,
                child: Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Tennis Beginner (By Level)"),
                          SizedBox(
                              width: 17,
                              height: 17,
                              child: SvgPicture.asset(
                                'assets/images/edit_square.svg',
                                color: Color(0xff99A0AB),
                              )),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Curriculum / Program Details",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "High - Performance Coaching",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff626D7E)),
                      ),
                      SizedBox(height: 10),
                      RichText(
                        text: TextSpan(children: const [
                          TextSpan(
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff626D7E)),
                              text:
                                  'Abc sports management flagship course is geared for professional excellence. Players in this exclusive'),
                          TextSpan(
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff2A62B8)),
                              text: 'View More..'),
                        ]),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text("Program Fee"),
                              SizedBox(height: 10),
                              Container(
                                width: 60,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: Color(0xffEAEFF8),
                                    borderRadius: BorderRadius.circular(4)),
                                child: Center(
                                  child: Text(
                                    "₹1,000/m",
                                    style: TextStyle(
                                      color: Color(0xff2A62B8),
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(left: 120)),
                          Column(
                            children: [
                              Text("Registration Fee"),
                              SizedBox(height: 10),
                              Container(
                                width: 60,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: Color(0xffEAEFF8),
                                    borderRadius: BorderRadius.circular(4)),
                                child: Center(
                                  child: Text(
                                    "₹1,000/m",
                                    style: TextStyle(
                                      color: Color(0xff2A62B8),
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text("Total Batch"),
                              SizedBox(height: 10),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: Color(0xffEAEFF8),
                                    borderRadius: BorderRadius.circular(4)),
                                child: Center(
                                  child: Text(
                                    "12",
                                    style: TextStyle(
                                      color: Color(0xff2A62B8),
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(left: 130)),
                          Column(
                            children: [
                              Text("Total Trainee"),
                              SizedBox(height: 10),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: Color(0xffEAEFF8),
                                    borderRadius: BorderRadius.circular(4)),
                                child: Center(
                                  child: Text(
                                    "50",
                                    style: TextStyle(
                                      color: Color(0xff2A62B8),
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Coach"),
                          SizedBox(height: 10),
                          Text(
                            "Riyaz mohammad",
                            style: TextStyle(
                                color: Color(0xff626D7E),
                                fontSize: 12,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              Divider(),
              SizedBox(height: 10),
              //Tennis Intermidiate Level;
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.95,
                height: 220,
                child: Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Tennis Intermediate (By Level)"),
                          SizedBox(
                              width: 17,
                              height: 17,
                              child: SvgPicture.asset(
                                'assets/images/edit_square.svg',
                                color: Color(0xff99A0AB),
                              )),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: const [
                          Text(
                            "Curriculum / Program Details",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w700),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: SizedBox(
                                width: 8,
                                height: 8,
                                child: CircleAvatar(
                                  backgroundColor: Color(0xffFD4639),
                                )),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text("Program Fee"),
                              SizedBox(height: 10),
                              Container(
                                width: 60,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: Color(0xffEAEFF8),
                                    borderRadius: BorderRadius.circular(4)),
                                child: Center(
                                  child: Text(
                                    "₹1,000/m",
                                    style: TextStyle(
                                      color: Color(0xff2A62B8),
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(left: 120)),
                          Column(
                            children: [
                              Text("Registration Fee"),
                              SizedBox(height: 10),
                              Container(
                                width: 60,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: Color(0xffEAEFF8),
                                    borderRadius: BorderRadius.circular(4)),
                                child: Center(
                                  child: Text(
                                    "₹1,000/m",
                                    style: TextStyle(
                                      color: Color(0xff2A62B8),
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text("Total Batch"),
                              SizedBox(height: 10),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: Color(0xffEAEFF8),
                                    borderRadius: BorderRadius.circular(4)),
                                child: Center(
                                  child: Text(
                                    "10",
                                    style: TextStyle(
                                      color: Color(0xff2A62B8),
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(left: 130)),
                          Column(
                            children: [
                              Text("Total Trainee"),
                              SizedBox(height: 10),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: Color(0xffEAEFF8),
                                    borderRadius: BorderRadius.circular(4)),
                                child: Center(
                                  child: Text(
                                    "40",
                                    style: TextStyle(
                                      color: Color(0xff2A62B8),
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Coach"),
                          SizedBox(height: 10),
                          Text(
                            "Pradhuman Singh",
                            style: TextStyle(
                                color: Color(0xff626D7E),
                                fontSize: 12,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Divider(),
            ]),
          ),
        ),
      ),
    );
  }
}
