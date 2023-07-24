// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:cached_network_image/cached_network_image.dart';
import 'package:drona/res/widget/datefield.dart';
import 'package:drona/utils/utils.dart';
import 'package:drona/view/dashboard/layout.dart';
import 'package:drona/view/trainee_listing/deactivate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import '../../model/trainee_list_model.dart';
import '../../res/app_url.dart';
import 'package:intl/intl.dart';

import '../../view_model/trainee_view_model.dart';
import '../batch_listing/trainee_list.dart';
import 'add_trainee_list.dart';



class Activate_Page extends StatefulWidget {
  String traineeProfileUid;
  int index;
  List<Datum> traineeList;
   Activate_Page({super.key, required this.traineeProfileUid, required this.index, required this.traineeList});

  @override
  State<Activate_Page> createState() => _Activate_PageState();
}

class _Activate_PageState extends State<Activate_Page> {


  TraineeViewModel traineeViewModel = TraineeViewModel();

  final TextEditingController contact = TextEditingController();

  final TextEditingController fees = TextEditingController();
   TextEditingController tDateController = TextEditingController();

  List<DropdownMenuItem<String>> get sportsItem {
    List<DropdownMenuItem<String>> serviceDetails = [
      DropdownMenuItem(value: "Tennis", child: Text("Tennis")),
      DropdownMenuItem(value: "Golf", child: Text("Golf")),
    ];
    return serviceDetails;
  }

  List<DropdownMenuItem<String>> get batchTime {
    List<DropdownMenuItem<String>> sportsTiming = [
      DropdownMenuItem(
          value: "Tennis Batch Morning", child: Text("Tennis Batch Morning")),
      DropdownMenuItem(
          value: "Golf Batch Morning", child: Text("Golf Batch Morning")),
      DropdownMenuItem(
          value: "Tennis Batch Evening", child: Text("Tennis Batch Evening")),
      DropdownMenuItem(
          value: "Golf Batch Evening", child: Text("Golf Batch Evening")),
    ];
    return sportsTiming;
  }

  String selectedItem = 'Tennis';
  String selectedTiming = "Tennis Batch Morning";

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Activate',
          style: TextStyle(
              fontSize: 18,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w700,
              color: Color(0xff39404A)),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
//color: Colors.grey,
                width: w,
                height: h * 0.08,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
//Profile Image;
                      SizedBox(
                        height: h * 0.05,
                        width: w * 0.05,
                        child:  CircleAvatar(
                            backgroundColor: Colors.black,
                            child: CachedNetworkImage(
                                fit: BoxFit.contain,
                                imageUrl: AppUrl.ouserProfileimgListEndPoint +widget.traineeList[widget.index].image,
                                errorWidget: (context, url, error) =>
                                // Image.asset("assets/images/user.png")
                                const Icon(Icons.person,size: 30,color: Colors.white,)


                            )
                          /* Text(
                                  getInitials(widget
                                      .traineeList[widget.index].traineeName),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),*/
                          // backgroundImage: getInitials(value.dataList.data!.data[index].traineeName),
                        ),
                      ),
//SizedBox(width: w*0.05,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.traineeList[widget.index]
                                    .traineeName,
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                widget.traineeList[widget.index]
                                    .join_status ==
                                    "not_onboarded"
                                    ? "Not Onboarded"
                                    : "Onboarded",
                                style: TextStyle(
                                    color: widget
                                        .traineeList[
                                    widget.index]
                                        .join_status ==
                                        "not_onboarded"
                                        ? Colors.red
                                        : Colors.green,
                                    fontSize: 10),
                              ),
                            ],
                          ),
//Gender and Age;
                          SizedBox(
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              children: [
                                Text(
                                  widget.traineeList[widget.index]
                                      .gender,
                                  style: TextStyle(fontSize: 12),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "|",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                //Text("Dob :"),
                                Text(
                                  widget
                                      .traineeList[widget.index].dob,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        width: 35,
                        height: 35,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              AppUrl.serviceIconEndPoint +
                                  widget.traineeList[widget.index]
                                      .serviceicon),
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(height: 20),
              Padding(
                padding:
                     EdgeInsets.only(top: 12.0, left: 22.0, right: 26.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   /* Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Phone Number",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w600,
                              color: Color(0xff39404A)),
                        ),
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              "Change",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffFD685D)),
                            ),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),

                    SizedBox(height: 4),
                    SizedBox(
                        width: 342,
                        height: 48,
                        child: TextField(
                          style: TextStyle(fontSize: 14),
                          controller: contact,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: '+91-999 999 9999',
                              contentPadding: EdgeInsets.all(15),
                              hintStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              fillColor: Colors.grey.shade300),
                        )),
                    //Service selected;
                    SizedBox(height: 16),*/
                    Text(
                      "Service",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w600,
                          color: Color(0xff39404A)),
                    ),
                    SizedBox(height: 4),
                    Container(
                        width: 342,
                        height: 48,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(widget.traineeList[widget.index].serviceName)
                       /* InputDecorator(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff39404A)),
                                  icon: Icon(Icons.expand_more,
                                      size: Checkbox.width),
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
                          fontSize: 14,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w600,
                          color: Color(0xff39404A)),
                    ),
                    SizedBox(height: 4),
                    Container(
                        width: 342,
                        height: 48,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(8)),
                        child:Text(widget.traineeList[widget.index].batchname)
                      /*InputDecorator(
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(5),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff39404A)),
                                  icon: Icon(Icons.expand_more,
                                      size: Checkbox.width),
                                  isExpanded: true,
                                  value: selectedTiming,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedTiming = newValue!;
                                    });
                                  },
                                  items: batchTime),
                            ))*/
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Fees/Month",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w600,
                          color: Color(0xff39404A)),
                    ),
                    SizedBox(height: 4),
                    //Fees Selected;
                    SizedBox(
                      width: 342,
                      height: 41,
                      child: Row(
                        children: [
                          Container(
                            width: 51,
                            height: 41,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8),
                                    topLeft: Radius.circular(8)),
                                color: Color(0xff2A62B8)),
                            child: Center(
                              child: Text(
                                "₹/M",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xffFBFBFC)),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.74,
                            height: 41,
                            child: Center(
                              child: TextField(
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff121417)),
                                controller: fees,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: widget.traineeList[widget.index].fees.toString(),
                                  contentPadding: EdgeInsets.only(
                                      left: 15, top: 15, bottom: 15),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xff2A62B8)),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(8),
                                          bottomRight: Radius.circular(8))),
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xff2A62B8)),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(8),
                                        bottomRight: Radius.circular(8)),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Activation Date",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w600,
                          color: Color(0xff39404A)),
                    ),
                    SizedBox(height: 4),
                    SizedBox(
                      width: 342,
                      height: 48,
                      child:TextFormField(
                       /* autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == "") {
                            return "Please select Activation Date";
                          } else {
                            return null;
                          }
                        },
                        readOnly: true,*/
                        controller: tDateController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(
                            Icons.calendar_month,
                            size: 30.0,
                          ),
                          hintText: '01-01-2023',
                          contentPadding: const EdgeInsets.all(5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        onTap: () async {
                          DateTime now = DateTime.now();
                          DateTime firstDate =
                          DateTime(now.year, now.month);
                          var date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: firstDate,
                            lastDate:
                            DateTime.now().add(Duration(days: 90)),
                          );
                          if (date != null) {
                            tDateController.text =
                                DateFormat('dd-MM-yyyy').format(date);
                          }
                        },
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.26),
                    SizedBox(
                      width: 400,
                      height: 45,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              backgroundColor: Color(0xff2A62B8)),
                          onPressed: () {
                            //Activation DialogBox;
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return SizedBox(
                                    width: 400,
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
                                        "Activate",
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
                                              "Please Confirm Activation Of \n${widget.traineeList[widget.index].traineeName}",
                                              style: TextStyle(
                                                  color: Color(0xff626D7E),
                                                  fontSize: 16,
                                                  fontFamily: 'Lato',
                                                  fontWeight: FontWeight.w600),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ]),
                                      // contentPadding: EdgeInsets.all(24),
                                      actions: [
                                        SizedBox(
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
                                               // bool checkValidation = formKey.currentState!.validate();
                                                if (tDateController.text == "") {
                                                  Utils.flushBarErrorMessage("Please select Activation Date", context);
                                                  // setState(() {});
                                                } else {
                                                  //autoValidateMode = AutovalidateMode.disabled;
                                                  Map<String, dynamic> data = {
                                                    "batch_uid":widget.traineeList[widget.index].batchUid,
                                                    "trainee_profile_uid":widget.traineeList[widget.index].traineeProfileUid,
                                                    "fees":widget.traineeList[widget.index].fees.toInt(),
                                                    "activate_date": tDateController.text
                                                  };
                                                  print("data$data");
                                                  traineeViewModel.TraineeActivateApi(data).then((value) {
                                                    Get.to(() => Layout(selectedIndex: 3),transition: Transition.rightToLeft);
                                                    Navigator.of(context).pop();
                                                  });
                                                }



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
                            style: TextStyle(fontSize: 15, fontFamily: 'Lato'),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
