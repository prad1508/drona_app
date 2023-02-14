import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../res/language/language.dart';
import '../../res/widget/round_button.dart';
import '../../utils/routes/routes_name.dart';

class AcadmicSetup extends StatefulWidget {
  const AcadmicSetup({super.key});

  @override
  State<AcadmicSetup> createState() => _AcadmicSetupState();
}

class _AcadmicSetupState extends State<AcadmicSetup> {
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;
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
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/images/logo2.png'),
                  width: 175,
                  height: 64,
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                    width: 180,
                    child: Text(AppLocale.title1.getString(context),
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        textAlign: TextAlign.center)),
                SizedBox(
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
                SizedBox(
                  height: 20,
                ),
                Divider(
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
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ),
                Text(
                  AppLocale.title4.getString(context),
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 14),
                ),
                SizedBox(
                  height: 20,
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
                  height: 80,
                  child: Row(
                    children: [
                      Text(AppLocale.title5.getString(context), style: Theme.of(context).textTheme.bodyLarge,),
                      TextButton(
                        onPressed: (){
                           Navigator.pushNamed(context, RoutesName.login);
                        },
                        child: Text(
                          AppLocale.login.getString(context),
                          style: TextStyle(fontSize: 18, color: Colors.red),
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
