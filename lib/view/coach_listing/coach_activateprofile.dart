import 'package:cached_network_image/cached_network_image.dart';
import 'package:drona/data/response/status.dart';
import 'package:drona/res/app_url.dart';
import 'package:drona/res/widget/round_button.dart';
import 'package:drona/utils/no_data.dart';
import 'package:drona/view/coach_listing/coach_activateNumber.dart';
import 'package:drona/view_model/trainee_view_model.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../model/coach_list_model.dart';
import '../../utils/color.dart';
import '../../utils/utils.dart';
import '../../view_model/academy_view_model.dart';
import '../../view_model/coachlist_view_model.dart';
import '../../view_model/myprogram_view_model.dart';
import '../../view_model/myservices_view_model.dart';
import '../../view_model/program_view_model.dart';

class CoachActivateProfile extends StatefulWidget {
  int index;
  String coachProfileUid;
  List<CoachData> coachList;

  CoachActivateProfile(
      {super.key,
      required this.index,
      required this.coachProfileUid,
      required this.coachList});

  @override
  State<CoachActivateProfile> createState() => _CoachActivateProfileState();
}

class _CoachActivateProfileState extends State<CoachActivateProfile> {
  CoachlistViewViewModel coachlistViewViewModel = CoachlistViewViewModel();

  MyservicesViewViewModel myServicesViewViewModel = MyservicesViewViewModel();
  ProgramViewViewModel programViewViewModel = ProgramViewViewModel();
  late Map<String, dynamic> data;

  MyProgramViewViewModel myProgramViewViewModel = MyProgramViewViewModel();

  AcademyViewViewModel academyViewViewModel = AcademyViewViewModel();
  @override
  void initState() {
    data = {"filter_batch_uid": "", "search": ""};
    myServicesViewViewModel.fetchMyservicesListApi();
    academyViewViewModel.fetchAcademyListApi();

    // TODO: implement initState
    super.initState();
  }

  List activeServiceValue = [];
  List<DropdownMenuItem<String>> activeServices = [];
  final TextEditingController fees = TextEditingController();
  TextEditingController tDateController = TextEditingController();

  String? selectedService;
  var _refresh = false;
  assignSeviceId(selectedvalue) {
    if (_refresh == true) {
      myProgramViewViewModel.fetchMyProgramListApi(selectedService);
    }
    selectedService = selectedService;
    _refresh = false;
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

  List<String> serviceSelected = [];
  late String catUid;
  late String userUid;

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
          'Activate',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
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
                        child: CircleAvatar(
                            backgroundColor: Colors.black,
                            child: CachedNetworkImage(
                                fit: BoxFit.contain,
                                imageUrl: AppUrl.ouserProfileimgListEndPoint +
                                    widget.coachList[widget.index].img,
                                errorWidget: (context, url, error) =>
                                    // Image.asset("assets/images/user.png")
                                    const Icon(
                                      Icons.person,
                                      size: 30,
                                      color: Colors.white,
                                    ))
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.coachList[widget.index].name,
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                widget.coachList[widget.index].joinStatus ==
                                        "not_onboarded"
                                    ? "Not Onboarded"
                                    : "Onboarded",
                                style: TextStyle(
                                    color: widget.coachList[widget.index]
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  widget.coachList[widget.index].gender,
                                  style: TextStyle(fontSize: 12),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "|",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                //Text("Dob :"),
                                Text(
                                  widget.coachList[widget.index].dob,
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
              // SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(top: 12.0, left: 22.0, right: 26.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Services",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w600,
                          color: Color(0xff39404A)),
                    ),
                    SizedBox(height: h * 0.02),
                    Container(
                      padding: const EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: const Color.fromARGB(255, 218, 216, 216)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                      ),
                      child: ChangeNotifierProvider<AcademyViewViewModel>(
                          create: (context) => academyViewViewModel,
                          child: Consumer<AcademyViewViewModel>(
                              builder: (context, value, child) {
                            activeServiceValue.clear();
                            activeServices.clear();
// print(value.dataList.data!.services![0].status);
                            if (value.dataList.data != null) {
                              print(value.dataList.data?.services);
                              for (var i = 0;
                                  i < value.dataList.data!.services.length;
                                  i++) {
                                print(value.dataList.data!.services[i].status);
                                if (value.dataList.data!.services[i].status
                                        .toString() ==
                                    'active') {
                                  activeServiceValue.add(value
                                      .dataList.data!.services[i].uid
                                      .toString());
                                  activeServices.add(DropdownMenuItem(
                                      value: value
                                          .dataList.data!.services[i].uid
                                          .toString(),
                                      child: Text(value.dataList.data!
                                          .services[i].serviceName
                                          .toString())));
                                }
                              }
                            }
                            value.dataList.data == null
                                ? null
                                : assignSeviceId(activeServiceValue[0]);
                            return DropdownButton(
                                isExpanded: true,
                                underline: DropdownButtonHideUnderline(
                                    child: Container()),
                                value: selectedService,
                                hint: const Text("Choose Your Service"),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedService = newValue!;
                                    _refresh = true;
                                  });
                                },
                                items: activeServices);
                          })),
                    ),
                    SizedBox(height: h * 0.02),

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
                    Container(
                      //color: Colors.black,
                      width: w,
                      height: 41,
                      child: Row(
                        children: [
                          Container(
                            width: w * 0.065,
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
                                  hintText: widget
                                      .coachList[widget.index].salaryMonthly
                                      .toString(),
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
                      width: w,
                      height: 48,
                      child: TextFormField(
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
                          DateTime firstDate = DateTime(now.year, now.month);
                          var date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: firstDate,
                            lastDate: DateTime.now().add(Duration(days: 90)),
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
                                              "Please Confirm Activation Of \n${widget.coachList[widget.index].name}",
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
                                                if (tDateController.text ==
                                                    "") {
                                                  Utils.flushBarErrorMessage(
                                                      "Please select Activation Date",
                                                      context);
                                                  // setState(() {});
                                                } else {
                                                  //autoValidateMode = AutovalidateMode.disabled;
                                                  Map<String, dynamic> data = {
                                                    "coach_profile_uid": widget
                                                        .coachList[widget.index]
                                                        .uid,
                                                    "service_uid":
                                                        selectedService,
                                                    "salary": fees.text.isEmpty
                                                        ? widget
                                                            .coachList[
                                                                widget.index]
                                                            .salaryMonthly
                                                        : fees.text,
                                                    "activate_date":
                                                        tDateController.text
                                                  };
                                                  print("data$data");

                                                  coachlistViewViewModel
                                                      .activateCoachListApi(
                                                          data, context);
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
