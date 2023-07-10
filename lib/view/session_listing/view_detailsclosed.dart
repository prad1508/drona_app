import 'package:drona/res/app_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import 'package:drona/model/session_details_model.dart';

import '../../data/response/status.dart';
import '../../res/widget/round_button.dart';
import '../../utils/no_data.dart';
import '../../view_model/session_view_model.dart';
import 'session_detail_edit.dart';

class ViewDetailClosed extends StatefulWidget {
  String id;
  ViewDetailClosed(
      {super.key,
        required this.id,
      });

  @override
  State<ViewDetailClosed> createState() => _ViewDetailClosedState();
}

class _ViewDetailClosedState extends State<ViewDetailClosed> {
  //multi language support
  SessionViewViewModel sessionViewModel = SessionViewViewModel();

  final FlutterLocalization _localization = FlutterLocalization.instance;

  final List<int> _selectedItems = <int>[];
  bool value1 = true;
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

  TextEditingController feedbackTraineeController = TextEditingController();
  TextEditingController feedbackAcademyController = TextEditingController();
  @override
  initState() {
    sessionViewModel.fetchSessionDetailsListhApi(widget.id);
    _foundUsers = _allUsers;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
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
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: ChangeNotifierProvider<SessionViewViewModel>(
              create: (BuildContext context) => sessionViewModel,
              child:
              Consumer<SessionViewViewModel>(builder: (context, value, _) {
                // print(value.dataList2.data!.data?[0].batch_name);

                switch (value.dataList2.status!) {
                  case Status.loading:
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.teal,
                      ),
                    );
                  case Status.completed:
                  /* if (attendanceList.isEmpty) {
                            attendanceList.addAll(value.dataList2.data!.data);
                          }*/
                    return Column(
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
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Chip(
                                            backgroundColor: Colors.redAccent
                                                .withOpacity(.2),
                                            label: Text(
                                              value.dataList2.data!.status
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.redAccent),
                                            )),
                                        CircleAvatar(
                                            radius: 20,
                                            backgroundColor: Color.fromARGB(
                                                255, 217, 217, 217),
                                            child: Image(
                                                image: NetworkImage(AppUrl
                                                    .serviceIconEndPoint +
                                                    value.dataList2.data!
                                                        .serviceIconName))

                                        )
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        value.dataList2.data!.batchName
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            height: 2),
                                      ),
                                      Text(
                                        '${value.dataList2.data!.programName} - ${value.dataList2.data!.data[0].dayShort} ,${value.dataList2.data!.data[0].sdd} ${value.dataList2.data!.data[0].smm} ${value.dataList2.data!.data[0].syy} ${value.dataList2.data!.data[0].batchTimingFrom} to ${value.dataList2.data!.data[0].batchTimingTo}',
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
                                children: [
                                  Checkbox(
                                    value: value1,
                                    onChanged: (value) {
                                      setState(() {
                                        value1 = value!;
                                        print('checked');
                                      });
                                    },
                                  ),
                                  const Text('Attendance Marked')
                                ],
                              ),
                            ],
                          ),
                        ),
                        DefaultTabController(
                            length: 3,
                            initialIndex: 0,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  TabBar(
                                    indicatorPadding: const EdgeInsets.all(10),
                                    isScrollable: true,
                                    labelColor: Colors.black,
                                    labelPadding: const EdgeInsets.all(0),
                                    indicatorColor: Colors.transparent,
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
                                            style:
                                            TextStyle(color: Colors.blue),
                                          ),
                                         /* avatar: CircleAvatar(
                                              backgroundColor:
                                              Colors.blue.shade100,
                                              child:  Text(value.dataList2.data!
                                                  .data.length
                                                  .toString())

                                          ),*/
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10, left: 10),
                                        child: Chip(
                                          backgroundColor: const Color.fromARGB(
                                              255, 242, 242, 242),
                                          label: const Text(
                                            'Absent',
                                          ),
                                          /*avatar: CircleAvatar(
                                              backgroundColor:
                                              Colors.blue.shade100,
                                              child:  Text(value.dataList2.data!
                                                  .data.length
                                                  .toString())

                                          ),*/
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10, left: 10),
                                        child: Chip(
                                          backgroundColor: const Color.fromARGB(
                                              255, 242, 242, 242),
                                          label: const Text(
                                            'Leave',
                                          ),
                                          /*avatar:CircleAvatar(
                                              backgroundColor:
                                              Colors.blue.shade100,
                                              child: Text(value.dataList2.data!
                                                  .data.length.toString())

                                          ),*/
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: height * .35,
                                    decoration: const BoxDecoration(
                                      // color: Colors.green,
                                        border: Border(
                                            top: BorderSide(
                                                color: Colors.grey,
                                                width: 0.5))),
                                    child: TabBarView(
                                      children: <Widget>[
                                        SingleChildScrollView(
                                          child: SizedBox(
                                              height: height * .4,
                                              child:
                                              ListView.builder(
                                                  itemCount: value
                                                      .dataList2
                                                      .data!
                                                      .data
                                                      .length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return value
                                                        .dataList2
                                                        .data!
                                                        .data[
                                                    index]
                                                        .attendance ==
                                                        "P"
                                                        ? Card(
                                                      elevation:
                                                      0,
                                                      margin: const EdgeInsets
                                                          .symmetric(
                                                          vertical:
                                                          0),
                                                      child:
                                                      Column(
                                                        children: [
                                                          ListTile(
                                                            tileColor: (_selectedItems.contains(index))
                                                                ? const Color.fromARGB(255, 218, 218, 219).withOpacity(0.5)
                                                                : Colors.transparent,
                                                            leading: CircleAvatar(
                                                                radius: 20.5,
                                                                backgroundColor: const Color.fromRGBO(194, 235, 216, 1),
                                                                child: _selectedItems.contains(index)
                                                                    ? const Icon(
                                                                  Icons.check,
                                                                  color: Color.fromRGBO(71, 192, 136, 1),
                                                                  size: 30.0,
                                                                )
                                                                    : Text(
                                                                  (value.dataList2.data!.data[index].traineeName[0][0].toString() + value.dataList2.data!.data[index].traineeName[1][0].toString()).toUpperCase(),
                                                                  style: const TextStyle(fontSize: 14),
                                                                )),
                                                            title:
                                                            Text(
                                                              value.dataList2.data!.data[index].traineeName,
                                                              style: const TextStyle(
                                                                  color: Color.fromRGBO(57, 64, 74, 1),
                                                                  fontSize: 14,
                                                                  fontWeight: FontWeight.w700,
                                                                  fontFamily: 'Loto-Regular'),
                                                            ),
                                                            subtitle:
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  value.dataList2.data!.data[index].gender.toUpperCase(),
                                                                  // value.dataList2.data!.data[index].id,
                                                                  style: const TextStyle(color: Color.fromRGBO(57, 64, 74, 1), fontSize: 12, fontWeight: FontWeight.w400, fontFamily: 'Loto-Regular'),
                                                                ),
                                                                Text(" - "),
                                                                Text(
                                                                  value.dataList2.data!.data[index].dob,
                                                                  // value.dataList2.data!.data[index].id,
                                                                  style: const TextStyle(color: Color.fromRGBO(57, 64, 74, 1), fontSize: 12, fontWeight: FontWeight.w400, fontFamily: 'Loto-Regular'),
                                                                ),
                                                                /*Container(height: 10,width: 1,color: Colors.grey,margin: EdgeInsets.all(2),),
                                                      Text(
                                                        "Due: ${value.dataList2.data!.data[index].fees}",
                                                        // value.dataList2.data!.data[index].id,
                                                        style: const TextStyle(
                                                            color: Color.fromRGBO(
                                                                57, 64, 74, 1),
                                                            fontSize: 12,
                                                            fontWeight:
                                                            FontWeight.w400,
                                                            fontFamily:
                                                            'Loto-Regular'),
                                                      ),*/
                                                              ],
                                                            ),
                                                            trailing:
                                                            SizedBox(
                                                              width:
                                                              MediaQuery.of(context).size.width * 0.25,
                                                              child:
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                children: [
                                                                  CircleAvatar(
                                                                      radius: 13,
                                                                      backgroundColor: Colors.green,
                                                                      child: Text(
                                                                        value.dataList2.data!.data[index].attendance.toString(),
                                                                        style: const TextStyle(color: Colors.white),
                                                                      )),
                                                                ],
                                                              ),
                                                            ),
                                                            onTap:
                                                                () {},
                                                            onLongPress:
                                                                () {
                                                              if (!_selectedItems.contains(index)) {
                                                                setState(() {
                                                                  _selectedItems.add(index);
                                                                });
                                                              } else {
                                                                setState(() {
                                                                  _selectedItems.removeWhere((val) => val == index);
                                                                });
                                                              }
                                                            },
                                                          ),
                                                          const Divider(
                                                            height:
                                                            5,
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                        : const SizedBox();
                                                  })

                                          ),
                                        ),
                                        SingleChildScrollView(
                                          child: SizedBox(
                                              height: height * .57,
                                              child: ListView.builder(
                                                  itemCount: value
                                                      .dataList2
                                                      .data!
                                                      .data
                                                      .length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return value
                                                        .dataList2
                                                        .data!
                                                        .data[
                                                    index]
                                                        .attendance ==
                                                        "A"
                                                        ? Card(
                                                      elevation:
                                                      0,
                                                      margin: const EdgeInsets
                                                          .symmetric(
                                                          vertical:
                                                          0),
                                                      child:
                                                      Column(
                                                        children: [
                                                          ListTile(
                                                            tileColor: (_selectedItems.contains(index))
                                                                ? const Color.fromARGB(255, 218, 218, 219).withOpacity(0.5)
                                                                : Colors.transparent,
                                                            leading: CircleAvatar(
                                                                radius: 20.5,
                                                                backgroundColor: const Color.fromRGBO(194, 235, 216, 1),
                                                                child: _selectedItems.contains(index)
                                                                    ? const Icon(
                                                                  Icons.check,
                                                                  color: Color.fromRGBO(71, 192, 136, 1),
                                                                  size: 30.0,
                                                                )
                                                                    : Text(
                                                                  (value.dataList2.data!.data[index].traineeName[0][0].toString() + value.dataList2.data!.data[index].traineeName[1][0].toString()).toUpperCase(),
                                                                  style: const TextStyle(fontSize: 14),
                                                                )),
                                                            title:
                                                            Text(
                                                              value.dataList2.data!.data[index].traineeName,
                                                              style: const TextStyle(
                                                                  color: Color.fromRGBO(57, 64, 74, 1),
                                                                  fontSize: 14,
                                                                  fontWeight: FontWeight.w700,
                                                                  fontFamily: 'Loto-Regular'),
                                                            ),
                                                            subtitle:
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  value.dataList2.data!.data[index].gender.toUpperCase(),
                                                                  // value.dataList2.data!.data[index].id,
                                                                  style: const TextStyle(color: Color.fromRGBO(57, 64, 74, 1), fontSize: 12, fontWeight: FontWeight.w400, fontFamily: 'Loto-Regular'),
                                                                ),
                                                                Text(" - "),
                                                                Text(
                                                                  value.dataList2.data!.data[index].dob,
                                                                  // value.dataList2.data!.data[index].id,
                                                                  style: const TextStyle(color: Color.fromRGBO(57, 64, 74, 1), fontSize: 12, fontWeight: FontWeight.w400, fontFamily: 'Loto-Regular'),
                                                                ),
                                                                /*Container(height: 10,width: 1,color: Colors.grey,margin: EdgeInsets.all(2),),
                                                      Text(
                                                        "Due: ${value.dataList2.data!.data[index].fees}",
                                                        // value.dataList2.data!.data[index].id,
                                                        style: const TextStyle(
                                                            color: Color.fromRGBO(
                                                                57, 64, 74, 1),
                                                            fontSize: 12,
                                                            fontWeight:
                                                            FontWeight.w400,
                                                            fontFamily:
                                                            'Loto-Regular'),
                                                      ),*/
                                                              ],
                                                            ),
                                                            trailing:
                                                            SizedBox(
                                                              width:
                                                              MediaQuery.of(context).size.width * 0.25,
                                                              child:
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                children: [
                                                                  CircleAvatar(
                                                                      radius: 13,
                                                                      backgroundColor: Colors.green,
                                                                      child: Text(
                                                                        value.dataList2.data!.data[index].attendance.toString(),
                                                                        style: const TextStyle(color: Colors.white),
                                                                      )),
                                                                ],
                                                              ),
                                                            ),
                                                            onTap:
                                                                () {},
                                                            onLongPress:
                                                                () {
                                                              if (!_selectedItems.contains(index)) {
                                                                setState(() {
                                                                  _selectedItems.add(index);
                                                                });
                                                              } else {
                                                                setState(() {
                                                                  _selectedItems.removeWhere((val) => val == index);
                                                                });
                                                              }
                                                            },
                                                          ),
                                                          const Divider(
                                                            height:
                                                            5,
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                        : const SizedBox();
                                                  })),
                                        ),
                                        SingleChildScrollView(
                                          child: SizedBox(
                                              height: height * .57,
                                              child: ListView.builder(
                                                  itemCount: value
                                                      .dataList2
                                                      .data!
                                                      .data
                                                      .length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return value
                                                        .dataList2
                                                        .data!
                                                        .data[
                                                    index]
                                                        .attendance ==
                                                        "L"
                                                        ? Card(
                                                      elevation:
                                                      0,
                                                      margin: const EdgeInsets
                                                          .symmetric(
                                                          vertical:
                                                          0),
                                                      child:
                                                      Column(
                                                        children: [
                                                          ListTile(
                                                            tileColor: (_selectedItems.contains(index))
                                                                ? const Color.fromARGB(255, 218, 218, 219).withOpacity(0.5)
                                                                : Colors.transparent,
                                                            leading: CircleAvatar(
                                                                radius: 20.5,
                                                                backgroundColor: const Color.fromRGBO(194, 235, 216, 1),
                                                                child: _selectedItems.contains(index)
                                                                    ? const Icon(
                                                                  Icons.check,
                                                                  color: Color.fromRGBO(71, 192, 136, 1),
                                                                  size: 30.0,
                                                                )
                                                                    : Text(
                                                                  (value.dataList2.data!.data[index].traineeName[0][0].toString() + value.dataList2.data!.data[index].traineeName[1][0].toString()).toUpperCase(),
                                                                  style: const TextStyle(fontSize: 14),
                                                                )),
                                                            title:
                                                            Text(
                                                              value.dataList2.data!.data[index].traineeName,
                                                              style: const TextStyle(
                                                                  color: Color.fromRGBO(57, 64, 74, 1),
                                                                  fontSize: 14,
                                                                  fontWeight: FontWeight.w700,
                                                                  fontFamily: 'Loto-Regular'),
                                                            ),
                                                            subtitle:
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  value.dataList2.data!.data[index].gender.toUpperCase(),
                                                                  // value.dataList2.data!.data[index].id,
                                                                  style: const TextStyle(color: Color.fromRGBO(57, 64, 74, 1), fontSize: 12, fontWeight: FontWeight.w400, fontFamily: 'Loto-Regular'),
                                                                ),
                                                                Text(" - "),
                                                                Text(
                                                                  value.dataList2.data!.data[index].dob,
                                                                  // value.dataList2.data!.data[index].id,
                                                                  style: const TextStyle(color: Color.fromRGBO(57, 64, 74, 1), fontSize: 12, fontWeight: FontWeight.w400, fontFamily: 'Loto-Regular'),
                                                                ),
                                                                /*Container(height: 10,width: 1,color: Colors.grey,margin: EdgeInsets.all(2),),
                                                      Text(
                                                        "Due: ${value.dataList2.data!.data[index].fees}",
                                                        // value.dataList2.data!.data[index].id,
                                                        style: const TextStyle(
                                                            color: Color.fromRGBO(
                                                                57, 64, 74, 1),
                                                            fontSize: 12,
                                                            fontWeight:
                                                            FontWeight.w400,
                                                            fontFamily:
                                                            'Loto-Regular'),
                                                      ),*/
                                                              ],
                                                            ),
                                                            trailing:
                                                            SizedBox(
                                                              width:
                                                              MediaQuery.of(context).size.width * 0.25,
                                                              child:
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                children: [
                                                                  CircleAvatar(
                                                                      radius: 13,
                                                                      backgroundColor: Colors.green,
                                                                      child: Text(
                                                                        value.dataList2.data!.data[index].attendance.toString(),
                                                                        style: const TextStyle(color: Colors.white),
                                                                      )),
                                                                ],
                                                              ),
                                                            ),
                                                            onTap:
                                                                () {},
                                                            onLongPress:
                                                                () {
                                                              if (!_selectedItems.contains(index)) {
                                                                setState(() {
                                                                  _selectedItems.add(index);
                                                                });
                                                              } else {
                                                                setState(() {
                                                                  _selectedItems.removeWhere((val) => val == index);
                                                                });
                                                              }
                                                            },
                                                          ),
                                                          const Divider(
                                                            height:
                                                            5,
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                        : const SizedBox();
                                                  })),
                                        ),
                                      ],
                                    ),
                                  )
                                ])),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(44, 98, 163, 243),
                              borderRadius:
                              BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CircleAvatar(
                                    radius: 25,
                                    backgroundColor:
                                    Color.fromARGB(44, 98, 163, 243),
                                    child: Icon(
                                      Icons.attach_file,
                                      color: Colors.blueAccent,
                                      size: 30.0,
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: const [
                                    Text(
                                      'View File',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      'abc.pdf',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 30,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Feedback for Trainee',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: feedbackTraineeController,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.done,
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: value.dataList2.data!.feedbackTrainee.toString(),
                            contentPadding: const EdgeInsets.all(10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Feedback	for	Academy',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: feedbackAcademyController,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.done,
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: value.dataList2.data!.feedbackAcademy.toString(),
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
                          height: 30,
                        ),
                        value.dataList2.data!.status == "close"? SizedBox():
                        RoundButton(
                            loading: false,
                            title: 'Close Session',
                            textColor: Colors.white,
                            rounded: true,
                            color: Theme.of(context).primaryColor,
                            onPress: () {
                              //  markedAttendencePopup(context, );

                              Map<String, dynamic> data = {
                                "session_uid": widget.id,
                                "feedback_trainee":
                                feedbackTraineeController.text,
                                "feedback_academy":
                                feedbackAcademyController.text,
                                "attachfile": []
                              };
                              print("data==$data");
                              sessionViewModel.sessionCloseApi(data, context);
                            }),
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
                            //   value.dataList2.message.toString(),
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
    );
  }
}

