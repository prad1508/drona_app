import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';

import '../../res/language/language.dart';
import '../../res/widget/round_button.dart';
import '../../utils/routes/routes_name.dart';
import '../../view_model/myservices_view_model.dart';
import '../../view_model/registration_view_model.dart';
import 'forget_otp.dart';
import 'otp.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
    //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;
  MyservicesViewViewModel myservicesViewViewModel = MyservicesViewViewModel();
  final TextEditingController dob = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
   final registration = Provider.of<RegistrationViewModel>(context);
    return MaterialApp(
      supportedLocales: _localization.supportedLocales,
      localizationsDelegates: _localization.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          toolbarHeight: 80,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title:const Text('Reset Password', style: TextStyle(fontSize: 18),),
          centerTitle: true,
          foregroundColor: Colors.black,
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
                  const Align(
                    alignment: Alignment.center,
                    child: Text('Please Enter Your Phone Number To Receive a Verification Code',
                      style: TextStyle(fontSize: 16, fontFamily:  'Loto-Regular'),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                   TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                       hintText: 'XXX-XXX-XXXX',
                        hintStyle: TextStyle(fontSize: 12),
                        contentPadding: const EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .4,
                  ),
                  
                  RoundButton(
                      loading: false,
                      title: 'Send',
                      textColor: Colors.white,
                      rounded: true,
                      color: Theme.of(context).primaryColor,
                      onPress: () {
                                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      ForgetOtp(),
                ),
              );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
