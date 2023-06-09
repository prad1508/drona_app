import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';

import '../../model/batchList_model.dart';

import '../../res/widget/round_button.dart';
import '../../utils/utils.dart';
import '../../view_model/batchList_view_model.dart';
import '../../view_model/session_view_model.dart';
import '../trainee_phonbook_add.dart';

class SessionalDetails extends StatefulWidget {
  const SessionalDetails({super.key});

  @override
  State<SessionalDetails> createState() => _SessionalDetailsState();
}

class _SessionalDetailsState extends State<SessionalDetails> {
  //multi language support

  final FlutterLocalization _localization = FlutterLocalization.instance;
  BatchListViewViewModel batchListViewViewModel = BatchListViewViewModel();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController doj = TextEditingController();
  final TextEditingController dateschedule = TextEditingController();
  final TextEditingController onlinesessionurl = TextEditingController();
  final TextEditingController fromBatch = TextEditingController();
  final TextEditingController toBatch = TextEditingController();

  List<int> _selectedItems = <int>[];
  bool notFound = false;
  List<Map<String, dynamic>> _foundUsers = [];

  @override
  initState() {
    batchListViewViewModel.fetchBatchListListApi();
    super.initState();
  }

  String? selectedService;
  assignSeviceId(selectedvalue) {
    batchListViewViewModel.fetchBatchListListApi();
    selectedService = selectedService;
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

  List<DropdownMenuItem<String>> get batchnames {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text('John'), value: "john"),
      DropdownMenuItem(child: Text("Anil"), value: "anil"),
      DropdownMenuItem(child: Text("Ravi"), value: "ravi"),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> batchname = [];

  String selectedAssignCoach = 'john';

  @override
  Widget build(BuildContext context) {
    final session = Provider.of<SessionViewViewModel>(context);
    final batch = Provider.of<BatchListViewViewModel>(context);

    return MaterialApp(
      supportedLocales: _localization.supportedLocales,
      localizationsDelegates: _localization.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          leading: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          title: Text(
            'Create Session Details',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Material(
          color: Colors.white,
          child: Container(
            padding: const EdgeInsets.all(20),
            child:

                //
                // ChangeNotifierProvider<AcademyViewViewModel>(
                //     create: (context) => academyViewViewModel,
                //     child: Consumer<AcademyViewViewModel>(
                //         builder: (context, value, child) {
                //           activeServiceValue.clear();
                //           activeServices.clear();
                //           for (var i = 0; i < value.dataList.data!.services!.length; i++) {
                //             if (value.dataList.data!.services![i].status.toString() == 'active') {
                //               activeServiceValue.add(value.dataList.data!.services![i].uid.toString());
                //               activeServices.add(DropdownMenuItem(value: value.dataList.data!.services![i].uid.toString(),
                //                   child: Text(value.dataList.data!.services![i].serviceName.toString())));
                //             }
                //           }
                //           assignSeviceId(activeServiceValue[0]);
                //           return DropdownButton(
                //               isExpanded: true,
                //               underline: DropdownButtonHideUnderline(
                //                   child: Container()),
                //               value: selectedService,
                //               onChanged: (String? newValue) {
                //                 setState(() {
                //                   selectedService = newValue!;
                //                 });
                //               },
                //               items: activeServices);
                //         })),

                ChangeNotifierProvider<BatchListViewViewModel>(
                    create: (BuildContext context) => batchListViewViewModel,
                    child: Consumer<BatchListViewViewModel>(
                        builder: (context, value, _) {
                      activeServiceValue.clear();
                      activeServices.clear();
                      for (var i = 0;
                          i < value.dataList.data!.data!.length;
                          i++) {
                        activeServiceValue
                            .add(value.dataList.data!.data![i].uid.toString());
                        activeServices.add(DropdownMenuItem(
                            value: value.dataList.data!.data![i].uid.toString(),
                            child: Text(value.dataList.data!.data![i].batchName
                                .toString())));
                      }

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Schedule Batch',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          /// batch name dropdown
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 188, 185, 185)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: DropdownButton(
                                isExpanded: true,
                                elevation: 1,
                                dropdownColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                                iconEnabledColor: Colors.black,
                                style: const TextStyle(color: Colors.black),
                                value: selectedService,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedService = newValue!;
                                  });
                                },
                                items: activeServices),
                          ),
                          const SizedBox(
                            height: 15,
                          ),

                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Online Session URL',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: onlinesessionurl,
                            decoration: InputDecoration(
                              hintText: 'Zoom.com/session/264415201014',
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
                              'Date',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: dateschedule,
                            decoration: InputDecoration(
                              hintText: '04-02-2023',
                              suffixIcon: Icon(Icons.date_range_outlined),
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
                              'Time',
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
                                  controller: fromBatch
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
                                  controller: toBatch
                                    ..text = batchTodata.toString(),
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
                            title: 'Create Session',
                            textColor: Colors.white,
                            rounded: true,
                            color: Theme.of(context).primaryColor,
                            onPress: () {
                              if (fromBatch.text.isEmpty) {
                                Utils.flushBarErrorMessage(
                                    'Please enter Time', context);
                              } else if (toBatch.text.isEmpty) {
                                Utils.flushBarErrorMessage(
                                    'Please enter Time', context);
                              } else if (dateschedule.text.isEmpty) {
                                Utils.flushBarErrorMessage(
                                    'Please enter Date', context);
                              } else {
                                Map data = {
                                  "batch_uid": selectedService,
                                  "provide_online_sessions": "",
                                  "online_session_url": onlinesessionurl.text,
                                  "batch_timing_from": fromBatch.text,
                                  "batch_timing_to": toBatch.text,
                                  "sdate": dateschedule.text
                                };
                                print(data);
                                session.fetchCreateSessionListApi(
                                    data, context);
                              }
                            },
                          ),
                          const SizedBox(height: 30),
                        ],
                      );
                    })),
          ),
        ),
      ),
    );
  }
}
