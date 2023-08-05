// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../data/response/status.dart';
import '../../res/app_url.dart';
import '../../utils/no_data.dart';
import '../../view_model/service_program_view_model.dart';
import '../registeration/choose_facility.dart';
import 'add_program.dart';
import 'edit_facility.dart';
import 'edit_program.dart';

class FacilityProgram extends StatefulWidget {
  String serviceUid;
  FacilityProgram({super.key, required this.serviceUid});

  @override
  State<FacilityProgram> createState() => _FacilityProgramState();
}

class _FacilityProgramState extends State<FacilityProgram> {
  ServiceProgramViewModel serviceProgramViewModel = ServiceProgramViewModel();

  @override
  void initState() {
    print("widget.serviceUid${widget.serviceUid}");
    serviceProgramViewModel.fetchServiceProgramListApi(widget.serviceUid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Service And Program',
            style: TextStyle(color: Colors.black, fontSize: 18)),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: AlwaysScrollableScrollPhysics(),
          child: ChangeNotifierProvider<ServiceProgramViewModel>(
            create: (BuildContext context) => serviceProgramViewModel,
            child: Consumer<ServiceProgramViewModel>(
              builder: (context, value, _) {
                switch (value.dataList.status!) {
                  case Status.loading:
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.teal,
                      ),
                    );
                  case Status.completed:
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromRGBO(223, 225, 228, .5),
                                    ),
                                    child: Image(
                                        height: 25,
                                        width: 25,
                                        image: NetworkImage(
                                            AppUrl.serviceIconEndPoint +
                                                value.dataList.data!
                                                    .serviceIconname)),
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(top: 15)),
                                Text(value.dataList.data!.serviceName)
                              ],
                            ),
                          ),
                          Divider(),
                          SizedBox(height: 20),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Text(
                              "Facility Details",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(height: 30),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 15, bottom: 15),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(251, 251, 252, 1)),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.95,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "${value.dataList.data!.myfacility[0].inputtextname} : ",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(value.dataList.data!
                                                .myfacility[0].inputtextdata),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            Get.to(()=> EditFacility(serviceUid: value.dataList.data!
                                                .myfacility[0].serviceUid, myFacility: value.dataList.data!
                                                .myfacility,));
                                          },

                                          child: SizedBox(
                                              width: 17,
                                              height: 17,
                                              child: Image.asset(
                                                'assets/images/edit_icon.png',
                                                color: Color(0xff99A0AB),
                                              )),
                                        ),
                                      ]),
                                  SizedBox(height: 15),
                                  Text(
                                    value.dataList.data!.myfacility[0]
                                        .checkboxwithselectoptionname,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: h * 0.05,
                                        width: w * 0.9,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: value
                                              .dataList
                                              .data!
                                              .myfacility[0]
                                              .checkboxwithselectoption
                                              .length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Container(
                                              height: 20,
                                              width: w * 0.2,
                                              margin: EdgeInsets.all(5),
                                              padding: EdgeInsets.only(
                                                  left: 5, right: 5),
                                              decoration: BoxDecoration(
                                                  //color: Colors.green,
                                                  color: Color(0xffEAEFF8),
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Center(
                                                    child: Text(
                                                      "${value.dataList.data!.myfacility[0].checkboxwithselectoption[index].name} : ",
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff2A62B8),
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    " ${value.dataList.data!.myfacility[0].checkboxwithselectoption[index].quantity}",
                                                    style: TextStyle(
                                                      color: Color(0xff2A62B8),
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 10,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    "Others",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: h * 0.05,
                                        width: w * 0.9,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: value.dataList.data!
                                              .myfacility[0].other.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Container(
                                              height: 20,
                                              width: w * 0.2,
                                              margin: EdgeInsets.all(5),
                                              padding: EdgeInsets.only(
                                                  left: 5, right: 5),
                                              decoration: BoxDecoration(
                                                  //color: Colors.green,
                                                  color: Color(0xffEAEFF8),
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              child: Center(
                                                child: Text(
                                                  value
                                                      .dataList
                                                      .data!
                                                      .myfacility[0]
                                                      .other[index]
                                                      .name,
                                                  style: TextStyle(
                                                    color: Color(0xff2A62B8),
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 20,),

                                  Text("Gallery"),

                                  Row(
                                    mainAxisAlignment:MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: h*0.1,
                                        width: w*0.9,
                                        child: ListView.builder(
                                            shrinkWrap: true,

                                            scrollDirection: Axis.horizontal,
                                          itemCount: value.dataList.data!.myfacility[0].images.length,
                                            itemBuilder: (context, index){
                                            return Container(
                                              height: 50,
                                                width: 50,
                                              margin: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                               // color: Colors.red,
                                                image: DecorationImage(
                                                  fit: BoxFit.contain,
                                                    image: NetworkImage(

                                                        AppUrl.facilityGalleryImageEndPoint+value.dataList.data!.myfacility[0].images[index]))

                                              ),
                                                
                                              );
                                            }),
                                      )

                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Divider(),
                          SizedBox(height: 10),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children:  [
                                Text(
                                  "Program Details",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Get.to(()=> Add_Program(service: value.dataList.data!.serviceName, serviceId: widget.serviceUid ,));
                                  },
                                  icon: Icon(Icons.add,color: Colors.black,),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            height: h*0.4,
                            width: w,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: value.dataList.data!.myprogram.length,
                                itemBuilder: (BuildContext context, int index) {
                              return Container(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20.0, top: 15, bottom: 15),
                                decoration: BoxDecoration(
                                    //color: Color.fromRGBO(251, 251, 252, 1),
                                    //color: Colors.red
                                    ),
                                child: SizedBox(
                                  height: h*0.5,
                                  width: MediaQuery.of(context).size.width * 0.95,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 5.0),
                                    child:
                                    ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: value.dataList.data!.myprogram[index].programs.length,
                                      itemBuilder: (BuildContext context, int int) {
                                        return  Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("${value.dataList.data!.myprogram[index].programs[int].programName} (${value.dataList.data!.myprogram[index].name})"),
                                                GestureDetector(
                                                  onTap: (){
                                                    Get.to(()=> Edit_Program(programs: value.dataList.data!.myprogram[index].programs, serviceUid: widget.serviceUid,index: index, index2: int,));
                                                  },
                                                  child: SizedBox(
                                                      width: 17,
                                                      height: 17,
                                                      child: Image.asset(
                                                        'assets/images/edit_icon.png',
                                                        color: Color(0xff99A0AB),
                                                      )),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              "Curriculum / Program Details",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              value.dataList.data!.myprogram[index].programs[int].curriculumTitle,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xff626D7E)),
                                            ),
                                            SizedBox(height: 10),
                                            RichText(
                                              text: TextSpan(children:  [
                                                TextSpan(
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w500,
                                                        color: Color(0xff626D7E)),
                                                    text:
                                                    value.dataList.data!.myprogram[index].programs[int].curriculumDesc),
                                                /*TextSpan(
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w500,
                                                        color: Color(0xff2A62B8)),
                                                    text: 'View More..'),*/
                                              ]),
                                            ),
                                            SizedBox(height: 10),
                                            Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Program Fee"),
                                                    SizedBox(height: 10),
                                                    Container(
                                                      height: 20,
                                                      padding: EdgeInsets.only(
                                                          left: 5, right: 5),
                                                      decoration: BoxDecoration(
                                                          color: Color(0xffEAEFF8),
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              4)),
                                                      child: Center(
                                                        child: Text(
                                                          "₹${value.dataList.data!.myprogram[index].programs[int].amount}/m",
                                                          style: TextStyle(
                                                            color: Color(0xff2A62B8),
                                                            fontStyle:
                                                            FontStyle.normal,
                                                            fontWeight:
                                                            FontWeight.w400,
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                    padding:
                                                    EdgeInsets.only(left: 120)),
                                                Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Registration Fee"),
                                                    SizedBox(height: 10),
                                                    Container(
                                                      height: 20,
                                                      padding: EdgeInsets.only(
                                                          left: 5, right: 5),
                                                      decoration: BoxDecoration(
                                                          color: Color(0xffEAEFF8),
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              4)),
                                                      child: Center(
                                                        child: Text(
                                                          "₹${value.dataList.data!.myprogram[index].programs[int].registrationfee}/m",
                                                          style: TextStyle(
                                                            color: Color(0xff2A62B8),
                                                            fontStyle:
                                                            FontStyle.normal,
                                                            fontWeight:
                                                            FontWeight.w400,
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                           /* SizedBox(height: 10),
                                            Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Total Batch"),
                                                    SizedBox(height: 10),
                                                    Container(
                                                      height: 20,
                                                      padding: EdgeInsets.only(
                                                          left: 5, right: 5),
                                                      decoration: BoxDecoration(
                                                          color: Color(0xffEAEFF8),
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              4)),
                                                      child: Center(
                                                        child: Text(
                                                          "12",
                                                          style: TextStyle(
                                                            color: Color(0xff2A62B8),
                                                            fontStyle:
                                                            FontStyle.normal,
                                                            fontWeight:
                                                            FontWeight.w400,
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                    padding:
                                                    EdgeInsets.only(left: 130)),
                                                Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Total Trainee"),
                                                    SizedBox(height: 10),
                                                    Container(
                                                      height: 20,
                                                      padding: EdgeInsets.only(
                                                          left: 5, right: 5),
                                                      decoration: BoxDecoration(
                                                          color: Color(0xffEAEFF8),
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              4)),
                                                      child: Center(
                                                        child: Text(
                                                          "50",
                                                          style: TextStyle(
                                                            color: Color(0xff2A62B8),
                                                            fontStyle:
                                                            FontStyle.normal,
                                                            fontWeight:
                                                            FontWeight.w400,
                                                            fontSize: 10,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),*/
                                            SizedBox(height: 35),

                                            Divider(thickness: 2,),
                                            SizedBox(height: 80),
                                          ],
                                        );

                                      },

                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                          Divider(),
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
              },
            ),
          ),
        ),
      ),
    );
  }
}
