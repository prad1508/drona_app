import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import '../../res/language/language.dart';
import '../../res/widget/customTextField.dart';
import '../../res/widget/customradio.dart';
import '../../res/widget/progressPills.dart';
import '../../res/widget/round_button.dart';
import '../../utils/routes/routes_name.dart';
import '../../utils/color.dart' as AppColor;
import '../../view_model/registration_view_model.dart';
import '../../view_model/user_view_model.dart';
import 'tellus_acadmic.dart';

class OtpPage extends StatefulWidget {
  final Map<String, String> registration;
  const OtpPage({
    super.key, required  this.registration,
  });

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  OtpTimerButtonController controller = OtpTimerButtonController();
  final TextEditingController otpvalue1 = TextEditingController();
  final TextEditingController otpvalue2 = TextEditingController();
  final TextEditingController otpvalue3 = TextEditingController();
  final TextEditingController otpvalue4 = TextEditingController();
  final TextEditingController otpvalue5 = TextEditingController();
  final TextEditingController otpvalue6 = TextEditingController();
  late String field1, field2, field3, field4, field5, field6;
  String mobNumber= '';

  @override
  initState() {
    mobileNumber();
  }
  mobileNumber() async {
    final prefsData = await SharedPreferences.getInstance();
    List<String>? items = prefsData.getStringList('registerResponse');
    setState(() {
      mobNumber = items![2] + " " + items![3];
    });
  }
 //otp field merge
 Future<void>otpField(String Field) async{
     setState(() {
       field1 = Field;
     });
  }
  Future<void>otpField2(String Field) async{
     setState(() {
       field2 = Field;
     });
  }
  Future<void>otpField3(String Field) async{
     setState(() {
       field3 = Field;
     });
  }
  Future<void>otpField4(String Field) async{
     setState(() {
       field4 = Field;
     });
  }
  Future<void>otpField5(String Field) async{
     setState(() {
       field5 = Field;
     });
  }
  Future<void>otpField6(String Field, context) async{
     setState(() {
       field6 = Field;
     });
  }
 
 //count down timer
 _requestOtp() {
    controller.loading();
    Future.delayed(Duration(seconds: 2), () {
      controller.startTimer();
    });
  }


  @override
  Widget build(BuildContext context) {
    final registration = Provider.of<RegistrationViewModel>(context);
    final Width = MediaQuery.of(context).size.width * 0.8 / 6;
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
                    child: Text(mobNumber,
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
                            onChanged: (otpvalue1){
                              otpField(otpvalue1);
                            },
                            textInputAction: TextInputAction.next,
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
                           onChanged: (otpvalue2){
                              otpField2(otpvalue2);
                            },
                            textInputAction: TextInputAction.next,
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
                             onChanged: (otpvalue3){
                              otpField3(otpvalue3);
                            },
                            textInputAction: TextInputAction.next,
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
                           onChanged: (otpvalue4){
                              otpField4(otpvalue4);
                            },
                            textInputAction: TextInputAction.next,
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
                           onChanged: (otpvalue5){
                              otpField5(otpvalue5);
                            },
                            textInputAction: TextInputAction.next,
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
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: Width,
                        child: TextFormField(
                           onChanged: (otpvalue6){
                              otpField6(otpvalue6, context);

                               if(field1.isEmpty && field2.isEmpty && field3.isEmpty && field4.isEmpty && field5.isEmpty && field6.isEmpty)
                                  {}
                                  else{
                    
                                    registration.OtpVerify(field1 + field2 + field3 + field4 + field5 + field6, context);
                                  }
                            },
                          
                            controller: otpvalue6,
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
                     OtpTimerButton(
                      buttonType: ButtonType.text_button,
                      controller: controller,
                      onPressed:  () {
                         registration.Register(widget.registration, context);
                        // ignore: void_checks
                        return _requestOtp();
                       
                        },
                      text: Text(
                          AppLocale.resendOtp.getString(context),
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                        ),
                      duration: 120,
                    ),
                    ],
                  ),

                 
                  TextButton(
                              style: TextButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: (){
                                Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                const TellusAcadmic(),
                                          ),
                                        );
                              },
                              child: const Text('Disabled'),
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
