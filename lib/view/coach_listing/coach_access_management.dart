// ignore_for_file: prefer_const_constructors
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter/material.dart';

class Access_Management_Page extends StatefulWidget {
  const Access_Management_Page({super.key});

  @override
  State<Access_Management_Page> createState() => _Access_Management_PageState();
}

class _Access_Management_PageState extends State<Access_Management_Page> {
  bool acadmySwitch = false;
  bool financeSwitch = false;
  bool batchSwitch = false;
  bool sessionSwitch = false;
  bool traineeSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Access Management',
            style: TextStyle(color: Colors.black, fontSize: 18)),
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          SizedBox(
            width: 390,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24.0, top: 12.5, right: 24.0, bottom: 12.5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Academy Management",
                        style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff39404A)),
                      ),
                      FlutterSwitch(
                          activeColor: Color(0xff24DB58),
                          inactiveColor: Color(0xffE6E6E6),
                          toggleColor: Color(0xffFFFFFF),
                          width: 42,
                          height: 20,
                          toggleSize: 15,
                          value: acadmySwitch,
                          onToggle: (value) {
                            setState(() {
                              acadmySwitch = value;
                            });
                          })
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Finance Management",
                        style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff39404A)),
                      ),
                      FlutterSwitch(
                          activeColor: Color(0xff24DB58),
                          inactiveColor: Color(0xffE6E6E6),
                          toggleColor: Color(0xffFFFFFF),
                          width: 42,
                          height: 20,
                          toggleSize: 15,
                          value: financeSwitch,
                          onToggle: (value) {
                            setState(() {
                              financeSwitch = value;
                            });
                          })
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Batch Management",
                        style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff39404A)),
                      ),
                      FlutterSwitch(
                          activeColor: Color(0xff24DB58),
                          inactiveColor: Color(0xffE6E6E6),
                          toggleColor: Color(0xffFFFFFF),
                          width: 42,
                          height: 20,
                          toggleSize: 15,
                          value: batchSwitch,
                          onToggle: (value) {
                            setState(() {
                              batchSwitch = value;
                            });
                          })
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Session Management",
                        style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff39404A)),
                      ),
                      FlutterSwitch(
                          activeColor: Color(0xff24DB58),
                          inactiveColor: Color(0xffE6E6E6),
                          toggleColor: Color(0xffFFFFFF),
                          width: 42,
                          height: 20,
                          toggleSize: 15,
                          value: sessionSwitch,
                          onToggle: (value) {
                            setState(() {
                              sessionSwitch = value;
                            });
                          })
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Trainee Management",
                        style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff39404A)),
                      ),
                      FlutterSwitch(
                          activeColor: Color(0xff24DB58),
                          inactiveColor: Color(0xffE6E6E6),
                          toggleColor: Color(0xffFFFFFF),
                          width: 42,
                          height: 20,
                          toggleSize: 15,
                          value: traineeSwitch,
                          onToggle: (value) {
                            setState(() {
                              traineeSwitch = value;
                            });
                          })
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            heightFactor: 10,
            child: SizedBox(
              width: 342,
              height: 45,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      backgroundColor: Color(0xff2A62B8)),
                  onPressed: () {},
                  child: const Text(
                    "Submit",
                    style: TextStyle(fontSize: 15, fontFamily: 'Lato'),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
