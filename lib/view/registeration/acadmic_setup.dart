import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../res/language/language.dart';
import '../../res/widget/round_button.dart';
import '../../utils/routes/routes_name.dart';

class AcadmicSetup extends StatefulWidget {
  const AcadmicSetup({super.key});

  @override
  State<AcadmicSetup> createState() => _AcadmicSetupState();
}

class _AcadmicSetupState extends State<AcadmicSetup> {
   //transltate
  final FlutterLocalization _localization = FlutterLocalization.instance;

  TextEditingController reasoncontroller = TextEditingController();
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("English"), value: "en"),
      DropdownMenuItem(child: Text("हिंदी"), value: "hi"),
    ];
    return menuItems;
  }
   String selectedValue = 'en';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getlanguageState();
    String selectedValue = "en";
  }

  //setselected language
  @override
  addlanguageState(lang) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('lang', lang);
  }

  //get selected language
  @override
  getlanguageState() async {
  
      SharedPreferences prefs = await SharedPreferences.getInstance();
   setState(() {
    if(prefs.getString('lang') == null) return;
       if(prefs.getString('lang').toString() != null){
         selectedValue = prefs.getString('lang').toString();
       }
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: _localization.supportedLocales,
      localizationsDelegates: _localization.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Material(
          color: Colors.white,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/images/logo2.png'),
                  width: 175,
                  height: 64,
                ),
                const SizedBox(
                  height: 28,
                ),
                SizedBox(
                    child: Text(AppLocale.title1.getString(context),
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 17, height: 1.7),
                        textAlign: TextAlign.center)),
                const SizedBox(
                  height: 40,
                ),
                Container(
                    padding: const EdgeInsets.only(left: 20),
                    width: MediaQuery.of(context).size.height * 0.3,
                    child: DropdownButton(
                        isExpanded: true,
                        elevation: 1,
                        dropdownColor: const Color.fromARGB(255, 255, 255, 255),
                        iconEnabledColor: Colors.black,
                        style:
                            const TextStyle(color: Colors.black),
                        value: selectedValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                            addlanguageState(newValue);
                            _localization.translate(selectedValue);
                          });
                        },
                        items: dropdownItems),
                  ),
                   const SizedBox(
                  height: 40,
                ),
                RoundButton(
                  loading: false,
                  title: AppLocale.title2.getString(context),
                  rounded: true,
                  color: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).scaffoldBackgroundColor,
                  onPress: () =>  Navigator.pushNamed(context, RoutesName.Registration),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Divider(
                  thickness: 1,
                ),
                Transform.translate(
                  offset: const Offset(0, -26),
                  child: Container(
                    height: 30,
                    color: Colors.white,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(
                            fontSize: 20, backgroundColor: Colors.white),
                      ),
                      onPressed: null,
                      child: Text(
                        AppLocale.or.getString(context),
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                Text(
                  AppLocale.title4.getString(context),
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 14),
                ),
                const SizedBox(
                  height: 14,
                ),
                RoundButton(
                  loading: false,
                  title: AppLocale.title3.getString(context),
                  textColor: Colors.black,
                  rounded: true,
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  onPress: () {},
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: Row(
                    children: [
                      Text(AppLocale.title5.getString(context), style: Theme.of(context).textTheme.bodyMedium,),
                      TextButton(
                        onPressed: (){
                          // Navigator.pushNamed(context, RoutesName.login);
                        },
                        child: Text(
                          AppLocale.login.getString(context),
                          style: const TextStyle(fontSize: 18, color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
