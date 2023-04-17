import 'package:drona/view/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';

import '../../res/widget/round_button.dart';
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
  final TextEditingController dob = TextEditingController();
  final TextEditingController _emailController = TextEditingController();


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
                      Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const Layout(selectedIndex: 0,),
                                ),
                              );
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
          title:const Text('Confirm New password', style: TextStyle(fontSize: 18),),
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
                    child: Text('Your New Password Must be Different from previously use password',
                      style: TextStyle(fontSize: 16, fontFamily:  'Loto-Regular'),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                   Align(
                      alignment: Alignment.topLeft,
                      child: Text("New Password",
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
                      child: Text("Current Password",
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
                      title: 'Submit',
                      textColor: Colors.white,
                      rounded: true,
                      color: Theme.of(context).primaryColor,
                      onPress: () {
                        successPopup(context);
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
