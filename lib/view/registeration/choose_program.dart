import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../res/language/language.dart';
import '../../res/widget/customradio.dart';
import '../../res/widget/progressPills.dart';
import '../../res/widget/round_button.dart';
import '../../utils/routes/routes_name.dart';

class ChooseProgram extends StatefulWidget {
  const ChooseProgram({super.key});

  @override
  State<ChooseProgram> createState() => _ChooseProgramState();
}

class _ChooseProgramState extends State<ChooseProgram> {
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;
  //custom radio
  // custum radio call in seprate page
  String? _groupValue = 'owner';
  ValueChanged<String?> _valueChangedHandler() {
    return (value) => setState(() => _groupValue = value!);
  }

  String? _genderValue = 'm';
  ValueChanged<String?> _genderChangedHandler() {
    return (value) => setState(() => _genderValue = value!);
  }

  /// button hide and show
  bool agree = true;

  /// chekbox List
  String selected = "";
  List _cartList = [1, 2, 3, 4];
  var _selectedList;
  final Set _saved = Set();

  List<bool> checkBoxSelectionList = [];
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        supportedLocales: _localization.supportedLocales,
        localizationsDelegates: _localization.localizationsDelegates,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: Row(
                children: [
                  progressPills(
                      number: 7,
                      active: 5,
                      color: Theme.of(context).primaryColorLight),
                ],
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  child: Column(children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Choose Your Program For Tennis',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomRadio<String>(
                          value: 'm',
                          groupValue: _genderValue,
                          onChanged: _genderChangedHandler(),
                          label: 'Male ',
                        ),
                        CustomRadio<String>(
                          value: 'f',
                          groupValue: _genderValue,
                          onChanged: _genderChangedHandler(),
                          label: 'Female',
                        ),
                        CustomRadio<String>(
                          value: 'o',
                          groupValue: _genderValue,
                          onChanged: _genderChangedHandler(),
                          label: 'Other',
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: _cartList.length,
                              itemBuilder: (context, index) {
                                return CheckboxListTile(
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  title: Text("Advance"),
                                  value: checkBoxSelectionList[index],
                                  onChanged: (value) {
                                    for (int i = 0;
                                        i < checkBoxSelectionList.length;
                                        i++) {
                                      if (i == index) {
                                        setState(() {
                                          if (checkBoxSelectionList[i] ==
                                              false) {
                                            _saved.remove(_cartList[index]);
                                            checkBoxSelectionList[i] = true;
                                            _saved.add(_cartList[index]);
                                          } else {
                                            checkBoxSelectionList[i] = false;
                                            _saved.remove(_cartList[index]);
                                          }
                                        });
                                      } else {
                                        setState(() {
                                          checkBoxSelectionList[i] = false;
                                        });
                                      }
                                    }
                                  },
                                );
                                // setState(() {
                                //   isCheck = value!;
                                //   agree = value;
                                // });
                              }),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            !agree
                                ? const SizedBox.shrink()
                                : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: 150,
                                      child: TextFormField(
                                        onTap: () {},
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          hintText: '  500',
                                          contentPadding: EdgeInsets.all(15),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          prefixIcon: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.blue.shade700,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10))),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(15),
                                                child: Text('₹/M'),
                                              )),
                                          //prefixIconColor: Colors.blue.shade900,
                                        ),
                                      ),
                                    ),
                                  ),
                            !agree
                                ? const SizedBox.shrink()
                                : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: 150,
                                      child: TextFormField(
                                        // controller: moNoController,
                                        keyboardType: TextInputType.number,

                                        // FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))

                                        decoration: InputDecoration(
                                          hintText: '  Fee',
                                          contentPadding: EdgeInsets.all(15),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          prefixIcon: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade700,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10))),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(15),
                                                child: Text('₹/M'),
                                              )),
                                          //prefixIconColor: Colors.blue.shade900,
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: RoundButton(
                        loading: false,
                        title: AppLocale.title3.getString(context),
                        textColor: Colors.white,
                        rounded: true,
                        color: agree == true
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).primaryColor.withOpacity(0.5),
                        onPress: agree == true
                            ? () {
                                print(_groupValue);
                                print(_genderValue);

                                Navigator.pushNamed(
                                    context, RoutesName.OtpPage);
                              }
                            : () {
                                print('btn dissabled');
                              },
                      ),
                    ),
                  ]),
                ),
              ),
            )));
  }
}
