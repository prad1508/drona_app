// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../model/trainee_list_model.dart';

class Edit_Page extends StatefulWidget {
  String traineeProfileUid;
  int index;
  List<Datum> traineeList;
  Edit_Page(
      {super.key,
      required this.traineeProfileUid,
      required this.index,
      required this.traineeList});

  @override
  State<Edit_Page> createState() => _Edit_PageState();
}

class _Edit_PageState extends State<Edit_Page> {


  TextEditingController feeController = TextEditingController();

  List<DropdownMenuItem<String>> get sportsItem {
    List<DropdownMenuItem<String>> serviceDetails = [
      const DropdownMenuItem(value: "Tennis", child: Text("Tennis")),
      const DropdownMenuItem(value: "Golf", child: Text("Golf")),
    ];
    return serviceDetails;
  }

  List<DropdownMenuItem<String>> get batchTime {
    List<DropdownMenuItem<String>> sportsTiming = [
      const DropdownMenuItem(
          value: "Tennis Batch Morning", child: Text("Tennis Batch Morning")),
      const DropdownMenuItem(
          value: "Golf Batch Morning", child: Text("Golf Batch Morning")),
      const DropdownMenuItem(
          value: "Tennis Batch Evening", child: Text("Tennis Batch Evening")),
      const DropdownMenuItem(
          value: "Golf Batch Evening", child: Text("Golf Batch Evening")),
    ];
    return sportsTiming;
  }

  String selectedItem = 'Tennis';
  String selectedTiming = "Tennis Batch Morning";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Edit Batch',
          style: TextStyle(
              color: Color(0xff39404A),
              fontSize: 18,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w700),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      "Trainee's Full Name",
                      style: TextStyle(
                          color: Color(0xff39404A),
                          fontSize: 14,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 4),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(8)),
                      width: 342,
                      height: 48,
                      child: TextField(
                        enabled: false,
                        readOnly: true,
                        showCursor: false,
                        style: TextStyle(
                            color: Color(0xff39404A),
                            fontSize: 14,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w600),
                        decoration: InputDecoration(
                            hintText:
                                widget.traineeList[widget.index].traineeName,
                            contentPadding: EdgeInsets.all(15),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(8),
                            )),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Service",
                      style: TextStyle(
                          color: Color(0xff39404A),
                          fontSize: 14,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 4),
                    Container(
                      width: 342,
                      height: 48,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(widget.traineeList[widget.index].serviceName),
                      /*InputDecorator(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff626D7E)),
                                  icon: Icon(Icons.expand_more),
                                  isExpanded: true,
                                  value: selectedItem,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedItem = newValue!;
                                    });
                                  },
                                  items: sportsItem),
                            ))*/
                    ),
                    SizedBox(height: 16),
                    //Batch Timing Selected;
                    Text(
                      "Batch",
                      style: TextStyle(
                          color: Color(0xff39404A),
                          fontSize: 14,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 4),
                    SizedBox(
                        width: 342,
                        height: 48,
                        child: InputDecorator(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff626D7E)),
                                  icon: Icon(Icons.expand_more),
                                  isExpanded: true,
                                  value: selectedTiming,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedTiming = newValue!;
                                    });
                                  },
                                  items: batchTime),
                            ))),
                    SizedBox(height: 16),

                    Text(
                      "Fees/Month",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 4),
                    //Fees Selected;
                    Row(
                      children: [
                        Container(
                          width: 51,
                          height: 41,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xff2A62B8)),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10)),
                            color: Color(0xff2A62B8),
                          ),
                          child: Center(
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
                          width: 291,
                          height: 41,
                          child: Center(
                            child: TextField(
                              controller: feeController,
                              cursorHeight: 20,
                              cursorRadius: Radius.circular(10),
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(8),
                                hintText: widget.traineeList[widget.index].fees
                                    .toString(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff2A62B8)),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff2A62B8)),
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

                    SizedBox(height: MediaQuery.of(context).size.height * 0.39),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: 342,
                        height: 45,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                backgroundColor: Color(0xff2A62B8)),
                            onPressed: () {
                              //Dialog Box;
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return SizedBox(
                                      width: 342,
                                      height: 266,
                                      child: AlertDialog(
                                        icon: SizedBox(
                                          width: 44,
                                          height: 44,
                                          child: CircleAvatar(
                                            backgroundColor: Color(0xff47C088),
                                            child: Icon(
                                              Icons.check_sharp,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        title: Text(
                                          "Edit Batch",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17,
                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.w600),
                                        ),
                                        alignment: Alignment.center,
                                        content: Wrap(children: [
                                          Center(
                                            child: SizedBox(
                                              width: 300,
                                              height: 48,
                                              child: Text(
                                                "Please Confirm Edit Of Batch For ${widget.traineeList[widget.index].traineeName}!",
                                                style: TextStyle(
                                                    color: Color(0xff626D7E),
                                                    fontSize: 16,
                                                    fontFamily: 'Lato',
                                                    fontWeight:
                                                        FontWeight.w600),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ]),
                                        // contentPadding: EdgeInsets.all(24),
                                        actions: [
                                          Container(
                                            width: 139,
                                            height: 48,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Color(0xffDFE1E4),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    8)))),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
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
                                            width: 139,
                                            height: 48,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Color(0xff2A62B8),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    8)))),
                                                onPressed: () {
                                                  Map<String, dynamic> data = {
                                                    "batch_uid":
                                                        "v317jp1ntel2ueujxymt",
                                                    "trainee_profile_uid":
                                                        widget
                                                            .traineeList[
                                                                widget.index]
                                                            .traineeProfileUid,
                                                    "fees": feeController
                                                            .text.isEmpty
                                                        ? widget
                                                            .traineeList[
                                                                widget.index]
                                                            .fees
                                                        : feeController.text
                                                  };


                                                  print("data=$data");
                                                },
                                                child: Text(
                                                  "Confirm",
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
                                    );
                                  });
                            },
                            child: const Text(
                              "Submit",
                              style:
                                  TextStyle(fontSize: 15, fontFamily: 'Lato'),
                            )),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
