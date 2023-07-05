import 'dart:io';

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
import '../utils/utils.dart';
import '../utils/validation.dart';
import '../view_model/registration_view_model.dart';
import 'package:intl/intl.dart';

class TrainAddManualy extends StatefulWidget {
  String fees;
  String batchId;
  String batchName;
  String pathPage;

  TrainAddManualy({super.key, required this.batchId, required this.batchName, this.pathPage='',this.fees=''});

  @override
  State<TrainAddManualy> createState() => _TrainAddManualyState();
}

class _TrainAddManualyState extends State<TrainAddManualy> {
  bool editFees = false;
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
    fee.text = widget.fees;
  }

  @override
  Widget build(BuildContext context) {
    final traineeViewModel = Provider.of<TraineeViewModel>(context);
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        supportedLocales: _localization.supportedLocales,
        localizationsDelegates: _localization.localizationsDelegates,

        home: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          resizeToAvoidBottomInset : false ,
          appBar: AppBar(
            leading: widget.pathPage=="dashBoard"?
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ) :null,
            title: Text(
              //AppLocale.title27.getString(context),
              "Add Trainee In ${widget.batchName}",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            // actions: [
            //   IconButton(
            //     onPressed: (() {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (BuildContext context) => const AddPhonebook(),
            //         ),
            //       );
            //     }),
            //     icon: const Icon(Icons.contact_page),
            //     iconSize: 25,
            //     color: Colors.black,
            //   )
            // ],
          ),
          body: Material(
            color: Colors.white,
            child: GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
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
                              DateOfBirth(
                                  controller: dob,
                                  hintText: AppLocale.dob.getString(context)),
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
                                height: 15,
                              ),
                              DateOfjoining(controller: doj, hintText: 'Doj'),

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            AppLocale.fee.getString(context),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        TextButton(onPressed: (){
                          /// open modal
                          _openModal(context);
                        }, child: const Text("Edit Fees"))
                      ],
                    ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    TextFormField(
                      readOnly: true,
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
                          FocusManager.instance.primaryFocus?.unfocus();
                          print(widget.batchId);
                          print(fullName.text);
                          print(phone.text);
                          print(doj.text);
                          print(dobilling.text);
                          print(fee.text);
                          if (fullName.text.toString().isEmpty) {
                            Utils.flushBarErrorMessage('Please fill Name', context);
                          }
                          else if (phone.text.toString().isEmpty) {
                            Utils.flushBarErrorMessage('Please fill Number', context);
                          }
                          else if (doj.text.toString().isEmpty) {
                            Utils.flushBarErrorMessage('Please Select Date of Joining', context);
                          }
                          else if (dobilling.text.toString().isEmpty) {
                            Utils.flushBarErrorMessage('Please Select Month Of Blling', context);
                          }
                          else if (fee.text.toString().isEmpty) {
                            Utils.flushBarErrorMessage('Please Fill Salary', context);
                          }
                          else {
                            /// show dialog box
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) {
                                return Center(
                                  child: AlertDialog(
                                    //  title: const Center(child: Text('')),
                                    content:   Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: const BoxDecoration(
                                            color: Colors.green,
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(
                                            Icons.check,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        const Text("Send Invite",style: TextStyle(
                                            fontSize: 14
                                        ),),
                                        const SizedBox(height: 5),

                                        Text('Invite "${fullName.text}" To Your Academy',style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w200
                                        ),),
                                        const SizedBox(height: 5),

                                      ],
                                    ),
                                    contentPadding: const EdgeInsets.all(15),
                                    actions: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                            width: double.infinity,
                                            child: RoundButton(
                                              title: 'Okay',
                                              onPress: () async {
                                                Navigator.pop(context);
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
                                                  "img": "",
                                                  "relation": "self"
                                                };
                                                print(data);
                                                traineeViewModel.fetchTraineeAddListApi(data, context ,"onboarding");
                                              },
                                              rounded: true,
                                              color: Theme.of(context).primaryColor,
                                              textColor: Colors.white,

                                            )
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );

                          }
                        }
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> showExitPopup(context) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SizedBox(
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.close_rounded,
                      color: Colors.redAccent,
                      size: 50.0,
                    ),
                  ),
                  const Text("Do you want to exit?"),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            child: const Text("No",
                                style: TextStyle(color: Colors.black)),
                          )),
                      const SizedBox(width: 15),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            exit(0);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent),
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

  void _openModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height*.4,
            ),
            Dialog(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: fee,
                      decoration: InputDecoration(
                        hintText: "Enter Fees",
                        contentPadding: const EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Theme
                                .of(context)
                                .primaryColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,

                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Dismiss the modal
                          },
                          child: const Text('Cancel'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: ElevatedButton(
                            onPressed: () {

                              // String enteredText = _textEditingController.text;
                              if(fee.text.isEmpty || int.parse(fee.text) <=0)
                              {
                                Utils.flushBarErrorMessage("Please enter valid fees", context);
                              }
                              else
                              {
                                fee.text = fee.text;
                                Navigator.of(context).pop();
                              }

                            },
                            child: const Text('OK'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}



