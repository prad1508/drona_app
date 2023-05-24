// ignore_for_file: prefer_const_constructors

import 'package:drona/view/academy/communication.dart';
import 'package:flutter/material.dart';

class Edit_Communication extends StatefulWidget {
  const Edit_Communication({super.key});

  @override
  State<Edit_Communication> createState() => _Edit_CommunicationState();
}

class _Edit_CommunicationState extends State<Edit_Communication> {
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
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
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
                Text(
                  "Your Signature",
                  style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: 48,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffD0D3D8)),
                      borderRadius: BorderRadius.circular(8)),
                  child: TextField(
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
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  heightFactor: 10.5,
                  child: SizedBox(
                    width: 342,
                    height: 45,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            backgroundColor: Color(0xff2A62B8)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Communication()),
                          );
                        },
                        child: const Text(
                          "Submit",
                          style: TextStyle(fontSize: 15, fontFamily: 'Lato'),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
