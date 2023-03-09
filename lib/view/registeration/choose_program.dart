import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../res/language/language.dart';
import '../../res/widget/customradio.dart';
import '../../res/widget/progressPills.dart';
import '../../res/widget/round_button.dart';
import '../../utils/routes/routes_name.dart';
import '../../res/widget/customradio.dart';

class ChooseProgram extends StatefulWidget {
  const ChooseProgram({super.key});

  @override
  State<ChooseProgram> createState() => _ChooseProgramState();
}

class _ChooseProgramState extends State<ChooseProgram> {
  TextEditingController amountController = TextEditingController();
  TextEditingController feeController = TextEditingController();

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
  static int _len = 4;
  List<bool> isChecked = List.generate(_len, (index) => false);
  String _getTitle() =>
      "Checkbox Demo : Checked = ${isChecked.where((check) => check == true).length}, Unchecked = ${isChecked.where((check) => check == false).length}";
  String _title = "Checkbox Demo";
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
                          btnColor: Colors.black,
                          value: 'm',
                          groupValue: _genderValue,
                          onChanged: _genderChangedHandler(),
                          label: 'Male ',
                        ),
                        CustomRadio<String>(
                          btnColor: Colors.black,
                          value: 'f',
                          groupValue: _genderValue,
                          onChanged: _genderChangedHandler(),
                          label: 'Female',
                        ),
                        CustomRadio<String>(
                          btnColor: Colors.black,
                          value: 'o',
                          groupValue: _genderValue,
                          onChanged: _genderChangedHandler(),
                          label: 'Other',
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                            ),
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: _len,
                                itemBuilder: (context, index) {
                                  return CheckboxListTile(
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    title: Text("Advance"),
                                    value: isChecked[index],
                                    onChanged: (checked) {
                                      setState(() {
                                        // isCheck = checked!;
                                        agree = checked!;
                                        isChecked[index] = checked!;
                                        _title = _getTitle();
                                      });
                                    },
                                  );
                                }),
                          ),
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
                                        controller: amountController,
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
                                    padding: const EdgeInsets.only(
                                        top: 9, bottom: 80),
                                    child: SizedBox(
                                      width: 150,
                                      child: TextFormField(
                                        controller: feeController,
                                        keyboardType: TextInputType.number,
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
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 120),
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

                                // Navigator.pushNamed(
                                //     context, RoutesName.OtpPage);
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
