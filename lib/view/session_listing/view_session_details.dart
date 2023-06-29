import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../data/response/status.dart';
import '../../res/app_url.dart';
import '../../res/language/language.dart';
import '../../res/widget/round_button.dart';
import '../../utils/no_data.dart';
import '../../view_model/session_view_model.dart';
import '../dashboard/layout.dart';
import '../profile/view_profile.dart';
import 'session_detail_edit.dart';

class ViewSessionalDetails extends StatefulWidget {
  String? id;
  ViewSessionalDetails({super.key, this.id});

  @override
  State<ViewSessionalDetails> createState() => _ViewSessionalDetailsState();
}

class _ViewSessionalDetailsState extends State<ViewSessionalDetails> {
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;
  SessionViewViewModel sessionViewModel = SessionViewViewModel();
  final List<int> _selectedItems = <int>[];
  bool value1 = false;
  final List<Map<String, dynamic>> _allUsers = [
    {
      "id": 1,
      "name": "Aarav saxena",
      "detail": 'M / 24 / Due :  ₹200',
      "proImg": "assets/images/user_profile.png",
      "categorgyImg": "assets/images/Golf.png",
      "level": "Advance"
    },
    {
      "id": 2,
      "name": "Riyaz mohammed",
      "detail": 'M / 26 / Due :  ₹200',
      "proImg": "",
      "categorgyImg": "assets/images/Golf.png",
      "level": "Beginner"
    },
    {
      "id": 2,
      "name": "Riyaz mohammed",
      "detail": 'M / 26 / Due :  ₹200',
      "proImg": "",
      "categorgyImg": "assets/images/Golf.png",
      "level": "Beginner"
    },
    {
      "id": 3,
      "name": "Riyaz mohammed",
      "detail": 'M / 26 / Due :  ₹200',
      "proImg": "",
      "categorgyImg": "assets/images/Golf.png",
      "level": "Beginner"
    },
    {
      "id": 4,
      "name": "Riyaz mohammed",
      "detail": 'M / 26 / Due :  ₹200',
      "proImg": "",
      "categorgyImg": "assets/images/Golf.png",
      "level": "Beginner"
    },
    {
      "id": 5,
      "name": "Riyaz mohammed",
      "detail": 'M / 26 / Due :  ₹200',
      "proImg": "",
      "categorgyImg": "assets/images/Golf.png",
      "level": "Beginner"
    },
    {
      "id": 6,
      "name": "Riyaz mohammed",
      "detail": 'M / 26 / Due :  ₹200',
      "proImg": "",
      "categorgyImg": "assets/images/Golf.png",
      "level": "Beginner"
    }
  ];
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    sessionViewModel.fetchSessionDetailsListhApi(widget.id);
    _foundUsers = _allUsers;
    super.initState();
  }

  //cancel session
  Future<bool> cancelPopup(context) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SizedBox(
              height: 270,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.redAccent,
                        child: Icon(
                          Icons.close_sharp,
                          color: Colors.white,
                          size: 18.0,
                        )),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  const Text("Are you sure?"),
                  const Text(
                    " you want to cancel this session?",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),








                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Chip(
                                backgroundColor: Colors.green.withOpacity(.2),
                                label: const Text(
                                  'Scheduled',
                                  style: TextStyle(color: Colors.green),
                                )),
                            const CircleAvatar(
                              radius: 20,
                              backgroundColor:
                              Color.fromARGB(255, 217, 217, 217),
                              child: Image(
                                  image:
                                  AssetImage('assets/images/tennis.png')),
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
                  const SizedBox(height: 19),
                  Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 197, 196, 196),
                            ),
                            child: const Text("No",
                                style: TextStyle(color: Colors.black)),
                          )),
                      const SizedBox(width: 15),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            markedAttendencePopup(context);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent),
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

  //confirm marked attendence
  Future<bool> markedAttendencePopup(context) async {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SizedBox(
              height: height * .8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Confirm Marked Attendance"),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: height * .7,
                    width: width * 1,
                    child: DefaultTabController(
                        length: 3,
                        initialIndex: 0,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              TabBar(
                                indicatorPadding: const EdgeInsets.all(10),
                                isScrollable: true,
                                labelColor: Colors.black,
                                labelPadding: const EdgeInsets.all(0),
                                unselectedLabelColor: Colors.grey,
                                tabs: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10, left: 10),
                                    child: Chip(
                                      backgroundColor: const Color.fromARGB(
                                          255, 242, 242, 242),
                                      label: const Text(
                                        'Present',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                      avatar: CircleAvatar(
                                        backgroundColor: Colors.blue.shade100,
                                        child:
                                        Text(_foundUsers.length.toString()),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Chip(
                                      backgroundColor: const Color.fromARGB(
                                          255, 242, 242, 242),
                                      label: const Text(
                                        'Absent',
                                      ),
                                      avatar: CircleAvatar(
                                        backgroundColor: Colors.green.shade100,
                                        child: const Text(
                                          '01',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Chip(
                                      backgroundColor: const Color.fromARGB(
                                          255, 242, 242, 242),
                                      label: const Text(
                                        'Leave',
                                      ),
                                      avatar: CircleAvatar(
                                        backgroundColor: Colors.brown.shade100,
                                        child: const Text('01'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: height * .6,
                                decoration: const BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            color: Colors.grey, width: 0.5))),
                                child: TabBarView(
                                  children: <Widget>[
                                    _foundUsers.isNotEmpty
                                        ? ListView.builder(
                                        itemCount: _foundUsers.length,
                                        itemBuilder: (context, index) {
                                          var nameText = _foundUsers[index]
                                          ['name']
                                              .split(' ');
                                          return Card(
                                            key: ValueKey(
                                                _foundUsers[index]["id"]),
                                            elevation: 0,
                                            margin:
                                            const EdgeInsets.symmetric(
                                                vertical: 0),
                                            child: Column(
                                              children: [
                                                ListTile(
                                                  contentPadding:
                                                  const EdgeInsets.all(
                                                      0),
                                                  tileColor: (_selectedItems
                                                      .contains(index))
                                                      ? const Color
                                                      .fromARGB(
                                                      255,
                                                      218,
                                                      218,
                                                      219)
                                                      .withOpacity(0.5)
                                                      : Colors.transparent,
                                                  leading: CircleAvatar(
                                                      radius: 18,
                                                      backgroundColor:
                                                      const Color
                                                          .fromRGBO(
                                                          194,
                                                          235,
                                                          216,
                                                          1),
                                                      child:
                                                      _selectedItems
                                                          .contains(
                                                          index)
                                                          ? const Icon(
                                                        Icons
                                                            .check,
                                                        color: Color.fromRGBO(
                                                            71,
                                                            192,
                                                            136,
                                                            1),
                                                        size:
                                                        30.0,
                                                      )
                                                          : Text(
                                                        (nameText[0][0].toString() +
                                                            nameText[1][0].toString())
                                                            .toUpperCase(),
                                                        style: const TextStyle(
                                                            fontSize:
                                                            12),
                                                      )),
                                                  title: Text(
                                                    _foundUsers[index]
                                                    ['name'],
                                                    style: const TextStyle(
                                                        color:
                                                        Color.fromRGBO(
                                                            57,
                                                            64,
                                                            74,
                                                            1),
                                                        fontSize: 12,
                                                        fontWeight:
                                                        FontWeight.w700,
                                                        fontFamily:
                                                        'Loto-Regular'),
                                                  ),
                                                  subtitle: Text(
                                                    _foundUsers[index]
                                                    ["detail"]
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color:
                                                        Color.fromRGBO(
                                                            57,
                                                            64,
                                                            74,
                                                            1),
                                                        fontSize: 11,
                                                        fontWeight:
                                                        FontWeight.w400,
                                                        fontFamily:
                                                        'Loto-Regular'),
                                                  ),
                                                  trailing: SizedBox(
                                                    width: MediaQuery.of(
                                                        context)
                                                        .size
                                                        .width *
                                                        0.25,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        CircleAvatar(
                                                            radius: 12,
                                                            backgroundColor:
                                                            Colors.green
                                                                .withOpacity(
                                                                0.1),
                                                            child:
                                                            const Text(
                                                              'P',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .green,
                                                                  fontSize:
                                                                  12),
                                                            )),
                                                        CircleAvatar(
                                                            radius: 12,
                                                            backgroundColor: Colors
                                                                .redAccent
                                                                .withOpacity(
                                                                0.1),
                                                            child: const Text(
                                                                'A',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .redAccent,
                                                                    fontSize:
                                                                    12))),
                                                        CircleAvatar(
                                                            radius: 12,
                                                            backgroundColor:
                                                            Colors.blue
                                                                .withOpacity(
                                                                0.1),
                                                            child: const Text(
                                                                'L',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .blue,
                                                                    fontSize:
                                                                    12))),
                                                      ],
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                            const ViewProfilenew()));
                                                  },
                                                  onLongPress: () {
                                                    if (!_selectedItems
                                                        .contains(index)) {
                                                      setState(() {
                                                        _selectedItems
                                                            .add(index);
                                                      });
                                                    } else {
                                                      setState(() {
                                                        _selectedItems
                                                            .removeWhere(
                                                                (val) =>
                                                            val ==
                                                                index);
                                                      });
                                                    }
                                                  },
                                                ),
                                                const Divider(
                                                  height: 5,
                                                ),
                                              ],
                                            ),
                                          );
                                        })
                                        : const Text(
                                      'No results found',
                                      style: TextStyle(fontSize: 24),
                                    ),
                                    _foundUsers.isNotEmpty
                                        ? ListView.builder(
                                        itemCount: _foundUsers.length,
                                        itemBuilder: (context, index) {
                                          var nameText = _foundUsers[index]
                                          ['name']
                                              .split(' ');
                                          return Card(
                                            key: ValueKey(
                                                _foundUsers[index]["id"]),
                                            elevation: 0,
                                            margin:
                                            const EdgeInsets.symmetric(
                                                vertical: 0),
                                            child: Column(
                                              children: [
                                                ListTile(
                                                  contentPadding:
                                                  const EdgeInsets.all(
                                                      0),
                                                  tileColor: (_selectedItems
                                                      .contains(index))
                                                      ? const Color
                                                      .fromARGB(
                                                      255,
                                                      218,
                                                      218,
                                                      219)
                                                      .withOpacity(0.5)
                                                      : Colors.transparent,
                                                  leading: CircleAvatar(
                                                      radius: 18,
                                                      backgroundColor:
                                                      const Color
                                                          .fromRGBO(
                                                          194,
                                                          235,
                                                          216,
                                                          1),
                                                      child:
                                                      _selectedItems
                                                          .contains(
                                                          index)
                                                          ? const Icon(
                                                        Icons
                                                            .check,
                                                        color: Color.fromRGBO(
                                                            71,
                                                            192,
                                                            136,
                                                            1),
                                                        size:
                                                        30.0,
                                                      )
                                                          : Text(
                                                        (nameText[0][0].toString() +
                                                            nameText[1][0].toString())
                                                            .toUpperCase(),
                                                        style: const TextStyle(
                                                            fontSize:
                                                            12),
                                                      )),
                                                  title: Text(
                                                    _foundUsers[index]
                                                    ['name'],
                                                    style: const TextStyle(
                                                        color:
                                                        Color.fromRGBO(
                                                            57,
                                                            64,
                                                            74,
                                                            1),
                                                        fontSize: 12,
                                                        fontWeight:
                                                        FontWeight.w700,
                                                        fontFamily:
                                                        'Loto-Regular'),
                                                  ),
                                                  subtitle: Text(
                                                    _foundUsers[index]
                                                    ["detail"]
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color:
                                                        Color.fromRGBO(
                                                            57,
                                                            64,
                                                            74,
                                                            1),
                                                        fontSize: 11,
                                                        fontWeight:
                                                        FontWeight.w400,
                                                        fontFamily:
                                                        'Loto-Regular'),
                                                  ),
                                                  trailing: SizedBox(
                                                    width: MediaQuery.of(
                                                        context)
                                                        .size
                                                        .width *
                                                        0.25,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        CircleAvatar(
                                                            radius: 12,
                                                            backgroundColor:
                                                            Colors.green
                                                                .withOpacity(
                                                                0.1),
                                                            child:
                                                            const Text(
                                                              'P',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .green,
                                                                  fontSize:
                                                                  12),
                                                            )),
                                                        CircleAvatar(
                                                            radius: 12,
                                                            backgroundColor: Colors
                                                                .redAccent
                                                                .withOpacity(
                                                                0.1),
                                                            child: const Text(
                                                                'A',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .redAccent,
                                                                    fontSize:
                                                                    12))),
                                                        CircleAvatar(
                                                            radius: 12,
                                                            backgroundColor:
                                                            Colors.blue
                                                                .withOpacity(
                                                                0.1),
                                                            child: const Text(
                                                                'L',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .blue,
                                                                    fontSize:
                                                                    12))),
                                                      ],
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                            const ViewProfilenew()));
                                                  },
                                                  onLongPress: () {
                                                    if (!_selectedItems
                                                        .contains(index)) {
                                                      setState(() {
                                                        _selectedItems
                                                            .add(index);
                                                      });
                                                    } else {
                                                      setState(() {
                                                        _selectedItems
                                                            .removeWhere(
                                                                (val) =>
                                                            val ==
                                                                index);
                                                      });
                                                    }
                                                  },
                                                ),
                                                const Divider(
                                                  height: 5,
                                                ),
                                              ],
                                            ),
                                          );
                                        })
                                        : const Text(
                                      'No results found',
                                      style: TextStyle(fontSize: 24),
                                    ),
                                    _foundUsers.isNotEmpty
                                        ? ListView.builder(
                                        itemCount: _foundUsers.length,
                                        itemBuilder: (context, index) {
                                          var nameText = _foundUsers[index]
                                          ['name']
                                              .split(' ');
                                          return Card(
                                            key: ValueKey(
                                                _foundUsers[index]["id"]),
                                            elevation: 0,
                                            margin:
                                            const EdgeInsets.symmetric(
                                                vertical: 0),
                                            child: Column(
                                              children: [
                                                ListTile(
                                                  contentPadding:
                                                  const EdgeInsets.all(
                                                      0),
                                                  tileColor: (_selectedItems
                                                      .contains(index))
                                                      ? const Color
                                                      .fromARGB(
                                                      255,
                                                      218,
                                                      218,
                                                      219)
                                                      .withOpacity(0.5)
                                                      : Colors.transparent,
                                                  leading: CircleAvatar(
                                                      radius: 18,
                                                      backgroundColor:
                                                      const Color
                                                          .fromRGBO(
                                                          194,
                                                          235,
                                                          216,
                                                          1),
                                                      child:
                                                      _selectedItems
                                                          .contains(
                                                          index)
                                                          ? const Icon(
                                                        Icons
                                                            .check,
                                                        color: Color.fromRGBO(
                                                            71,
                                                            192,
                                                            136,
                                                            1),
                                                        size:
                                                        30.0,
                                                      )
                                                          : Text(
                                                        (nameText[0][0].toString() +
                                                            nameText[1][0].toString())
                                                            .toUpperCase(),
                                                        style: const TextStyle(
                                                            fontSize:
                                                            12),
                                                      )),
                                                  title: Text(
                                                    _foundUsers[index]
                                                    ['name'],
                                                    style: const TextStyle(
                                                        color:
                                                        Color.fromRGBO(
                                                            57,
                                                            64,
                                                            74,
                                                            1),
                                                        fontSize: 12,
                                                        fontWeight:
                                                        FontWeight.w700,
                                                        fontFamily:
                                                        'Loto-Regular'),
                                                  ),
                                                  subtitle: Text(
                                                    _foundUsers[index]
                                                    ["detail"]
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color:
                                                        Color.fromRGBO(
                                                            57,
                                                            64,
                                                            74,
                                                            1),
                                                        fontSize: 11,
                                                        fontWeight:
                                                        FontWeight.w400,
                                                        fontFamily:
                                                        'Loto-Regular'),
                                                  ),
                                                  trailing: SizedBox(
                                                    width: MediaQuery.of(
                                                        context)
                                                        .size
                                                        .width *
                                                        0.25,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        CircleAvatar(
                                                            radius: 12,
                                                            backgroundColor:
                                                            Colors.green
                                                                .withOpacity(
                                                                0.1),
                                                            child:
                                                            const Text(
                                                              'P',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .green,
                                                                  fontSize:
                                                                  12),
                                                            )),
                                                        CircleAvatar(
                                                            radius: 12,
                                                            backgroundColor: Colors
                                                                .redAccent
                                                                .withOpacity(
                                                                0.1),
                                                            child: const Text(
                                                                'A',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .redAccent,
                                                                    fontSize:
                                                                    12))),
                                                        CircleAvatar(
                                                            radius: 12,
                                                            backgroundColor:
                                                            Colors.blue
                                                                .withOpacity(
                                                                0.1),
                                                            child: const Text(
                                                                'L',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .blue,
                                                                    fontSize:
                                                                    12))),
                                                      ],
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                            const ViewProfilenew()));
                                                  },
                                                  onLongPress: () {
                                                    if (!_selectedItems
                                                        .contains(index)) {
                                                      setState(() {
                                                        _selectedItems
                                                            .add(index);
                                                      });
                                                    } else {
                                                      setState(() {
                                                        _selectedItems
                                                            .removeWhere(
                                                                (val) =>
                                                            val ==
                                                                index);
                                                      });
                                                    }
                                                  },
                                                ),
                                                const Divider(
                                                  height: 5,
                                                ),
                                              ],
                                            ),
                                          );
                                        })
                                        : const Text(
                                      'No results found',
                                      style: TextStyle(fontSize: 24),
                                    ),
                                  ],
                                ),
                              )
                            ])),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 197, 196, 196),
                            ),
                            child: const Text("Cancel",
                                style: TextStyle(color: Colors.black)),
                          )),
                      const SizedBox(width: 15),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor),
                          child: const Text(
                            "Submit",
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

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
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
              Text(
                _selectedItems.isEmpty ? '' : _selectedItems.length.toString(),
                style: const TextStyle(color: Colors.black),
              )
            ],
          ),
          title: Text(
            'View Session Details',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            _selectedItems.isEmpty
                ? IconButton(
              onPressed: (() {
                /*Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const SessionDetailEdit(),
                                ),
                              );*/
                Get.to(()=> const SessionDetailEdit(),transition: Transition.leftToRight);

              }),
              icon: const Icon(Icons.edit),
              iconSize: 25,
              color: Colors.black,
            )
                : IconButton(
              onPressed: (() {
                if (kDebugMode) {
                  print('add coach list');
                }
              }),
              icon: const Icon(Icons.delete_outline),
              iconSize: 25,
              color: Colors.black,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Material(
            color: Colors.white,
            child: Container(
              padding: const EdgeInsets.all(20),
              child:
              ChangeNotifierProvider<SessionViewViewModel>(
                  create: (BuildContext context) => sessionViewModel,
                  child: Consumer<SessionViewViewModel>(
                      builder: (context, value, _) {
                        // print(value.dataList.data!.data?[0].batch_name);

                        switch(value.dataList.status!){


                          case Status.loading :
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.teal,
                              ),
                            );
                          case Status.completed:
                            return  Column(
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
                                      padding: const EdgeInsets.only(
                                          top: 10, bottom: 10, right: 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Chip(
                                                    backgroundColor:
                                                    Colors.green.withOpacity(.2),
                                                    label:  Text(
                                                      '${value.dataList.data!.data?[0].status}',
                                                      style: const TextStyle(color: Colors.green),
                                                    )),
                                                CircleAvatar(
                                                  radius: 20,
                                                  backgroundColor:
                                                  const Color.fromARGB(255, 217, 217, 217),
                                                  child: Image(
                                                      image: NetworkImage(
                                                          "${AppUrl.imageListendPoint}${value.dataList.data!.data?[0].service_iconname}")),
                                                )
                                              ],
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${value.dataList.data!.data?[0].batch_name}',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    height: 2),
                                              ),
                                              Text( '${value.dataList.data!.data?[0].program_name} - ${value.dataList.data!.data?[0].day_short} ,${value.dataList.data!.data?[0].sdd} ${value.dataList.data!.data?[0].smm} ${value.dataList.data!.data?[0].syy} ${value.dataList.data!.data?[0].batch_timing_from} to ${value.dataList.data!.data?[0].batch_timing_to}',
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
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.check_circle,
                                            color: Colors.grey,
                                            size: 25.0,
                                          ),
                                          Text('Attendance Pending')
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text('Mark all present'),
                                          Checkbox(
                                            value: value1,
                                            onChanged: (value) {
                                              setState(() {
                                                this.value1 = value!;
                                                print('checked');
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: SizedBox(
                                    height: height * .5,
                                    child: _foundUsers.isNotEmpty
                                        ? ListView.builder(
                                        itemCount: value.dataList.data!.data?.length,
                                        itemBuilder: (context, index) {
                                          var nameText =
                                          _foundUsers[index]['name'].split(' ');
                                          return Card(
                                            // key: ValueKey(_foundUsers[index]["id"]),
                                            elevation: 0,
                                            margin:
                                            const EdgeInsets.symmetric(vertical: 0),
                                            child: Column(
                                              children: [
                                                ListTile(
                                                  tileColor:
                                                  (_selectedItems.contains(index))
                                                      ? const Color.fromARGB(
                                                      255, 218, 218, 219)
                                                      .withOpacity(0.5)
                                                      : Colors.transparent,
                                                  leading: CircleAvatar(
                                                      radius: 20.5,
                                                      backgroundColor:
                                                      const Color.fromRGBO(
                                                          194, 235, 216, 1),
                                                      child: _selectedItems
                                                          .contains(index)
                                                          ? const Icon(
                                                        Icons.check,
                                                        color: Color.fromRGBO(
                                                            71, 192, 136, 1),
                                                        size: 30.0,
                                                      )
                                                          : Text(
                                                        (nameText[0][0].toString() +
                                                            nameText[1][0]
                                                                .toString())
                                                            .toUpperCase(),
                                                        style: const TextStyle(
                                                            fontSize: 14),
                                                      )),
                                                  title: Text(
                                                    '${value.dataList.data!.data?[index].trainee_name}',
                                                    style: const TextStyle(
                                                        color:
                                                        Color.fromRGBO(57, 64, 74, 1),
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w700,
                                                        fontFamily: 'Loto-Regular'),
                                                  ),
                                                  subtitle: Text(
                                                    _foundUsers[index]["detail"]
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color:
                                                        Color.fromRGBO(57, 64, 74, 1),
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.w400,
                                                        fontFamily: 'Loto-Regular'),
                                                  ),
                                                  trailing: SizedBox(
                                                    width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                        0.25,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        CircleAvatar(
                                                            radius: 13,
                                                            backgroundColor: Colors.green
                                                                .withOpacity(0.1),
                                                            child: const Text(
                                                              'P',
                                                              style: TextStyle(
                                                                  color: Colors.green),
                                                            )),
                                                        CircleAvatar(
                                                            radius: 13,
                                                            backgroundColor: Colors
                                                                .redAccent
                                                                .withOpacity(0.1),
                                                            child: const Text('A',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .redAccent))),
                                                        CircleAvatar(
                                                            radius: 13,
                                                            backgroundColor: Colors.blue
                                                                .withOpacity(0.1),
                                                            child: const Text('L',
                                                                style: TextStyle(
                                                                    color: Colors.blue))),
                                                      ],
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                            const ViewProfilenew()));
                                                  },
                                                  onLongPress: () {
                                                    if (!_selectedItems.contains(index)) {
                                                      setState(() {
                                                        _selectedItems.add(index);
                                                      });
                                                    } else {
                                                      setState(() {
                                                        _selectedItems.removeWhere(
                                                                (val) => val == index);
                                                      });
                                                    }
                                                  },
                                                ),
                                                const Divider(
                                                  height: 5,
                                                ),
                                              ],
                                            ),
                                          );
                                        })
                                        : const Text(
                                      'No results found',
                                      style: TextStyle(fontSize: 24),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  // padding: const EdgeInsets.all(20),
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(44, 98, 163, 243),
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: const [
                                        CircleAvatar(
                                            radius: 20,
                                            backgroundColor: Color.fromARGB(44, 98, 163, 243),
                                            child: Icon(
                                              Icons.upload,
                                              color: Colors.blueAccent,
                                              size: 20.0,
                                            )),
                                        Text(
                                          'Click to upload your attachment',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    )),
                                const SizedBox(
                                  height: 30,
                                ),
                                RoundButton(
                                    loading: false,
                                    title: 'Submit Attendance',
                                    textColor: Colors.white,
                                    rounded: true,
                                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                                    onPress: () {
                                      /*Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (BuildContext context) => const Layout(
                    selectedIndex: 0,
                    ),
                    ),
                    );*/
                                      Get.to(()=> const Layout(selectedIndex: 0,),transition: Transition.leftToRight);

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
                                      cancelPopup(context);
                                    }),
                                const SizedBox(
                                  height: 30,
                                ),
                              ],
                            );
                          case Status.error:
                            return Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.error_outline,
                                      color: Theme.of(context).primaryColorDark,
                                      size: 100.0,
                                    ),
                                    const NoData()
                                    // Text(
                                    //   value.dataList.message.toString(),
                                    //   style: TextStyle(
                                    //       color: Theme.of(context).primaryColor,
                                    //       fontSize: 20,
                                    //       height: 2),
                                    // )
                                  ],
                                ));
                        }


                      })),


            ),
          ),
        ),
      ),
    );
  }
}

