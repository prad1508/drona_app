import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import '../../res/language/language.dart';
import '../../res/widget/customradio.dart';
import '../../res/widget/progress_pills.dart';
import '../../res/widget/round_button.dart';
import '../../res/widget/synctextform.dart';
import '../../utils/utils.dart';
import '../../utils/validation.dart';
import '../../view_model/registration_view_model.dart';
//import 'package:async_textformfield/async_textformfield.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String? _role = '0';
  ValueChanged<String?> _valueChangedHandler() {
    return (value) => setState(() => _role = value!);
  }

  String? _genderValue = 'm';
  ValueChanged<String?> _genderChangedHandler() {
    return (value) => setState(() => _genderValue = value!);
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController phone = TextEditingController();
  bool value = false;
  bool agree = false;
  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final registration = Provider.of<RegistrationViewModel>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          toolbarHeight: 100,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Row(
            children: [
              ProgressPills(
                  number: 7,
                  active: 0,
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
              padding: const EdgeInsets.only(left:20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      AppLocale.title6.getString(context),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      AppLocale.title7.getString(context),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: fullName,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                     hintText: 'eg. Ashmit Singh',
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
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      AppLocale.phoneNumber.getString(context),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AsyncTextFormField(
                      controller: phone,
                      validationDebounce: const Duration(milliseconds: 500),
                      validator: Validation().isPhoneField,
                      keyboardType: TextInputType.phone,
                      hintText: 'eg. 9658992342',
                      isValidatingMessage: 'Enter a valid 10 digit mobile number',
                      valueIsInvalidMessage:'Enter a valid 10 digit mobile number'
                    ),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      AppLocale.yourRole.getString(context),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomRadio<String>(
                        btnColor: Colors.black,
                        value: '0',
                        groupValue: _role,
                        onChanged: _valueChangedHandler(),
                        label: AppLocale.owner.getString(context),
                      ),
                      CustomRadio<String>(
                        btnColor: Colors.black,
                        value: '1',
                        groupValue: _role,
                        onChanged: _valueChangedHandler(),
                        label: AppLocale.ownerInstructor.getString(context),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      AppLocale.emailOptional.getString(context),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AsyncTextFormField(
                      controller: email,
                      validationDebounce: const Duration(milliseconds: 500),
                      validator: Validation().isEmailField,
                      keyboardType: TextInputType.emailAddress,
                      hintText: 'eg. abc@example.com',
                    ),

                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      AppLocale.gender.getString(context),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomRadio<String>(
                        btnColor: Colors.black,
                        value: 'm',
                        groupValue: _genderValue,
                        onChanged: _genderChangedHandler(),
                        label: AppLocale.male.getString(context),
                      ),
                      CustomRadio<String>(
                        btnColor: Colors.black,
                        value: 'f',
                        groupValue: _genderValue,
                        onChanged: _genderChangedHandler(),
                        label: AppLocale.female.getString(context),
                      ),
                      CustomRadio<String>(
                        btnColor: Colors.black,
                        value: 'o',
                        groupValue: _genderValue,
                        onChanged: _genderChangedHandler(),
                        label: AppLocale.other.getString(context),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(children: <Widget>[
                    Checkbox(
                      checkColor: Colors.white,
                      activeColor: Theme.of(context).primaryColor,
                      value: value,
                      onChanged: (value) {
                        setState(() {
                          this.value = value!;
                          agree = value;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppLocale.iAgree.getString(context),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: null,
                          child: Text(
                            AppLocale.terms.getString(context),
                            style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).primaryColorLight),
                          ),
                        ),
                        Text(
                          AppLocale.and.getString(context),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextButton(
                          style:
                              TextButton.styleFrom(padding: const EdgeInsets.all(0)),
                          onPressed: null,
                          child: Text(
                            AppLocale.privacyPolicy.getString(context),
                            style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).primaryColorLight),
                          ),
                        ),
                      ],
                    )
                  ]),
                  RoundButton(
                    loading: registration.loading,
                    title: AppLocale.conts.getString(context),
                    textColor: Colors.white,
                    rounded: true,
                    color: agree == true
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).primaryColor.withOpacity(0.5),
                    onPress: agree == true
                        ? () {
                           if(fullName.text.isEmpty){
                            Utils.flushBarErrorMessage('Fill Full Name', context);
                           }
                           if(phone.text.toString().length < 10){
                             Utils.flushBarErrorMessage('Fill Phone Number', context);
                           }
                            else{
                             Map<String, String> data = {
                              "name": fullName.text.toString(),
                              "ccode": '+91',
                              "mobno": phone.text.toString(),
                              "role": _role.toString(),
                              "gender": _genderValue.toString(),
                              "email": email.text.toString()
                            };
                          registration.register(data, context);
                          // Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //             builder: (BuildContext context) =>
                          //                 OtpPage(registration: data),
                          //           ),
                          //         );
                            }
                            
                          }
                        : () {
                            if (kDebugMode) {
                              print('btn dissabled');
                            }
                          },
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
