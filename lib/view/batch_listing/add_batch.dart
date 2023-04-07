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

class AddBatch extends StatefulWidget {
  const AddBatch({super.key});

  @override
  State<AddBatch> createState() => _AddBatchState();
}

class _AddBatchState extends State<AddBatch> {
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;
  //custom radio
  // custum radio call in seprate page
  String? _groupLevel = 'beginner';
  ValueChanged<String?> _valueChangedHandler() {
    return (value) => setState(() => _groupLevel = value!);
  }

  String? _groupBatch = 'group';
  ValueChanged<String?> _valueChangedBatch() {
    return (value) => setState(() => _groupBatch = value!);
  }

  String? _genderValue = 'beginner';
  ValueChanged<String?> _genderChangedHandler() {
    return (value) => setState(() => _genderValue = value!);
  }

  String? _groupDays = 'mon';
  ValueChanged<String?> _valueChangedDays() {
    return (value) => setState(() => _groupDays = value!);
  }

  bool value = true;
  bool agree = true;
  final TextEditingController FullName = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();

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

  List<DropdownMenuItem<String>> get dropdownAssignCoach {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("John"), value: "john Smith"),
      DropdownMenuItem(child: Text("Anil"), value: "anil"),
      DropdownMenuItem(child: Text("Ravi"), value: "ravi"),
    ];
    return menuItems;
  }

  String selectedCategory = 'Tennis';
  String selectedAssignCoach = 'john Smith';

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
            'Create Batch',
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
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Batch Name',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: FullName,
                    decoration: InputDecoration(
                      hintText: 'eg. Cricket',
                      contentPadding: EdgeInsets.all(10),
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
                  Align(alignment: Alignment.topLeft, child: Text('Services')),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(255, 188, 185, 185)),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: DropdownButton(
                        isExpanded: true,
                        elevation: 1,
                        dropdownColor: const Color.fromARGB(255, 255, 255, 255),
                        iconEnabledColor: Colors.black,
                        style: const TextStyle(color: Colors.black),
                        value: selectedCategory,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCategory = newValue!;

                            _localization.translate(selectedCategory);
                          });
                        },
                        items: dropdownCategory),
                  ),
                  SizedBox(
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
                                  const BatchList(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(255, 188, 185, 185)),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: DropdownButton(
                        isExpanded: true,
                        elevation: 1,
                        dropdownColor: const Color.fromARGB(255, 255, 255, 255),
                        iconEnabledColor: Colors.black,
                        style: const TextStyle(color: Colors.black),
                        value: selectedAssignCoach,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedAssignCoach = newValue!;

                            _localization.translate(selectedAssignCoach);
                          });
                        },
                        items: dropdownAssignCoach),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'What Level?',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        CustomRadio<String>(
                          btnColor: Colors.black,
                          value: 'beginner',
                          groupValue: _groupLevel,
                          onChanged: _valueChangedHandler(),
                          label: 'Beginner',
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CustomRadio<String>(
                          btnColor: Colors.black,
                          value: 'intermediate',
                          groupValue: _groupLevel,
                          onChanged: _valueChangedHandler(),
                          label: 'Intermediate',
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CustomRadio<String>(
                          btnColor: Colors.black,
                          value: 'advance',
                          groupValue: _groupLevel,
                          onChanged: _valueChangedHandler(),
                          label: 'Advance',
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CustomRadio<String>(
                          btnColor: Colors.black,
                          value: 'professional',
                          groupValue: _groupLevel,
                          onChanged: _valueChangedHandler(),
                          label: 'Professional',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Fee',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: FullName,
                    decoration: InputDecoration(
                      hintText: '200',
                      contentPadding: EdgeInsets.all(10),
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
                      'Type of Batch',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomRadio<String>(
                        btnColor: Colors.black,
                        value: 'group',
                        groupValue: _groupBatch,
                        onChanged: _valueChangedBatch(),
                        label: 'Coaching Group',
                      ),
                      CustomRadio<String>(
                        btnColor: Colors.black,
                        value: 'private',
                        groupValue: _groupBatch,
                        onChanged: _valueChangedBatch(),
                        label: 'Coaching Private',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(children: <Widget>[
                    Checkbox(
                      checkColor: Colors.white,
                      activeColor: Theme.of(context).primaryColor,
                      value: value,
                      onChanged: (value) {
                        setState(() {
                          this.value = value!;
                          agree = value;
                        });
                      },
                    ),
                    SizedBox(
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
                  SizedBox(
                    width: 15,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Online session Url',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: FullName,
                    decoration: InputDecoration(
                      hintText: 'ww.xyz.com',
                      contentPadding: EdgeInsets.all(10),
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
                      'Batch Days',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        CustomRadio<String>(
                          btnColor: Colors.black,
                          value: 'mon',
                          groupValue: _groupDays,
                          onChanged: _valueChangedDays(),
                          label: 'Mon',
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CustomRadio<String>(
                          btnColor: Colors.black,
                          value: 'tue',
                          groupValue: _groupDays,
                          onChanged: _valueChangedDays(),
                          label: 'Tue',
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CustomRadio<String>(
                          btnColor: Colors.black,
                          value: 'wed',
                          groupValue: _groupDays,
                          onChanged: _valueChangedDays(),
                          label: 'Wed',
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CustomRadio<String>(
                          btnColor: Colors.black,
                          value: 'thu',
                          groupValue: _groupDays,
                          onChanged: _valueChangedDays(),
                          label: 'Thu',
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CustomRadio<String>(
                          btnColor: Colors.black,
                          value: 'fri',
                          groupValue: _groupDays,
                          onChanged: _valueChangedDays(),
                          label: 'Fri',
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CustomRadio<String>(
                          btnColor: Colors.black,
                          value: 'sat',
                          groupValue: _groupDays,
                          onChanged: _valueChangedDays(),
                          label: 'Sat',
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CustomRadio<String>(
                          btnColor: Colors.black,
                          value: 'sun',
                          groupValue: _groupDays,
                          onChanged: _valueChangedDays(),
                          label: 'Sun',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Batch Timing',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextFormField(
                          controller: FullName,
                          decoration: InputDecoration(
                            hintText: 'From',
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextFormField(
                          controller: FullName,
                          decoration: InputDecoration(
                            hintText: 'To',
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  RoundButton(
                    loading: false,
                    title: 'Add Trainee',
                    textColor: Colors.white,
                    rounded: true,
                    color: Theme.of(context).primaryColorDark.withOpacity(0.2),
                    onPress: agree == true
                        ? () {
                            Navigator.pushNamed(
                                context, RoutesName.TraineeAddOptions);
                          }
                        : () {
                            print('btn dissabled');
                          },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  RoundButton(
                    loading: false,
                    title: 'Update',
                    textColor: Colors.white,
                    rounded: true,
                    color: agree == true
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).primaryColor.withOpacity(0.5),
                    onPress: agree == true
                        ? () {
                            Navigator.pushNamed(
                                context, RoutesName.TraineeAddOptions);
                          }
                        : () {
                            print('btn dissabled');
                          },
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
