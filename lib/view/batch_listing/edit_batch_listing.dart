import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import '../../res/widget/customradio.dart';
import '../../res/widget/round_button.dart';
import '../../res/widget/textcheckbox.dart';
import '../../view_model/academy_view_model.dart';
import '../../view_model/batchList_view_model.dart';
import '../../view_model/batch_view_model.dart';
import '../../view_model/coachlist_view_model.dart';
import '../../view_model/myprogram_view_model.dart';
import '../profile/create_profile.dart';


class EditBatchListing extends StatefulWidget {
  int Listindex;
  EditBatchListing({super.key, this.Listindex = -1});

  @override
  State<EditBatchListing> createState() => _EditBatchListingState();
}

class _EditBatchListingState extends State<EditBatchListing> {
  bool isInitialized = false;
  bool isInitialized1 = false;

  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;
  //custom radio
  // custum radio call in seprate page
  String? _programUid;
  String? _programid;
  String? _programName;

  ValueChanged<String?> _valueChangedHandler(value) {
    return (value) => setState(() => _programUid = value!);
  }

  String? _groupBatch = 'Group';
  ValueChanged<String?> _valueChangedBatch() {
    return (value) => setState(() => _groupBatch = value!);
  }

  assignSeviceId(selectedvalue) {
    myProgramViewViewModel.fetchMyProgramListApi(selectedvalue);
  }

  bool value1 = true;
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
  String profileUid = "";
  String selected = "";
  bool onlineSession = true;
  AcademyViewViewModel academyViewViewModel = AcademyViewViewModel();
  CoachlistViewViewModel coachlistViewViewModel = CoachlistViewViewModel();
  MyProgramViewViewModel myProgramViewViewModel = MyProgramViewViewModel();
  BatchListViewViewModel batchListViewViewModel = BatchListViewViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    batchListViewViewModel.fetchBatchListListApi();
    academyViewViewModel.fetchAcademyListApi();
    coachlistViewViewModel.fetchCoachlistListApi();
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

  @override
  Widget build(BuildContext context) {
    final batch = Provider.of<BatchViewViewModel>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        supportedLocales: _localization.supportedLocales,
        localizationsDelegates: _localization.localizationsDelegates,
        home: ChangeNotifierProvider<BatchListViewViewModel>(
            create: (BuildContext context) => batchListViewViewModel,
            child:
            Consumer<BatchListViewViewModel>(builder: (context, value, _) {
              if (!isInitialized) {
                assignSeviceId(
                    value.dataList.data!.data![widget.Listindex].serviceUid);
                profileUid = value
                    .dataList.data!.data![widget.Listindex].coachProfileUid
                    .toString();
                onlineSession = value.dataList.data!.data![widget.Listindex]
                    .provideOnlineSessions!;
                print("batch type is");
                print(value.dataList.data!.data![widget.Listindex].batch_type
                    .toString());
                print(value.dataList.data!.data![widget.Listindex].fees
                    .toString());
                batchName.text = value
                    .dataList.data!.data![widget.Listindex].batchName
                    .toString();
                batchTo.text = value
                    .dataList.data!.data![widget.Listindex].batchTimingTo
                    .toString();
                batchFrom.text = value
                    .dataList.data!.data![widget.Listindex].batchTimingFrom
                    .toString();
                fee.text = value.dataList.data!.data![widget.Listindex].fees
                    .toString();
                onlineUrl.text = value
                    .dataList.data!.data![widget.Listindex].onlineSessionUrl
                    .toString();
                int? size = value
                    .dataList.data?.data![widget.Listindex].batchDays?.length;
                // assignSeviceId(value.dataList.data!.data![widget.Listindex].serviceUid);
                for (var i = 0; i < size!; i++) {
                  switch (value
                      .dataList.data?.data![widget.Listindex].batchDays?[i]) {
                    case '0':
                      sun = true;
                      batchDays.add("0");
                      break;
                    case '1':
                      mon = true;
                      batchDays.add("1");
                      break;
                    case '2':
                      tue = true;
                      batchDays.add("2");
                      break;
                    case '3':
                      wed = true;
                      batchDays.add("3");
                      break;
                    case '4':
                      thu = true;
                      batchDays.add("4");
                      break;
                    case '5':
                      fri = true;
                      batchDays.add("5");
                      break;
                    case '6':
                      sat = true;
                      batchDays.add("6");
                      break;
                  }
                }

                isInitialized = true;
              }

              // _groupBatch = value.dataList.data!.data?[widget.Listindex].batch_type;

              // controller: batchTo
              //   ..text = value.dataList.data
              //       ?.data![widget.Listindex].batchTimingTo
              //       .toString() ?? batchTodata.toString(),

              selectedService =
                  value.dataList.data?.data![widget.Listindex].serviceName;

              return Scaffold(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                appBar: AppBar(
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  title: Text(
                    'Edit Batch',
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
                            controller: batchName..text,
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
                              alignment: Alignment.topLeft,
                              child: Text('Services')),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: selectedService,
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
                                          CreateProfile(
                                              listindex: widget.Listindex),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),

                          Container(
                            padding: const EdgeInsets.only(left: 10.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color:
                                  const Color.fromARGB(255, 218, 216, 216)),
                              borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                            ),
                            child:
                            ChangeNotifierProvider<CoachlistViewViewModel>(
                                create: (context) => coachlistViewViewModel,
                                child: Consumer<CoachlistViewViewModel>(
                                    builder: (context, value, child) {
                                      print(
                                          "object==${value.dataList.data!.coachlist.length}");

                                      // profileUid =selected;
                                      List<DropdownMenuItem<String>>
                                      dropdownItems = List.generate(
                                          value.dataList.data!.coachlist
                                              .length ??
                                              0, (index) {
                                        return DropdownMenuItem(
                                            value: value.dataList.data!
                                                .coachlist[index].uid
                                                .toString() ??
                                                '',
                                            child: Text(value.dataList.data!
                                                .coachlist[index].name
                                                .toString() ??
                                                'add coach'));
                                      });
                                      return DropdownButton(
                                          isExpanded: true,
                                          underline:
                                          DropdownButtonHideUnderline(
                                              child: Container()),
                                          value: profileUid,
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              profileUid = newValue!;
                                            });
                                          },

                                          // (String? newValue) {
                                          //
                                          //    profileUid = newValue!;
                                          //    Provider.of<CoachlistViewViewModel>(context, listen: false).notifyListeners();
                                          //
                                          //  },

                                          items: dropdownItems);
                                    })),
                          ),

                          const SizedBox(
                            height: 15,
                          ),

                          ChangeNotifierProvider<MyProgramViewViewModel>(
                            create: (BuildContext context) =>
                            myProgramViewViewModel,
                            child: Consumer<MyProgramViewViewModel>(
                                builder: (context, value, _) {
                                  _programid =
                                      value.dataList.data?.data![0].uid.toString();
                                  _programName = value.dataList.data?.data![0]
                                      .programs![0].programName
                                      .toString();
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: (value.dataList.data?.data![0]
                                            .name ??
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
                                          ? SizedBox(
                                        height: 15,
                                      )
                                          : Container(),
                                      (value.dataList.data?.data![0].programs)
                                          ?.isNotEmpty ??
                                          false
                                          ? Container(
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
                                                      .programs![
                                                  index]
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
                                                    groupValue:
                                                    _programUid,
                                                    onChanged:
                                                    _valueChangedHandler(
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
                                                  SizedBox(
                                                    width: 10,
                                                  )
                                                ],
                                              );
                                            }),
                                      )
                                          : Container(),
                                    ],
                                  );
                                }),
                          ),
                          const SizedBox(
                            height: 15,
                          ),

                          /// program

                          // Align(
                          //   alignment: Alignment.topLeft,
                          //   child: Text(
                          //     'Program',
                          //     style: Theme.of(context).textTheme.bodyMedium,
                          //   ),
                          // ),
                          // const SizedBox(
                          //   height: 5,
                          // ),
                          // Align(
                          //   alignment: Alignment.topLeft,
                          //   child: ElevatedButton(
                          //     onPressed: () {},
                          //     style: ElevatedButton.styleFrom(
                          //         backgroundColor:
                          //         Colors.black.withOpacity(0.5),
                          //         padding: const EdgeInsets.fromLTRB(
                          //             25, 15, 25, 15)),
                          //     child: Text(value.dataList.data
                          //         ?.data![widget.Listindex].programName
                          //         .toString() ??
                          //         ''),
                          //   ),
                          // ),

                          Align(
                            alignment: Alignment.topLeft,
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Fee',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                 TextButton(
                                 onPressed: () {             _openModal(context);
                                 }, child: Text("Edit Fees",style: TextStyle(
                                  color: Colors.blue,)))
                              ],
                            )

                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ChangeNotifierProvider<MyProgramViewViewModel>(
                              create: (BuildContext context) =>
                              myProgramViewViewModel,
                              child: Consumer<MyProgramViewViewModel>(
                                  builder: (context, value, _) {
                                    for (var fee in value
                                        .dataList.data?.data![0].programs! ??
                                        []) {
                                      fee.amount;
                                    }
                                    return

                                      TextFormField(
                                      readOnly: true,
                                      controller: fee..text = fee.text ?? '0',
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
                                value: 'Group',
                                groupValue: _groupBatch,
                                onChanged: _valueChangedBatch(),
                                label: 'Group Coaching',
                              ),
                              CustomRadio<String>(
                                btnColor: Colors.black,
                                value: 'Private',
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
                              value: value1,
                              onChanged: (value) {
                                setState(() {
                                  this.value1 = value!;
                                  onlineSession = value;
                                  Provider.of<CoachlistViewViewModel>(context,
                                      listen: false)
                                      .notifyListeners();
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
                            controller: onlineUrl..text,
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
                                  title: 'SU',
                                  checkedFillColor: Colors.black,
                                  onChanged: (val) {
                                    print("sunday");
                                    print(val);
                                    setState(() {
                                      sun = val;
                                      if (val == true) {
                                        if (!batchDays.contains(0)) {
                                          batchDays.add("0");
                                        }
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
                                        if (!batchDays.contains(1)) {
                                          batchDays.add("1");
                                        }
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
                                        if (!batchDays.contains(2)) {
                                          batchDays.add("2");
                                        }
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
                                        if (!batchDays.contains(3)) {
                                          batchDays.add("3");
                                        }
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
                                        if (!batchDays.contains(4)) {
                                          batchDays.add("4");
                                        }
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
                                        if (!batchDays.contains(5)) {
                                          batchDays.add("5");
                                        }
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
                                        if (!batchDays.contains(6)) {
                                          batchDays.add("6");
                                        }
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
                                    hintText: value
                                        .dataList
                                        .data
                                        ?.data![widget.Listindex]
                                        .batchTimingFrom
                                        .toString(),
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
                                  readOnly: true,
                                  controller: batchTo
                                    ..text = batchTodata.toString(),
                                  decoration: InputDecoration(
                                    hintText: value.dataList.data
                                        ?.data![widget.Listindex].batchTimingTo
                                        .toString(),
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
                            title: 'Save',
                            textColor: Colors.white,
                            rounded: true,
                            color: Theme.of(context).primaryColor,
                            onPress: () {
                              /* Map<String, dynamic> data = {
                                'batch_uid': value
                                    .dataList.data!.data?[widget.Listindex].uid
                                    .toString(),
                                'batch_name': batchName.text.toString(),
                                'coach_profile_uid': profileUid.toString(),

                                'program_uid': value.dataList.data!
                                    .data?[widget.Listindex].programUid
                                    .toString(),
                                'program_name': value.dataList.data!
                                    .data?[widget.Listindex].programName
                                    .toString(),
                                'fees': value.dataList.data!
                                    .data?[widget.Listindex].fees,

                                /// because currently getting null
                                'type_batch': 'Group',
                                'provide_online_sessions':
                                    onlineSession.toString(),
                                'online_session_url': onlineSession
                                    ? onlineUrl.text.toString()
                                    : "n/a",
                                'batch_days ': batchDays,

                                //'batch_timing_from':batchFrom.text.isNotEmpty ? batchFrom.text:value.dataList.data!.data?[widget.Listindex].batchTimingFrom.toString(),
                                // 'batch_timing_to':batchTo.text.isNotEmpty ?batchTo.text:value.dataList.data!.data?[widget.Listindex].batchTimingTo.toString(),
                                'batch_timing_from': "10:30 am",
                                'batch_timing_to': "10:30 pm",
                              };*/
                              Map<String, dynamic> data = {
                                "batch_uid": "${value
                                    .dataList.data!.data?[widget.Listindex].uid}",
                                "batch_name": batchName.text.isEmpty ? value
                                    .dataList.data!.data![widget.Listindex].batchName : batchName.text,
                                "coach_profile_uid":profileUid,
                                "program_uid":"${value.dataList.data!
                                    .data?[widget.Listindex].programUid}",
                                "program_name":"${value.dataList.data!
                                    .data?[widget.Listindex].programName}",
                                "fees":fee.text.isEmpty ?    value
                                    .dataList.data!.data![widget.Listindex].fees : fee.text,
                                "type_batch": _groupBatch.toString() == "" ?  value
                                    .dataList.data!.data![widget.Listindex].batch_type : _groupBatch.toString(),
                                "provide_online_sessions":false,
                                "online_session_url": onlineSession ? onlineUrl.text : "n/a",
                                "batch_days":batchDays,
                                "batch_timing_from":batchFrom.text.isEmpty ? value
                                    .dataList.data!.data![widget.Listindex].batchTimingFrom : batchFrom.text,
                                "batch_timing_to":batchTo.text.isEmpty ? value
                                    .dataList.data!.data![widget.Listindex].batchTimingTo : batchTo.text
                              };

                              print("data is");
                              print(data);
                              batch.fetchEditebatchListApi(data, context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            })));
  }

  void _openModal(BuildContext context) {}
}


