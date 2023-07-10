import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import 'package:drona/model/session_details_model.dart';


import '../../data/response/status.dart';
import '../../res/app_url.dart';
import '../../res/widget/round_button.dart';
import '../../utils/no_data.dart';
import '../../view_model/session_view_model.dart';
import 'session_detail_edit.dart';

class SessionDetailCancel extends StatefulWidget {

  String uid;
  SessionDetailCancel({super.key, required this.uid});

  @override
  State<SessionDetailCancel> createState() => _SessionDetailCancelState();
}

class _SessionDetailCancelState extends State<SessionDetailCancel> {
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;
  SessionViewViewModel sessionViewModel = SessionViewViewModel();
  List<Data> attendanceList = [];

  final List<int> _selectedItems = <int>[];
  bool value = false;
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
    print("widget.id==${widget.uid}");
    sessionViewModel.fetchSessionDetailsListhApi(widget.uid);
    _foundUsers = _allUsers;
    super.initState();
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
        ),
        body: SingleChildScrollView(
          child: Container(
            padding:  EdgeInsets.all(20),
            child:  ChangeNotifierProvider<SessionViewViewModel>(
                create: (BuildContext context) => sessionViewModel,
                child: Consumer<SessionViewViewModel>(
                    builder: (context, value, _) {
                      // print(value.dataList2.data!.data?[0].batch_name);
                      switch (value.dataList2.status!) {
                        case Status.loading:
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.teal,
                            ),
                          );
                        case Status.completed:
                          if (value.dataList2.data!.data.isEmpty) {
                          }
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
                                          padding:
                                          const EdgeInsets.only(left: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Chip(
                                                  backgroundColor: Colors.green
                                                      .withOpacity(.2),
                                                  label: Text(
                                                    value.dataList2.data!.data[0].status,
                                                    style: const TextStyle(
                                                        color: Colors.green),
                                                  )),
                                              CircleAvatar(
                                                radius: 20,
                                                backgroundColor:
                                                const Color.fromARGB(
                                                    255, 217, 217, 217),
                                                child: Image(
                                                    image: NetworkImage(
                                                        "${AppUrl.serviceIconEndPoint}${value.dataList2.data!.serviceIconName}")),
                                              )
                                            ],
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              value.dataList2.data!.batchName,
                                              style: const TextStyle(
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
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
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

                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: SizedBox(
                                    height: height * .5,
                                    child: ListView.builder(
                                        itemCount: value.dataList2.data!.data.length,
                                        itemBuilder: (context, index) {
                                          // value1 == true ? attendanceList.add(value.dataList2.data!.data[index]) : null;

                                          //var nameText = _foundUsers[index]['name'].split(' ');
                                          return Card(
                                            // key: ValueKey(_foundUsers[index]["id"]),
                                            elevation: 0,
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 0),
                                            child: Column(
                                              children: [
                                                ListTile(
                                                  tileColor: (_selectedItems
                                                      .contains(index))
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
                                                      "${value.dataList2.data!.data[index].traineeName.split(" ")[0][0].toUpperCase()}"
                                                          "${value.dataList2.data!.data[index].traineeName.split(" ")[1][0].toUpperCase()}",
                                                      style:
                                                      const TextStyle(
                                                          fontSize: 14),
                                                    ),
                                                  ),
                                                  title: Text(
                                                    value.dataList2.data!.data[index]
                                                        .traineeName,
                                                    style: const TextStyle(
                                                        color: Color.fromRGBO(
                                                            57, 64, 74, 1),
                                                        fontSize: 14,
                                                        fontWeight:
                                                        FontWeight.w700,
                                                        fontFamily:
                                                        'Loto-Regular'),
                                                  ),
                                                  subtitle: Row(
                                                    children: [
                                                      Text(
                                                        value.dataList2.data!.data[index]
                                                            .gender
                                                            .toUpperCase(),
                                                        // value.dataList2.data!.data[index].id,
                                                        style: const TextStyle(
                                                            color: Color.fromRGBO(
                                                                57, 64, 74, 1),
                                                            fontSize: 12,
                                                            fontWeight:
                                                            FontWeight.w400,
                                                            fontFamily:
                                                            'Loto-Regular'),
                                                      ),
                                                      Text(" - "),
                                                      Text(
                                                        value.dataList2.data!.data[index].dob,
                                                        // value.dataList2.data!.data[index].id,
                                                        style: const TextStyle(
                                                            color: Color.fromRGBO(
                                                                57, 64, 74, 1),
                                                            fontSize: 12,
                                                            fontWeight:
                                                            FontWeight.w400,
                                                            fontFamily:
                                                            'Loto-Regular'),
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
                                                  trailing: SizedBox(
                                                    width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                        0.24,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              /* _onTapPresnet(
                                                                  index);*/
                                                            });
                                                          },
                                                          child: CircleAvatar(
                                                              radius: 13,
                                                              backgroundColor:
                                                              value.dataList2.data!.data[index]
                                                                  .attendance ==
                                                                  'P'
                                                                  ? Colors
                                                                  .green
                                                                  : Colors
                                                                  .green
                                                                  .withOpacity(
                                                                  0.1),
                                                              child: Text(
                                                                'P',
                                                                style: TextStyle(
                                                                    color: value.dataList2.data!.data[index]
                                                                        .attendance ==
                                                                        'P'
                                                                        ? Colors
                                                                        .white
                                                                        : Colors
                                                                        .green),
                                                              )),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            setState(() {
/*
                                                              _onTapAbsent(index);
*/
                                                            });
                                                          },
                                                          child: CircleAvatar(
                                                              radius: 13,
                                                              backgroundColor:
                                                              value.dataList2.data!.data[index]
                                                                  .attendance ==
                                                                  'A'
                                                                  ? Colors
                                                                  .pink
                                                                  : Colors
                                                                  .pink
                                                                  .withOpacity(
                                                                  0.1),
                                                              child: Text(
                                                                'A',
                                                                style: TextStyle(
                                                                    color: value.dataList2.data!.data[index]
                                                                        .attendance ==
                                                                        'A'
                                                                        ? Colors
                                                                        .white
                                                                        : Colors
                                                                        .pink),
                                                              )),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              // _onTapLeave(index);
                                                            });
                                                          },
                                                          child: CircleAvatar(
                                                              radius: 13,
                                                              backgroundColor:
                                                              value.dataList2.data!.data[index]
                                                                  .attendance ==
                                                                  'L'
                                                                  ? Colors
                                                                  .pink
                                                                  : Colors
                                                                  .pink
                                                                  .withOpacity(
                                                                  0.1),
                                                              child: Text(
                                                                'L',
                                                                style: TextStyle(
                                                                    color: value.dataList2.data!.data[index]
                                                                        .attendance ==
                                                                        'L'
                                                                        ? Colors
                                                                        .white
                                                                        : Colors
                                                                        .blue),
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  onTap: () {},
                                                  onLongPress: () {
                                                    if (!_selectedItems
                                                        .contains(index)) {
                                                      setState(() {
                                                        _selectedItems.add(index);
                                                      });
                                                    } else {
                                                      setState(() {
                                                        _selectedItems
                                                            .removeWhere((val) =>
                                                        val == index);
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
                                        })),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                // padding: const EdgeInsets.all(20),
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(44, 98, 163, 243),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      CircleAvatar(
                                          radius: 20,
                                          backgroundColor:
                                          Color.fromARGB(44, 98, 163, 243),
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
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.5),
                                  onPress: () {
                                    //  markedAttendencePopup(context, );
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
      ),
    );
  }
}

