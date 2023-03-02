import 'package:flutter/material.dart';
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
   //transltate
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
