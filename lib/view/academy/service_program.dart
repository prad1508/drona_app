// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:drona/res/widget/Academy_Listing/facility_program.dart';
import 'package:drona/res/widget/Academy_Listing/service_offring_page.dart';

import 'package:flutter/material.dart';

class Servicelist_Page extends StatefulWidget {
  const Servicelist_Page({super.key});

  @override
  State<Servicelist_Page> createState() => _Servicelist_PageState();
}

class _Servicelist_PageState extends State<Servicelist_Page> {
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
        actions: [
          //Chosse service and programme;
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 40,
                height: 40,
                child: Icon(Icons.add),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Service_Offering_Page()),
              );
            },
          )
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            //Listing of Academy Sercive and Programe;
            SizedBox(height: 15),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              height: 80,
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Facility_Program()),
                  );
                },
                contentPadding: EdgeInsets.all(5),
                leading: SizedBox(
                  width: 40,
                  height: 40,
                  child: Image(image: AssetImage("assets/images/tennis.png")),
                ),
                title: Text(
                  "Tennis",
                  style: TextStyle(
                    color: Color(0xff39404A),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                subtitle: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Column(children: [
                      Row(children: [
                        Container(
                            width: 56,
                            height: 20,
                            decoration: BoxDecoration(
                                color: Color(0xffEAEFF8),
                                borderRadius: BorderRadius.circular(4)),
                            child: Center(
                              child: Text(
                                "Beginner",
                                style: TextStyle(
                                  color: Color(0xff2A62B8),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              ),
                            )),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Container(
                            width: 56,
                            height: 20,
                            decoration: BoxDecoration(
                                color: Color(0xffEAEFF8),
                                borderRadius: BorderRadius.circular(4)),
                            child: Center(
                              child: Text(
                                "Intermediate",
                                style: TextStyle(
                                  color: Color(0xff2A62B8),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              ),
                            ))
                      ]),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                      Row(children: [
                        Row(
                          children: const [
                            Text(
                              "Total Batch : ",
                              style: TextStyle(
                                color: Color(0xff39404A),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              " 22",
                              style: TextStyle(
                                color: Color(0xff39404A),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Row(children: const [
                          Text(
                            "Total Trainee : ",
                            style: TextStyle(
                              color: Color(0xff39404A),
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
                          ),
                          Text(" 90",
                              style: TextStyle(
                                color: Color(0xff39404A),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              )),
                        ]),
                      ])
                    ])),
                isThreeLine: true,
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 15,
                ),
              ),
            ),
            Divider(),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              height: 75,
              child: ListTile(
                onTap: () {},
                contentPadding: EdgeInsets.all(5),
                leading: SizedBox(
                  width: 40,
                  height: 40,
                  child: Image(image: AssetImage("assets/images/Golf.png")),
                ),
                title: Text(
                  "Golf",
                  style: TextStyle(
                    color: Color(0xff39404A),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                subtitle: Padding(
                    padding: const EdgeInsets.only(top: 5.0, right: 10),
                    child: Column(children: [
                      Row(children: [
                        Container(
                            width: 56,
                            height: 20,
                            decoration: BoxDecoration(
                                color: Color(0xffEAEFF8),
                                borderRadius: BorderRadius.circular(4)),
                            child: Center(
                              child: Text(
                                "Beginner",
                                style: TextStyle(
                                  color: Color(0xff2A62B8),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              ),
                            )),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Container(
                            width: 56,
                            height: 20,
                            decoration: BoxDecoration(
                                color: Color(0xffEAEFF8),
                                borderRadius: BorderRadius.circular(4)),
                            child: Center(
                              child: Text(
                                "Intermediate",
                                style: TextStyle(
                                  color: Color(0xff2A62B8),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                ),
                              ),
                            ))
                      ]),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                      Row(children: [
                        Row(
                          children: const [
                            Text(
                              "Total Batch : ",
                              style: TextStyle(
                                color: Color(0xff39404A),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              " 22",
                              style: TextStyle(
                                color: Color(0xff39404A),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Row(children: const [
                          Text(
                            "Total Trainee : ",
                            style: TextStyle(
                              color: Color(0xff39404A),
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
                          ),
                          Text(" 90",
                              style: TextStyle(
                                color: Color(0xff39404A),
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              )),
                        ]),
                      ])
                    ])),
                isThreeLine: true,
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 15,
                ),
              ),
            ),
            Divider(),
          ],
        ),
      )),
    );
  }
}