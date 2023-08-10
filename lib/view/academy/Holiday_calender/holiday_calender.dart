import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_holiday.dart';

class Holiday_Calender extends StatefulWidget {
  const Holiday_Calender({super.key});

  @override
  State<Holiday_Calender> createState() => _Holiday_CalenderState();
}

class _Holiday_CalenderState extends State<Holiday_Calender> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Holiday Calender',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontFamily: 'Lato')),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
                onPressed: () {
                  Get.to(Add_Holiday());
                },
                icon: const Icon(Icons.add)),
          )
        ],
        elevation: 0,
      ),
      body: SafeArea(
          child: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("National",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w600)),
            SizedBox(
              width: w * .95,
              height: 65,
              child: const SafeArea(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.only(top: 15)),
                          Text(
                            "15 Aug, 2023, Monday",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w700),
                          ),
                          Padding(padding: EdgeInsets.only(top: 5)),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(padding: EdgeInsets.only(top: 20)),
                                Text("Independence Day ",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w400)),
                                Text('|',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w700)),
                                Padding(padding: EdgeInsets.only(top: 10)),
                                Row(
                                  children: [
                                    Text(" Holiday Type : ",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w700)),
                                    Text("National",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                              ]),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios,
                          color: Color(0xff99A0AB), size: 20),
                    ]),
              ),
            ),
            const Divider(),
            SizedBox(
              width: w * .95,
              height: 65,
              child: const SafeArea(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.only(top: 15)),
                          Text(
                            "03 July, 2023, Monday",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w700),
                          ),
                          Padding(padding: EdgeInsets.only(top: 5)),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(padding: EdgeInsets.only(top: 20)),
                                Text("Guru Purnima ",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w400)),
                                Text('|',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w700)),
                                Padding(padding: EdgeInsets.only(top: 10)),
                                Row(
                                  children: [
                                    Text(" Holiday Type : ",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w700)),
                                    Text("Haryana",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                              ]),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios,
                          color: Color(0xff99A0AB), size: 20),
                    ]),
              ),
            ),
            const Divider(),
            const SizedBox(height: 20),
            const Text("State",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 20),
            SizedBox(
              width: w * .95,
              height: 65,
              child: const SafeArea(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.only(top: 15)),
                          Text(
                            "20 Aug, 2023, Monday",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w700),
                          ),
                          Padding(padding: EdgeInsets.only(top: 5)),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(padding: EdgeInsets.only(top: 20)),
                                Text("Milad un-Nabi/Id-e-Milad ",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w400)),
                                Text('|',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w700)),
                                Padding(padding: EdgeInsets.only(top: 10)),
                                Row(
                                  children: [
                                    Text(" Holiday Type : ",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w700)),
                                    Text("National",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                              ]),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios,
                          color: Color(0xff99A0AB), size: 20),
                    ]),
              ),
            ),
            const Divider(),
            const SizedBox(height: 20),
            const Text("Academy",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 20),
            SizedBox(
              width: w * .95,
              height: 65,
              child: const SafeArea(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.only(top: 15)),
                          Text(
                            "20 Aug, 2023, Monday",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w700),
                          ),
                          Padding(padding: EdgeInsets.only(top: 5)),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(padding: EdgeInsets.only(top: 20)),
                                Text("Milad un-Nabi/Id-e-Milad ",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w400)),
                                Text('|',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w700)),
                                Padding(padding: EdgeInsets.only(top: 10)),
                                Row(
                                  children: [
                                    Text(" Holiday Type : ",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w700)),
                                    Text("National",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                              ]),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios,
                          color: Color(0xff99A0AB), size: 20),
                    ]),
              ),
            ),
            const Divider(),
          ],
        ),
      )),
    );
  }
}
