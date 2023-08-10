import 'package:drona/view/registeration/registration.dart';
import 'package:drona/view/registeration/reset_password.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../res/widget/round_button.dart';
import '/utils/routes/routes_name.dart';
import '/utils/utils.dart';
import '/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  bool value = true;
  String usr = '';
  String pass = '';
  @override
  void dispose() {
    super.dispose();

    _phoneController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _obsecurePassword.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Savecredential();
  }

 Savecredential() async {
  final prefsData = await SharedPreferences.getInstance();
        List<String>? items = prefsData.getStringList('saveCredential');
    setState(() {
      usr = items![0].toString();
      pass = items[1].toString();
    });
 }
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    final authViewMode = Provider.of<AuthViewModel>(context);

    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * .1,
              ),
              const Image(
                image: AssetImage('assets/images/logo2.png'),
                width: 175,
                height: 64,
              ),
              const SizedBox(
                height: 60,
              ),
              const Center(
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Phone",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _phoneController..text = usr.toString()..selection = TextSelection(
                            baseOffset: usr.length,
                            extentOffset: usr.length),
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
                 onChanged: (value) {
                        setState(() {
                          usr = value;
                        });
                      },
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Password",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                obscureText: _obscureText,
                controller: _passwordController..text = pass.toString()..selection = TextSelection(
                            baseOffset: pass.length,
                            extentOffset: pass.length),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                  hintText: '************',
                  hintStyle: TextStyle(fontSize: 12),
                  contentPadding: const EdgeInsets.all(10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                 onChanged: (value) {
                        setState(() {
                          pass = value;
                        });
                      },
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        activeColor: Theme.of(context).primaryColor,
                        value: value,
                        onChanged: (value) {
                          setState(() {
                            this.value = value!;
                          });
                        },
                      ),
                      Text(
                        "Save Credential",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  TextButton(
                    style:
                        TextButton.styleFrom(padding: const EdgeInsets.all(0)),
                    onPressed: () {
                      /*Navigator.pushNamed(context, RoutesName.resetPassword);*/
                      Get.to(() => const ResetPassword(), transition: Transition.rightToLeft);

                    },
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                          fontSize: 14, color: Theme.of(context).primaryColor),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 21.5,
              ),
              RoundButton(
                title: 'Login',
                loading: authViewMode.loading,
                rounded: true,
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).scaffoldBackgroundColor,
                onPress: () {
                  if (_phoneController.text.isEmpty) {
                    Utils.flushBarErrorMessage('Please Enter 10 Digit Mobile Number', context);
                  } else if (_passwordController.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        'Please Enter Password', context);
                  } else if (_passwordController.text.length < 6) {
                    Utils.flushBarErrorMessage(
                        'Please Enter 6 Digit Password', context);
                  } else {
                    Map<String, String> data = {
                      'userid': _phoneController.text,
                      'password': _passwordController.text.toString(),
                    };
                    authViewMode.loginApi(data, value, context);
                  }
                },
              ),
              SizedBox(
                height: height * .02,
              ),
              InkWell(
                  onTap: () {
                   // Navigator.pushNamed(context, RoutesName.signUp);
                    Get.to(() => const Registration(),transition: Transition.rightToLeft);

                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't Have An Account?"),
                      TextButton(
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(0)),
                        onPressed: () {
                          //Navigator.pushNamed(context, RoutesName.registration);
                          Get.to(() => const Registration(),transition: Transition.rightToLeft);
                        },
                        child: Text(
                          "Signup",
                          style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).primaryColor),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      )),
    );
  }
}
