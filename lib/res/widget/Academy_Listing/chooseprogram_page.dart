// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:drona/res/widget/progress_pills.dart';
import 'package:flutter/material.dart';

class ChooseProgramPage extends StatefulWidget {
  const ChooseProgramPage({super.key});

  @override
  State<ChooseProgramPage> createState() => _ChooseProgramPageState();
}

class _ChooseProgramPageState extends State<ChooseProgramPage> {
  //bylevel
  bool bylevelBeginner = false;
  bool bylevelIntermediate = false;
  bool bylevelAdvance = false;
  bool bylevelprof = false;
  bool bylevelBeginner2 = false;
  bool bylevelIntermediate2 = false;
  bool bylevelProf2 = false;
  bool bylevelAdvance2 = false;
  TextEditingController txtBylevelBeginner = TextEditingController();
  TextEditingController txtBylevelIntermediate = TextEditingController();
  TextEditingController txtBylevelAdvance = TextEditingController();
  TextEditingController txtBylevelprof = TextEditingController();
  TextEditingController txtBylevelBeginner2 = TextEditingController();
  TextEditingController txtBylevelIntermediate2 = TextEditingController();
  TextEditingController txtBylevelAdvance2 = TextEditingController();
  TextEditingController txtBylevelProf2 = TextEditingController();
  final List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  //bye age
  bool bylevelUnder12 = false;
  bool bylevelUnder14 = false;
  bool bylevelUnder16 = false;
  bool bylevelAdult = false;
  bool bylevelUnder12Second = false;
  bool bylevelUnder14Second = false;
  bool bylevelUnder16Second = false;
  bool bylevelAdultSecond = false;
  TextEditingController txtBylevelUnder12 = TextEditingController();
  TextEditingController txtBylevelUnder14 = TextEditingController();
  TextEditingController txtBylevelUnder16 = TextEditingController();
  TextEditingController txtBylevelAdult = TextEditingController();
  TextEditingController txtBylevelUnder12Second = TextEditingController();
  TextEditingController txtBylevelUnder14Second = TextEditingController();
  TextEditingController txtBylevelUnder16Second = TextEditingController();
  TextEditingController txtBylevelAdultSecond = TextEditingController();

  bool _customTileExpanded = false;
  //custom program name
  bool _customGernal = false;
  // List<TextField> _nameFields = [];
  // List<TextField> _amountFields = [];
  // late List _customChecked;

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
                  active: 2,
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Choose Your Facility For Tennis",
                              style: TextStyle(
                                  fontSize: 19,
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
                      ),
                      DefaultTabController(
                        length: 3,
                        initialIndex: 0,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                              TabBar(
                                indicator: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(5.0)),
                                labelColor: Colors.white,
                                unselectedLabelColor: Colors.black,
                                labelPadding: const EdgeInsets.all(0),
                                dividerColor: Colors.transparent,
                                indicatorColor: Colors.transparent,
                                tabs: [
                                  Tab(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 5.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.50,
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 13, 15, 13),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1, color: Colors.black),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5)),
                                        ),
                                        child: const Text(
                                          "By Level",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 5.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.50,
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 13, 15, 13),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1, color: Colors.black),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5)),
                                        ),
                                        child: const Text(
                                          "By Age",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.50,
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 13, 15, 13),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.black),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                      child: const Text(
                                        "Custom",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * .6,
                                child: TabBarView(children: <Widget>[
                                  //by level
                                  Column(children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            children: [
                                              Checkbox(
                                                checkColor: Colors.white,
                                                activeColor: Theme.of(context)
                                                    .primaryColor,
                                                value: bylevelBeginner,
                                                onChanged: (value) {
                                                  print(value);
                                                  setState(() {
                                                    bylevelBeginner = value!;
                                                  });
                                                },
                                              ),
                                              Text(
                                                'Beginner',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              ),
                                            ],
                                          ),
                                          bylevelBeginner
                                              ? SizedBox(
                                                  width: 150,
                                                  child: TextFormField(
                                                    focusNode: _focusNodes[0],
                                                    controller:
                                                        txtBylevelBeginner,
                                                    onTap: () {},
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration: InputDecoration(
                                                      hintText: '  Fees',
                                                      contentPadding:
                                                          const EdgeInsets.all(
                                                              15),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                                width: 1.0),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      prefixIcon: Container(
                                                          decoration: BoxDecoration(
                                                              color: _focusNodes[0]
                                                                      .hasFocus
                                                                  ? const Color.fromARGB(
                                                                      255,
                                                                      4,
                                                                      112,
                                                                      201)
                                                                  : const Color.fromARGB(
                                                                      255,
                                                                      193,
                                                                      193,
                                                                      193),
                                                              borderRadius: const BorderRadius.only(
                                                                  topLeft:
                                                                      Radius.circular(
                                                                          10),
                                                                  bottomLeft:
                                                                      Radius.circular(
                                                                          10))),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(15),
                                                            child: Text(
                                                              '₹/M',
                                                              style: TextStyle(
                                                                  color: _focusNodes[
                                                                              0]
                                                                          .hasFocus
                                                                      ? Colors
                                                                          .white
                                                                      : const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          44,
                                                                          44,
                                                                          44)),
                                                            ),
                                                          )),
                                                    ),
                                                  ),
                                                )
                                              : Container(),
                                        ]),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    //intermediate
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            children: [
                                              Checkbox(
                                                checkColor: Colors.white,
                                                activeColor: Theme.of(context)
                                                    .primaryColor,
                                                value: bylevelIntermediate,
                                                onChanged: (value) {
                                                  print(value);
                                                  setState(() {
                                                    bylevelIntermediate =
                                                        value!;
                                                  });
                                                },
                                              ),
                                              Text(
                                                'Intermediate',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              ),
                                            ],
                                          ),
                                          bylevelIntermediate
                                              ? SizedBox(
                                                  width: 150,
                                                  child: TextFormField(
                                                    focusNode: _focusNodes[0],
                                                    controller:
                                                        txtBylevelIntermediate,
                                                    onTap: () {},
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration: InputDecoration(
                                                      hintText: '  Fees',
                                                      contentPadding:
                                                          const EdgeInsets.all(
                                                              15),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                                width: 1.0),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      prefixIcon: Container(
                                                          decoration: BoxDecoration(
                                                              color: _focusNodes[0]
                                                                      .hasFocus
                                                                  ? const Color.fromARGB(
                                                                      255,
                                                                      4,
                                                                      112,
                                                                      201)
                                                                  : const Color.fromARGB(
                                                                      255,
                                                                      193,
                                                                      193,
                                                                      193),
                                                              borderRadius: const BorderRadius.only(
                                                                  topLeft:
                                                                      Radius.circular(
                                                                          10),
                                                                  bottomLeft:
                                                                      Radius.circular(
                                                                          10))),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(15),
                                                            child: Text(
                                                              '₹/M',
                                                              style: TextStyle(
                                                                  color: _focusNodes[
                                                                              0]
                                                                          .hasFocus
                                                                      ? Colors
                                                                          .white
                                                                      : const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          44,
                                                                          44,
                                                                          44)),
                                                            ),
                                                          )),
                                                    ),
                                                  ),
                                                )
                                              : Container(),
                                        ]),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    //Advance
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            children: [
                                              Checkbox(
                                                checkColor: Colors.white,
                                                activeColor: Theme.of(context)
                                                    .primaryColor,
                                                value: bylevelAdvance,
                                                onChanged: (value) {
                                                  print(value);
                                                  setState(() {
                                                    bylevelAdvance = value!;
                                                  });
                                                },
                                              ),
                                              Text(
                                                'Advance',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              ),
                                            ],
                                          ),
                                          bylevelAdvance
                                              ? SizedBox(
                                                  width: 150,
                                                  child: TextFormField(
                                                    focusNode: _focusNodes[0],
                                                    controller:
                                                        txtBylevelAdvance,
                                                    onTap: () {},
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration: InputDecoration(
                                                      hintText: '  Fees',
                                                      contentPadding:
                                                          const EdgeInsets.all(
                                                              15),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                                width: 1.0),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      prefixIcon: Container(
                                                          decoration: BoxDecoration(
                                                              color: _focusNodes[0]
                                                                      .hasFocus
                                                                  ? const Color.fromARGB(
                                                                      255,
                                                                      4,
                                                                      112,
                                                                      201)
                                                                  : const Color.fromARGB(
                                                                      255,
                                                                      193,
                                                                      193,
                                                                      193),
                                                              borderRadius: const BorderRadius.only(
                                                                  topLeft:
                                                                      Radius.circular(
                                                                          10),
                                                                  bottomLeft:
                                                                      Radius.circular(
                                                                          10))),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(15),
                                                            child: Text(
                                                              '₹/M',
                                                              style: TextStyle(
                                                                  color: _focusNodes[
                                                                              0]
                                                                          .hasFocus
                                                                      ? Colors
                                                                          .white
                                                                      : const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          44,
                                                                          44,
                                                                          44)),
                                                            ),
                                                          )),
                                                    ),
                                                  ),
                                                )
                                              : Container(),
                                        ]),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    //Professional
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            children: [
                                              Checkbox(
                                                checkColor: Colors.white,
                                                activeColor: Theme.of(context)
                                                    .primaryColor,
                                                value: bylevelProf2,
                                                onChanged: (value) {
                                                  print(value);
                                                  setState(() {
                                                    bylevelProf2 = value!;
                                                  });
                                                },
                                              ),
                                              Text(
                                                'Professional',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              ),
                                            ],
                                          ),
                                          bylevelProf2
                                              ? SizedBox(
                                                  width: 150,
                                                  child: TextFormField(
                                                    focusNode: _focusNodes[0],
                                                    controller: txtBylevelProf2,
                                                    onTap: () {},
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration: InputDecoration(
                                                      hintText: '  Fees',
                                                      contentPadding:
                                                          const EdgeInsets.all(
                                                              15),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                                width: 1.0),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      prefixIcon: Container(
                                                          decoration: BoxDecoration(
                                                              color: _focusNodes[0]
                                                                      .hasFocus
                                                                  ? const Color.fromARGB(
                                                                      255,
                                                                      4,
                                                                      112,
                                                                      201)
                                                                  : const Color.fromARGB(
                                                                      255,
                                                                      193,
                                                                      193,
                                                                      193),
                                                              borderRadius: const BorderRadius.only(
                                                                  topLeft:
                                                                      Radius.circular(
                                                                          10),
                                                                  bottomLeft:
                                                                      Radius.circular(
                                                                          10))),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(15),
                                                            child: Text(
                                                              '₹/M',
                                                              style: TextStyle(
                                                                  color: _focusNodes[
                                                                              0]
                                                                          .hasFocus
                                                                      ? Colors
                                                                          .white
                                                                      : const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          44,
                                                                          44,
                                                                          44)),
                                                            ),
                                                          )),
                                                    ),
                                                  ),
                                                )
                                              : Container(),
                                        ]),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    //Registration
                                    Container(
                                      padding: const EdgeInsets.all(0),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: const Color.fromARGB(
                                                255, 224, 223, 223)),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                      child: ExpansionTile(
                                        title: const Text(
                                          'Registration Fee',
                                          style: TextStyle(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17,
                                            color: Colors.black,
                                          ),
                                        ),
                                        trailing: const Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black,
                                        ),
                                        children: <Widget>[
                                          //Beginner
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          bylevelBeginner
                                              ? Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                      Row(
                                                        children: [
                                                          Checkbox(
                                                            checkColor:
                                                                Colors.white,
                                                            activeColor: Theme
                                                                    .of(context)
                                                                .primaryColor,
                                                            value:
                                                                bylevelBeginner2,
                                                            onChanged: (value) {
                                                              print(value);
                                                              setState(() {
                                                                bylevelBeginner2 =
                                                                    value!;
                                                              });
                                                            },
                                                          ),
                                                          Text(
                                                            'Beginner',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyMedium,
                                                          ),
                                                        ],
                                                      ),
                                                      bylevelBeginner2
                                                          ? SizedBox(
                                                              width: 150,
                                                              child:
                                                                  TextFormField(
                                                                focusNode:
                                                                    _focusNodes[
                                                                        4],
                                                                controller:
                                                                    txtBylevelBeginner2,
                                                                onTap: () {},
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintText:
                                                                      '  Fees',
                                                                  contentPadding:
                                                                      const EdgeInsets
                                                                          .all(15),
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide: const BorderSide(
                                                                        color: Colors
                                                                            .blue,
                                                                        width:
                                                                            1.0),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  prefixIcon:
                                                                      Container(
                                                                          decoration: BoxDecoration(
                                                                              color: _focusNodes[4].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193),
                                                                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                          child: Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(15),
                                                                            child:
                                                                                Text(
                                                                              '₹/M',
                                                                              style: TextStyle(color: _focusNodes[4].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
                                                                            ),
                                                                          )),
                                                                ),
                                                              ),
                                                            )
                                                          : Container(),
                                                    ])
                                              : Container(),

                                          //Intermediate
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          bylevelIntermediate
                                              ? Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                      Row(
                                                        children: [
                                                          Checkbox(
                                                            checkColor:
                                                                Colors.white,
                                                            activeColor: Theme
                                                                    .of(context)
                                                                .primaryColor,
                                                            value:
                                                                bylevelIntermediate2,
                                                            onChanged: (value) {
                                                              print(value);
                                                              setState(() {
                                                                bylevelIntermediate2 =
                                                                    value!;
                                                              });
                                                            },
                                                          ),
                                                          Text(
                                                            'Intermediate',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyMedium,
                                                          ),
                                                        ],
                                                      ),
                                                      bylevelIntermediate2
                                                          ? SizedBox(
                                                              width: 150,
                                                              child:
                                                                  TextFormField(
                                                                focusNode:
                                                                    _focusNodes[
                                                                        5],
                                                                controller:
                                                                    txtBylevelIntermediate2,
                                                                onTap: () {},
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintText:
                                                                      '  Fees',
                                                                  contentPadding:
                                                                      const EdgeInsets
                                                                          .all(15),
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide: const BorderSide(
                                                                        color: Colors
                                                                            .blue,
                                                                        width:
                                                                            1.0),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  prefixIcon:
                                                                      Container(
                                                                          decoration: BoxDecoration(
                                                                              color: _focusNodes[5].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193),
                                                                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                          child: Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(15),
                                                                            child:
                                                                                Text(
                                                                              '₹/M',
                                                                              style: TextStyle(color: _focusNodes[5].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
                                                                            ),
                                                                          )),
                                                                ),
                                                              ),
                                                            )
                                                          : Container(),
                                                    ])
                                              : Container(),
                                        ],
                                      ),
                                    ),
                                  ]),

                                  //by age
                                  Column(children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            children: [
                                              Checkbox(
                                                checkColor: Colors.white,
                                                activeColor: Theme.of(context)
                                                    .primaryColor,
                                                value: bylevelUnder12,
                                                onChanged: (value) {
                                                  print(value);
                                                  setState(() {
                                                    bylevelUnder12 = value!;
                                                  });
                                                },
                                              ),
                                              Text(
                                                'Under 12',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              ),
                                            ],
                                          ),
                                          bylevelUnder12
                                              ? SizedBox(
                                                  width: 150,
                                                  child: TextFormField(
                                                    focusNode: _focusNodes[0],
                                                    controller:
                                                        txtBylevelUnder12,
                                                    onTap: () {},
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration: InputDecoration(
                                                      hintText: '  Fees',
                                                      contentPadding:
                                                          const EdgeInsets.all(
                                                              15),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                                width: 1.0),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      prefixIcon: Container(
                                                          decoration: BoxDecoration(
                                                              color: _focusNodes[0]
                                                                      .hasFocus
                                                                  ? const Color.fromARGB(
                                                                      255,
                                                                      4,
                                                                      112,
                                                                      201)
                                                                  : const Color.fromARGB(
                                                                      255,
                                                                      193,
                                                                      193,
                                                                      193),
                                                              borderRadius: const BorderRadius.only(
                                                                  topLeft:
                                                                      Radius.circular(
                                                                          10),
                                                                  bottomLeft:
                                                                      Radius.circular(
                                                                          10))),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(15),
                                                            child: Text(
                                                              '₹/M',
                                                              style: TextStyle(
                                                                  color: _focusNodes[
                                                                              0]
                                                                          .hasFocus
                                                                      ? Colors
                                                                          .white
                                                                      : const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          44,
                                                                          44,
                                                                          44)),
                                                            ),
                                                          )),
                                                    ),
                                                  ),
                                                )
                                              : Container(),
                                        ]),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    //intermediate
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            children: [
                                              Checkbox(
                                                checkColor: Colors.white,
                                                activeColor: Theme.of(context)
                                                    .primaryColor,
                                                value: bylevelUnder14,
                                                onChanged: (value) {
                                                  print(value);
                                                  setState(() {
                                                    bylevelUnder14 = value!;
                                                  });
                                                },
                                              ),
                                              Text(
                                                'Under 14',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              ),
                                            ],
                                          ),
                                          bylevelUnder14
                                              ? SizedBox(
                                                  width: 150,
                                                  child: TextFormField(
                                                    focusNode: _focusNodes[0],
                                                    controller:
                                                        txtBylevelUnder14,
                                                    onTap: () {},
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration: InputDecoration(
                                                      hintText: '  Fees',
                                                      contentPadding:
                                                          const EdgeInsets.all(
                                                              15),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                                width: 1.0),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      prefixIcon: Container(
                                                          decoration: BoxDecoration(
                                                              color: _focusNodes[0]
                                                                      .hasFocus
                                                                  ? const Color.fromARGB(
                                                                      255,
                                                                      4,
                                                                      112,
                                                                      201)
                                                                  : const Color.fromARGB(
                                                                      255,
                                                                      193,
                                                                      193,
                                                                      193),
                                                              borderRadius: const BorderRadius.only(
                                                                  topLeft:
                                                                      Radius.circular(
                                                                          10),
                                                                  bottomLeft:
                                                                      Radius.circular(
                                                                          10))),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(15),
                                                            child: Text(
                                                              '₹/M',
                                                              style: TextStyle(
                                                                  color: _focusNodes[
                                                                              0]
                                                                          .hasFocus
                                                                      ? Colors
                                                                          .white
                                                                      : const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          44,
                                                                          44,
                                                                          44)),
                                                            ),
                                                          )),
                                                    ),
                                                  ),
                                                )
                                              : Container(),
                                        ]),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    //Advance
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            children: [
                                              Checkbox(
                                                checkColor: Colors.white,
                                                activeColor: Theme.of(context)
                                                    .primaryColor,
                                                value: bylevelUnder16,
                                                onChanged: (value) {
                                                  print(value);
                                                  setState(() {
                                                    bylevelUnder16 = value!;
                                                  });
                                                },
                                              ),
                                              Text(
                                                'Under 16',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              ),
                                            ],
                                          ),
                                          bylevelUnder16
                                              ? SizedBox(
                                                  width: 150,
                                                  child: TextFormField(
                                                    focusNode: _focusNodes[0],
                                                    controller:
                                                        txtBylevelUnder16,
                                                    onTap: () {},
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration: InputDecoration(
                                                      hintText: '  Fees',
                                                      contentPadding:
                                                          const EdgeInsets.all(
                                                              15),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                                width: 1.0),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      prefixIcon: Container(
                                                          decoration: BoxDecoration(
                                                              color: _focusNodes[0]
                                                                      .hasFocus
                                                                  ? const Color.fromARGB(
                                                                      255,
                                                                      4,
                                                                      112,
                                                                      201)
                                                                  : const Color.fromARGB(
                                                                      255,
                                                                      193,
                                                                      193,
                                                                      193),
                                                              borderRadius: const BorderRadius.only(
                                                                  topLeft:
                                                                      Radius.circular(
                                                                          10),
                                                                  bottomLeft:
                                                                      Radius.circular(
                                                                          10))),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(15),
                                                            child: Text(
                                                              '₹/M',
                                                              style: TextStyle(
                                                                  color: _focusNodes[
                                                                              0]
                                                                          .hasFocus
                                                                      ? Colors
                                                                          .white
                                                                      : const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          44,
                                                                          44,
                                                                          44)),
                                                            ),
                                                          )),
                                                    ),
                                                  ),
                                                )
                                              : Container(),
                                        ]),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    //Professional
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            children: [
                                              Checkbox(
                                                checkColor: Colors.white,
                                                activeColor: Theme.of(context)
                                                    .primaryColor,
                                                value: bylevelAdult,
                                                onChanged: (value) {
                                                  print(value);
                                                  setState(() {
                                                    bylevelAdult = value!;
                                                  });
                                                },
                                              ),
                                              Text(
                                                'Adult',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              ),
                                            ],
                                          ),
                                          bylevelAdult
                                              ? SizedBox(
                                                  width: 150,
                                                  child: TextFormField(
                                                    focusNode: _focusNodes[0],
                                                    controller: txtBylevelAdult,
                                                    onTap: () {},
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration: InputDecoration(
                                                      hintText: '  Fees',
                                                      contentPadding:
                                                          const EdgeInsets.all(
                                                              15),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                                width: 1.0),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      prefixIcon: Container(
                                                          decoration: BoxDecoration(
                                                              color: _focusNodes[0]
                                                                      .hasFocus
                                                                  ? const Color.fromARGB(
                                                                      255,
                                                                      4,
                                                                      112,
                                                                      201)
                                                                  : const Color.fromARGB(
                                                                      255,
                                                                      193,
                                                                      193,
                                                                      193),
                                                              borderRadius: const BorderRadius.only(
                                                                  topLeft:
                                                                      Radius.circular(
                                                                          10),
                                                                  bottomLeft:
                                                                      Radius.circular(
                                                                          10))),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(15),
                                                            child: Text(
                                                              '₹/M',
                                                              style: TextStyle(
                                                                  color: _focusNodes[
                                                                              0]
                                                                          .hasFocus
                                                                      ? Colors
                                                                          .white
                                                                      : const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          44,
                                                                          44,
                                                                          44)),
                                                            ),
                                                          )),
                                                    ),
                                                  ),
                                                )
                                              : Container(),
                                        ]),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    //Registration
                                    Container(
                                      padding: const EdgeInsets.all(0),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: const Color.fromARGB(
                                                255, 224, 223, 223)),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                      child: ExpansionTile(
                                        title: const Text(
                                          'Registration Fee',
                                          style: TextStyle(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17,
                                            color: Colors.black,
                                          ),
                                        ),
                                        trailing: const Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black,
                                        ),
                                        children: <Widget>[
                                          //Beginner
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          bylevelBeginner
                                              ? Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                      Row(
                                                        children: [
                                                          Checkbox(
                                                            checkColor:
                                                                Colors.white,
                                                            activeColor: Theme
                                                                    .of(context)
                                                                .primaryColor,
                                                            value:
                                                                bylevelBeginner2,
                                                            onChanged: (value) {
                                                              print(value);
                                                              setState(() {
                                                                bylevelBeginner2 =
                                                                    value!;
                                                              });
                                                            },
                                                          ),
                                                          Text(
                                                            'Under 12',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyMedium,
                                                          ),
                                                        ],
                                                      ),
                                                      bylevelBeginner2
                                                          ? SizedBox(
                                                              width: 150,
                                                              child:
                                                                  TextFormField(
                                                                focusNode:
                                                                    _focusNodes[
                                                                        4],
                                                                controller:
                                                                    txtBylevelBeginner2,
                                                                onTap: () {},
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintText:
                                                                      '  Fees',
                                                                  contentPadding:
                                                                      const EdgeInsets
                                                                          .all(15),
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide: const BorderSide(
                                                                        color: Colors
                                                                            .blue,
                                                                        width:
                                                                            1.0),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  prefixIcon:
                                                                      Container(
                                                                          decoration: BoxDecoration(
                                                                              color: _focusNodes[4].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193),
                                                                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                          child: Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(15),
                                                                            child:
                                                                                Text(
                                                                              '₹/M',
                                                                              style: TextStyle(color: _focusNodes[4].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
                                                                            ),
                                                                          )),
                                                                ),
                                                              ),
                                                            )
                                                          : Container(),
                                                    ])
                                              : Container(),

                                          //Intermediate
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          bylevelIntermediate
                                              ? Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                      Row(
                                                        children: [
                                                          Checkbox(
                                                            checkColor:
                                                                Colors.white,
                                                            activeColor: Theme
                                                                    .of(context)
                                                                .primaryColor,
                                                            value:
                                                                bylevelIntermediate2,
                                                            onChanged: (value) {
                                                              print(value);
                                                              setState(() {
                                                                bylevelIntermediate2 =
                                                                    value!;
                                                              });
                                                            },
                                                          ),
                                                          Text(
                                                            'Under 14',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyMedium,
                                                          ),
                                                        ],
                                                      ),
                                                      bylevelIntermediate2
                                                          ? SizedBox(
                                                              width: 150,
                                                              child:
                                                                  TextFormField(
                                                                focusNode:
                                                                    _focusNodes[
                                                                        5],
                                                                controller:
                                                                    txtBylevelIntermediate2,
                                                                onTap: () {},
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintText:
                                                                      '  Fees',
                                                                  contentPadding:
                                                                      const EdgeInsets
                                                                          .all(15),
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide: const BorderSide(
                                                                        color: Colors
                                                                            .blue,
                                                                        width:
                                                                            1.0),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  prefixIcon:
                                                                      Container(
                                                                          decoration: BoxDecoration(
                                                                              color: _focusNodes[5].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193),
                                                                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                          child: Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(15),
                                                                            child:
                                                                                Text(
                                                                              '₹/M',
                                                                              style: TextStyle(color: _focusNodes[5].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
                                                                            ),
                                                                          )),
                                                                ),
                                                              ),
                                                            )
                                                          : Container(),
                                                    ])
                                              : Container(),
                                        ],
                                      ),
                                    ),
                                  ]),
                                  //Custom;
                                  Column(children: [
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            children: [
                                              Checkbox(
                                                checkColor: Colors.white,
                                                activeColor: Theme.of(context)
                                                    .primaryColor,
                                                value: _customGernal,
                                                onChanged: (value) {
                                                  print(value);
                                                  setState(() {
                                                    _customGernal = value!;
                                                  });
                                                },
                                              ),
                                              Text(
                                                'General',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              ),
                                            ],
                                          ),
                                          _customGernal
                                              ? SizedBox(
                                                  width: 150,
                                                  child: TextFormField(
                                                    focusNode: _focusNodes[0],
                                                    controller:
                                                        txtBylevelBeginner,
                                                    onTap: () {},
                                                    keyboardType:
                                                        TextInputType.number,
                                                    decoration: InputDecoration(
                                                      hintText: '  Fees',
                                                      contentPadding:
                                                          const EdgeInsets.all(
                                                              15),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.blue,
                                                                width: 1.0),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      prefixIcon: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: _focusNodes[
                                                                        0]
                                                                    .hasFocus
                                                                ? const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    4,
                                                                    112,
                                                                    201)
                                                                : const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    193,
                                                                    193,
                                                                    193),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(10),
                                                              bottomLeft: Radius
                                                                  .circular(10),
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(15),
                                                            child: Text(
                                                              '₹/M',
                                                              style: TextStyle(
                                                                  color: _focusNodes[
                                                                              0]
                                                                          .hasFocus
                                                                      ? Colors
                                                                          .white
                                                                      : const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          44,
                                                                          44,
                                                                          44)),
                                                            ),
                                                          )),
                                                    ),
                                                  ),
                                                )
                                              : Container(),
                                        ]),
                                    //Registration
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.95,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: const Color.fromARGB(
                                                255, 224, 223, 223)),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                      ),
                                      child: ExpansionTile(
                                        title: Row(
                                          children: [
                                            Text(
                                              'Registration Fee',
                                              style: TextStyle(
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 17,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Icon(Icons.info_outline_rounded)
                                          ],
                                        ),
                                        trailing: const Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.black,
                                        ),
                                        children: <Widget>[],
                                      ),
                                    ),
                                  ]),
                                ]),
                              ),
                            ]),
                      ),
                    ]),
              ),
            ),
          ),
        ));
  }
}
