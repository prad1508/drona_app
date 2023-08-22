import 'package:drona/view/registeration/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../res/widget/round_button.dart';
import '../../utils/utils.dart';
import '../../view_model/registration_view_model.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  // //multi language support
  // final FlutterLocalization _localization = FlutterLocalization.instance;
  //MyservicesViewViewModel myservicesViewViewModel = MyservicesViewViewModel();
  // final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController oldpass = TextEditingController();
  final TextEditingController newpass = TextEditingController();
  bool oldPassword = true;

  // RegistrationViewModel registrationViewModel = RegistrationViewModel();
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final setnewPassword = Provider.of<RegistrationViewModel>(context);
    return MaterialApp(
      // supportedLocales: _localization.supportedLocales,
      // localizationsDelegates: _localization.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          toolbarHeight: 80,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(
            'Change Password',
            style: TextStyle(fontSize: 18),
          ),
          centerTitle: true,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Material(
              color: Colors.white,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Enter Old Password',
                        style:
                            TextStyle(fontSize: 16, fontFamily: 'Loto-Regular'),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    // AsyncTextFormField(
                    //     controller: phone,
                    //     validationDebounce: const Duration(milliseconds: 100),
                    //     validator: Validation().isPhoneField,
                    //     keyboardType: TextInputType.phone,
                    //     hintText: '**********',
                    //     isValidatingMessage:
                    //         'Enter your old Password',
                    //     valueIsInvalidMessage:
                    //         'Enter your old Password'),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        controller: oldpass,
                        decoration: InputDecoration(
                            hintText: '**********',
                            contentPadding: EdgeInsets.only(top: 10, left: 10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Enter New Password',
                        style:
                            TextStyle(fontSize: 16, fontFamily: 'Loto-Regular'),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    // AsyncTextFormField(
                    //     controller: phone,
                    //     validationDebounce: const Duration(milliseconds: 100),
                    //     validator: Validation().isPhoneField,
                    //     keyboardType: TextInputType.phone,
                    //     hintText: '**********',
                    //     isValidatingMessage:
                    //         'Enter your old Password',
                    //     valueIsInvalidMessage:
                    //         'Enter your old Password'),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        controller: newpass,
                        decoration: InputDecoration(
                            hintText: '**********',
                            contentPadding: EdgeInsets.only(top: 10, left: 10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.height * .45,
                    ),
                    RoundButton(
                        loading: false,
                        title: 'Submit',
                        textColor: Colors.white,
                        rounded: true,
                        color: Theme.of(context).primaryColor,
                        onPress: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (oldpass.text.length>=6 && newpass.text.length>=6) {
                            setnewPassword.confirmnewPassword(newpass.text,oldpass.text, context);
                          } else {
                            Utils.flushBarErrorMessage('Please Enter Correct Password', context);
                          }
                        }),

                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 1,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.white,
                              side: BorderSide(
                                  color: Theme.of(context).primaryColor)),
                          onPressed: () {
                            Get.to(const ResetPassword());
                          },
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          )),
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
}
