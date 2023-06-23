import 'package:drona/view/trainee_phonbook_add.dart';
import 'package:drona/view_model/trainee_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import '../res/language/language.dart';
import '../res/widget/customradio.dart';
import '../res/widget/datefield.dart';
import '../res/widget/round_button.dart';
import '../res/widget/synctextform.dart';
import '../utils/validation.dart';
import '../view_model/registration_view_model.dart';
import 'package:intl/intl.dart';

class TrainAddManualy extends StatefulWidget {
  String batchId;
  String batchName;

  TrainAddManualy({super.key, required this.batchId, required this.batchName});

  @override
  State<TrainAddManualy> createState() => _TrainAddManualyState();
}

class _TrainAddManualyState extends State<TrainAddManualy> {
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;
  final TextEditingController fullName = TextEditingController();
  final TextEditingController doj = TextEditingController();
  final TextEditingController dob = TextEditingController();
  final TextEditingController dobilling = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController fee = TextEditingController();
  final TextEditingController age = TextEditingController();
  String? _genderValue = 'male';
  ValueChanged<String?> _genderChangedHandler() {
    return (value) => setState(() => _genderValue = value!);
  }

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final traineeViewModel = Provider.of<TraineeViewModel>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: _localization.supportedLocales,
      localizationsDelegates: _localization.localizationsDelegates,

      home: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        resizeToAvoidBottomInset : false ,
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
            //AppLocale.title27.getString(context),
            "Add Trainee In ${widget.batchName}",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const AddPhonebook(),
                  ),
                );
              }),
              icon: const Icon(Icons.contact_page),
              iconSize: 25,
              color: Colors.black,
            )
          ],
        ),
        body: Material(
          color: Colors.white,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    AppLocale.phoneNumber.getString(context),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                AsyncTextFormField(
                    controller: phone,
                    validationDebounce: const Duration(milliseconds: 100),
                    validator: Validation().isPhoneField,
                    keyboardType: TextInputType.phone,
                    hintText: 'eg. 9876521233',
                    isValidatingMessage: 'Enter a valid 10 digit mobile number',
                    valueIsInvalidMessage:
                        'Enter a valid 10 digit mobile number'),
                const SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    AppLocale.fullName.getString(context),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: fullName,
                  decoration: InputDecoration(
                    hintText: 'Enter Full Name',
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

                /// add gender

                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Gender',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomRadio<String>(
                      btnColor: Colors.black,
                      value: 'male',
                      groupValue: _genderValue,
                      onChanged: _genderChangedHandler(),
                      label: 'Male ',
                    ),
                    CustomRadio<String>(
                      btnColor: Colors.black,
                      value: 'female',
                      groupValue: _genderValue,
                      onChanged: _genderChangedHandler(),
                      label: 'Female',
                    ),
                    CustomRadio<String>(
                      btnColor: Colors.black,
                      value: 'other',
                      groupValue: _genderValue,
                      onChanged: _genderChangedHandler(),
                      label: 'Other',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),

                /// dob age
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              AppLocale.dob.getString(context),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            readOnly: true,
                            controller: dob,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              suffixIcon: const Icon(
                                Icons.calendar_month,
                                size: 30.0,
                              ),
                              hintText: "Dob",
                              contentPadding: const EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                            onTap: () async {
                              var date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1930),
                                lastDate: DateTime.now(),
                              );
                              if (date != null) {
                                dob.text =
                                    DateFormat('dd-MM-yyyy').format(date);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width * 0.4,
                    //   child: Column(
                    //     children: [
                    //       Align(
                    //         alignment: Alignment.topLeft,
                    //         child: Text(
                    //           "Age",
                    //           style: Theme.of(context).textTheme.bodyMedium,
                    //         ),
                    //       ),
                    //       const SizedBox(
                    //         height: 10,
                    //       ),
                    //       TextFormField(
                    //         controller: age,
                    //         decoration: InputDecoration(
                    //           hintText: '21',
                    //           contentPadding: const EdgeInsets.all(10),
                    //           border: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(5.0),
                    //             borderSide: BorderSide(
                    //               color: Theme.of(context).primaryColor,
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),

                const SizedBox(
                  height: 15,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              AppLocale.doj.getString(context),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            readOnly: true,
                            controller: doj,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              suffixIcon: const Icon(
                                Icons.calendar_month,
                                size: 30.0,
                              ),
                              hintText: "Doj",
                              contentPadding: const EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                            onTap: () async {
                              var date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1930),
                                lastDate: DateTime.now(),
                              );
                              if (date != null) {
                                doj.text =
                                    DateFormat('dd-MM-yyyy').format(date);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Month of Billing",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          YearMonthPicker(
                              controller: dobilling,
                              hintText: 'Month of Billing'),
                          // DateOfjoining(
                          //     controller: dobilling,
                          //     hintText: 'Month of Billing'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    AppLocale.fee.getString(context),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: fee,
                  decoration: InputDecoration(
                    hintText: '₹ 1000',
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
                RoundButton(
                  loading: false,
                  title: AppLocale.submit.getString(context),
                  textColor: Colors.white,
                  rounded: true,
                  color: Theme.of(context).primaryColor,
                  onPress: () {
                    print(widget.batchId);
                    print(fullName.text);
                    print(phone.text);
                    print(doj.text);
                    print(dobilling.text);
                    print(fee.text);

                    Map<String, dynamic> data = {
                      "batch_uid": widget.batchId,
                      "fullname": fullName.text,
                      "ccode": "91",
                      "mobno": phone.text,
                      "gender": _genderValue,
                      "fees": fee.text,
                      "dateofjoining": doj.text,
                      // "age": age.text,
                      "dob": dob.text,
                      "monthofbilling": dobilling.text,
                      "img": "izf5azt0sy2iurz.jpeg",
                      "relation": "self"
                    };
                    print(data);
                    traineeViewModel.fetchTraineeAddListApi(data, context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



