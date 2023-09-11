// ignore_for_file: prefer_const_constructors
import 'package:cached_network_image/cached_network_image.dart';
import 'package:drona/res/widget/customradio.dart';
import 'package:drona/view/batch_listing/trainee_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../data/response/status.dart';
import '../../res/app_url.dart';
import '../../res/language/language.dart';
import '../../utils/utils.dart';
import '../../view_model/trainee_view_model.dart';
import '../../model/trainee_list_model.dart';
import '../dashboard/layout.dart';
import 'add_trainee_list.dart';


class Deactivate_Page extends StatefulWidget {
  String traineeProfileUid;
  int index;
  List<Datum> traineeList;
   Deactivate_Page({super.key,required this.traineeProfileUid, required this.index, required this.traineeList});

  @override
  State<Deactivate_Page> createState() => _Deactivate_PageState();
}

class _Deactivate_PageState extends State<Deactivate_Page> {
  TraineeViewModel traineeViewModel = TraineeViewModel();



  List<String> PayMode = ["Pay", "Won't Pay"];
  String name = "Riyaz mohammed";
  String? ModePayment = 'p';
  ValueChanged<String?> Mode() {
    return (value) => setState(() {
      ModePayment = value!;
      print("ModePayment$ModePayment");
    }
    );
  }

  Map<String, dynamic> data = {};
  int pageCount = 10;
  int pageNo = 1;
  TextEditingController tDateController = TextEditingController();


  @override
  void initState() {
    traineeViewModel.fetchLedgerListSearchApi(
        {"trainee_profile_uid": widget.traineeProfileUid}, pageCount, pageNo);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title:  Text(
            AppLocale.deactivate.getString(context),
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700)),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: ChangeNotifierProvider<TraineeViewModel>(
          create: (context) => traineeViewModel,
          child: Consumer<TraineeViewModel>(
            builder: (context, value, _) {
              switch (value.dataList1.status!) {
                case Status.loading:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case Status.completed:
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
//color: Colors.grey,
                          width: w,
                          height: h * 0.08,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
//Profile Image;
                                SizedBox(
                                  height: h * 0.05,
                                  width: w * 0.1,
                                  child:   CircleAvatar(
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
                                              ? AppLocale.notOnboarded.getString(context)
                                              : AppLocale.onboarded.getString(context),
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
                                         // Text("Dob :"),
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
// SizedBox(height: h * 0.005),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Card(
                            color: Colors.grey.shade50,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: SizedBox(
                              width: w,
                              height: h * 0.08,
                              child: Column(children: [
                                Center(
                                  child: Container(
                                    width: w * 0.85,
                                    height: h * 0.08,
                                    decoration: BoxDecoration(
//color: Colors.grey
                                        ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                         "₹${widget.traineeList[widget.index].fees}",
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(
                                              height: 25,
                                              width: 25,
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    Color(0xff173564),
                                                child: Icon(
                                                  Icons.currency_rupee,
                                                  color: Colors.white,
                                                  size: 15,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          //"Due on ${widget.traineeList[widget.index].monthOfBilling}",
                                          AppLocale.dueOn.getString(context).trParams({"key":widget.traineeList[widget.index].monthOfBilling}),
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ), // SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 12.0, left: 22.0, right: 26.0),
                          child: SizedBox(
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    AppLocale.dueAmountPaid.getString(context),
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff39404A)),
                                  ),
                                ),
                                SizedBox(height: 4),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: 163,
                                      height: 48,
                                      child: CustomRadio<String>(
                                          value: 'p',
                                          label: PayMode[0],
                                          groupValue: ModePayment,
                                          onChanged: Mode(),
                                          btnColor: Colors.black),
                                    ),
                                    SizedBox(width: 8),
                                    SizedBox(
                                      width: 163,
                                      height: 48,
                                      child: CustomRadio<String>(
                                          value: 'w',
                                          label: PayMode[1],
                                          groupValue: ModePayment,
                                          onChanged: Mode(),
                                          btnColor: Colors.black),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 30),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    AppLocale.deactivationDate.getString(context),
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff39404A)),
                                  ),
                                ),
                                SizedBox(height: 5),
                                SizedBox(
                                  width: 344,
                                  height: 48,
                                  child:TextFormField(
                                    readOnly: true,
                                    controller: tDateController,
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                      suffixIcon: const Icon(
                                        Icons.calendar_month,
                                        size: 30.0,
                                      ),
                                      hintText: '${AppLocale.eg.getString(context)}. 01-01-2023',
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
                                  )
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.42),

                                SizedBox(
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
                                                height: 300,
                                                child: AlertDialog(
                                                  icon: SizedBox(
                                                    width: 44,
                                                    height: 44,
                                                    child: CircleAvatar(
                                                      backgroundColor: Colors.yellow.shade700,
                                                      child: Icon(
                                                        Icons.priority_high,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  title: Text(
                                                    AppLocale.deactivate.getString(context),
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
                                                        height: 60,
                                                        child: Text(
                                                          //"Please Confirm Deactivation Of\n ${widget.traineeList[widget.index].traineeName}!",
                                                          AppLocale.deactivationConfirmation.getString(context).trParams({"key":widget.traineeList[widget.index].traineeName}),
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
                                                                      Radius.circular(8)))),
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                          },
                                                          child:  Text(
                                                            AppLocale.cancel.getString(context),
                                                            style: TextStyle(
                                                                color: Color(0xff23282E),
                                                                fontSize: 15,
                                                                fontFamily: 'Lato',
                                                                fontWeight: FontWeight.w600),
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
                                                              shape:
                                                              const RoundedRectangleBorder(
                                                                  borderRadius:
                                                                  BorderRadius.all(
                                                                      Radius.circular(
                                                                          8)))),
                                                          onPressed: () {
                                                            if (tDateController.text == "") {
                                                              Utils.flushBarErrorMessage("Please select DeActivation Date", context);
                                                              // setState(() {});
                                                            }else{

                                                            Map<String, dynamic> data = {
                                                              "batch_uid":widget.traineeList[widget.index].batchUid,
                                                              "trainee_profile_uid":widget.traineeList[widget.index].traineeProfileUid,
                                                              "due_amount_pay":ModePayment == "p" ? true : false,
                                                              "deactivate_date":tDateController.text};
                                                            print("data==$data");
                                                            traineeViewModel.TraineeDeActivateApi(
                                                                data)
                                                                .then((value) {
                                                                  Get.to(() =>  Layout(selectedIndex: 3),transition: Transition.rightToLeft);
                                                              Navigator.of(context).pop();


                                                            });
                                                          }
                                                            },
                                                          child:  Text(
                                                            AppLocale.confirm.getString(context),
                                                            style: TextStyle(
                                                                color: Color(0xffFBFBFC),
                                                                fontSize: 15,
                                                                fontFamily: 'Lato',
                                                                fontWeight: FontWeight.w600),
                                                          )),
                                                    )
                                                  ],
                                                ),
                                              );
                                            });
                                      },
                                      child:  Text(
                                        AppLocale.submit.getString(context),
                                        style: TextStyle(fontSize: 15, fontFamily: 'Lato'),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]);

                case Status.error:
                  return Center(child: Text(AppLocale.noData.getString(context),
                  ));
              }
            },
          ),
        ),
      ),
    );
  }
}
