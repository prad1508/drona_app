import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'holiday_calender.dart';

class Confirm_Holiday extends StatefulWidget {
  const Confirm_Holiday({super.key});

  @override
  State<Confirm_Holiday> createState() => _Confirm_HolidayState();
}

class _Confirm_HolidayState extends State<Confirm_Holiday> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
       // automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Confirm Holiday',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontFamily: 'Lato')),
        elevation: 0,
      ),
      body:  SingleChildScrollView(
        child: SafeArea(child:
        Padding(padding: const EdgeInsets.only(left:15,right: 15,bottom: 10,top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("National",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w600),),
              const SizedBox(height: 10),
              SizedBox(
                width: w*.95,
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
                              "Eid-ul-adha",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w700),
                            ),
                            Padding(padding: EdgeInsets.only(top: 5)),
                            Text(
                              "29 June, 2023, Wednesday ",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 45,
                              height: 45,
                              child: Card(
                                shape: CircleBorder(),
                                color: Color(0xff47C088),
                                elevation: 0,
                                child: Icon(Icons.check,color: Colors.white,),
                              ),
                            ),
                            //Funtion Select Btn
                            // IconButton(
                            //   style: IconButton.styleFrom(
                            //     backgroundColor: isRightSelected?Colors.green:Colors.white
                            //   ),
                            //   icon: Icon(Icons.check),
                            //   color: isRightSelected ? Colors.white : Colors.green,
                            //   onPressed: () {
                            //     setState(() {
                            //       isRightSelected = !isRightSelected;
                            //       isWrongSelected = false;
                            //     });
                            //   },
                            // ),
                            //SizedBox(width: 20),
                            SizedBox(
                              width: 45,
                              height: 45,
                              child: Card(
                                //shape: CircleBorder(),
                                //color: Color(0xff47C088),
                                elevation: 0,
                                child: Icon(Icons.close,color: Color(0xffF15E53),),
                              ),
                            ),
                            //Function Cross Btn
                            // IconButton(
                            //   icon: const Icon(Icons.close),
                            //   color: isWrongSelected ? Colors.white : Colors.red,
                            //   style: IconButton.styleFrom(
                            //     backgroundColor: isWrongSelected?Colors.white:Colors.red
                            //   ),
                            //   onPressed: () {
                            //     setState(() {
                            //       isWrongSelected = !isWrongSelected;
                            //       isRightSelected = false;
                            //     });
                            //   },
                            // ),
                          ],
                        ),
                      ],
                    )
                ),
              ),
              const Divider(),
              SizedBox(
                width: w*.95,
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
                              "Guru Purnima",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w700),
                            ),
                            Padding(padding: EdgeInsets.only(top: 5)),
                            Text(
                              "03 July, 2023, Monday",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 45,
                              height: 45,
                              child: Card(
                                // shape: CircleBorder(),
                                // color: Color(0xff47C088),
                                elevation: 0,
                                child: Icon(Icons.check,color: Color(0xff47C088),),
                              ),
                            ),
                            //Funtion Select Btn
                            // IconButton(
                            //   style: IconButton.styleFrom(
                            //     backgroundColor: isRightSelected?Colors.green:Colors.white
                            //   ),
                            //   icon: Icon(Icons.check),
                            //   color: isRightSelected ? Colors.white : Colors.green,
                            //   onPressed: () {
                            //     setState(() {
                            //       isRightSelected = !isRightSelected;
                            //       isWrongSelected = false;
                            //     });
                            //   },
                            // ),
                            //SizedBox(width: 20),
                            SizedBox(
                              width: 45,
                              height: 45,
                              child: Card(
                                shape: CircleBorder(),
                                color: Color(0xffF15E53),
                                elevation: 0,
                                child: Icon(Icons.close,color: Colors.white,),
                              ),
                            ),
                            //Function Cross Btn
                            // IconButton(
                            //   icon: const Icon(Icons.close),
                            //   color: isWrongSelected ? Colors.white : Colors.red,
                            //   style: IconButton.styleFrom(
                            //     backgroundColor: isWrongSelected?Colors.white:Colors.red
                            //   ),
                            //   onPressed: () {
                            //     setState(() {
                            //       isWrongSelected = !isWrongSelected;
                            //       isRightSelected = false;
                            //     });
                            //   },
                            // ),
                          ],
                        ),
                      ],
                    )
                ),
              ),
              const Divider(),
              SizedBox(
                width: w*.95,
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
                              "Muharram/Ashura (Tentative Date)",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w700),
                            ),
                            Padding(padding: EdgeInsets.only(top: 5)),
                            Text(
                              "29 July, 2023, Saturday",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 45,
                              height: 45,
                              child: Card(
                                shape: CircleBorder(),
                                color: Color(0xff47C088),
                                elevation: 0,
                                child: Icon(Icons.check,color: Colors.white,),
                              ),
                            ),
                            //Funtion Select Btn
                            // IconButton(
                            //   style: IconButton.styleFrom(
                            //     backgroundColor: isRightSelected?Colors.green:Colors.white
                            //   ),
                            //   icon: Icon(Icons.check),
                            //   color: isRightSelected ? Colors.white : Colors.green,
                            //   onPressed: () {
                            //     setState(() {
                            //       isRightSelected = !isRightSelected;
                            //       isWrongSelected = false;
                            //     });
                            //   },
                            // ),
                            //SizedBox(width: 20),
                            SizedBox(
                              width: 45,
                              height: 45,
                              child: Card(
                                //shape: CircleBorder(),
                                //color: Color(0xff47C088),
                                elevation: 0,
                                child: Icon(Icons.close,color: Color(0xffF15E53),),
                              ),
                            ),
                            //Function Cross Btn
                            // IconButton(
                            //   icon: const Icon(Icons.close),
                            //   color: isWrongSelected ? Colors.white : Colors.red,
                            //   style: IconButton.styleFrom(
                            //     backgroundColor: isWrongSelected?Colors.white:Colors.red
                            //   ),
                            //   onPressed: () {
                            //     setState(() {
                            //       isWrongSelected = !isWrongSelected;
                            //       isRightSelected = false;
                            //     });
                            //   },
                            // ),
                          ],
                        ),
                      ],
                    )
                ),
              ),
              const Divider(),
              SizedBox(
                width: w*.95,
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
                              "Ganesh Chaturthi/Vinayaka Chaturthi",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w700),
                            ),
                            Padding(padding: EdgeInsets.only(top: 5)),
                            Text(
                              "29 sep, 2023, Tuesday",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 45,
                              height: 45,
                              child: Card(
                                // shape: CircleBorder(),
                                // color: Color(0xff47C088),
                                elevation: 0,
                                child: Icon(Icons.check,color: Color(0xff47C088),),
                              ),
                            ),
                            //Funtion Select Btn
                            // IconButton(
                            //   style: IconButton.styleFrom(
                            //     backgroundColor: isRightSelected?Colors.green:Colors.white
                            //   ),
                            //   icon: Icon(Icons.check),
                            //   color: isRightSelected ? Colors.white : Colors.green,
                            //   onPressed: () {
                            //     setState(() {
                            //       isRightSelected = !isRightSelected;
                            //       isWrongSelected = false;
                            //     });
                            //   },
                            // ),
                            //SizedBox(width: 20),
                            SizedBox(
                              width: 45,
                              height: 45,
                              child: Card(
                                //shape: CircleBorder(),
                                //color: Color(0xff47C088),
                                elevation: 0,
                                child: Icon(Icons.close,color: Color(0xffF15E53),),
                              ),
                            ),
                            //Function Cross Btn
                            // IconButton(
                            //   icon: const Icon(Icons.close),
                            //   color: isWrongSelected ? Colors.white : Colors.red,
                            //   style: IconButton.styleFrom(
                            //     backgroundColor: isWrongSelected?Colors.white:Colors.red
                            //   ),
                            //   onPressed: () {
                            //     setState(() {
                            //       isWrongSelected = !isWrongSelected;
                            //       isRightSelected = false;
                            //     });
                            //   },
                            // ),
                          ],
                        ),
                      ],
                    )
                ),
              ),
              const Divider(),
              SizedBox(
                width: w*.95,
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
                              "Milad un-Nabi/Id-e-Milad",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w700),
                            ),
                            Padding(padding: EdgeInsets.only(top: 5)),
                            Text(
                              "28 Sep, 2023, Thursday",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 45,
                              height: 45,
                              child: Card(
                                // shape: CircleBorder(),
                                // color: Color(0xff47C088),
                                elevation: 0,
                                child: Icon(Icons.check,color: Color(0xff47C088),),
                              ),
                            ),
                            //Funtion Select Btn
                            // IconButton(
                            //   style: IconButton.styleFrom(
                            //     backgroundColor: isRightSelected?Colors.green:Colors.white
                            //   ),
                            //   icon: Icon(Icons.check),
                            //   color: isRightSelected ? Colors.white : Colors.green,
                            //   onPressed: () {
                            //     setState(() {
                            //       isRightSelected = !isRightSelected;
                            //       isWrongSelected = false;
                            //     });
                            //   },
                            // ),
                            //SizedBox(width: 20),
                            SizedBox(
                              width: 45,
                              height: 45,
                              child: Card(
                                //shape: CircleBorder(),
                                //color: Color(0xff47C088),
                                elevation: 0,
                                child: Icon(Icons.close,color: Color(0xffF15E53),),
                              ),
                            ),
                            //Function Cross Btn
                            // IconButton(
                            //   icon: const Icon(Icons.close),
                            //   color: isWrongSelected ? Colors.white : Colors.red,
                            //   style: IconButton.styleFrom(
                            //     backgroundColor: isWrongSelected?Colors.white:Colors.red
                            //   ),
                            //   onPressed: () {
                            //     setState(() {
                            //       isWrongSelected = !isWrongSelected;
                            //       isRightSelected = false;
                            //     });
                            //   },
                            // ),
                          ],
                        ),
                      ],
                    )
                ),
              ),
              const Divider(),
              SizedBox(
                width: w*.95,
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
                              "Mahatma Gandhi Jayanti",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w700),
                            ),
                            Padding(padding: EdgeInsets.only(top: 5)),
                            Text(
                              "02 Oct, 2023, Monday",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 45,
                              height: 45,
                              child: Card(
                                // shape: CircleBorder(),
                                // color: Color(0xff47C088),
                                elevation: 0,
                                child: Icon(Icons.check,color: Color(0xff47C088),),
                              ),
                            ),
                            //Funtion Select Btn
                            // IconButton(
                            //   style: IconButton.styleFrom(
                            //     backgroundColor: isRightSelected?Colors.green:Colors.white
                            //   ),
                            //   icon: Icon(Icons.check),
                            //   color: isRightSelected ? Colors.white : Colors.green,
                            //   onPressed: () {
                            //     setState(() {
                            //       isRightSelected = !isRightSelected;
                            //       isWrongSelected = false;
                            //     });
                            //   },
                            // ),
                            //SizedBox(width: 20),
                            SizedBox(
                              width: 45,
                              height: 45,
                              child: Card(
                                //shape: CircleBorder(),
                                //color: Color(0xff47C088),
                                elevation: 0,
                                child: Icon(Icons.close,color: Color(0xffF15E53),),
                              ),
                            ),
                            //Function Cross Btn
                            // IconButton(
                            //   icon: const Icon(Icons.close),
                            //   color: isWrongSelected ? Colors.white : Colors.red,
                            //   style: IconButton.styleFrom(
                            //     backgroundColor: isWrongSelected?Colors.white:Colors.red
                            //   ),
                            //   onPressed: () {
                            //     setState(() {
                            //       isWrongSelected = !isWrongSelected;
                            //       isRightSelected = false;
                            //     });
                            //   },
                            // ),
                          ],
                        ),
                      ],
                    )
                ),
              ),
              const Divider(),
              const SizedBox(height: 20),
              const Text("State",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w600),),
              const SizedBox(height: 20),
              SizedBox(
                width: w*.95,
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
                              "Ganesh Chaturthi/Vinayaka Chaturthi",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w700),
                            ),
                            Padding(padding: EdgeInsets.only(top: 5)),
                            Text(
                              "29 sep, 2023, Tuesday",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 45,
                              height: 45,
                              child: Card(
                                // shape: CircleBorder(),
                                // color: Color(0xff47C088),
                                elevation: 0,
                                child: Icon(Icons.check,color: Color(0xff47C088),),
                              ),
                            ),
                            //Funtion Select Btn
                            // IconButton(
                            //   style: IconButton.styleFrom(
                            //     backgroundColor: isRightSelected?Colors.green:Colors.white
                            //   ),
                            //   icon: Icon(Icons.check),
                            //   color: isRightSelected ? Colors.white : Colors.green,
                            //   onPressed: () {
                            //     setState(() {
                            //       isRightSelected = !isRightSelected;
                            //       isWrongSelected = false;
                            //     });
                            //   },
                            // ),
                            //SizedBox(width: 20),
                            SizedBox(
                              width: 45,
                              height: 45,
                              child: Card(
                                //shape: CircleBorder(),
                                //color: Color(0xff47C088),
                                elevation: 0,
                                child: Icon(Icons.close,color: Color(0xffF15E53),),
                              ),
                            ),
                            //Function Cross Btn
                            // IconButton(
                            //   icon: const Icon(Icons.close),
                            //   color: isWrongSelected ? Colors.white : Colors.red,
                            //   style: IconButton.styleFrom(
                            //     backgroundColor: isWrongSelected?Colors.white:Colors.red
                            //   ),
                            //   onPressed: () {
                            //     setState(() {
                            //       isWrongSelected = !isWrongSelected;
                            //       isRightSelected = false;
                            //     });
                            //   },
                            // ),
                          ],
                        ),
                      ],
                    )
                ),
              ),
              const Divider(),
              SizedBox(
                width: w*.95,
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
                              "Milad un-Nabi/Id-e-Milad",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w700),
                            ),
                            Padding(padding: EdgeInsets.only(top: 5)),
                            Text(
                              "28 Sep, 2023, Thursday",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 45,
                              height: 45,
                              child: Card(
                                // shape: CircleBorder(),
                                // color: Color(0xff47C088),
                                elevation: 0,
                                child: Icon(Icons.check,color: Color(0xff47C088),),
                              ),
                            ),
                            //Funtion Select Btn
                            // IconButton(
                            //   style: IconButton.styleFrom(
                            //     backgroundColor: isRightSelected?Colors.green:Colors.white
                            //   ),
                            //   icon: Icon(Icons.check),
                            //   color: isRightSelected ? Colors.white : Colors.green,
                            //   onPressed: () {
                            //     setState(() {
                            //       isRightSelected = !isRightSelected;
                            //       isWrongSelected = false;
                            //     });
                            //   },
                            // ),
                            //SizedBox(width: 20),
                            SizedBox(
                              width: 45,
                              height: 45,
                              child: Card(
                                //shape: CircleBorder(),
                                //color: Color(0xff47C088),
                                elevation: 0,
                                child: Icon(Icons.close,color: Color(0xffF15E53),),
                              ),
                            ),
                            //Function Cross Btn
                            // IconButton(
                            //   icon: const Icon(Icons.close),
                            //   color: isWrongSelected ? Colors.white : Colors.red,
                            //   style: IconButton.styleFrom(
                            //     backgroundColor: isWrongSelected?Colors.white:Colors.red
                            //   ),
                            //   onPressed: () {
                            //     setState(() {
                            //       isWrongSelected = !isWrongSelected;
                            //       isRightSelected = false;
                            //     });
                            //   },
                            // ),
                          ],
                        ),
                      ],
                    )
                ),
              ),
              const Divider(),
              SizedBox(
                width: w*.95,
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
                              "Mahatma Gandhi Jayanti",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w700),
                            ),
                            Padding(padding: EdgeInsets.only(top: 5)),
                            Text(
                              "02 Oct, 2023, Monday",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 45,
                              height: 45,
                              child: Card(
                                // shape: CircleBorder(),
                                // color: Color(0xff47C088),
                                elevation: 0,
                                child: Icon(Icons.check,color: Color(0xff47C088),),
                              ),
                            ),
                            //Funtion Select Btn
                            // IconButton(
                            //   style: IconButton.styleFrom(
                            //     backgroundColor: isRightSelected?Colors.green:Colors.white
                            //   ),
                            //   icon: Icon(Icons.check),
                            //   color: isRightSelected ? Colors.white : Colors.green,
                            //   onPressed: () {
                            //     setState(() {
                            //       isRightSelected = !isRightSelected;
                            //       isWrongSelected = false;
                            //     });
                            //   },
                            // ),
                            //SizedBox(width: 20),
                            SizedBox(
                              width: 45,
                              height: 45,
                              child: Card(
                                //shape: CircleBorder(),
                                //color: Color(0xff47C088),
                                elevation: 0,
                                child: Icon(Icons.close,color: Color(0xffF15E53),),
                              ),
                            ),
                            //Function Cross Btn
                            // IconButton(
                            //   icon: const Icon(Icons.close),
                            //   color: isWrongSelected ? Colors.white : Colors.red,
                            //   style: IconButton.styleFrom(
                            //     backgroundColor: isWrongSelected?Colors.white:Colors.red
                            //   ),
                            //   onPressed: () {
                            //     setState(() {
                            //       isWrongSelected = !isWrongSelected;
                            //       isRightSelected = false;
                            //     });
                            //   },
                            // ),
                          ],
                        ),
                      ],
                    )
                ),
              ),
              const Divider(),
              const SizedBox(height: 10),
              SizedBox(
                width: w*.95,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius
                                .circular(8)),
                        backgroundColor: Color(
                            0xff2A62B8)),
                    onPressed: () {
                      Get.to(Holiday_Calender());
                    },
                    child: const Text(
                      "Submit",
                      style: TextStyle(fontSize: 15,
                          fontFamily: 'Lato'),
                    )),
              ),

            ],),
        )
        ),
      )
    );
  }
}
