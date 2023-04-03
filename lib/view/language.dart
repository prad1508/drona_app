import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../utils/routes/routes_name.dart';
class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  //transltate
  final FlutterLocalization _localization = FlutterLocalization.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: _localization.supportedLocales,
      localizationsDelegates: _localization.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          centerTitle: true,
          title: Text(
            'Select Language',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Material(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Container(
                width: MediaQuery.of(context).size.width * 1,
                padding: const EdgeInsets.only(left:20, right: 20),
                child: OutlinedButton(
                  onPressed: () {
                    //English language
                    _localization.translate('en');
                    Navigator.pushNamed(context, RoutesName.acadmicSetup);
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      width: 1.0,
                      color: Colors.black,
                      style: BorderStyle.solid,
                    ),
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text('English', style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 16,),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                padding: const EdgeInsets.only(left:20, right: 20),
                child: OutlinedButton(
                  onPressed: () {
                    //hindi language
                    _localization.translate('hi');
                    Navigator.pushNamed(context, RoutesName.acadmicSetup);
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      width: 1.0,
                      color: Colors.black,
                      style: BorderStyle.solid,
                    ),
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text(
                    'हिंदी',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
             
              ],
          ),
        ),
      ),
    );
  }
}
