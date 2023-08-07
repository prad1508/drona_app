import 'dart:core';
import 'dart:core';

import 'package:flutter/material.dart';

import '../../model/service_program_model.dart';
import '../../view_model/facility_view_model.dart';

class Edit_Program extends StatefulWidget {
  List<Program> programs;
  String serviceUid;
  int index;
  int index2;
  Edit_Program(
      {super.key,
      required this.programs,
      required this.serviceUid,
      required this.index,
      required this.index2});

  @override
  State<Edit_Program> createState() => _Edit_ProgramState();
}

class _Edit_ProgramState extends State<Edit_Program> {
  FacilityViewViewModel facilityViewViewModel = FacilityViewViewModel();
  TextEditingController curriculumTitle = TextEditingController();
  TextEditingController curriculumTitleDescription = TextEditingController();

  TextEditingController feeController = TextEditingController();
  TextEditingController registrationFessController = TextEditingController();

  @override
  void initState() {
    print("widget--${widget.index2}");
    feeController.text = widget.programs[widget.index2].amount.toString();
    registrationFessController.text = widget.programs[widget.index2].registrationfee.toString();
    curriculumTitle.text = widget.programs[widget.index2].curriculumTitle;
    curriculumTitleDescription.text = widget.programs[widget.index2].curriculumDesc;

    super.initState();
  }

  @override
  void dispose() {
    curriculumTitle.dispose();
    curriculumTitleDescription.dispose();
    feeController.dispose();
    registrationFessController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Edit Program',
            style: TextStyle(color: Colors.black, fontSize: 18)),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 25, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.programs[widget.index2].programName.toString(),
                  style: const TextStyle(fontFamily: 'Lato', fontSize: 25)),
              const SizedBox(height: 10),
              const Text("Curriculum / Program Details"),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                width: w * .88,
                child: TextField(
                  controller: curriculumTitle,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      hintText: 'Enter Curriculum Title',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Color(0xffDFE1E4)))),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                  height: 100,
                  width: w * .88,
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffDFE1E4)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: curriculumTitleDescription,
                      maxLines: 3,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(5),
                          hintText: 'Enter Curriculum Description',
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)
                          /*border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),borderSide:const BorderSide(color: Color(0xffDFE1E4)))*/

                          ),
                    ),
                  )),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Program Fees"),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: InkWell(
                      child: const Text(
                        "Edit",
                        style: TextStyle(color: Colors.red),
                      ),
                      onTap: () {
                        //Show Dialog
                        showDialog(
                            context: context,
                            builder: (context) {
                              return PopDialog(
                                hintTitle: widget.programs[widget.index].amount,
                                text: '',
                                title: 'Change Program Fee',
                                controller: feeController,
                              );
                            });
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Container(
                    width: 51,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff2A62B8)),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topLeft: Radius.circular(10)),
                      color: const Color(0xff2A62B8),
                    ),
                    child: const Center(
                      child: Text(
                        "₹/M",
                        style: TextStyle(
                            color: Color(0xffFBFBFC),
                            fontSize: 14,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 295,
                    height: 50,
                    child: Center(
                      child: TextField(
                        controller: feeController,
                        cursorHeight: 20,
                        cursorRadius: Radius.circular(10),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff2A62B8)),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff2A62B8)),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Registration Fees"),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: InkWell(
                      child: const Text(
                        "Edit",
                        style: TextStyle(color: Colors.red),
                      ),
                      onTap: () {
                        //Show Dialog
                        showDialog(
                            context: context,
                            builder: (context) {
                              return PopDialog(
                                hintTitle: widget
                                    .programs[widget.index].registrationfee,
                                text: '',
                                title: 'Change Registration Fees',
                                controller: registrationFessController,
                              );
                            });
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Container(
                    width: 51,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff2A62B8)),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topLeft: Radius.circular(10)),
                      color: const Color(0xff2A62B8),
                    ),
                    child: const Center(
                      child: Text(
                        "₹/M",
                        style: TextStyle(
                            color: Color(0xffFBFBFC),
                            fontSize: 14,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 295,
                    height: 50,
                    child: Center(
                      child: TextField(
                        controller: registrationFessController,
                        cursorHeight: 20,
                        cursorRadius: Radius.circular(10),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(15),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff2A62B8)),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff2A62B8)),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 250),
              SizedBox(
                width: w * .95,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      backgroundColor: Color(0xff2A62B8)),
                  onPressed: () {
                    //Show Dialog
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: SizedBox(
                              width: 360,
                              height: 270,
                              child: Column(
                                children: [
                                  const SizedBox(height: 20),
                                  const SizedBox(
                                    width: 45,
                                    height: 45,
                                    child: Card(
                                      elevation: 0,
                                      shape: CircleBorder(),
                                      color: Color(0xffFEC259),
                                      child: Icon(Icons.priority_high),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text("Confirm Change"),
                                  const SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Program Fee from ",
                                          style: TextStyle(
                                              color: Color(0xff626D7E))),
                                      Text(
                                        "₹${widget.programs[widget.index2].amount} ",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      Text("To ",
                                          style: TextStyle(
                                              color: Color(0xff626D7E))),
                                      Text("₹${feeController.text} ",
                                          style: TextStyle(
                                              color: Color(0xff2A62B8))),
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Registration Fee from ",
                                          style: TextStyle(
                                              color: Color(0xff626D7E))),
                                      Text(
                                        "₹${widget.programs[widget.index2].registrationfee} ",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      Text("To ",
                                          style: TextStyle(
                                              color: Color(0xff626D7E))),
                                      Text(
                                          "₹${registrationFessController.text}",
                                          style: TextStyle(
                                              color: Color(0xff2A62B8))),
                                    ],
                                  ),

                                  const SizedBox(height: 50),
                                  //Buttons
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 135,
                                          height: 48,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      const Color(0xffDFE1E4),
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          8)))),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                "Cancel",
                                                style: TextStyle(
                                                    color: Color(0xff23282E),
                                                    fontSize: 15,
                                                    fontFamily: 'Lato',
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )),
                                        ),
                                        Container(
                                          width: 135,
                                          height: 48,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      const Color(0xff2A62B8),
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          8)))),
                                              onPressed: () {
                                                Map<String, dynamic> data = {
                                                  "service_uid":
                                                      widget.serviceUid,
                                                  "program_uid": widget
                                                      .programs[widget.index2]
                                                      .uid,
                                                  "amount":
                                                      feeController.text.isEmpty
                                                          ? widget
                                                              .programs[
                                                                  widget.index2]
                                                              .amount
                                                              .toString()
                                                          : feeController.text
                                                              .toString(),
                                                  "registrationfee":
                                                      registrationFessController
                                                              .text.isEmpty
                                                          ? widget
                                                              .programs[
                                                                  widget.index2]
                                                              .registrationfee
                                                              .toString()
                                                          : registrationFessController
                                                              .text
                                                              .toString(),
                                                  "curriculum_title":
                                                      curriculumTitle.text,
                                                  "curriculum_desc":
                                                      curriculumTitleDescription
                                                          .text
                                                };
                                                print("data==$data");

                                                facilityViewViewModel
                                                    .updateSingleProgramApi(
                                                        data,
                                                        context,
                                                        widget.serviceUid);
                                              },
                                              child: const Text(
                                                "Save",
                                                style: TextStyle(
                                                    color: Color(0xffFBFBFC),
                                                    fontSize: 15,
                                                    fontFamily: 'Lato',
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//PopUP Dialog Box
class PopDialog extends StatelessWidget {
  final String title;
  final String hintTitle;
  final String text;
  TextEditingController controller;

  PopDialog(
      {Key? key,
      required this.title,
      required this.hintTitle,
      required this.text,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 360,
        height: 300,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff39404A)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10.0),
              child: Row(
                children: [
                  Container(
                    width: 51,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff2A62B8)),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topLeft: Radius.circular(10)),
                      color: const Color(0xff2A62B8),
                    ),
                    child: const Center(
                      child: Text(
                        "₹/M",
                        style: TextStyle(
                            color: Color(0xffFBFBFC),
                            fontSize: 14,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 240,
                    height: 50,
                    child: Center(
                      child: TextField(
                        controller: controller,
                        cursorHeight: 20,
                        cursorRadius: const Radius.circular(10),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                          hintText: hintTitle,
                          contentPadding: const EdgeInsets.only(top: 15),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff2A62B8)),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff2A62B8)),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 135,
                    height: 48,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffDFE1E4),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)))),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                              color: Color(0xff23282E),
                              fontSize: 15,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                  Container(
                    width: 135,
                    height: 48,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(8)),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff2A62B8),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)))),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Save",
                          style: TextStyle(
                              color: Color(0xffFBFBFC),
                              fontSize: 15,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w600),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BtnPopDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 360,
        height: 270,
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              width: 45,
              height: 45,
              child: Card(
                elevation: 0,
                shape: CircleBorder(),
                // color: Color(0xffFEC259),
                child: Image.asset('assets/images/vector.png'),
              ),
            ),
            const SizedBox(height: 5),
            Text("Confirm Change"),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Program Fee from ",
                    style: TextStyle(color: Color(0xff626D7E))),
                Text(
                  "₹500 ",
                  style: TextStyle(color: Colors.black),
                ),
                Text("To ", style: TextStyle(color: Color(0xff626D7E))),
                Text("₹1000 ", style: TextStyle(color: Color(0xff2A62B8))),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Registration Fee from ",
                    style: TextStyle(color: Color(0xff626D7E))),
                Text(
                  "₹500 ",
                  style: TextStyle(color: Colors.black),
                ),
                Text("To ", style: TextStyle(color: Color(0xff626D7E))),
                Text("₹1000 ", style: TextStyle(color: Color(0xff2A62B8))),
              ],
            ),

            const SizedBox(height: 50),
            //Buttons
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 135,
                    height: 48,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffDFE1E4),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)))),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                              color: Color(0xff23282E),
                              fontSize: 15,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                  Container(
                    width: 135,
                    height: 48,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(8)),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff2A62B8),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)))),
                        onPressed: () {},
                        child: const Text(
                          "Save",
                          style: TextStyle(
                              color: Color(0xffFBFBFC),
                              fontSize: 15,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w600),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
