import 'package:drona/res/app_url.dart';
import 'package:drona/view/session_listing/session_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../res/widget/round_button.dart';
import '../../view_model/session_view_model.dart';

class SessionDetailEdit extends StatefulWidget {
  String status;
  String sessionUid;
  String batchName;
  String level;
  String batchTimingFrom;
  String batchTimingTo;
  String sDate;
  String coachProfileUid;
  String onlineSessionUrl;
  bool provideSessionUrl;
  String dayShort;
  String serviceIcon;

  SessionDetailEdit({
    super.key,
    required this.status,
    required this.sessionUid,
    required this.batchName,
    required this.level,
    required this.batchTimingTo,
    required this.batchTimingFrom,
    required this.sDate,
    required this.coachProfileUid,
    required this.onlineSessionUrl,
    required this.provideSessionUrl,
    required this.dayShort,
    required this.serviceIcon,
  });

  @override
  State<SessionDetailEdit> createState() => _SessionDetailEditState();
}

class _SessionDetailEditState extends State<SessionDetailEdit> {
  //multi language support

  SessionViewViewModel sessionViewViewModel = SessionViewViewModel();

  final FlutterLocalization _localization = FlutterLocalization.instance;
  final TextEditingController fullName = TextEditingController();
  final TextEditingController sessionToController = TextEditingController();
  final TextEditingController sessionFromController = TextEditingController();
  final TextEditingController sessionDateController = TextEditingController();
  final TextEditingController onlineSessionUrl = TextEditingController();

  String sessionFromData = '';
  String sessionToData = '';

  selectTimeFrom() async {
    var timepick = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    setState(() {
      sessionFromData = timepick!.format(context);
    });
  }

  selectTimeTo() async {
    var timepick = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    setState(() {
      sessionToData = timepick!.format(context);
    });
  }

  @override
  initState() {
    print("status=${widget.status}");
    print("batchName=${widget.batchName}");
    print("level=${widget.level}");
    print("batchTimingFrom=${widget.batchTimingFrom}");
    print("batchTimingFrom=${widget.batchTimingFrom}");
    print("sDate=${widget.sDate}");
    print("coachProfileUid=${widget.coachProfileUid}");
    print("onlineSessionUrl=${widget.onlineSessionUrl}");
    print("dayShort=${widget.dayShort}");
    print("serviceIcon=${widget.serviceIcon}");
    print("provideSessionUrl=${widget.provideSessionUrl}");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: _localization.supportedLocales,
      localizationsDelegates: _localization.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
            'Edit Session Details',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: const Color.fromARGB(255, 244, 247, 245),
                    elevation: 1,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10, bottom: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Chip(
                                    backgroundColor:
                                        Colors.green.withOpacity(.2),
                                    label: Text(
                                      widget.status,
                                      style: TextStyle(color: Colors.green),
                                    )),
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor:
                                      const Color.fromARGB(255, 217, 217, 217),
                                  child: Image(
                                      height: 25,
                                      image: NetworkImage(
                                          AppUrl.serviceIconEndPoint +
                                              widget.serviceIcon.toString())),
                                )
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.batchName,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    height: 2),
                              ),
                              Text(
                                '${widget.level} - ${widget.dayShort} ,${widget.sDate}, ${widget.batchTimingFrom} to ${widget.batchTimingTo}',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
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
                  controller: onlineSessionUrl,
                  decoration: InputDecoration(
                    hintText: widget.onlineSessionUrl,
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
                Column(
                  children: [
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
          readOnly: true,
          controller: sessionDateController,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            suffixIcon: const Icon(
              Icons.calendar_month,
              size: 30.0,
            ),
            hintText: widget.sDate,
            contentPadding: const EdgeInsets.all(10),
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
              sessionDateController.text = DateFormat('dd-MM-yyyy').format(date);
            }
          },
        ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Time',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: TextFormField(
                            controller: sessionFromController
                              ..text = sessionFromData.toString(),
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: widget.batchTimingFrom,
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
                            controller: sessionToController
                              ..text = sessionToData.toString(),
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: widget.batchTimingTo,
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
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                RoundButton(
                    loading: false,
                    title: 'Update',
                    textColor: Colors.white,
                    rounded: true,
                    color: Theme.of(context).primaryColor,
                    onPress: () {
                      Map<String, dynamic> data = {
                        "session_uid":widget.sessionUid,
                        "provide_online_sessions":onlineSessionUrl.text.isNotEmpty ? true : false,
                        "online_session_url":onlineSessionUrl.text,
                        "batch_timing_from":sessionFromData.isEmpty ? widget.batchTimingFrom : sessionFromData,
                        "batch_timing_to":sessionToData.isEmpty ? widget.batchTimingTo : sessionToData,
                        "sdate":sessionDateController.text.isEmpty ? widget.sDate : sessionDateController.text,
                        "coach_profile_uid":widget.coachProfileUid
                      };
                      print("data==$data");
                      sessionViewViewModel.sessionEditApi(data, context);

                    }),
                const SizedBox(
                  height: 30,
                ),
                RoundButton(
                    loading: false,
                    title: 'Cancel Session',
                    textColor: Colors.white,
                    rounded: true,
                    color: Colors.redAccent,
                    onPress: () {
                      Map<String, dynamic> data =
                        {"session_uid":widget.sessionUid};
                      sessionViewViewModel.sessionCancelApi(data, context).then((value) => Get.to(const SessionList()));
                    }),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
