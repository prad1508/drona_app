import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/response/status.dart';
import '../../utils/no_data.dart';
import '../../view_model/myprogram_view_model.dart';

class Add_Program extends StatefulWidget {
  String service;
  String serviceId;
   Add_Program({this.service='' , this.serviceId='',super.key});

  @override
  State<Add_Program> createState() => _Add_ProgramState();
}

bool advance = false;
bool professional = false;

class _Add_ProgramState extends State<Add_Program> {
  MyProgramViewViewModel myProgramViewViewModel = MyProgramViewViewModel();

  @override
  void initState() {
    myProgramViewViewModel.fetchMyProgramListApi(widget.serviceId);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title:  Text('Add Program In ' + widget.service,
            style: TextStyle(color: Colors.black, fontSize: 18)),
        elevation: 0,
      ),
      body: SafeArea(
          child:
          Padding(padding: EdgeInsets.all(20.0),
            child:


          ChangeNotifierProvider<MyProgramViewViewModel>(
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
                return
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: screenHeight * 0.5,
                          child:  ListView.builder(
                             // scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: value.dataList.data?.data![0].programs?.length,
                              itemBuilder: (context, index) {
                                print(value.dataList.data?.data![0].programs![index].amount);
                                return
                                Column(
                                  children: [
                                    const SizedBox(height: 20),
                                    value.dataList.data?.data![0].programs![index].amount != '0' ?
                                    Container(
                                      decoration: BoxDecoration(
                                        // color: Color(0xffeaeff8),
                                          border: Border.all(color: Color(0xffDFE1E4)),
                                          borderRadius: BorderRadius.circular(10)),
                                      width: screenWidth * .95,
                                      child: ExpansionTile(
                                        collapsedBackgroundColor: Color(0xffeaeff8),
                                        backgroundColor: Color(0xffeaeff8).withOpacity(0.4),
                                        title:  Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Text('${value.dataList.data?.data![0].programs![index].programName}', style: TextStyle(
                                                  fontFamily: 'Lato', fontSize: 15)),
                                              Row(
                                                  children: [
                                                    Text('Fees:', style: TextStyle(
                                                        fontFamily: 'Lato',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 15)),
                                                    Text('${value.dataList.data!.data![0].programs?[index].amount}/M', style: TextStyle(
                                                        fontFamily: 'Lato',
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: 15)),
                                                  ]),
                                            ]),
                                        children: [
                                          Padding(padding: EdgeInsets.all(10),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Text("Curriculum / Program Details"),
                                                const SizedBox(
                                                    height: 7
                                                ),
                                                SizedBox(
                                                  height: 50,
                                                  width: screenWidth * .88,
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                        filled: true,
                                                        fillColor: Colors.white,
                                                        hintStyle: TextStyle(
                                                            fontSize: 13,
                                                            fontWeight: FontWeight.normal
                                                        ),
                                                        contentPadding: const EdgeInsets
                                                            .only(left: 8,
                                                            right: 8,
                                                            top: 8,
                                                            bottom: 5),
                                                        hintText: 'High-Performance Coaching',
                                                        border: OutlineInputBorder(
                                                            borderRadius: BorderRadius
                                                                .circular(10),
                                                            borderSide: BorderSide(
                                                                color: Color(0xffDFE1E4)))),
                                                  ),

                                                ),
                                                const SizedBox(
                                                    height: 10
                                                ),

                                                Container(
                                                  //   height: 100,
                                                  width: screenWidth * .88,
                                                  //  decoration: BoxDecoration(border: Border.all(color: Color(0xffDFE1E4)),borderRadius: BorderRadius.circular(10)),
                                                  child:
                                                  TextField(
                                                      maxLines: 5,
                                                      decoration: InputDecoration(
                                                          filled: true,
                                                          fillColor: Colors.white,
                                                          hintStyle: const TextStyle(
                                                              fontSize: 13,
                                                              fontWeight: FontWeight.normal
                                                          ),
                                                          contentPadding: const EdgeInsets
                                                              .only(left: 8,
                                                              right: 8,
                                                              top: 8,
                                                              bottom: 5),
                                                          hintText: "Abc sports management flagship course is geared for professional excellence. Players in this exclusive",
                                                          border: OutlineInputBorder(
                                                              borderRadius: BorderRadius
                                                                  .circular(10),
                                                              borderSide: BorderSide(
                                                                  color: Color(
                                                                      0xffDFE1E4)))),

                                                      style: TextStyle(fontFamily: 'Lato',
                                                          fontWeight: FontWeight.w400,
                                                          fontSize: 14)),

                                                ),
                                                const SizedBox(
                                                    height: 15
                                                ),
                                                Padding(padding: EdgeInsets.only(
                                                    left: 10, right: 10),
                                                  child:  Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Text('Registration Fees:',
                                                          style: TextStyle(
                                                              fontFamily: 'Lato',
                                                              fontWeight: FontWeight.w400)),
                                                      Row(
                                                        children: [
                                                          Text('Fees:', style: TextStyle(
                                                              fontFamily: 'Lato',
                                                              fontWeight: FontWeight.w400)),
                                                          Text('${value.dataList.data?.data![0].programs![index].registrationfee}/M', style: TextStyle(
                                                              fontFamily: 'Lato',
                                                              fontWeight: FontWeight.w400)),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )  :

                                    Row(
                                      children: [
                                        Checkbox(value: professional, onChanged: (value) {
                                          setState(() {
                                            professional = value!;
                                          });
                                        },),
                                        Text('${value.dataList.data?.data![0].programs![index].programName}')
                                      ],
                                    ),
                                    const SizedBox(
                                        height: 5
                                    ),
                                  ],
                                );
                                //Intermediate Box
                              }),
                        ),



                        const SizedBox(
                            height: 50
                        ),
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
                                      child:
                                      AlertDialog(
                                        title: Text(
                                          "Create Custom Program",
                                          style: TextStyle(
                                              color: Colors
                                                  .black,
                                              fontSize:
                                              17,
                                              fontFamily:
                                              'Lato',
                                              fontWeight:
                                              FontWeight.w600),
                                        ),

                                        content:
                                        Align(
                                          alignment:
                                          Alignment
                                              .bottomRight,
                                          child:
                                          TextButton(
                                            child:
                                            Text(
                                              "+ Add More",
                                              style: TextStyle(
                                                  color: Color(
                                                      0xff2A62B8),
                                                  fontSize:
                                                  16,
                                                  fontFamily:
                                                  'Lato',
                                                  fontWeight:
                                                  FontWeight.w700),
                                              textAlign:
                                              TextAlign.center,
                                            ),
                                            onPressed:
                                                () {},
                                          ),
                                        ),
                                        // contentPadding: EdgeInsets.all(24),
                                        actions: [
                                          SizedBox(
                                            width:
                                            135,
                                            height:
                                            48,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: Color(
                                                        0xffDFE1E4),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius
                                                            .all(
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
                                                      fontWeight: FontWeight
                                                          .w600),
                                                )),
                                          ),
                                          Container(
                                            width:
                                            135,
                                            height:
                                            48,
                                            decoration:
                                            BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(8)),
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: Color(
                                                        0xff2A62B8),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius
                                                            .all(
                                                            Radius.circular(
                                                                8)))),
                                                onPressed: () {},
                                                child: Text(
                                                  "Save",
                                                  style: TextStyle(
                                                      color: Color(0xffFBFBFC),
                                                      fontSize: 15,
                                                      fontFamily: 'Lato',
                                                      fontWeight: FontWeight
                                                          .w600),
                                                )),
                                          )
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: Text("Create Your Custom Page",
                              style: TextStyle(color: Colors.black),),
                          ),
                        ),
                        const SizedBox(
                            height: 20
                        ),
                        SizedBox(
                          width: screenWidth * .95,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                backgroundColor: Color(0xff2A62B8)),
                            onPressed: () {},
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
                          color: Theme
                              .of(context)
                              .primaryColorDark,
                          size: 100.0,
                        ),
                        const NoData()
                        // Text(
                        //   value.dataList.message.toString(),
                        //   style: TextStyle(
                        //       color: Theme.of(context).primaryColor,
                        //       fontSize: 20,
                        //       height: 2),
                        // )
                      ],
                    ));
            }
          })


      ),
    )
    )
    );
  }
}
