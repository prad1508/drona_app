import 'package:cached_network_image/cached_network_image.dart';
import 'package:drona/data/response/status.dart';
import 'package:drona/res/app_url.dart';
import 'package:drona/res/widget/round_button.dart';
import 'package:drona/utils/no_data.dart';
import 'package:drona/view/batch_listing/editprofile_details.dart';
import 'package:drona/view_model/trainee_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../model/coach_list_model.dart';
import '../../utils/color.dart';
import '../../utils/utils.dart';
import '../../view_model/coachlist_view_model.dart';
import '../../view_model/myservices_view_model.dart';
import '../../view_model/program_view_model.dart';

class CoachDeactivateProfile extends StatefulWidget {
  String coachProfileUid;
  int index;
  List<CoachData> coachList;
   CoachDeactivateProfile({super.key, required this.index, required this.coachList, required this.coachProfileUid});


  @override
  State<CoachDeactivateProfile> createState() => _CoachDeactivateProfileState();
}

class _CoachDeactivateProfileState extends State<CoachDeactivateProfile> {
  CoachlistViewViewModel coachlistViewViewModel = CoachlistViewViewModel();


  TextEditingController dob = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  //Getting initials if no image
  String getInitials(String name) {
    List<String> nameParts = name.split(' ');
    if (nameParts.length > 1) {
      return nameParts[0][0].toUpperCase() + nameParts[1][0].toUpperCase();
    } else if (nameParts.length == 1) {
      String firstName = nameParts[0];
      if (firstName.length >= 2) {
        return firstName.substring(0, 2).toUpperCase();
      } else {
        return firstName[0].toUpperCase();
      }
    } else {
      return '';
    }
  }

  List serviceList = [];
  List<String> serviceSelected = [];
  late String catUid;
  late String userUid;
  final List<int> _selectedItems = <int>[];
  TextEditingController tDateController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Deactivate',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: const Icon(Icons.edit, color: Colors.black),
                onPressed: () {
                  Get.to(
                      () => EditProfileDetails(
                            index: widget.index,
                          ),
                      transition: Transition.leftToRight);
                },
              ))
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body:  Column(
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
                              imageUrl: AppUrl.ouserProfileimgListEndPoint +widget.coachList[widget.index].img,
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
                              widget.coachList[widget.index]
                                  .name,
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              widget.coachList[widget.index]
                                  .joinStatus ==
                                  "not_onboarded"
                                  ? "Not Onboarded"
                                  : "Onboarded",
                              style: TextStyle(
                                  color: widget
                                      .coachList[
                                  widget.index]
                                      .joinStatus ==
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
                                widget.coachList[widget.index]
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
                                    .coachList[widget.index].dob,
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
                     /* child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            AppUrl.serviceIconEndPoint +
                                widget.coachList[widget.index]
                                    .serviceicon),
                        backgroundColor: Colors.white,
                      ),*/
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "₹${widget.coachList[widget.index].salaryMonthly}",
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
                            ),
                          /*  SizedBox(height: 4),
                            Text(
                              "Due on ${widget.coachList[widget.index].}",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey),
                            )*/
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
                        'Deactivation Date',
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
                                        "Deactivate",
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
                                              "Please Confirm Deactivation Of\n ${widget.coachList[widget.index].name}!",
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
                                                    "coach_profile_uid":widget.coachProfileUid,
                                                    "deactivate_date":tDateController.text};
                                                  print("data==$data");
                                                  coachlistViewViewModel.deActivateCoachListApi(data, context);

                                                }
                                              },
                                              child: const Text(
                                                "Confirm",
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
                          child: const Text(
                            "Submit",
                            style: TextStyle(fontSize: 15, fontFamily: 'Lato'),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ])
    );
  }
}
