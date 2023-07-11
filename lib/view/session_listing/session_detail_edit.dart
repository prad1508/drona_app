import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../res/widget/round_button.dart';

class SessionDetailEdit extends StatefulWidget {
  String status;
  String batchName;
  String level;
  String batchTimingFrom;
  String batchTimingTo;
  String sDate;
  String coachProfileUid;

  SessionDetailEdit({super.key,required this.status,
    required this.batchName,
    required this.level,
    required this.batchTimingTo,
    required this.batchTimingFrom,
    required this.sDate,
    required this.coachProfileUid
  });

  @override
  State<SessionDetailEdit> createState() => _SessionDetailEditState();
}

class _SessionDetailEditState extends State<SessionDetailEdit> {
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;
  final TextEditingController fullName = TextEditingController();
  final TextEditingController doj = TextEditingController();
  final TextEditingController dobilling = TextEditingController();
  final TextEditingController phone = TextEditingController();

  @override
  initState() {
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
        body: Material(
          color: Colors.white,
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
                                    label: const Text(
                                      'Scheduled',
                                      style: TextStyle(color: Colors.green),
                                    )),
                                const CircleAvatar(
                                  radius: 20,
                                  backgroundColor:
                                  Color.fromARGB(255, 217, 217, 217),
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/tennis.png')),
                                )
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Cricket Batch',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    height: 2),
                              ),
                              Text(
                                'Advance -  Tue, 04 Feb 2023 - 09:30 AM to 10:30 AM',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                SizedBox(
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
                  //controller: phone,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .4,
                      child: Column(
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
                            controller: dobilling,
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
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .4,
                      child: Column(
                        children: [
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
                          TextFormField(
                            controller: dobilling,
                            decoration: InputDecoration(
                              hintText: '09:30  AM to 10:30 AM',
                              suffixIcon: Icon(
                                Icons.watch_later,
                              ),
                              contentPadding: const EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                RoundButton(
                    loading: false,
                    title: 'Update',
                    textColor: Colors.white,
                    rounded: true,
                    color: Theme.of(context).primaryColor,
                    onPress: () {

                    }),
                const SizedBox(
                  height: 10,
                ),
                RoundButton(
                    loading: false,
                    title: 'Cancel Session',
                    textColor: Colors.white,
                    rounded: true,
                    color: Colors.redAccent,
                    onPress: () {

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

