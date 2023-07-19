// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:dotted_border/dotted_border.dart';
import 'package:drona/res/widget/progress_pills.dart';
import 'package:flutter/material.dart';

import 'chooseprogram_page.dart';

class ChooseFacilityPage extends StatefulWidget {
  const ChooseFacilityPage({super.key});

  @override
  State<ChooseFacilityPage> createState() => _ChooseFacilityPageState();
}

class _ChooseFacilityPageState extends State<ChooseFacilityPage> {
  bool syntheticChecked = false;
  bool grassChecked = false;
  bool clayChecked = false;
  bool hardChecked = false;
  bool minitennisChecked = false;
  bool pedalChecked = false;
  bool practiceChecked = false;
  bool stringingChecked = false;

  List<DropdownMenuItem<String>> get systheticList {
    List<DropdownMenuItem<String>> syntheticItems = [
      const DropdownMenuItem(value: "0", child: Text("0")),
      const DropdownMenuItem(value: "1", child: Text("1")),
      const DropdownMenuItem(value: "2", child: Text("2")),
      const DropdownMenuItem(value: "3", child: Text("3")),
      const DropdownMenuItem(value: "4", child: Text("4")),
      const DropdownMenuItem(value: "5", child: Text("5")),
      const DropdownMenuItem(value: "6", child: Text("6")),
      const DropdownMenuItem(value: "7", child: Text("7")),
      const DropdownMenuItem(value: "8", child: Text("8")),
      const DropdownMenuItem(value: "9", child: Text("9")),
      const DropdownMenuItem(value: "10", child: Text("10")),
    ];
    return syntheticItems;
  }

  String CountSyntietic = "0";

  List<DropdownMenuItem<String>> get grassList {
    List<DropdownMenuItem<String>> grassItems = [
      const DropdownMenuItem(value: "0", child: Text("0")),
      const DropdownMenuItem(value: "1", child: Text("1")),
      const DropdownMenuItem(value: "2", child: Text("2")),
      const DropdownMenuItem(value: "3", child: Text("3")),
      const DropdownMenuItem(value: "4", child: Text("4")),
      const DropdownMenuItem(value: "5", child: Text("5")),
      const DropdownMenuItem(value: "6", child: Text("6")),
      const DropdownMenuItem(value: "7", child: Text("7")),
      const DropdownMenuItem(value: "8", child: Text("8")),
      const DropdownMenuItem(value: "9", child: Text("9")),
      const DropdownMenuItem(value: "10", child: Text("10")),
    ];
    return grassItems;
  }

  String CountGrass = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Row(
            children: [
              ProgressPills(
                  number: 5,
                  active: 1,
                  color: Theme.of(context).primaryColorLight),
            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.98,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Choose Your Facility For Tennis",
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Number of facilities",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Lato',
                                color: Color(0xff39404A)),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            width: 72,
                            height: 36,
                            child: TextField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide:
                                          BorderSide(color: Color(0xffDFE1E4))),
                                  border: OutlineInputBorder()),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "Surface",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Lato',
                                color: Color(0xff39404A)),
                          ),
                          Icon(
                            Icons.info_outlined,
                            color: Color(0xff99A0AB),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                activeColor: Color(0xff2A62B8),
                                value: syntheticChecked,
                                onChanged: ((value) {
                                  setState(() {
                                    syntheticChecked = value!;
                                  });
                                }),
                              ),
                              Text(
                                "Synthetic",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Lato',
                                    color: Color(0xff39404A)),
                              )
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffDFE1E4)),
                                borderRadius: BorderRadius.circular(8)),
                            width: 72,
                            height: 35,
                            child: DropdownButtonHideUnderline(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: DropdownButton(
                                  icon: Icon(Icons.expand_more_outlined),
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Lato',
                                      color: Color(0xff39404A)),
                                  value: CountSyntietic,
                                  onChanged: (value) {
                                    setState(() {
                                      CountSyntietic = value!;
                                    });
                                  },
                                  items: systheticList,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                activeColor: Color(0xff2A62B8),
                                value: grassChecked,
                                onChanged: ((value) {
                                  setState(() {
                                    grassChecked = value!;
                                  });
                                }),
                              ),
                              Text(
                                "Grass",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Lato',
                                    color: Color(0xff39404A)),
                              )
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffDFE1E4)),
                                borderRadius: BorderRadius.circular(8)),
                            width: 72,
                            height: 35,
                            child: DropdownButtonHideUnderline(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: DropdownButton(
                                  icon: Icon(Icons.expand_more_outlined),
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Lato',
                                      color: Color(0xff39404A)),
                                  value: CountGrass,
                                  onChanged: (value) {
                                    setState(() {
                                      CountGrass = value!;
                                    });
                                  },
                                  items: grassList,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Checkbox(
                            activeColor: Color(0xff2A62B8),
                            value: clayChecked,
                            onChanged: ((value) {
                              setState(() {
                                clayChecked = value!;
                              });
                            }),
                          ),
                          Text(
                            "Clay",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Lato',
                                color: Color(0xff39404A)),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Checkbox(
                            activeColor: Color(0xff2A62B8),
                            value: hardChecked,
                            onChanged: ((value) {
                              setState(() {
                                hardChecked = value!;
                              });
                            }),
                          ),
                          Text(
                            "Hard",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Lato',
                                color: Color(0xff39404A)),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Color(0xffDFE1E4))),
                        child: ExpansionTile(
                          title: Text(
                            "Others",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Lato',
                                color: Color(0xff39404A)),
                          ),
                          children: [
                            Column(children: [
                              Row(
                                children: [
                                  Checkbox(
                                    activeColor: Color(0xff2A62B8),
                                    value: minitennisChecked,
                                    onChanged: ((value) {
                                      setState(() {
                                        minitennisChecked = value!;
                                      });
                                    }),
                                  ),
                                  Text(
                                    "Mini Tennis",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Lato',
                                        color: Color(0xff39404A)),
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Checkbox(
                                    activeColor: Color(0xff2A62B8),
                                    value: pedalChecked,
                                    onChanged: ((value) {
                                      setState(() {
                                        pedalChecked = value!;
                                      });
                                    }),
                                  ),
                                  Text(
                                    "Pedal Tennis",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Lato',
                                        color: Color(0xff39404A)),
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Checkbox(
                                    activeColor: Color(0xff2A62B8),
                                    value: practiceChecked,
                                    onChanged: ((value) {
                                      setState(() {
                                        practiceChecked = value!;
                                      });
                                    }),
                                  ),
                                  Text(
                                    "Practice Wall",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Lato',
                                        color: Color(0xff39404A)),
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Checkbox(
                                    activeColor: Color(0xff2A62B8),
                                    value: stringingChecked,
                                    onChanged: ((value) {
                                      setState(() {
                                        stringingChecked = value!;
                                      });
                                    }),
                                  ),
                                  Text(
                                    "Stringing Service",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Lato',
                                        color: Color(0xff39404A)),
                                  )
                                ],
                              ),
                            ])
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      DottedBorder(
                          color: Color(0xffEAEFF8),
                          child: InkWell(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: 60,
                              decoration:
                                  BoxDecoration(color: Color(0xffEAEFF8)),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        width: 40,
                                        height: 40,
                                        child: CircleAvatar(
                                          backgroundColor: Color(0xffCCD9EE),
                                          child: Icon(
                                            Icons.qr_code_scanner,
                                            color: Color(0xff2A62B8),
                                          ),
                                        )),
                                    SizedBox(width: 10),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Click to upload Images",
                                          style: TextStyle(
                                              color: Color(0xff2A62B8),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Lato'),
                                        ),
                                        Text(
                                          "or just drag and drop",
                                          style: TextStyle(
                                              color: Color(0xff626D7E),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Lato'),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            onTap: () {},
                          )),
                      Align(
                        heightFactor: 9,
                        child: Center(
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
                                        builder: (context) =>
                                            const ChooseProgramPage()),
                                  );
                                },
                                child: const Text(
                                  "Continue",
                                  style: TextStyle(
                                      fontSize: 15, fontFamily: 'Lato'),
                                )),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ));
  }
}
