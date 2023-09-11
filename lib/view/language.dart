import 'package:drona/res/language/language.dart';
import 'package:drona/view/registeration/acadmic_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/routes/routes_name.dart';

class Language extends StatefulWidget {
  String? path;
  Language({super.key, this.path});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  //transltate
  final FlutterLocalization _localization = FlutterLocalization.instance;

  @override
  Widget build(BuildContext context) {
    print("widget.path${widget.path}");
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: Text(
          AppLocale.selectLanguage.getString(context),
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
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: OutlinedButton(
                onPressed: () {
                  //English language
                  _localization.translate('en');
                  // Navigator.pushNamed(context, RoutesName.acadmicSetup);
                  widget.path == "drawer"
                      ? Get.back()
                      : Get.to(() => const AcadmicSetup(),
                          transition: Transition.rightToLeft);
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
                  'English',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 1,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: OutlinedButton(
                onPressed: () {
                  //hindi language
                  _localization.translate('hi');
                  //Navigator.pushNamed(context, RoutesName.acadmicSetup);

                  widget.path == "drawer"
                      ? Get.back()
                      : Get.to(() => const AcadmicSetup(),
                          transition: Transition.rightToLeft);
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
    );
  }
}
