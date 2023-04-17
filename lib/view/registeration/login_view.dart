import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import '../../res/language/language.dart';
import '../../res/widget/custom_textfield.dart';
import '../../res/widget/password_field.dart';
import '../../res/widget/round_button.dart';
import '/utils/routes/routes_name.dart';
import '/utils/utils.dart';
import '/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../../utils/text_styles.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  bool value = false;
  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    _obsecurePassword.dispose();
  }

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
                      child: Text("Login",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
             
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text("Phone",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                       hintText: 'XXX-XXX-XXXX',
                        contentPadding: const EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
               const SizedBox(height: 20,),
               Align(
                      alignment: Alignment.topLeft,
                      child: Text("Password",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                       hintText: '************',
                        contentPadding: const EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
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
                     Text("Save Credential",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                 
                    ],
                  ),
                TextButton(
                  style:
                      TextButton.styleFrom(padding: const EdgeInsets.all(0)),
                  onPressed: null,
                  child: Text("Forget password?",
                    style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).primaryColor),
                  ),
                )
                ],
              ),
                 
              SizedBox(
                height: 21.5,
              ),
              RoundButton(
                title: 'Login',
                loading: authViewMode.loading,
                rounded: true,
                color:  Theme.of(context).primaryColor,
                textColor: Theme.of(context).scaffoldBackgroundColor,
                onPress: () {
                  if (_emailController.text.isEmpty) {
                    Utils.flushBarErrorMessage('Please enter email', context);
                  } else if (_passwordController.text.isEmpty) {
                    Utils.flushBarErrorMessage('Please enter password', context);
                  } else if (_passwordController.text.length < 6) {
                    Utils.flushBarErrorMessage(
                        'Please enter 6 digit password', context);
                  } else {
                    Map data = {
                      'email': _emailController.text.toString(),
                      'password': _passwordController.text.toString(),
                    };
        
                    // Map data = {
                    //   'email' : 'shrikant@wepora.com',
                    //   'password' : '123456789',
                    // };
        
                    authViewMode.loginApi(data, context);
                   // print('api hit');
                  }
                },
              ),
              SizedBox(
                height: height * .02,
              ),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.signUp);
                  },
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    const Text("Dont Have an Account?"),
                    const SizedBox(width: 10,),
                    Text("Signup" , style: TextStyle(color: Theme.of(context).primaryColor),)
                  ],)),
            ],
          ),
        ),
      )),
    );
  }
}
