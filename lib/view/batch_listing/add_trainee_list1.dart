import 'dart:ffi';

import 'package:drona/view/profile/batch_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../res/language/language.dart';
import '../../res/widget/customTextField.dart';
import '../../res/widget/customradio.dart';
import '../../res/widget/progressPills.dart';
import '../../res/widget/round_button.dart';
import '../../utils/routes/routes_name.dart';
import '../../utils/color.dart' as AppColor;

class AddTraineeList1 extends StatefulWidget {
  const AddTraineeList1({super.key});

  @override
  State<AddTraineeList1> createState() => _AddTraineeList1State();
}

class _AddTraineeList1State extends State<AddTraineeList1> {
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;
  final TextEditingController FullName = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  List<Map<String, dynamic>> _foundUsers = [];
  List<int> _selectedItems = <int>[];

  final List<Map<String, dynamic>> _allUsers = [
    {
      "id": 1,
      "name": "Shivendar Singh",
      "proImg": "assets/images/user_profile.png",
      "categorgyImg": "assets/images/Golf.png"
    },
    {
      "id": 2,
      "name": "Aarush mishra",
      "proImg": "assets/images/user_profile.png",
      "categorgyImg": "assets/images/Golf.png"
    },
    {
      "id": 3,
      "name": "Divya Shah",
      "detail": 'Male, +9189555296811',
      "proImg": "assets/images/user_profile.png",
      "categorgyImg": "assets/images/Golf.png"
    }
  ];
  @override
  initState() {
    _foundUsers = _allUsers;
    super.initState();
  }

  void dataFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            'Add Trainee In Tennis Batch',
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
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      side: BorderSide(
                        color: Color.fromARGB(255, 197, 196, 196),
                      ),
                    ),
                    elevation: 0,
                    child: ListTile(
                      title: TextField(
                        onChanged: (value) => dataFilter(value),
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 0.0),
                            hintText: 'Search',
                            border: InputBorder.none),
                      ),
                      trailing: const Icon(Icons.search),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ListView.separated(
                    itemCount: 3,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 115,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 0, left: 20),
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(
                                        "assets/images/user_profile.png"),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Riyaz mohammad",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 24, top: 5),
                                      child: Text("Male | 34 Year"),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Container(
                                    padding: EdgeInsets.only(),
                                    decoration: BoxDecoration(
                                        color: Colors.green.shade100,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text(
                                      "Onboarded",
                                      style: TextStyle(color: Colors.green),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 20, top: 10, right: 10),
                                  child: CircleAvatar(
                                      backgroundImage:
                                          AssetImage("assets/images/Golf.png")),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 1, left: 20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.green.shade700,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text(
                                      "Active",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Text(
                                    "Tenni Batch",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text("03:00 PM to 05:30 PM"),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 65),
                                      child: Text(
                                        " Fee :",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ),
                                    Text("₹10,000"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " Due :",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Text("₹30,000"),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Container(
                        color: Colors.grey,
                        height: 1,
                      );
                    },
                  ),
                  SizedBox(
                    height: 65,
                  ),
                  RoundButton(
                      loading: false,
                      title: 'Add Now',
                      textColor: Colors.white,
                      rounded: true,
                      color: Theme.of(context).primaryColor,
                      onPress: () {
                        Navigator.pushNamed(
                            context, RoutesName.CoachProfileAdd);
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
