import 'package:flutter/material.dart';

class Activity_Log extends StatefulWidget {
  const Activity_Log({super.key});

  @override
  State<Activity_Log> createState() => _Activity_LogState();
}

class _Activity_LogState extends State<Activity_Log> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Activity Log',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontFamily: 'Lato')),
        elevation: 0,
      ),
      body: SafeArea(child:
      Padding(padding:const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: w*.25,
                height: 40,
                decoration: BoxDecoration(border: Border.all(color: const Color(0xffDFE1E4)),borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  decoration: InputDecoration(border: const OutlineInputBorder(borderSide: BorderSide.none),
                    contentPadding: const EdgeInsets.all(8),
                    suffixIcon: Padding(padding: const EdgeInsets.only(bottom: 15),
                    child: IconButton(onPressed: () {
                    }, icon: const Icon(Icons.calendar_today_outlined,color: Color(0xff99A0AB),size: 20,)),
                    )
                  ),
                ),
              ),
              const SizedBox(width: 10),
              //DropDown Btn
              Container(
                width: w*.17,
                height: 40,
                decoration: BoxDecoration(border: Border.all(color: const Color(0xffDFE1E4)),borderRadius: BorderRadius.circular(5)),
                child: DropdownButton<String>(
                  underline: Container(),
                  padding: const EdgeInsets.only(left: 15),
                  icon: const Padding(padding: EdgeInsets.only(left: 5),
                  child: Icon(Icons.keyboard_arrow_down_outlined,),
                  ),
                  style: const TextStyle(fontFamily: 'Lato',fontSize: 14,color: Color(0xff23282E)),
                  value: 'Activity Type',
                  onChanged: (String? newValue) {
                    // Handle dropdown item selection here
                    // You can use setState to update the selected value
                  },
                  items: <String>['Activity Type', 'Option 2', 'Option 3', 'Option 4']
                      .map<DropdownMenuItem<String>>(
                        (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: w*.8,
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 50,
                      height: 50,
                      child: Card(
                        elevation: 0,
                        color: Color(0xffD3F0E2),
                        shape: CircleBorder(),
                        child: Icon(Icons.check,color: Color(0xff47C088)),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            textAlign: TextAlign.start,
                            text: const TextSpan(
                                style: TextStyle(fontFamily: 'Lato',fontSize: 14,),
                                children: [
                                  TextSpan(text: 'Program Fee changed for Beginner from\n',style: TextStyle(color: Color(0xff626D7E))),
                                  TextSpan(text: '₹200 ',style: TextStyle(color: Color(0xff39404A),fontWeight: FontWeight.w700)),
                                  TextSpan(text: 'to',style: TextStyle(color: Color(0xff626D7E))),
                                  TextSpan(text: ' ₹250',style: TextStyle(color: Color(0xff39404A),fontWeight: FontWeight.w700)),
                                  TextSpan(text: ' by',style: TextStyle(color: Color(0xff626D7E))),
                                  TextSpan(text: ' Rajesh (Owner)',style: TextStyle(color: Color(0xff39404A),fontWeight: FontWeight.w700)),
                                ])),
                        const SizedBox(height: 10),
                        const Row(
                          children: [
                            Text("Comments : ",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w600)),
                            Text("Program fee has been increased",
                                style: TextStyle(
                                    fontSize: 14,
                                    color:Color(0xff626D7E),
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                        const SizedBox(height: 5),
                        const Row(
                          children: [
                            Text("Type : ",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w600)),
                            Text("Academy",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                        const SizedBox(height: 5),
                        RichText(
                            textAlign: TextAlign.start,
                            text: const TextSpan(
                                style: TextStyle(fontFamily: 'Lato',fontSize: 12,color: Color(0xff99A0AB)),
                                children: [
                                  TextSpan(text: '23/12/23'),
                                  TextSpan(text: ' at '),
                                  TextSpan(text: '23:00'),
                                ]))
                      ],
                    )
                  ],
                ),

              ],
            )
          ),
          SizedBox(
              width: w*.8,
              height: 130,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 50,
                        height: 50,
                        child: Card(
                          elevation: 0,
                          color: Color(0xffD3F0E2),
                          shape: CircleBorder(),
                          child: Icon(Icons.check,color: Color(0xff47C088)),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                              textAlign: TextAlign.start,
                              text: const TextSpan(
                                  style: TextStyle(fontFamily: 'Lato',fontSize: 14,),
                                  children: [
                                    TextSpan(text: 'Program Fee changed for Beginner from\n',style: TextStyle(color: Color(0xff626D7E))),
                                    TextSpan(text: '₹200 ',style: TextStyle(color: Color(0xff39404A),fontWeight: FontWeight.w700)),
                                    TextSpan(text: 'to',style: TextStyle(color: Color(0xff626D7E))),
                                    TextSpan(text: ' ₹250',style: TextStyle(color: Color(0xff39404A),fontWeight: FontWeight.w700)),
                                    TextSpan(text: ' by',style: TextStyle(color: Color(0xff626D7E))),
                                    TextSpan(text: ' Rajesh (Owner)',style: TextStyle(color: Color(0xff39404A),fontWeight: FontWeight.w700)),
                                  ])),
                          const SizedBox(height: 10),
                          const Row(
                            children: [
                              Text("Comments : ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w600)),
                              Text("Program fee has been increased",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color:Color(0xff626D7E),
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                          const SizedBox(height: 5),
                          const Row(
                            children: [
                              Text("Type : ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w600)),
                              Text("Academy",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                          const SizedBox(height: 5),
                          RichText(
                              textAlign: TextAlign.start,
                              text: const TextSpan(
                                  style: TextStyle(fontFamily: 'Lato',fontSize: 12,color: Color(0xff99A0AB)),
                                  children: [
                                    TextSpan(text: '23/12/23'),
                                    TextSpan(text: ' at '),
                                    TextSpan(text: '23:00'),
                                  ]))
                        ],
                      )
                    ],
                  ),

                ],
              )
          ),
          SizedBox(
              width: w*.8,
              height: 130,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 50,
                        height: 50,
                        child: Card(
                          elevation: 0,
                          color: Color(0xffD3F0E2),
                          shape: CircleBorder(),
                          child: Icon(Icons.check,color: Color(0xff47C088)),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                              textAlign: TextAlign.start,
                              text: const TextSpan(
                                  style: TextStyle(fontFamily: 'Lato',fontSize: 14,),
                                  children: [
                                    TextSpan(text: 'Program Fee changed for Beginner from\n',style: TextStyle(color: Color(0xff626D7E))),
                                    TextSpan(text: '₹200 ',style: TextStyle(color: Color(0xff39404A),fontWeight: FontWeight.w700)),
                                    TextSpan(text: 'to',style: TextStyle(color: Color(0xff626D7E))),
                                    TextSpan(text: ' ₹250',style: TextStyle(color: Color(0xff39404A),fontWeight: FontWeight.w700)),
                                    TextSpan(text: ' by',style: TextStyle(color: Color(0xff626D7E))),
                                    TextSpan(text: ' Rajesh (Owner)',style: TextStyle(color: Color(0xff39404A),fontWeight: FontWeight.w700)),
                                  ])),
                          const SizedBox(height: 10),
                          const Row(
                            children: [
                              Text("Comments : ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w600)),
                              Text("Program fee has been increased",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color:Color(0xff626D7E),
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                          const SizedBox(height: 5),
                          const Row(
                            children: [
                              Text("Type : ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w600)),
                              Text("Academy",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                          const SizedBox(height: 5),
                          RichText(
                              textAlign: TextAlign.start,
                              text: const TextSpan(
                                  style: TextStyle(fontFamily: 'Lato',fontSize: 12,color: Color(0xff99A0AB)),
                                  children: [
                                    TextSpan(text: '23/12/23'),
                                    TextSpan(text: ' at '),
                                    TextSpan(text: '23:00'),
                                  ]))
                        ],
                      )
                    ],
                  ),

                ],
              )
          ),
          SizedBox(
              width: w*.8,
              height: 130,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 50,
                        height: 50,
                        child: Card(
                          elevation: 0,
                          color: Color(0xffD3F0E2),
                          shape: CircleBorder(),
                          child: Icon(Icons.check,color: Color(0xff47C088)),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                              textAlign: TextAlign.start,
                              text: const TextSpan(
                                  style: TextStyle(fontFamily: 'Lato',fontSize: 14,),
                                  children: [
                                    TextSpan(text: 'Program Fee changed for Beginner from\n',style: TextStyle(color: Color(0xff626D7E))),
                                    TextSpan(text: '₹200 ',style: TextStyle(color: Color(0xff39404A),fontWeight: FontWeight.w700)),
                                    TextSpan(text: 'to',style: TextStyle(color: Color(0xff626D7E))),
                                    TextSpan(text: ' ₹250',style: TextStyle(color: Color(0xff39404A),fontWeight: FontWeight.w700)),
                                    TextSpan(text: ' by',style: TextStyle(color: Color(0xff626D7E))),
                                    TextSpan(text: ' Rajesh (Owner)',style: TextStyle(color: Color(0xff39404A),fontWeight: FontWeight.w700)),
                                  ])),
                          const SizedBox(height: 10),
                          const Row(
                            children: [
                              Text("Comments : ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w600)),
                              Text("Program fee has been increased",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color:Color(0xff626D7E),
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                          const SizedBox(height: 5),
                          const Row(
                            children: [
                              Text("Type : ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w600)),
                              Text("Academy",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                          const SizedBox(height: 5),
                          RichText(
                              textAlign: TextAlign.start,
                              text: const TextSpan(
                                  style: TextStyle(fontFamily: 'Lato',fontSize: 12,color: Color(0xff99A0AB)),
                                  children: [
                                    TextSpan(text: '23/12/23'),
                                    TextSpan(text: ' at '),
                                    TextSpan(text: '23:00'),
                                  ]))
                        ],
                      )
                    ],
                  ),

                ],
              )
          ),
          SizedBox(
              width: w*.8,
              height: 130,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 50,
                        height: 50,
                        child: Card(
                          elevation: 0,
                          color: Color(0xffD3F0E2),
                          shape: CircleBorder(),
                          child: Icon(Icons.check,color: Color(0xff47C088)),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                              textAlign: TextAlign.start,
                              text: const TextSpan(
                                  style: TextStyle(fontFamily: 'Lato',fontSize: 14,),
                                  children: [
                                    TextSpan(text: 'Program Fee changed for Beginner from\n',style: TextStyle(color: Color(0xff626D7E))),
                                    TextSpan(text: '₹200 ',style: TextStyle(color: Color(0xff39404A),fontWeight: FontWeight.w700)),
                                    TextSpan(text: 'to',style: TextStyle(color: Color(0xff626D7E))),
                                    TextSpan(text: ' ₹250',style: TextStyle(color: Color(0xff39404A),fontWeight: FontWeight.w700)),
                                    TextSpan(text: ' by',style: TextStyle(color: Color(0xff626D7E))),
                                    TextSpan(text: ' Rajesh (Owner)',style: TextStyle(color: Color(0xff39404A),fontWeight: FontWeight.w700)),
                                  ])),
                          const SizedBox(height: 10),
                          const Row(
                            children: [
                              Text("Comments : ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w600)),
                              Text("Program fee has been increased",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color:Color(0xff626D7E),
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                          const SizedBox(height: 5),
                          const Row(
                            children: [
                              Text("Type : ",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w600)),
                              Text("Academy",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                          const SizedBox(height: 5),
                          RichText(
                              textAlign: TextAlign.start,
                              text: const TextSpan(
                                  style: TextStyle(fontFamily: 'Lato',fontSize: 12,color: Color(0xff99A0AB)),
                                  children: [
                                    TextSpan(text: '23/12/23'),
                                    TextSpan(text: ' at '),
                                    TextSpan(text: '23:00'),
                                  ]))
                        ],
                      )
                    ],
                  ),

                ],
              )
          ),

        ],
      ),
      )
      ),
    );
  }
}

