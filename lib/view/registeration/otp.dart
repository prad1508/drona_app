import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../res/language/language.dart';
import '../../res/widget/asyntextfield.dart';
import '../../res/widget/customTextField.dart';
import '../../res/widget/customradio.dart';
import '../../res/widget/progressPills.dart';
import '../../res/widget/round_button.dart';
import '../../utils/routes/routes_name.dart';
import '../../utils/color.dart' as AppColor;
import 'tellus_acadmic.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({
    super.key,
  });

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController otpvalue1 = TextEditingController();
  final TextEditingController otpvalue2 = TextEditingController();
  final TextEditingController otpvalue3 = TextEditingController();
  final TextEditingController otpvalue4 = TextEditingController();
  final TextEditingController otpvalue5 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Width = MediaQuery.of(context).size.width * 0.8 / 5;
    return MaterialApp(
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
                  active: 1,
                  color: Theme.of(context).primaryColorLight),
            ],
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
                    alignment: Alignment.center,
                    child: Text(
                      AppLocale.enterOtp.getString(context),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocale.title8.getString(context),
                          style: TextStyle(
                              color: Color.fromARGB(255, 81, 81, 81),
                              fontSize: 16,
                              fontFamily: 'Loto-Regular')),
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 20.0,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '+91 9658992342',
                      style: TextStyle(
                          height: 1.7,
                          color: Color.fromARGB(255, 81, 81, 81),
                          fontSize: 16,
                          fontFamily: 'Loto-Regular'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: Width,
                        child: TextFormField(
                            controller: otpvalue1,
                            style:
                                TextStyle(fontSize: 25, fontFamily: 'poppin'),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: InputDecoration(
                                hintText: "*",
                                counterText: '',
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 20))),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: Width,
                        child: TextFormField(
                            controller: otpvalue2,
                            style:
                                TextStyle(fontSize: 25, fontFamily: 'poppin'),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: InputDecoration(
                                hintText: "*",
                                counterText: '',
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 20.0))),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: Width,
                        child: TextFormField(
                            controller: otpvalue3,
                            style:
                                TextStyle(fontSize: 25, fontFamily: 'poppin'),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: InputDecoration(
                                hintText: "*",
                                counterText: '',
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 20.0))),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: Width,
                        child: TextFormField(
                            controller: otpvalue4,
                            style:
                                TextStyle(fontSize: 25, fontFamily: 'poppin'),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: InputDecoration(
                                hintText: "*",
                                counterText: '',
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 20.0))),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: Width,
                        child: TextFormField(
                            controller: otpvalue5,
                            style:
                                TextStyle(fontSize: 25, fontFamily: 'poppin'),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: InputDecoration(
                                hintText: "*",
                                counterText: '',
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 20.0))),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      '1:01',
                      style: TextStyle(
                        height: 1.7,
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocale.title9.getString(context),
                        style: TextStyle(fontSize: 14),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  TellusAcadmic(),
                            ),
                          );
                        },
                        child: Text(
                          AppLocale.resendOtp.getString(context),
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ],
                  ),
                  // TextButton(
                  //   style: TextButton.styleFrom(
                  //     textStyle: const TextStyle(fontSize: 20),
                  //   ),
                  //   onPressed: () {
                  //     print(
                  //         '${otpvalue1.text}${otpvalue2.text}${otpvalue3.text}${otpvalue4.text}${otpvalue5.text}');
                  //   },
                  //   child: const Text('Disabled'),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
