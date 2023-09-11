import 'dart:io';

import 'package:drona/res/language/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import '../../res/widget/customradio.dart';
import '../../res/widget/round_button.dart';
import '../../res/widget/textcheckbox.dart';
import '../../view_model/academy_view_model.dart';
import '../../view_model/batch_view_model.dart';
import '../../view_model/coachlist_view_model.dart';
import '../../view_model/myprogram_view_model.dart';
import '../profile/create_profile.dart';

class CreateBatchListing extends StatefulWidget {
  String pathPage;
  CreateBatchListing({this.pathPage = '', super.key});

  @override
  State<CreateBatchListing> createState() => _CreateBatchListingState();
}

class _CreateBatchListingState extends State<CreateBatchListing> {
  List<DropdownMenuItem<String>>? _dropdownItem;

  //custom radio
  // custum radio call in seprate page
  String? _programUid;
  String? _programid;
  String? _programName;
  String? _feesamount;

  ValueChanged<String?> _valueChangedHandler(value) {
    return (value) => setState(() => _programUid = value!);
  }

  ValueChanged<String?> _nameChangedHandler(value) {
    return (value) => setState(() {
          print(value);
          _programName = value;
        });
  }

  String? _groupBatch = 'group';

  ValueChanged<String?> _valueChangedBatch() {
    return (value) => setState(() => _groupBatch = value!);
  }

  bool value = false;
  bool agree = true;

  final TextEditingController batchName = TextEditingController();
  final TextEditingController batchTo = TextEditingController();
  final TextEditingController batchFrom = TextEditingController();
  final TextEditingController fee = TextEditingController();
  final TextEditingController onlineUrl = TextEditingController();

  Future<bool> isValidPasscode(String value) async {
    return await Future.delayed(const Duration(seconds: 1),
        () => value.isNotEmpty && value.toLowerCase() == 'batman');
  }

  String selectedCategory = 'Tennis';
  String selectedAssignCoach = 'john';

  //batch days
  bool mon = false;
  bool tue = false;
  bool wed = false;
  bool thu = false;
  bool fri = false;
  bool sat = false;
  bool sun = false;
  List batchDays = [];
  String profileUid = "";
  bool onlineSession = false;
  AcademyViewViewModel academyViewViewModel = AcademyViewViewModel();
  CoachlistViewViewModel coachlistViewViewModel = CoachlistViewViewModel();
  MyProgramViewViewModel myProgramViewViewModel = MyProgramViewViewModel();
  BatchViewViewModel batchViewViewModel = BatchViewViewModel();
  Map<String, dynamic> data = {"search": ""};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    academyViewViewModel.fetchAcademyListApi();
    coachlistViewViewModel.fetchCoachlistApi(data);
  }

  @override
  void dispose() {
    super.dispose();
    batchName.dispose();
    batchFrom.dispose();
    batchTo.dispose();
    fee.dispose();
    onlineUrl.dispose();
  }

  String batchFromdata = '';
  String batchTodata = '';
  List activeServiceValue = [];
  List<DropdownMenuItem<String>> activeServices = [];

  selectTimeFrom() async {
    var timepick = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    setState(() {
      batchFromdata = timepick!.format(context);
    });
  }

  selectTimeTo() async {
    var timepick = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    setState(() {
      batchTodata = timepick!.format(context);
    });
  }

  String? selectedService;
  var _refresh = false;

  assignSeviceId(selectedvalue) {
    if (_refresh == true) {
      myProgramViewViewModel.fetchMyProgramListApi(selectedService);
    }
    selectedService = selectedService;
    _refresh = false;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final batch = Provider.of<BatchViewViewModel>(context);
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          leading: widget.pathPage == "dashBoard"
              ? IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.of(context).pop(),
                )
              : null,
          title: Text(
            AppLocale.createBatch.getString(context),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Material(
            color: Colors.white,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        AppLocale.serviceText.getString(context),
                        style: Theme.of(context).textTheme.bodyMedium,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: const Color.fromARGB(255, 218, 216, 216)),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
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
                                i < value.dataList.data!.services!.length;
                                i++) {
                              print(value.dataList.data!.services?[i].status);
                              if (value.dataList.data!.services![i].status
                                      .toString() ==
                                  'active') {
                                activeServiceValue.add(value
                                    .dataList.data!.services![i].uid
                                    .toString());
                                activeServices.add(DropdownMenuItem(
                                    value: value.dataList.data!.services![i].uid
                                        .toString(),
                                    child: Text(value
                                        .dataList.data!.services![i].serviceName
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
                              hint: Text(
                                  AppLocale.chooseService.getString(context)),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedService = newValue!;
                                  _refresh = true;
                                });
                              },
                              items: activeServices);
                        })),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      AppLocale.batchName.getString(context),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: batchName,
                    decoration: InputDecoration(
                      hintText: '${AppLocale.eg.getString(context)}. Cricket',
                      contentPadding: const EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocale.assignCoach.getString(context),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextButton(
                        child: Text(
                          AppLocale.addCoach.getString(context),
                          style: TextStyle(color: Colors.redAccent),
                        ),
                        onPressed: () {
                          Get.to(() => CreateProfile(pathPage: 'dashBoard'),
                              transition: Transition.rightToLeft);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: const Color.fromARGB(255, 218, 216, 216)),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                    child: ChangeNotifierProvider<CoachlistViewViewModel>(
                        create: (context) => coachlistViewViewModel,
                        child: Consumer<CoachlistViewViewModel>(
                            builder: (context, value, child) {
                          value.dataList1.data != null
                              ? profileUid =
                                  value.dataList1.data!.data[0].uid.toString()
                              : null;
                          if (value.dataList1.data != null) {
                            List<DropdownMenuItem<String>> dropdownItems =
                                List.generate(value.dataList1.data!.data.length,
                                    (index) {
                              return DropdownMenuItem(
                                  value: value.dataList1.data!.data[index].uid
                                      .toString(),
                                  child: Text(value
                                      .dataList1.data!.data[index].name
                                      .toString()));
                            });

                            return DropdownButton(
                                isExpanded: true,
                                underline: DropdownButtonHideUnderline(
                                    child: Container()),
                                value: profileUid,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    profileUid = newValue!;
                                  });
                                },
                                items: dropdownItems);
                          } else {
                            return DropdownButton(
                                isExpanded: true,
                                underline: DropdownButtonHideUnderline(
                                    child: Container()),
                                onChanged: (String? newValue) {},
                                items: _dropdownItem);
                          }
                        })),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ChangeNotifierProvider<MyProgramViewViewModel>(
                    create: (BuildContext context) => myProgramViewViewModel,
                    child: Consumer<MyProgramViewViewModel>(
                        builder: (context, value, _) {
                      if (value.dataList.data != null) {
                        _programid =
                            value.dataList.data?.data![0].uid.toString();
                      }
                      return (value.dataList.data?.data != null)
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: (value.dataList.data?.data![0].name ??
                                              '')
                                          .isNotEmpty
                                      ? Text(
                                          'Program',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        )
                                      // 'What ${value.dataList.data?.data![0].name.toString()}',
                                      : Container(),
                                ),
                                (value.dataList.data?.data![0].programs)
                                            ?.isNotEmpty ??
                                        false
                                    ? const SizedBox(
                                        height: 15,
                                      )
                                    : Container(),
                                (value.dataList.data?.data![0].programs)
                                            ?.isNotEmpty ??
                                        false
                                    ? SizedBox(
                                        height: 50,
                                        //color: Colors.amber,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            itemCount: value
                                                    .dataList
                                                    .data
                                                    ?.data![0]
                                                    .programs
                                                    ?.length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              return Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  value
                                                              .dataList
                                                              .data
                                                              ?.data![0]
                                                              .programs![index]
                                                              .amount
                                                              .toString() ==
                                                          '0'
                                                      ? Container()
                                                      : CustomRadio<String>(
                                                          btnColor:
                                                              Colors.black,
                                                          value: value
                                                                  .dataList
                                                                  .data
                                                                  ?.data![0]
                                                                  .programs![
                                                                      index]
                                                                  .uid
                                                                  .toString() ??
                                                              '',
                                                          valueName: value
                                                                  .dataList
                                                                  .data
                                                                  ?.data![0]
                                                                  .programs![
                                                                      index]
                                                                  .programName
                                                                  .toString() ??
                                                              '',
                                                          groupValue:
                                                              _programUid,
                                                          onChanged:
                                                              _valueChangedHandler(
                                                                  _programUid),
                                                          onChangedName:
                                                              _nameChangedHandler(
                                                                  _programName),
                                                          label: value
                                                                  .dataList
                                                                  .data
                                                                  ?.data![0]
                                                                  .programs![
                                                                      index]
                                                                  .programName
                                                                  .toString() ??
                                                              '',
                                                        ),
                                                  const SizedBox(
                                                    width: 10,
                                                  )
                                                ],
                                              );
                                            }),
                                      )
                                    : Container(),
                              ],
                            )
                          : const Text('');
                    }),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      AppLocale.fee.getString(context),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ChangeNotifierProvider<MyProgramViewViewModel>(
                      create: (BuildContext context) => myProgramViewViewModel,
                      child: Consumer<MyProgramViewViewModel>(
                          builder: (context, value, _) {
                        if (value.dataList.data != null) {
                          for (int i = 0;
                              i <
                                  value
                                      .dataList.data!.data![0].programs!.length;
                              i++) {
                            _feesamount = '';
                            if (value
                                    .dataList.data!.data![0].programs![i].uid ==
                                _programUid) {
                              _feesamount = value
                                  .dataList.data!.data![0].programs![i].amount
                                  .toString();
                              break;
                            }
                          }
                        }
                        return TextFormField(
                          readOnly: true,
                          controller: fee..text = _feesamount ?? '0',
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        );
                      })),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      AppLocale.tYOB.getString(context),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width * .425,
                        child: FittedBox(
                          child: CustomRadio<String>(
                            btnColor: Colors.black,
                            value: 'group',
                            groupValue: _groupBatch,
                            onChanged: _valueChangedBatch(),
                            label: AppLocale.groupCoaching.getString(context),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * .425,
                        child: FittedBox(
                          child: CustomRadio<String>(
                            btnColor: Colors.black,
                            value: 'private',
                            groupValue: _groupBatch,
                            onChanged: _valueChangedBatch(),
                            label: AppLocale.privateCoaching.getString(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(children: <Widget>[
                    Checkbox(
                      checkColor: Colors.white,
                      activeColor: Theme.of(context).primaryColor,
                      value: value,
                      onChanged: (value) {
                        setState(() {
                          this.value = value!;
                          onlineSession = value;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppLocale.title21.getString(context),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    )
                  ]),
                  const SizedBox(
                    width: 15,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      AppLocale.title22.getString(context),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    readOnly: onlineSession ? true : false,
                    controller: onlineUrl,
                    decoration: InputDecoration(
                      hintText:
                          '${AppLocale.eg.getString(context)}. ww.xyz.com',
                      filled: true,
                      fillColor: onlineSession
                          ? Colors.white
                          : const Color.fromARGB(255, 228, 228, 228),
                      contentPadding: const EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      AppLocale.batchDays.getString(context),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 70,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        TextCheckBox(
                          value: sun,
                          title: 'SU',
                          checkedFillColor: Colors.black,
                          onChanged: (val) {
                            setState(() {
                              sun = val;
                              if (val == true) {
                                batchDays.add("0");
                              } else {
                                batchDays.remove("0");
                              }
                            });
                          },
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        TextCheckBox(
                          value: mon,
                          title: 'MO',
                          checkedFillColor: Colors.black,
                          onChanged: (val) {
                            setState(() {
                              mon = val;
                              if (val == true) {
                                batchDays.add("1");
                              } else {
                                batchDays.remove("1");
                              }
                            });
                          },
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        TextCheckBox(
                          value: tue,
                          title: 'TU',
                          checkedFillColor: Colors.black,
                          onChanged: (val) {
                            setState(() {
                              tue = val;
                              if (val == true) {
                                batchDays.add("2");
                              } else {
                                batchDays.remove("2");
                              }
                            });
                          },
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        TextCheckBox(
                          value: wed,
                          title: 'WE',
                          checkedFillColor: Colors.black,
                          onChanged: (val) {
                            setState(() {
                              wed = val;
                              if (val == true) {
                                batchDays.add("3");
                              } else {
                                batchDays.remove("3");
                              }
                            });
                          },
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        TextCheckBox(
                          value: thu,
                          title: 'TH',
                          checkedFillColor: Colors.black,
                          onChanged: (val) {
                            setState(() {
                              thu = val;
                              if (val == true) {
                                batchDays.add("4");
                              } else {
                                batchDays.remove("4");
                              }
                            });
                          },
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        TextCheckBox(
                          value: fri,
                          title: 'FR',
                          checkedFillColor: Colors.black,
                          onChanged: (val) {
                            setState(() {
                              fri = val;
                              if (val == true) {
                                batchDays.add("5");
                              } else {
                                batchDays.remove("5");
                              }
                            });
                          },
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        TextCheckBox(
                          value: sat,
                          title: 'SA',
                          checkedFillColor: Colors.black,
                          onChanged: (val) {
                            setState(() {
                              sat = val;
                              if (val == true) {
                                batchDays.add("6");
                              } else {
                                batchDays.remove("6");
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      AppLocale.batchTiming.getString(context),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextFormField(
                          controller: batchFrom
                            ..text = batchFromdata.toString(),
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: AppLocale.from.getString(context),
                            contentPadding: const EdgeInsets.all(10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          onTap: selectTimeFrom,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextFormField(
                          controller: batchTo..text = batchTodata.toString(),
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: AppLocale.to.getString(context),
                            contentPadding: const EdgeInsets.all(10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          onTap: selectTimeTo,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  RoundButton(
                    loading: false,
                    title: AppLocale.conts.getString(context),
                    textColor: Colors.white,
                    rounded: true,
                    color: Theme.of(context).primaryColor,
                    onPress: () {
                      Map data = {
                        "service_uid": selectedService,
                        "batch_name": batchName.text.toString(),
                        "coach_profile_uid": profileUid,
                        "program_uid": _programUid.toString(),
                        "program_name": _programName.toString(),
                        "fees": _feesamount,
                        "type_batch": _groupBatch.toString(),
                        "provide_online_sessions": onlineSession,
                        "online_session_url":
                            onlineSession ? onlineUrl.text.toString() : "n/a",
                        "batch_days": batchDays,
                        "batch_timing_from": batchFrom.text,
                        "batch_timing_to": batchTo.text.toString()
                      };

                      print(data);
                      batch.fetchCreatebatchListApi(
                          data,
                          context,
                          batchName.text.toString(),
                          widget.pathPage,
                          _feesamount!);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<bool> showExitPopup(context) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.close_rounded,
                    color: Colors.redAccent,
                    size: 50.0,
                  ),
                ),
                const Text("Do you want to exit?"),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: const Text("No",
                          style: TextStyle(color: Colors.black)),
                    )),
                    const SizedBox(width: 15),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          exit(0);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent),
                        child: const Text(
                          "Yes",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      });
}

// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_localization/flutter_localization.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:provider/provider.dart';
// import 'dart:async';
// import '../../res/widget/customradio.dart';
// import '../../res/widget/round_button.dart';
// import '../../res/widget/textcheckbox.dart';
// import '../../view_model/academy_view_model.dart';
// import '../../view_model/batch_view_model.dart';
// import '../../view_model/coachlist_view_model.dart';
// import '../../view_model/myprogram_view_model.dart';
// import '../profile/create_profile.dart';
//
//
// class CreateBatchListing extends StatefulWidget {
//   String pathPage;
//   CreateBatchListing({this.pathPage='' ,super.key});
//
//   @override
//   State<CreateBatchListing> createState() => _CreateBatchListingState();
// }
//
// class _CreateBatchListingState extends State<CreateBatchListing> {
//   //multi language support
//   final FlutterLocalization _localization = FlutterLocalization.instance;
//   List<DropdownMenuItem<String>>? _dropdownItem;
//
//   //custom radio
//   // custum radio call in seprate page
//   String? _programUid;
//   String? _programid;
//   String? _programName;
//   String? _feesamount;
//
//   ValueChanged<String?> _valueChangedHandler(value) {
//     return (value) => setState(() => _programUid = value!);
//   }
//
//   ValueChanged<String?> _nameChangedHandler(value) {
//     return (value) => setState(() {
//       print(value);
//       _programName = value;
//     });
//   }
//
//   String? _groupBatch = 'group';
//
//   ValueChanged<String?> _valueChangedBatch() {
//     return (value) => setState(() => _groupBatch = value!);
//   }
//
//   bool value = true;
//   bool agree = true;
//
//   final TextEditingController batchName = TextEditingController();
//   final TextEditingController batchTo = TextEditingController();
//   final TextEditingController batchFrom = TextEditingController();
//   final TextEditingController fee = TextEditingController();
//   final TextEditingController onlineUrl = TextEditingController();
//
//   Future<bool> isValidPasscode(String value) async {
//     return await Future.delayed(const Duration(seconds: 1),
//             () => value.isNotEmpty && value.toLowerCase() == 'batman');
//   }
//
//   List<DropdownMenuItem<String>> get dropdownCategory {
//     List<DropdownMenuItem<String>> menuItems = [
//       const DropdownMenuItem(value: "Tennis", child: Text("Tennis")),
//       const DropdownMenuItem(value: "golf", child: Text("Golf")),
//       const DropdownMenuItem(value: "cricket", child: Text("Cricket")),
//     ];
//     return menuItems;
//   }
//
//   List<DropdownMenuItem<String>> get dropdownAssignCoach {
//     List<DropdownMenuItem<String>> menuItems = [
//       const DropdownMenuItem(value: "john", child: Text("John")),
//       const DropdownMenuItem(value: "anil", child: Text("Anil")),
//       const DropdownMenuItem(value: "ravi", child: Text("Ravi")),
//     ];
//     return menuItems;
//   }
//
//   String selectedCategory = 'Tennis';
//   String selectedAssignCoach = 'john';
//
//   //batch days
//   bool mon = false;
//   bool tue = false;
//   bool wed = false;
//   bool thu = false;
//   bool fri = false;
//   bool sat = false;
//   bool sun = false;
//   List batchDays = [];
//   String profileUid = "";
//   bool onlineSession = true;
//   AcademyViewViewModel academyViewViewModel = AcademyViewViewModel();
//   CoachlistViewViewModel coachlistViewViewModel = CoachlistViewViewModel();
//   MyProgramViewViewModel myProgramViewViewModel = MyProgramViewViewModel();
//   BatchViewViewModel batchViewViewModel = BatchViewViewModel();
//   Map<String, dynamic> data = {"search": ""};
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     academyViewViewModel.fetchAcademyListApi();
//     coachlistViewViewModel.fetchCoachlistApi(data);
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     batchName.dispose();
//     batchFrom.dispose();
//     batchTo.dispose();
//     fee.dispose();
//     onlineUrl.dispose();
//   }
//
//   String batchFromdata = '';
//   String batchTodata = '';
//   List activeServiceValue = [];
//   List<DropdownMenuItem<String>> activeServices = [];
//
//   selectTimeFrom() async {
//     var timepick = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//
//     setState(() {
//       batchFromdata = timepick!.format(context);
//     });
//   }
//
//   selectTimeTo() async {
//     var timepick = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//     setState(() {
//       batchTodata = timepick!.format(context);
//     });
//   }
//
//   String? selectedService;
//   var _refresh = false;
//
//   assignSeviceId(selectedvalue) {
//     if (_refresh == true) {
//       myProgramViewViewModel.fetchMyProgramListApi(selectedService);
//     }
//     selectedService = selectedService;
//     _refresh = false;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.sizeOf(context).width;
//     final batch = Provider.of<BatchViewViewModel>(context);
//     return WillPopScope(
//       onWillPop: () => showExitPopup(context),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         supportedLocales: _localization.supportedLocales,
//         localizationsDelegates: _localization.localizationsDelegates,
//         home: Scaffold(
//           backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//           appBar: AppBar(
//             leading:   widget.pathPage == "dashBoard" ? IconButton(
//               icon: const Icon(Icons.arrow_back, color: Colors.black),
//               onPressed: () => Navigator.of(context).pop(),
//             ) : null,
//             title: Text(
//               'Create Batch',
//               style: Theme.of(context).textTheme.bodyLarge,
//             ),
//             centerTitle: true,
//             backgroundColor: Colors.white,
//             elevation: 0,
//           ),
//           body: SingleChildScrollView(
//             child: Material(
//               color: Colors.white,
//               child: Container(
//                 padding: const EdgeInsets.all(20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Align(
//                         alignment: Alignment.topLeft, child: Text('Services' , style: Theme.of(context).textTheme.bodyMedium,)),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       padding: const EdgeInsets.only(left: 10.0),
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                             width: 1,
//                             color: const Color.fromARGB(255, 218, 216, 216)),
//                         borderRadius: const BorderRadius.all(Radius.circular(5)),
//                       ),
//                       child: ChangeNotifierProvider<AcademyViewViewModel>(
//                           create: (context) => academyViewViewModel,
//                           child: Consumer<AcademyViewViewModel>(
//                               builder: (context, value, child) {
//
//                                 activeServiceValue.clear();
//                                 activeServices.clear();
//                                 // print(value.dataList.data!.services![0].status);
//                                 if (value.dataList.data != null) {
//
//                                   for (var i = 0; i < value.dataList.data!.services!.length; i++) {
//                                     print(value.dataList.data!.services?[i].status);
//                                     if (value.dataList.data!.services![i].status.toString() == 'active') {
//                                       activeServiceValue.add(value.dataList.data!.services![i].uid.toString());
//                                       activeServices.add(DropdownMenuItem(
//                                           value: value.dataList.data!.services![i].uid.toString(),
//                                           child: Text(value.dataList.data!.services![i].serviceName.toString())));
//                                     }
//                                   }
//                                 }
//                                 value.dataList.data == null
//                                     ? null
//                                     : assignSeviceId(activeServiceValue[0]);
//                                 return DropdownButton(
//                                     isExpanded: true,
//                                     underline: DropdownButtonHideUnderline(
//                                         child: Container()),
//                                     value: selectedService,
//                                     hint: const Text("Choose Your Service"),
//                                     onChanged: (String? newValue) {
//                                       setState(() {
//                                         selectedService = newValue!;
//                                         _refresh = true;
//                                       });
//                                     },
//                                     items: activeServices);
//                               })),
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     Align(
//                       alignment: Alignment.topLeft,
//                       child: Text(
//                         'Batch Name',
//                         style: Theme.of(context).textTheme.bodyMedium,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     TextFormField(
//                       controller: batchName,
//                       decoration: InputDecoration(
//                         hintText: 'eg. Cricket',
//                         contentPadding: const EdgeInsets.all(10),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(5.0),
//                           borderSide: BorderSide(
//                             color: Theme.of(context).primaryColor,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Assign Coach',
//                           style: Theme.of(context).textTheme.bodyMedium,
//                         ),
//                         TextButton(
//                           child: const Text(
//                             'Add Coach',
//                             style: TextStyle(color: Colors.redAccent),
//                           ),
//                           onPressed: () {
//                             Get.to(()=>  CreateProfile(pathPage : 'dashBoard'),transition: Transition.rightToLeft);
//                           },
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       padding: const EdgeInsets.only(left: 10.0),
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                             width: 1,
//                             color: const Color.fromARGB(255, 218, 216, 216)),
//                         borderRadius: const BorderRadius.all(Radius.circular(5)),
//                       ),
//                       child: ChangeNotifierProvider<CoachlistViewViewModel>(
//                           create: (context) => coachlistViewViewModel,
//                           child: Consumer<CoachlistViewViewModel>(
//                               builder: (context, value, child) {
//                                 value.dataList1.data != null ? profileUid = value.dataList1.data!.data[0].uid.toString() : null;
//                                 if (value.dataList1.data != null) {
//                                   List<DropdownMenuItem<String>> dropdownItems =
//                                   List.generate(
//                                       value.dataList1.data!.data.length,
//                                           (index) {
//                                         return DropdownMenuItem(
//                                             value: value
//                                                 .dataList1.data!.data[index].uid
//                                                 .toString(),
//                                             child: Text(value
//                                                 .dataList1.data!.data[index].name
//                                                 .toString()));
//                                       });
//
//                                   return DropdownButton(
//                                       isExpanded: true,
//                                       underline: DropdownButtonHideUnderline(
//                                           child: Container()),
//                                       value: profileUid,
//                                       onChanged: (String? newValue) {
//                                         setState(() {
//                                           profileUid = newValue!;
//                                         });
//                                       },
//                                       items: dropdownItems);
//                                 } else {
//                                   return DropdownButton(
//                                       isExpanded: true,
//                                       underline: DropdownButtonHideUnderline(
//                                           child: Container()),
//                                       onChanged: (String? newValue) {
//                                       },
//                                       items: _dropdownItem);
//                                 }
//                               })),
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     ChangeNotifierProvider<MyProgramViewViewModel>(
//                       create: (BuildContext context) => myProgramViewViewModel,
//                       child: Consumer<MyProgramViewViewModel>(
//                           builder: (context, value, _) {
//                             if (value.dataList.data != null) {
//                               _programid =
//                                   value.dataList.data?.data![0].uid.toString();
//                             }
//                             return (value.dataList.data?.data != null)
//                                 ? Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Align(
//                                   alignment: Alignment.topLeft,
//                                   child: (value.dataList.data?.data![0].name ??
//                                       '')
//                                       .isNotEmpty
//                                       ? Text(
//                                     'Program',
//                                     style: Theme.of(context).textTheme.bodyMedium,
//                                   )
//                                   // 'What ${value.dataList.data?.data![0].name.toString()}',
//
//                                       : Container(),
//                                 ),
//                                 (value.dataList.data?.data![0].programs)
//                                     ?.isNotEmpty ??
//                                     false
//                                     ? const SizedBox(
//                                   height: 15,
//                                 )
//                                     : Container(),
//                                 (value.dataList.data?.data![0].programs)
//                                     ?.isNotEmpty ??
//                                     false
//                                     ? SizedBox(
//                                   height: 50,
//                                   //color: Colors.amber,
//                                   child: ListView.builder(
//                                       scrollDirection: Axis.horizontal,
//                                       shrinkWrap: true,
//                                       itemCount: value
//                                           .dataList
//                                           .data
//                                           ?.data![0]
//                                           .programs
//                                           ?.length ??
//                                           0,
//                                       itemBuilder: (context, index) {
//                                         return Row(
//                                           mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                           crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                           children: [
//                                             value
//                                                 .dataList
//                                                 .data
//                                                 ?.data![0]
//                                                 .programs![index]
//                                                 .amount
//                                                 .toString() ==
//                                                 '0'
//                                                 ? Container()
//                                                 : CustomRadio<String>(
//                                               btnColor:
//                                               Colors.black,
//                                               value: value
//                                                   .dataList
//                                                   .data
//                                                   ?.data![0]
//                                                   .programs![
//                                               index]
//                                                   .uid
//                                                   .toString() ??
//                                                   '',
//                                               valueName: value
//                                                   .dataList
//                                                   .data
//                                                   ?.data![0]
//                                                   .programs![
//                                               index]
//                                                   .programName
//                                                   .toString() ??
//                                                   '',
//                                               groupValue:
//                                               _programUid,
//                                               onChanged:
//                                               _valueChangedHandler(
//                                                   _programUid),
//                                               onChangedName:
//                                               _nameChangedHandler(
//                                                   _programName),
//                                               label: value
//                                                   .dataList
//                                                   .data
//                                                   ?.data![0]
//                                                   .programs![
//                                               index]
//                                                   .programName
//                                                   .toString() ??
//                                                   '',
//                                             ),
//                                             const SizedBox(
//                                               width: 10,
//                                             )
//                                           ],
//                                         );
//                                       }),
//                                 )
//                                     : Container(),
//                               ],
//                             )
//                                 : const Text('');
//                           }),
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     Align(
//                       alignment: Alignment.topLeft,
//                       child: Text(
//                         'Fee',
//                         style: Theme.of(context).textTheme.bodyMedium,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     ChangeNotifierProvider<MyProgramViewViewModel>(
//                         create: (BuildContext context) => myProgramViewViewModel,
//                         child: Consumer<MyProgramViewViewModel>(
//                             builder: (context, value, _) {
//                               if (value.dataList.data != null) {
//                                 for (int i = 0;
//                                 i <
//                                     value
//                                         .dataList.data!.data![0].programs!.length;
//                                 i++) {
//                                   _feesamount = '';
//                                   if (value
//                                       .dataList.data!.data![0].programs?[i].uid ==
//                                       _programUid) {
//                                     _feesamount = value
//                                         .dataList.data!.data![0].programs?[i].amount;
//                                     break;
//                                   }
//                                 }
//                               }
//                               return TextFormField(
//                                 readOnly: true,
//                                 controller: fee..text = _feesamount ?? '0',
//                                 decoration: InputDecoration(
//                                   contentPadding: const EdgeInsets.all(10),
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(5.0),
//                                     borderSide: BorderSide(
//                                       color: Theme.of(context).primaryColor,
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             })),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     Align(
//                       alignment: Alignment.topLeft,
//                       child: Text(
//                         'Type of Batch',
//                         style: Theme.of(context).textTheme.bodyMedium,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         SizedBox(
//                           width: width * .425,
//                           child: FittedBox(
//                             child: CustomRadio<String>(
//                               btnColor: Colors.black,
//                               value: 'group',
//                               groupValue: _groupBatch,
//                               onChanged: _valueChangedBatch(),
//                               label: 'Group Coaching',
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: width * .425,
//                           child: FittedBox(
//                             child: CustomRadio<String>(
//                               btnColor: Colors.black,
//                               value: 'private',
//                               groupValue: _groupBatch,
//                               onChanged: _valueChangedBatch(),
//                               label: 'Private Coaching',
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     Row(children: <Widget>[
//                       Checkbox(
//                         checkColor: Colors.white,
//                         activeColor: Theme.of(context).primaryColor,
//                         value: value,
//                         onChanged: (value) {
//                           setState(() {
//                             this.value = value!;
//                             onlineSession = value;
//                           });
//                         },
//                       ),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Provide Online Sessions',
//                             style: Theme.of(context).textTheme.bodyMedium,
//                           ),
//                         ],
//                       )
//                     ]),
//                     const SizedBox(
//                       width: 15,
//                     ),
//                     Align(
//                       alignment: Alignment.topLeft,
//                       child: Text(
//                         'Online Session Url',
//                         style: Theme.of(context).textTheme.bodyMedium,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     TextFormField(
//                       readOnly: onlineSession ? false : true,
//                       controller: onlineUrl,
//                       decoration: InputDecoration(
//                         hintText: 'e.g. ww.xyz.com',
//                         filled: true,
//                         fillColor: onlineSession
//                             ? Colors.white
//                             : const Color.fromARGB(255, 228, 228, 228),
//                         contentPadding: const EdgeInsets.all(10),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(5.0),
//                           borderSide: BorderSide(
//                             color: Theme.of(context).primaryColor,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     Align(
//                       alignment: Alignment.topLeft,
//                       child: Text(
//                         'Batch Days',
//                         style: Theme.of(context).textTheme.bodyMedium,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     SizedBox(
//                       height: 70,
//                       child: ListView(
//                         scrollDirection: Axis.horizontal,
//                         children: <Widget>[
//                           TextCheckBox(
//                             value: sun,
//                             title: 'SU',
//                             checkedFillColor: Colors.black,
//                             onChanged: (val) {
//                               setState(() {
//                                 sun = val;
//                                 if (val == true) {
//                                   batchDays.add("0");
//                                 } else {
//                                   batchDays.remove("0");
//                                 }
//                               });
//                             },
//                           ),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           TextCheckBox(
//                             value: mon,
//                             title: 'MO',
//                             checkedFillColor: Colors.black,
//                             onChanged: (val) {
//                               setState(() {
//                                 mon = val;
//                                 if (val == true) {
//                                   batchDays.add("1");
//                                 } else {
//                                   batchDays.remove("1");
//                                 }
//                               });
//                             },
//                           ),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           TextCheckBox(
//                             value: tue,
//                             title: 'TU',
//                             checkedFillColor: Colors.black,
//                             onChanged: (val) {
//                               setState(() {
//                                 tue = val;
//                                 if (val == true) {
//                                   batchDays.add("2");
//                                 } else {
//                                   batchDays.remove("2");
//                                 }
//                               });
//                             },
//                           ),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           TextCheckBox(
//                             value: wed,
//                             title: 'WE',
//                             checkedFillColor: Colors.black,
//                             onChanged: (val) {
//                               setState(() {
//                                 wed = val;
//                                 if (val == true) {
//                                   batchDays.add("3");
//                                 } else {
//                                   batchDays.remove("3");
//                                 }
//                               });
//                             },
//                           ),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           TextCheckBox(
//                             value: thu,
//                             title: 'TH',
//                             checkedFillColor: Colors.black,
//                             onChanged: (val) {
//                               setState(() {
//                                 thu = val;
//                                 if (val == true) {
//                                   batchDays.add("4");
//                                 } else {
//                                   batchDays.remove("4");
//                                 }
//                               });
//                             },
//                           ),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           TextCheckBox(
//                             value: fri,
//                             title: 'FR',
//                             checkedFillColor: Colors.black,
//                             onChanged: (val) {
//                               setState(() {
//                                 fri = val;
//                                 if (val == true) {
//                                   batchDays.add("5");
//                                 } else {
//                                   batchDays.remove("5");
//                                 }
//                               });
//                             },
//                           ),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           TextCheckBox(
//                             value: sat,
//                             title: 'SA',
//                             checkedFillColor: Colors.black,
//                             onChanged: (val) {
//                               setState(() {
//                                 sat = val;
//                                 if (val == true) {
//                                   batchDays.add("6");
//                                 } else {
//                                   batchDays.remove("6");
//                                 }
//                               });
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     Align(
//                       alignment: Alignment.topLeft,
//                       child: Text(
//                         'Batch Timings',
//                         style: Theme.of(context).textTheme.bodyMedium,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width * 0.4,
//                           child: TextFormField(
//                             controller: batchFrom
//                               ..text = batchFromdata.toString(),
//                             readOnly: true,
//                             decoration: InputDecoration(
//                               hintText: 'From',
//                               contentPadding: const EdgeInsets.all(10),
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(5.0),
//                                 borderSide: BorderSide(
//                                   color: Theme.of(context).primaryColor,
//                                 ),
//                               ),
//                             ),
//                             onTap: selectTimeFrom,
//                           ),
//                         ),
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width * 0.4,
//                           child: TextFormField(
//                             controller: batchTo..text = batchTodata.toString(),
//                             readOnly: true,
//                             decoration: InputDecoration(
//                               hintText: 'To',
//                               contentPadding: const EdgeInsets.all(10),
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(5.0),
//                                 borderSide: BorderSide(
//                                   color: Theme.of(context).primaryColor,
//                                 ),
//                               ),
//                             ),
//                             onTap: selectTimeTo,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 25,
//                     ),
//
//                     RoundButton(
//                       loading: false,
//                       title: 'Continue',
//                       textColor: Colors.white,
//                       rounded: true,
//                       color: Theme.of(context).primaryColor,
//                       onPress: () {
//                         Map data = {
//                           "service_uid": selectedService,
//                           "batch_name": batchName.text.toString(),
//                           "coach_profile_uid": profileUid,
//                           "program_uid": _programid.toString(),
//                           "program_name": _programName.toString(),
//                           "fees": _feesamount,
//                           "type_batch": _groupBatch.toString(),
//                           "provide_online_sessions": onlineSession,
//                           "online_session_url":
//                           onlineSession ? onlineUrl.text.toString() : "n/a",
//                           "batch_days": batchDays,
//                           "batch_timing_from": batchFrom.text,
//                           "batch_timing_to": batchTo.text.toString()
//                         };
//
//                         print(data);
//                         batch.fetchCreatebatchListApi(data, context ,batchName.text.toString(),widget.pathPage ,_feesamount!);
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// Future<bool> showExitPopup(context) async {
//   return await showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           content: SizedBox(
//             height: 150,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const Align(
//                   alignment: Alignment.center,
//                   child: Icon(
//                     Icons.close_rounded,
//                     color: Colors.redAccent,
//                     size: 50.0,
//                   ),
//                 ),
//                 const Text("Do you want to exit?"),
//                 const SizedBox(height: 20),
//                 Row(
//                   children: [
//                     Expanded(
//                         child: ElevatedButton(
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.white,
//                           ),
//                           child: const Text("No",
//                               style: TextStyle(color: Colors.black)),
//                         )),
//                     const SizedBox(width: 15),
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {
//                           exit(0);
//                         },
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.blueAccent),
//                         child: const Text(
//                           "Yes",
//                           style: TextStyle(color: Colors.white),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         );
//       });
// }
