import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';

import '../../../res/widget/round_button.dart';
import '../assessment.dart';
import 'assignmentPills.dart';
import 'confirmAddedCategoryBox.dart';

class WithSubCategory extends StatefulWidget {
  const WithSubCategory({super.key});

  @override
  State<WithSubCategory> createState() => _WithSubCategoryState();
}

class _WithSubCategoryState extends State<WithSubCategory> {
  //multi language support

  final FlutterLocalization _localization = FlutterLocalization.instance;
  final TextEditingController description = TextEditingController();
  final TextEditingController coachInput = TextEditingController();

  @override
  initState() {
    super.initState();
  }

  String dropDownValue = 'Technical';

  var values = [
    'Physical',
    'Technical',
    'Discipline',
  ];

  String subDropDownValue = 'Bowling';

  var subValue = [
    'Batting',
    'Bowling',
    'Fielding',
    'Wicket keeping',
  ];

  @override
  Widget build(BuildContext context) {
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
            'Assessment 1',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Material(
            color: Colors.white,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(3, 0, 3, 20),
                          child: AssignmentPills(
                              number: 6, active: 2, color: Colors.cyan),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Category',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        /// Category name dropdown
                        Padding(
                          padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 188, 185, 185)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                            ),
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: DropdownButton(
                              isExpanded: true,
                              hint: const Text("Select Category"),
                              elevation: 1,
                              dropdownColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              iconEnabledColor: Colors.black,
                              style: const TextStyle(color: Colors.black),
                              value: dropDownValue,
                              underline: const Divider(
                                color: Colors.transparent,
                              ),
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: values.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropDownValue = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 20)),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Sub Category',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 188, 185, 185)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                            ),
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: DropdownButton(
                              isExpanded: true,
                              hint: const Text("Select Category"),
                              elevation: 1,
                              dropdownColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              iconEnabledColor: Colors.black,
                              style: const TextStyle(color: Colors.black),
                              value: subDropDownValue,
                              underline: const Divider(
                                color: Colors.transparent,
                              ),
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: subValue.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  subDropDownValue = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 20)),
                        // Description
                        const Text(
                          'Description',
                          style: TextStyle(
                            color: Color(0xFF39404A),
                            fontSize: 14,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w600,
                            height: 1.50,
                            letterSpacing: 0.15,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 5)),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                          child: SizedBox(
                            width: double.infinity,
                            child: TextField(
                              style: const TextStyle(fontSize: 14),
                              maxLines: 2,
                              controller: description,
                              decoration: InputDecoration(
                                  hintText:
                                      'Parameters on which you want to test the fitness\nof the candidate',
                                  contentPadding: const EdgeInsets.all(15),
                                  hintStyle: const TextStyle(
                                    color: Color(0xFF626D7E),
                                    fontSize: 14,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400,
                                    height: 1.50,
                                    letterSpacing: 0.15,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFFD0D3D8), width: 0.5),
                                      borderRadius: BorderRadius.circular(5)),
                                  filled: true,
                                  fillColor: const Color(0xFFECEEF0)),
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 20)),
                        // Select Level
                        const Text(
                          'Select Level',
                          style: TextStyle(
                            color: Color(0xFF39404A),
                            fontSize: 14,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w600,
                            height: 1.50,
                            letterSpacing: 0.15,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 5)),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                          child: SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 10, 20, 10),
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFFEAEFF8),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: const Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '1',
                                          style: TextStyle(
                                            color: Color(0xFF2A62B8),
                                            fontSize: 16,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w500,
                                            height: 1.50,
                                            letterSpacing: 0.15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 10, 20, 10),
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFFEAEFF8),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: const Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '2',
                                          style: TextStyle(
                                            color: Color(0xFF2A62B8),
                                            fontSize: 16,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w500,
                                            height: 1.50,
                                            letterSpacing: 0.15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 10, 20, 10),
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFFEAEFF8),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: const Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '3',
                                          style: TextStyle(
                                            color: Color(0xFF2A62B8),
                                            fontSize: 16,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w500,
                                            height: 1.50,
                                            letterSpacing: 0.15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 10, 20, 10),
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFFEAEFF8),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: const Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '4',
                                          style: TextStyle(
                                            color: Color(0xFF2A62B8),
                                            fontSize: 16,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w500,
                                            height: 1.50,
                                            letterSpacing: 0.15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 10, 20, 10),
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFFEAEFF8),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: const Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '5',
                                          style: TextStyle(
                                            color: Color(0xFF2A62B8),
                                            fontSize: 16,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w500,
                                            height: 1.50,
                                            letterSpacing: 0.15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 20)),
                        // Coach Input
                        const Text(
                          'Coach Input',
                          style: TextStyle(
                            color: Color(0xFF39404A),
                            fontSize: 14,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w600,
                            height: 1.50,
                            letterSpacing: 0.15,
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 5)),
                        //Select File
                        Padding(
                          padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                          child: SizedBox(
                            width: double.infinity,
                            child: TextField(
                              style: const TextStyle(fontSize: 14),
                              maxLines: 4,
                              controller: coachInput,
                              decoration: InputDecoration(
                                  hintText: 'eg. Grip,stance',
                                  contentPadding: const EdgeInsets.all(15),
                                  hintStyle: const TextStyle(
                                    color: Color(0xFFC0C4CB),
                                    fontSize: 14,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400,
                                    height: 1.50,
                                    letterSpacing: 0.15,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFFD0D3D8), width: 0.5),
                                      borderRadius: BorderRadius.circular(5)),
                                  fillColor: const Color(0xFFECEEF0)),
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 20)),
                        Container(
                          width: double.infinity,
                          height: 88,
                          margin: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                          padding: const EdgeInsets.all(4),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 0.50, color: Color(0xFFDFE1E4)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFEAEFF8),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: ShapeDecoration(
                                              color: const Color(0xFFCCD9EE),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 24,
                                                  height: 24,
                                                  child: Stack(children: [
                                                    Image.asset(
                                                        'assets/images/upload.png')
                                                  ]),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 15),
                                          const Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Attach Video or Images',
                                                style: TextStyle(
                                                  color: Color(0xFF2A62B8),
                                                  fontSize: 12,
                                                  fontFamily: 'Lato',
                                                  fontWeight: FontWeight.w600,
                                                  height: 1.50,
                                                  letterSpacing: 0.15,
                                                ),
                                              ),
                                              Text(
                                                'or just drag and drop',
                                                style: TextStyle(
                                                  color: Color(0xFF626D7E),
                                                  fontSize: 12,
                                                  fontFamily: 'Lato',
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.50,
                                                  letterSpacing: 0.15,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Divider(
                      height: 2,
                      thickness: 1.5,
                    ),
                  ),
                  Column(
                    children: [
                      RoundButton(
                        loading: false,
                        title: 'Continue',
                        textColor: Colors.white,
                        rounded: true,
                        color: Theme.of(context).primaryColor,
                        onPress: () {
                          if (kDebugMode) {
                            print('${description.text}, ${coachInput.text}');
                          }
                          _dialogBuilder(context);
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
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

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'Confirm added category',
          style: TextStyle(
            color: Color(0xFF39404A),
            fontSize: 17,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 1.50,
            letterSpacing: 0.15,
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        titlePadding: const EdgeInsets.all(20),
        contentPadding: const EdgeInsets.all(0),
        content:  SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ConfirmBoxes(
                  category: 'Physical',
                  level: 3,
                  description:
                      'Parameters on which you want to test the fitness of the candidate'),
              ConfirmBoxes(
                  category: 'Technical - Batting',
                  level: 3,
                  description:
                      'Techniques/movements on which you want to assess the candidate'),
              ConfirmBoxes(
                  category: 'Technical - Bowling',
                  level: 3,
                  description:
                      'Techniques/movements on which you want to assess the candidate'),
              ConfirmBoxes(
                  category: 'Technical - Fielding',
                  level: 3,
                  description:
                      'Techniques/movements on which you want to assess the candidate'),
              ConfirmBoxes(
                  category: 'Technical - Wicket keeping',
                  level: 3,
                  description:
                      'Techniques/movements on which you want to assess the candidate'),
              ConfirmBoxes(
                  category: 'Tactical',
                  level: 3,
                  description:
                      'Parameters on which you want to assess all the strategies and action taken by a candidate'),
              ConfirmBoxes(
                  category: 'Discipline',
                  level: 3,
                  description:
                      'Parameters on which you want to assess the sporting attitude of candidate'),
            ],
          ),
        ),
        actionsPadding: const EdgeInsets.all(20),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width * .33,
                child: RoundButton(
                  title: 'Cancel',
                  onPress: () => Navigator.pop(context),
                  color: Colors.grey[300]!,
                  textColor: Colors.black,
                  rounded: true,
                ),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * .33,
                child: RoundButton(
                  title: 'Submit',
                  onPress: () {
                    Get.to(() => const AssessmentPage(),
                        transition: Transition.rightToLeft);
                    Navigator.pop(context);
                  },
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  rounded: true,
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
