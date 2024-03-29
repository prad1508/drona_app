import 'package:drona/res/language/language.dart';
import 'package:drona/view/dashboard/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../res/widget/round_button.dart';
import '../../utils/utils.dart';
import '../../view_model/myservices_view_model.dart';
import '../../view_model/registration_view_model.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;
  MyservicesViewViewModel myservicesViewViewModel = MyservicesViewViewModel();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController oldPassword= TextEditingController();


  //cancel session
  Future<bool> successPopup(context) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SizedBox(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.green,
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 18.0,
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Your password has been changed",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width * .9,
                    child: ElevatedButton(

                      onPressed: () {
                        /* Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const Layout(selectedIndex: 0,),
                                ),
                              );*/
                        Get.to(()=>  const Layout(selectedIndex: 0,),transition: Transition.rightToLeft);

                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor),
                      child: const Text(
                        "Login Now",
                        style: TextStyle(color: Colors.white,),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

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
          title: Text(AppLocale.confirmPassword.getString(context), style: TextStyle(fontSize: 18),),
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
                      child: Text(AppLocale.passwordDiffFromPrevious.getString(context),
                        style: const TextStyle(fontSize: 16, fontFamily:  'Loto-Regular'),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(AppLocale.newPassword.getString(context),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: newPassword,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: 'XXX-XXX-XXXX',
                        hintStyle: const TextStyle(fontSize: 12),
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
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(AppLocale.conPassword.getString(context),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: oldPassword,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: 'XXX-XXX-XXXX',
                        hintStyle: const TextStyle(fontSize: 12),
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
                        title: AppLocale.submit.getString(context),
                        textColor: Colors.white,
                        rounded: true,
                        color: Theme.of(context).primaryColor,
                        onPress: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if( oldPassword.text.toString().isEmpty){
                            Utils.flushBarErrorMessage(AppLocale.fillField.getString(context), context);
                          }
                          else if(newPassword.text.length >= 6){
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
                                         Text(AppLocale.passwordChanged.getString(context),style: TextStyle(
                                            fontSize: 14
                                        ),),
                                        const SizedBox(height: 5),
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
                                              title: AppLocale.loginNow.getString(context),
                                              onPress: () async {
                                                Navigator.pop(context);
                                                registration.verifynewPassword(newPassword.text.toString(), context);
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
                          else if(oldPassword.text.toString() == newPassword.text.toString()){
                            Utils.flushBarErrorMessage(AppLocale.passwordShouldBe6D.getString(context), context);
                          }
                          else{
                            Utils.flushBarErrorMessage(AppLocale.confirmPassNtMatch.getString(context), context);
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
