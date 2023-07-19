import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:provider/provider.dart';

import '../../res/language/language.dart';
import '../../res/widget/progress_pills.dart';
import '../../view_model/registration_view_model.dart';
import 'new_password.dart';



class ForgetOtp extends StatefulWidget {
  const ForgetOtp({super.key});

  @override
  State<ForgetOtp> createState() => _ForgetOtpState();
}

class _ForgetOtpState extends State<ForgetOtp> {
 OtpTimerButtonController controller = OtpTimerButtonController();
  final TextEditingController otpvalue1 = TextEditingController();
  final TextEditingController otpvalue2 = TextEditingController();
  final TextEditingController otpvalue3 = TextEditingController();
  final TextEditingController otpvalue4 = TextEditingController();
//  final TextEditingController otpvalue5 = TextEditingController();
 // final TextEditingController otpvalue6 = TextEditingController();
  late String field1, field2, field3, field4;
      //field5, field6;
  final focus1 = FocusNode();
  final focus2 = FocusNode();
  final focus3 = FocusNode();
  final focus4 = FocusNode();
//  final focus5 = FocusNode();
//  final focus6 = FocusNode();
  String mobNumber= '+91 9658992342';
  String token = '';
  @override
  initState() {
    super.initState();
    mobileNumber();
  }
   Future<bool> _onWillPop() async {
    return false; 
  }
  mobileNumber() async {
    
  }
 //otp field merge
 Future<void>otpField(String field, context) async{
     setState(() {
       field1 = field;
     });
     if(field.isEmpty){
       FocusScope.of(context).requestFocus(focus1);
     }else{
      FocusScope.of(context).requestFocus(focus2);
     }
  }
  Future<void>otpField2(String field, context) async{
     setState(() {
       field2 = field;
     });
    if(field.isEmpty){
       FocusScope.of(context).requestFocus(focus1);
     }else{
      FocusScope.of(context).requestFocus(focus3);
     }
   
  }
  Future<void>otpField3(String field, context) async{
     setState(() {
       field3 = field;
     });
     if(field.isEmpty){
       FocusScope.of(context).requestFocus(focus2);
     }else{
      FocusScope.of(context).requestFocus(focus4);
     }
  }
  Future<void>otpField4(String field, context) async{
     setState(() {
       field4 = field;
     });
    if(field.isEmpty){
       FocusScope.of(context).requestFocus(focus3);
      }
      // else{
     //  FocusScope.of(context).requestFocus(focus5);
     // }
  }
  // Future<void>otpField5(String field, context) async{
  //    setState(() {
  //      field5 = field;
  //    });
  //    if(field.isEmpty){
  //      FocusScope.of(context).requestFocus(focus4);
  //    }else{
  //     FocusScope.of(context).requestFocus(focus6);
  //    }
  //
  // }
  // Future<void>otpField6(String field, context) async{
  //    setState(() {
  //      field6 = field;
  //    });
  //    if(field.isEmpty){
  //      FocusScope.of(context).requestFocus(focus5);
  //    }
  //
  //
  // }
 
 //count down timer
 _requestOtp() {
    controller.loading();
    Future.delayed(const Duration(seconds: 2), () {
      controller.startTimer();
    });
  }


  @override
  Widget build(BuildContext context) {
    final registration = Provider.of<RegistrationViewModel>(context);
    final width = MediaQuery.of(context).size.width * 0.8 / 6;
    return  Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        foregroundColor: Colors.black,
        toolbarHeight: 80,
        title: Text(
                      AppLocale.enterOtp.getString(context),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Material(
            color: Colors.white,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocale.title35.getString(context),
                          style: const TextStyle(
                              color: Color.fromARGB(255, 81, 81, 81),
                              fontSize: 16,
                              fontFamily: 'Loto-Regular')),
                      const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 20.0,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(registration.mobno,
                      style: const TextStyle(
                          height: 1.7,
                          color: Color.fromARGB(255, 81, 81, 81),
                          fontSize: 16,
                          fontFamily: 'Loto-Regular'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width,
                        child: TextFormField(
                            focusNode: focus1,
                            autofocus: true,
                            onChanged: (otpvalue1){
                              otpField(otpvalue1, context);
                              if(field1.isNotEmpty && field2.isNotEmpty && field3.isNotEmpty && field4.isNotEmpty)
                              {
                                registration.resetotpVerify(field1 + field2 + field3 + field4,registration.mobno, context);
                              }
                            },
                            textInputAction: TextInputAction.next,
                            controller: otpvalue1,
                            style:
                                const TextStyle(fontSize: 25, fontFamily: 'poppin'),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: const InputDecoration(
                                hintText: "",
                                counterText: '',
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 20))),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        width: width,
                        
                        child: TextFormField(
                           focusNode: focus2,
                           autofocus: true,
                           onChanged: (otpvalue2){
                              otpField2(otpvalue2, context);
                              if(field1.isNotEmpty && field2.isNotEmpty && field3.isNotEmpty && field4.isNotEmpty)
                              {
                                registration.resetotpVerify(field1 + field2 + field3 + field4,registration.mobno, context);
                              }

                            },
                            textInputAction: TextInputAction.next,
                            controller: otpvalue2,
                            style:
                                const TextStyle(fontSize: 25, fontFamily: 'poppin'),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: const InputDecoration(
                                hintText: "",
                                counterText: '',
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 20.0))),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        width: width,
                        child: TextFormField(
                           focusNode: focus3,
                           autofocus: true,
                             onChanged: (otpvalue3){
                              otpField3(otpvalue3, context);
                              if(field1.isNotEmpty && field2.isNotEmpty && field3.isNotEmpty && field4.isNotEmpty)
                              {
                                registration.resetotpVerify(field1 + field2 + field3 + field4,registration.mobno, context);
                              }
                            },
                            textInputAction: TextInputAction.next,
                            controller: otpvalue3,
                            style:
                                const TextStyle(fontSize: 25, fontFamily: 'poppin'),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: const InputDecoration(
                                hintText: "",
                                counterText: '',
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 20.0))),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        width: width,
                        child: TextFormField(
                          focusNode: focus4,
                           autofocus: true,
                           onChanged: (otpvalue4){
                              otpField4(otpvalue4, context);
                              if(field1.isEmpty && field2.isEmpty && field3.isEmpty && field4.isEmpty)
                              {}
                              else{
                                registration.resetotpVerify(field1 + field2 + field3 + field4,registration.mobno, context);
                              }
                            },
                            textInputAction: TextInputAction.next,
                            controller: otpvalue4,
                            style:
                                const TextStyle(fontSize: 25, fontFamily: 'poppin'),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: const InputDecoration(
                                hintText: "",
                                counterText: '',
                                hintStyle: TextStyle(
                                    color: Colors.black, fontSize: 20.0))),
                      ),
                       const SizedBox(
                        width: 5,
                      ),
                      // SizedBox(
                      //   width: width,
                      //   child: TextFormField(
                      //      focusNode: focus5,
                      //      autofocus: true,
                      //      onChanged: (otpvalue5){
                      //         otpField5(otpvalue5, context);
                      //       },
                      //       textInputAction: TextInputAction.next,
                      //       controller: otpvalue5,
                      //       style:
                      //           const TextStyle(fontSize: 25, fontFamily: 'poppin'),
                      //       textAlign: TextAlign.center,
                      //       keyboardType: TextInputType.number,
                      //       maxLength: 1,
                      //       cursorColor: Theme.of(context).primaryColor,
                      //       decoration: const InputDecoration(
                      //           hintText: "",
                      //           counterText: '',
                      //           hintStyle: TextStyle(
                      //               color: Colors.black, fontSize: 20.0))),
                      // ),
                      // const SizedBox(
                      //   width: 5,
                      // ),
                      // SizedBox(
                      //   width: width,
                      //   child: TextFormField(
                      //      focusNode: focus6,
                      //      autofocus: true,
                      //      onChanged: (otpvalue6){
                      //         otpField6(otpvalue6, context);
                      //
                      //          if(field1.isEmpty && field2.isEmpty && field3.isEmpty && field4.isEmpty && field5.isEmpty && field6.isEmpty)
                      //             {}
                      //             else{
                      //              registration.resetotpVerify(field1 + field2 + field3 + field4 + field5 + field6, context);
                      //             }
                      //       },
                      //
                      //       controller: otpvalue6,
                      //       style:
                      //           const TextStyle(fontSize: 25, fontFamily: 'poppin'),
                      //       textAlign: TextAlign.center,
                      //       keyboardType: TextInputType.number,
                      //       maxLength: 1,
                      //       cursorColor: Theme.of(context).primaryColor,
                      //       decoration: const InputDecoration(
                      //           hintText: "",
                      //           counterText: '',
                      //           hintStyle: TextStyle(
                      //               color: Colors.black, fontSize: 20.0))),
                      // ),
                    ],
                  ),
                  
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocale.title9.getString(context),
                        style: const TextStyle(fontSize: 14),
                      ),
                     OtpTimerButton(
                      buttonType: ButtonType.text_button,
                      controller: controller,
                      onPressed:  () {
                        
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
                  
                ],
              ),
            ),
          ),
        ),
    );
  }
}
