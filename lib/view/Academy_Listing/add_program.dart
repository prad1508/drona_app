import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/response/status.dart';
import '../../utils/no_data.dart';
import '../../view_model/facility_view_model.dart';
import '../../view_model/myprogram_view_model.dart';

class Add_Program extends StatefulWidget {
  String service;
  String serviceId;
  Add_Program({this.service = '', this.serviceId = '', super.key});

  @override
  State<Add_Program> createState() => _Add_ProgramState();
}

bool advance = false;
bool professional = false;

class _Add_ProgramState extends State<Add_Program> {
  FacilityViewViewModel facilityViewViewModel = FacilityViewViewModel();

  String circi_title = '';
  List<String?> programName = [''];
  String amt = '';
  String regs_fee = '';
  String cir_desc = '';
  String prog_name = '';
  List<TextEditingController> titleControllers = [];
  List<TextEditingController> descControllers = [];
  List<TextEditingController> amountControllers = [];
  List<TextEditingController> registrationControllers = [];
  List<bool> check = [];
  List<bool> visible = [];
  List<String> values = [];
  MyProgramViewViewModel myProgramViewViewModel = MyProgramViewViewModel();
  List<Program> programList = [];

  String? programUid;
  @override
  void initState() {
    myProgramViewViewModel.fetchMyProgramListApi(widget.serviceId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    programList = [];
    int? num;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text('Add Program In ' + widget.service,
              style: TextStyle(color: Colors.black, fontSize: 18)),
          elevation: 0,
        ),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(20.0),
          child: ChangeNotifierProvider<MyProgramViewViewModel>(
              create: (BuildContext context) => myProgramViewViewModel,
              child: Consumer<MyProgramViewViewModel>(
                  builder: (context, value, _) {
                switch (value.dataList.status!) {
                  case Status.loading:
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.teal,
                      ),
                    );
                  case Status.completed:
                    print(value);

                    generateControllers(
                        value.dataList.data?.data![0].programs!.length);
                    num = value.dataList.data?.data![0].programs!.length;
                    for (var index = 0; index < num!; index++) {
                      generateVariable(value.dataList.data?.data![0]
                          .programs![index].programName);
                      programName.add(value.dataList.data!.data![0]
                          .programs![index].programName);
                      Program program = Program(
                        program_name: value.dataList.data?.data![0]
                            .programs![index].programName,
                        amount: value
                            .dataList.data?.data![0].programs![index].amount
                            .toString(),
                        registrationfee: value.dataList.data?.data![0]
                            .programs![index].registrationfee
                            .toString(),
                        curriculum_title: value.dataList.data?.data![0]
                            .programs![index].curriculumTitle,
                        curriculum_desc: value.dataList.data?.data![0]
                            .programs![index].curriculumDescription,
                      );

                      programList.add(program);
                    }

                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: screenHeight * 0.6,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: value
                                    .dataList.data?.data![0].programs?.length,
                                itemBuilder: (context, index) {
                                  if (int.parse(value.dataList.data!.data![0]
                                          .programs![index].amount
                                          .toString()) !=
                                      0) {
                                    amountControllers[index].text = value
                                        .dataList
                                        .data!
                                        .data![0]
                                        .programs![index]
                                        .amount
                                        .toString();
                                    registrationControllers[index].text = value
                                        .dataList
                                        .data!
                                        .data![0]
                                        .programs![index]
                                        .registrationfee
                                        .toString();
                                  }

                                  print(value.dataList.data?.data![0]
                                      .programs![index].amount);
                                  return Column(
                                    children: [
                                      const SizedBox(height: 20),
                                      int.parse(value.dataList.data!.data![0]
                                                  .programs![index].amount
                                                  .toString()) !=
                                              0
                                          ? Container(
                                              decoration: BoxDecoration(
                                                  color: Color(0xffeaeff8),
                                                  border: Border.all(
                                                      color: Color(0xffDFE1E4)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              width: screenWidth * .95,
                                              child: ExpansionTile(
                                                trailing: Text(''),
                                                onExpansionChanged: (_) {},
                                                collapsedBackgroundColor:
                                                    Color(0xffeaeff8),
                                                backgroundColor:
                                                    Color(0xffeaeff8),
                                                title: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                          '${value.dataList.data?.data![0].programs![index].programName}',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Lato',
                                                              fontSize: 15)),
                                                      Row(children: [
                                                        Text('Fees:',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Lato',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 15)),
                                                        Text(
                                                            '${value.dataList.data!.data![0].programs?[index].amount}/M',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Lato',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 15)),
                                                      ]),
                                                    ]),
                                                // children: [
                                                //   Padding(padding: EdgeInsets.all(10),
                                                //     child: Column(
                                                //       crossAxisAlignment: CrossAxisAlignment.start,
                                                //       children: [
                                                //         const Text("Curriculum / Program Details"),
                                                //         const SizedBox(
                                                //             height: 7
                                                //         ),
                                                //         SizedBox(
                                                //           height: 50,
                                                //           width: screenWidth * .88,
                                                //           child: TextField(
                                                //             controller: titleControllers[index],
                                                //             decoration: InputDecoration(
                                                //                 filled: true,
                                                //                 fillColor: Colors.white,
                                                //                 hintStyle: TextStyle(
                                                //                     fontSize: 13,
                                                //                     fontWeight: FontWeight.normal
                                                //                 ),
                                                //                 contentPadding: const EdgeInsets
                                                //                     .only(left: 8,
                                                //                     right: 8,
                                                //                     top: 8,
                                                //                     bottom: 5),
                                                //                 hintText: 'High-Performance Coaching',
                                                //                 border: OutlineInputBorder(
                                                //                     borderRadius: BorderRadius
                                                //                         .circular(10),
                                                //                     borderSide: BorderSide(
                                                //                         color: Color(0xffDFE1E4)))),
                                                //           ),
                                                //
                                                //         ),
                                                //         const SizedBox(
                                                //             height: 10
                                                //         ),
                                                //
                                                //         Container(
                                                //           //   height: 100,
                                                //           width: screenWidth * .88,
                                                //           //  decoration: BoxDecoration(border: Border.all(color: Color(0xffDFE1E4)),borderRadius: BorderRadius.circular(10)),
                                                //           child:
                                                //           TextField(
                                                //               controller: descControllers[index],
                                                //               maxLines: 5,
                                                //               decoration: InputDecoration(
                                                //                   filled: true,
                                                //                   fillColor: Colors.white,
                                                //                   hintStyle: const TextStyle(
                                                //                       fontSize: 13,
                                                //                       fontWeight: FontWeight.normal
                                                //                   ),
                                                //                   contentPadding: const EdgeInsets
                                                //                       .only(left: 8,
                                                //                       right: 8,
                                                //                       top: 8,
                                                //                       bottom: 5),
                                                //                   hintText: "Abc sports management flagship course is geared for professional excellence. Players in this exclusive",
                                                //                   border: OutlineInputBorder(
                                                //                       borderRadius: BorderRadius
                                                //                           .circular(10),
                                                //                       borderSide: BorderSide(
                                                //                           color: Color(
                                                //                               0xffDFE1E4)))),
                                                //
                                                //               style: TextStyle(fontFamily: 'Lato',
                                                //                   fontWeight: FontWeight.w400,
                                                //                   fontSize: 14)),
                                                //
                                                //         ),
                                                //         const SizedBox(
                                                //             height: 15
                                                //         ),
                                                //         Padding(padding: EdgeInsets.only(
                                                //             left: 10, right: 10),
                                                //           child:  Row(
                                                //             mainAxisAlignment: MainAxisAlignment
                                                //                 .spaceBetween,
                                                //             children: [
                                                //               Text('Registration Fees: ${value.dataList.data?.data![0].programs![index].registrationfee}',
                                                //                   style: TextStyle(
                                                //                       fontFamily: 'Lato',
                                                //                       fontWeight: FontWeight.w400)),
                                                //
                                                //               Row(
                                                //                 children: [
                                                //                   Text('Fees:', style: TextStyle(
                                                //                       fontFamily: 'Lato',
                                                //                       fontWeight: FontWeight.w400)),
                                                //                   Text('${value.dataList.data?.data![0].programs![index].amount}/M', style: TextStyle(
                                                //                       fontFamily: 'Lato',
                                                //                       fontWeight: FontWeight.w400)),
                                                //                 ],
                                                //               )
                                                //             ],
                                                //           ),
                                                //         )
                                                //       ],
                                                //     ),
                                                //   ),
                                                // ],
                                              ),
                                            )
                                          : Row(
                                              children: [
                                                Checkbox(
                                                  value: check[index],
                                                  onChanged: (value) {
                                                    print("value is $value");
                                                    print(
                                                        "check[index]${check[index]}");
                                                    setState(() {
                                                      if (value == true) {
                                                        for (var i = 0;
                                                            i < check.length;
                                                            i++) {
                                                          if (i == index) {
                                                            check[index] =
                                                                value!;
                                                          } else {
                                                            check[i] = false;
                                                          }
                                                        }
                                                      } else {
                                                        check[index] = value!;
                                                      }
                                                    });
                                                  },
                                                ),
                                                Text(
                                                    '${value.dataList.data?.data![0].programs![index].programName}')
                                              ],
                                            ),
                                      check[index]
                                          ? Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                      "Curriculum / Program Details"),
                                                  const SizedBox(height: 7),
                                                  SizedBox(
                                                    height: 50,
                                                    width: screenWidth * .88,
                                                    child: TextField(
                                                      controller:
                                                          titleControllers[
                                                              index],
                                                      decoration: InputDecoration(
                                                          filled: true,
                                                          fillColor: Colors
                                                              .white,
                                                          hintStyle: TextStyle(
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                          contentPadding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8,
                                                                  right: 8,
                                                                  top: 8,
                                                                  bottom: 5),
                                                          hintText:
                                                              'High-Performance Coaching',
                                                          border: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              borderSide: BorderSide(
                                                                  color: Color(
                                                                      0xffDFE1E4)))),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Container(
                                                    //   height: 100,
                                                    width: screenWidth * .88,
                                                    //  decoration: BoxDecoration(border: Border.all(color: Color(0xffDFE1E4)),borderRadius: BorderRadius.circular(10)),
                                                    child: TextField(
                                                        controller: descControllers[
                                                            index],
                                                        maxLines: 5,
                                                        decoration: InputDecoration(
                                                            filled: true,
                                                            fillColor:
                                                                Colors.white,
                                                            hintStyle: const TextStyle(
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal),
                                                            contentPadding:
                                                                const EdgeInsets.only(
                                                                    left: 8,
                                                                    right: 8,
                                                                    top: 8,
                                                                    bottom: 5),
                                                            hintText:
                                                                "Abc sports management flagship course is geared for professional excellence. Players in this exclusive",
                                                            border: OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        10),
                                                                borderSide: BorderSide(
                                                                    color: Color(
                                                                        0xffDFE1E4)))),
                                                        style: TextStyle(
                                                            fontFamily: 'Lato',
                                                            fontWeight: FontWeight.w400,
                                                            fontSize: 14)),
                                                  ),
                                                  const SizedBox(height: 15),
                                                ],
                                              ),
                                            )
                                          : Container(),
                                      check[index]
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8, right: 18),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text("Program Fees"),
                                                  const Text(
                                                      "Registartion Fees"),
                                                ],
                                              ),
                                            )
                                          : Container(),
                                      check[index]
                                          ? const SizedBox(height: 4)
                                          : Container(),
                                      check[index]
                                          ? Row(
                                              children: [
                                                Container(
                                                  width: 51,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xff2A62B8)),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    10),
                                                            topLeft:
                                                                Radius.circular(
                                                                    10)),
                                                    color:
                                                        const Color(0xff2A62B8),
                                                  ),
                                                  child: const Center(
                                                    child: Text(
                                                      "₹/M",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xffFBFBFC),
                                                          fontSize: 14,
                                                          fontFamily: 'Lato',
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: screenWidth * 0.30,
                                                  height: 50,
                                                  child: Center(
                                                    child: TextField(
                                                      controller:
                                                          amountControllers[
                                                              index],
                                                      cursorHeight: 20,
                                                      cursorRadius:
                                                          Radius.circular(10),
                                                      keyboardType:
                                                          TextInputType.number,
                                                      textAlign:
                                                          TextAlign.start,
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.all(15),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Color(
                                                                  0xff2A62B8)),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topRight:
                                                                Radius.circular(
                                                                    10),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    10),
                                                          ),
                                                        ),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Color(
                                                                  0xff2A62B8)),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topRight:
                                                                Radius.circular(
                                                                    10),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    10),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8),
                                                  child: Container(
                                                    width: 51,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: const Color(
                                                              0xff2A62B8)),
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .only(
                                                              bottomLeft: Radius
                                                                  .circular(10),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      10)),
                                                      color: const Color(
                                                          0xff2A62B8),
                                                    ),
                                                    child: const Center(
                                                      child: Text(
                                                        "₹/M",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xffFBFBFC),
                                                            fontSize: 14,
                                                            fontFamily: 'Lato',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: screenWidth * 0.30,
                                                  height: 50,
                                                  child: Center(
                                                    child: TextField(
                                                      controller:
                                                          registrationControllers[
                                                              index],
                                                      cursorHeight: 20,
                                                      cursorRadius:
                                                          Radius.circular(10),
                                                      keyboardType:
                                                          TextInputType.number,
                                                      textAlign:
                                                          TextAlign.start,
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.all(15),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Color(
                                                                  0xff2A62B8)),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topRight:
                                                                Radius.circular(
                                                                    10),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    10),
                                                          ),
                                                        ),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Color(
                                                                  0xff2A62B8)),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topRight:
                                                                Radius.circular(
                                                                    10),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    10),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                          : Container(),
                                      check[index]
                                          ? const SizedBox(height: 10)
                                          : Container(),
                                    ],
                                  );
                                  //Intermediate Box
                                }),
                          ),
                          const SizedBox(height: 50),
                          SizedBox(
                            width: screenWidth * .95,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  backgroundColor: Color(0xffDFE1E4)),
                              onPressed: () {
                                //Custom Dialog Box.
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return SizedBox(
                                        width: 342,
                                        child: AlertDialog(
                                          title: Text(
                                            "Create Custom Program",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                                fontFamily: 'Lato',
                                                fontWeight: FontWeight.w600),
                                          ),

                                          content: Align(
                                            alignment: Alignment.bottomRight,
                                            child: TextButton(
                                              child: Text(
                                                "+ Add More",
                                                style: TextStyle(
                                                    color: Color(0xff2A62B8),
                                                    fontSize: 16,
                                                    fontFamily: 'Lato',
                                                    fontWeight:
                                                        FontWeight.w700),
                                                textAlign: TextAlign.center,
                                              ),
                                              onPressed: () {},
                                            ),
                                          ),
                                          // contentPadding: EdgeInsets.all(24),
                                          actions: [
                                            SizedBox(
                                              width: 135,
                                              height: 48,
                                              child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          Color(0xffDFE1E4),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          8)))),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    "Cancel",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff23282E),
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
                                                          Color(0xff2A62B8),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          8)))),
                                                  onPressed: () {},
                                                  child: Text(
                                                    "Save",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xffFBFBFC),
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
                              child: Text(
                                "Create Your Custom Page",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: screenWidth * .95,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  backgroundColor: Color(0xff2A62B8)),
                              onPressed: () {
                                for (var i = 0; i < check.length; i++) {
                                  if (check[i] == true) {
                                    circi_title = titleControllers[i].text;
                                    amt = amountControllers[i].text;
                                    regs_fee = registrationControllers[i].text;
                                    cir_desc = descControllers[i].text;
                                    prog_name = programName[i]!;
                                    programUid = value.dataList.data!.data![0]
                                        .programs![i].uid;
                                  }
                                }
                                /* Map<String, dynamic> data = {
                                              "service_uid": value.dataList.data!.data![0].serviceUid.toString(),
                                              "program_name": prog_name,
                                              "amount": amt.toString(),
                                              "registrationfee": regs_fee.toString(),
                                              "curriculum_title": circi_title.toString(),
                                              "curriculum_desc": cir_desc.toString()
                                            };
                                          print(data);
                                          myProgramViewViewModel.fetchMyProgramAddListApi(data);*/

                                /*for(int i = 0; i<value.dataList.data!.data![0].programs!.length; i++) {*/
                                Map<String, dynamic> data = {
                                  "service_uid": value
                                      .dataList.data!.data![0].serviceUid
                                      .toString(),
                                  "program_uid": programUid,
                                  "amount": amt.toString(),
                                  "registrationfee": regs_fee.toString(),
                                  "curriculum_title": circi_title.toString(),
                                  "curriculum_desc": cir_desc.toString()
                                };

                                print("data==$data");
                                facilityViewViewModel.updateSingleProgramApi(data, context, value.dataList.data!.data![0].serviceUid
                                        .toString());
                                /* }*/
                              },
                              child: Text("Continue"),
                            ),
                          ),
                        ]);
                  case Status.error:
                    return Center(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          color: Theme.of(context).primaryColorDark,
                          size: 100.0,
                        ),
                        const NoData()
                      ],
                    ));
                }
              })),
        )));
  }

  void generateControllers(int? len) {
    for (var i = 0; i < len!; i++) {
      titleControllers.add(TextEditingController());
      descControllers.add(TextEditingController());
      amountControllers.add(TextEditingController());
      registrationControllers.add(TextEditingController());
    }
  }

  List<Map<String, dynamic>> programListToJson(List<Program> programList) {
    List<Map<String, dynamic>> programJsonList = programList
        .map((program) => {
              'program_name': program.program_name,
              'amount': program.amount,
              'registrationfee': program.registrationfee,
              'curriculum_title': program.curriculum_title,
              'curriculum_desc': program.curriculum_desc,
            })
        .toList();

    return programJsonList;
    //return jsonEncode(programJsonList);
  }

  generateVariable(String? a) {
    check.add(false);
    values.add(a!);
  }
}

class Program {
  final String? program_name;
  String? amount;
  String? registrationfee;
  String? curriculum_title;
  String? curriculum_desc;

  Program({
    this.program_name,
    this.amount = '0',
    this.registrationfee = '0',
    required this.curriculum_title,
    required this.curriculum_desc,
  });
}

// class variable {
//   bool isChecked ;
//   bool isVisible;
//
//   variable({
//   this.isChecked = false ,
//   this.isVisible = false,
// });
// }
