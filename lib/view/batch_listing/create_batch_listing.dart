import 'dart:developer';

import 'package:drona/view/batch_listing/coach_profile_add.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'dart:math';
import '../../res/widget/customradio.dart';
import '../../res/widget/round_button.dart';
import '../../res/widget/textcheckbox.dart';
import '../../view_model/batch_view_model.dart';
import '../../view_model/coachlist_view_model.dart';
import '../../view_model/myprogram_view_model.dart';
import '../../view_model/myservices_view_model.dart';
import '../profile/create_profile.dart';

class CreateBatchListing extends StatefulWidget {
  const CreateBatchListing({super.key});

  @override
  State<CreateBatchListing> createState() => _CreateBatchListingState();
}

class _CreateBatchListingState extends State<CreateBatchListing> {
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;
  //custom radio
  // custum radio call in seprate page
  String? _programUid;
  String? _programName;
  ValueChanged<String?> _valueChangedHandler(value) {
    return (value) => setState(() => _programUid = value!);
  }

  String? _groupBatch = 'group';
  ValueChanged<String?> _valueChangedBatch() {
    return (value) => setState(() => _groupBatch = value!);
  }

  bool value = true;
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

  List<DropdownMenuItem<String>> get dropdownCategory {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("Tennis"), value: "Tennis"),
      const DropdownMenuItem(child: Text("Golf"), value: "golf"),
      const DropdownMenuItem(child: Text("Cricket"), value: "cricket"),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownAssignCoach {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("John"), value: "john"),
      const DropdownMenuItem(child: Text("Anil"), value: "anil"),
      const DropdownMenuItem(child: Text("Ravi"), value: "ravi"),
    ];
    return menuItems;
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
  String selectedService = "fymg3n6d8g69cysc4hhr";
  String profileUid = "";
  bool onlineSession = true;
  MyservicesViewViewModel myservicesViewViewModel = MyservicesViewViewModel();
  CoachlistViewViewModel coachlistViewViewModel = CoachlistViewViewModel();
  MyProgramViewViewModel myProgramViewViewModel = MyProgramViewViewModel();
  BatchViewViewModel batchViewViewModel = BatchViewViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myservicesViewViewModel.fetchMyservicesListApi();
    coachlistViewViewModel.fetchCoachlistListApi();
    myProgramViewViewModel.fetchMyProgramListApi('fymg3n6d8g69cysc4hhr');
  }
  String batchFromdata = '';
  String batchTodata = '';
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

  @override
  Widget build(BuildContext context) {
     final batch = Provider.of<BatchViewViewModel>(context);
    return MaterialApp(
      supportedLocales: _localization.supportedLocales,
      localizationsDelegates: _localization.localizationsDelegates,
      home: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Create Batch',
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
                      'Batch Name',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: batchName,
                    decoration: InputDecoration(
                      hintText: 'eg. Cricket',
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
                  const Align(
                      alignment: Alignment.topLeft, child: Text('Services')),
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
                    child: ChangeNotifierProvider<MyservicesViewViewModel>(
                        create: (context) => myservicesViewViewModel,
                        child: Consumer<MyservicesViewViewModel>(
                            builder: (context, value, child) {
                          // selectedService = value
                          //         .dataList.data?.services?[0].uid
                          //         .toString() ??
                          //     '';
                          List<DropdownMenuItem<String>> dropdownItems =
                              List.generate(
                                  value.dataList.data?.services!.length ?? 0,
                                  (index) {
                            return DropdownMenuItem(
                                value: value.dataList.data?.services?[index].uid
                                    .toString(),
                                child: Text(value.dataList.data
                                        ?.services?[index].serviceName
                                        .toString() ??
                                    ''));
                          });
                          return DropdownButton(
                              isExpanded: true,
                              underline: DropdownButtonHideUnderline(
                                  child: Container()),
                              value: selectedService,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedService = newValue!;
                                });
                              },
                              items: dropdownItems);
                        })),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Assign Coach',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextButton(
                        child: const Text(
                          'Add Coach',
                          style: TextStyle(color: Colors.redAccent),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const CreateProfile(),
                            ),
                          );
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
                          profileUid =
                              value.dataList.data?.data![0].uid.toString() ??
                                  '';
                          List<DropdownMenuItem<String>> dropdownItems =
                              List.generate(
                                  value.dataList.data?.data!.length ?? 0,
                                  (index) {
                            return DropdownMenuItem(
                                value: value.dataList.data?.data![index].uid
                                        .toString() ??
                                    '',
                                child: Text(value
                                        .dataList.data?.data![index].name
                                        .toString() ??
                                    ''));
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
                        })),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ChangeNotifierProvider<MyProgramViewViewModel>(
                    create: (BuildContext context) => myProgramViewViewModel,
                    child: Consumer<MyProgramViewViewModel>(
                        builder: (context, value, _) {
                      var uidValue = value
                          .dataList.data?.data![0].programs![0].uid
                          .toString();
                      _programName = value
                          .dataList.data?.data![0].programs![0].programName
                          .toString();
                      return Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'What ${value.dataList.data?.data![0].name.toString()}?',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 50,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: value.dataList.data?.data![0]
                                        .programs?.length ??
                                    0,
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      CustomRadio<String>(
                                        btnColor: Colors.black,
                                        value: value.dataList.data?.data![0]
                                                .programs![index].uid
                                                .toString() ??
                                            '',
                                        groupValue: _programUid,
                                        onChanged:
                                            _valueChangedHandler(uidValue),
                                        label: value.dataList.data?.data![0]
                                                .programs![index].programName
                                                .toString() ??
                                            '',
                                      ),
                                      SizedBox(
                                        width: 10,
                                      )
                                    ],
                                  );
                                }),
                          ),
                        ],
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Fee',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: fee,
                    decoration: InputDecoration(
                      hintText: 'e.g. 200',
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
                      'Type of Batch',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomRadio<String>(
                        btnColor: Colors.black,
                        value: 'group',
                        groupValue: _groupBatch,
                        onChanged: _valueChangedBatch(),
                        label: 'Group Coaching',
                      ),
                      CustomRadio<String>(
                        btnColor: Colors.black,
                        value: 'private',
                        groupValue: _groupBatch,
                        onChanged: _valueChangedBatch(),
                        label: 'Private Coaching',
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
                          'Provide Online Sessions',
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
                      'Online session Url',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    readOnly: onlineSession ? false : true,
                    controller: onlineUrl,
                    decoration: InputDecoration(
                      hintText: 'e.g. ww.xyz.com',
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
                      'Batch Days',
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
                          title: 'Sun',
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
                          width: 10,
                        ),
                        TextCheckBox(
                          value: mon,
                          title: 'Mon',
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
                          width: 10,
                        ),
                        TextCheckBox(
                          value: tue,
                          title: 'Tue',
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
                          width: 10,
                        ),
                        TextCheckBox(
                          value: wed,
                          title: 'Wed',
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
                          width: 10,
                        ),
                        TextCheckBox(
                          value: thu,
                          title: 'Thu',
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
                          width: 10,
                        ),
                        TextCheckBox(
                          value: fri,
                          title: 'Fri',
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
                          width: 10,
                        ),
                        TextCheckBox(
                          value: sat,
                          title: 'Sat',
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
                      'Batch Timing',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextFormField(
                          controller: batchFrom
                            ..text = batchFromdata.toString(),
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: 'From',
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
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextFormField(
                          controller: batchTo..text = batchTodata.toString(),
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: 'To',
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
                    height: 15,
                  ),
                  RoundButton(
                    loading: false,
                    title: 'Add Trainee',
                    textColor: Colors.white,
                    rounded: true,
                    color: Theme.of(context).primaryColorDark.withOpacity(0.2),
                    onPress: agree == true
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const CoachProfileAdd(),
                              ),
                            );
                          }
                        : () {
                            print('btn dissabled');
                          },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  RoundButton(
                    loading: false,
                    title: 'Continue',
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
                        "fees": fee.text.toString(),
                        "type_batch": _groupBatch.toString(),
                        "provide_online_sessions": onlineSession,
                        "online_session_url": onlineSession ? onlineUrl.text.toString() : "n/a",
                        "batch_days": batchDays,
                        "batch_timing_from": batchFrom.text,
                        "batch_timing_to": batchTo.text.toString()
                      };
                      batch.fetchCreatebatchListApi(data, context);
                      print(data);
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
