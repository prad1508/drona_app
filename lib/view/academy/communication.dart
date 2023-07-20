// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Academy_Listing/communication_edit.dart';

class Communication extends StatefulWidget {
  const Communication({super.key});

  @override
  State<Communication> createState() => _CommunicationState();
}

class _CommunicationState extends State<Communication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Communication & Signature',
            style: TextStyle(color: Colors.black, fontSize: 18)),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sample Message",
                style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: 110,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffD0D3D8)),
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "It’s a gentle reminder to make the payment by 10th of May",
                          style: TextStyle(
                            color: Color(0xff626D7E),
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(height: 35),
                        Text(
                          "Abc Academy",
                          style: TextStyle(
                            color: Colors.black,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your Signature",
                    style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  InkWell(
                    child: Text(
                      "Edit",
                      style: TextStyle(
                        color: Color(0xffFD685D),
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                    onTap: () {
                      /*Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Edit_Communication()),
                      );*/
                      Get.to(()=> const Edit_Communication(),transition: Transition.rightToLeft);

                    },
                  ),
                ],
              ),
              SizedBox(height: 4),
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 48,
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffD0D3D8)),
                    borderRadius: BorderRadius.circular(8)),
                child: TextField(
                  readOnly: true,
                  style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                      hintText: 'Abc Academy',
                      contentPadding: EdgeInsets.all(10),
                      border:
                          UnderlineInputBorder(borderSide: BorderSide.none)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
