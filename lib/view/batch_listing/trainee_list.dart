import 'package:drona/view/profile/batch_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../../res/language/language.dart';
import '../../res/widget/customTextField.dart';
import '../../res/widget/customradio.dart';
import '../../res/widget/progressPills.dart';
import '../../res/widget/round_button.dart';
import '../../utils/routes/routes_name.dart';
import '../../utils/color.dart' as AppColor;
import 'create_batch_listing.dart';

class TraineeList extends StatefulWidget {
  const TraineeList({super.key});

  @override
  State<TraineeList> createState() => _TraineeListState();
}

class _TraineeListState extends State<TraineeList> {
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;
  //custom radio
  // custum radio call in seprate page
  String? gender = 'None';
  bool value = true;
  bool agree = true;

  Future<bool> isValidPasscode(String value) async {
    return await Future.delayed(Duration(seconds: 1),
        () => value.isNotEmpty && value.toLowerCase() == 'batman');
  }

  List<DropdownMenuItem<String>> get dropdownCategory {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Tennis"), value: "Tennis"),
      DropdownMenuItem(child: Text("Golf"), value: "golf"),
      DropdownMenuItem(child: Text("Cricket"), value: "cricket"),
    ];
    return menuItems;
  }

  String selectedCategory = 'Tennis';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: _localization.supportedLocales,
      localizationsDelegates: _localization.localizationsDelegates,
      home: Scaffold(
        body: Center(
            child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25.0),
                      ),
                    ),
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 400,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(
                              height: 15,
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text('Filters'),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(),
                            SizedBox(
                              height: 15,
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text('Select Service'),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color:
                                          Color.fromARGB(255, 188, 185, 185)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: DropdownButton(
                                    isExpanded: true,
                                    elevation: 1,
                                    dropdownColor: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    iconEnabledColor: Colors.black,
                                    style: const TextStyle(color: Colors.black),
                                    value: selectedCategory,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedCategory = newValue!;

                                        _localization
                                            .translate(selectedCategory);
                                      });
                                    },
                                    items: dropdownCategory),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text('Status'),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Radio(
                                              value: 'None',
                                              groupValue: gender,
                                              onChanged: (value) {
                                                setState(() {
                                                  gender = value.toString();
                                                });
                                              }),
                                          Expanded(
                                            child: Text('None'),
                                          )
                                        ],
                                      ),
                                      flex: 1,
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Radio(
                                              value: 'Active',
                                              groupValue: gender,
                                              onChanged: (value) {
                                                setState(() {
                                                  gender = value.toString();
                                                });
                                              }),
                                          Expanded(child: Text('Active'))
                                        ],
                                      ),
                                      flex: 1,
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Radio(
                                              value: 'Inactive',
                                              groupValue: gender,
                                              onChanged: (value) {
                                                setState(() {
                                                  gender = value.toString();
                                                });
                                              }),
                                          Expanded(child: Text('Inactive'))
                                        ],
                                      ),
                                      flex: 1,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: SizedBox(
                                    width: 140,
                                    child: RoundButton(
                                        loading: false,
                                        title: 'Clear All',
                                        textColor: Colors.white,
                                        rounded: true,
                                        color: Theme.of(context)
                                            .primaryColorDark
                                            .withOpacity(0.2),
                                        onPress: () {
                                          /*Navigator.pushNamed(context,
                                              RoutesName.CreateBatchListing);*/
                                          Get.to(() =>  CreateBatchListing(),
                                              transition:
                                              Transition.leftToRight);
                                        }),
                                  ),
                                ),
                                SizedBox(
                                  width: 140,
                                  child: RoundButton(
                                      loading: false,
                                      title: 'Apply',
                                      textColor: Colors.white,
                                      rounded: true,
                                      color: Theme.of(context).primaryColor,
                                      onPress: () {
                                        /*Navigator.pushNamed(context,
                                            RoutesName.CreateBatchListing);*/
                                        Get.to(() =>  CreateBatchListing(), transition: Transition.rightToLeft);
                                      }),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Text('data'))),
      ),
    );
  }
}
