import 'package:drona/res/language/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import '../../res/widget/synctextform.dart';
import '../../res/widget/round_button.dart';
import '../../utils/utils.dart';
import '../../utils/validation.dart';
import '../../view_model/myservices_view_model.dart';
import '../../view_model/registration_view_model.dart';


class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;
  MyservicesViewViewModel myservicesViewViewModel = MyservicesViewViewModel();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phone = TextEditingController();
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
          title:  Text(
            AppLocale.resetPassword.getString(context),
            style: TextStyle(fontSize: 18),
          ),
          centerTitle: true,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: GestureDetector(
            onTap: (){
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
                     Align(
                      alignment: Alignment.center,
                      child: Text(
                        AppLocale.receiveVerificationCode.getString(context),
                        style:
                        TextStyle(fontSize: 16, fontFamily: 'Loto-Regular'),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    AsyncTextFormField(
                        controller: phone,
                        validationDebounce: const Duration(milliseconds: 100),
                        validator: Validation().isPhoneField,
                        keyboardType: TextInputType.phone,
                        hintText: 'XXX-XXX-XXXX',
                        isValidatingMessage:
                        AppLocale.valid10digitError.getString(context),
                        valueIsInvalidMessage:
                        AppLocale.valid10digitError.getString(context),
                      valueIsEmptyMessage: AppLocale.valueIsEmptyMessage.getString(context),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .4,
                    ),
                    RoundButton(
                        loading: false,
                        title: AppLocale.send.getString(context),
                        textColor: Colors.white,
                        rounded: true,
                        color: Theme.of(context).primaryColor,
                        onPress: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if(phone.text.trim().toString().length == 10)
                          {
                            Map<String, String> data = {
                              "mobno": phone.text.toString(),
                            };
                            registration.forgetPassword(data, context);
                          }
                          else{
                            Utils.flushBarErrorMessage(AppLocale.valid10digitError.getString(context), context);
                          }
                        }),

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
