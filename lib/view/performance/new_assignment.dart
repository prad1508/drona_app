import 'package:drona/view/performance/widgets/assignmentWithCategory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:provider/provider.dart';

import '../../../data/response/status.dart';
import '../../../res/widget/round_button.dart';
import '../../../utils/no_data.dart';
import '../../../utils/utils.dart';
import '../../../view_model/batchList_view_model.dart';
import '../../../view_model/session_view_model.dart';

class NewAssignment extends StatefulWidget {
  const NewAssignment({super.key});

  @override
  State<NewAssignment> createState() => _NewAssignmentState();
}

class _NewAssignmentState extends State<NewAssignment> {
  //multi language support

  final FlutterLocalization _localization = FlutterLocalization.instance;
  final TextEditingController assessmentName = TextEditingController();

  @override
  initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: _localization.supportedLocales,
      localizationsDelegates: _localization.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          leading: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          title: Text(
            'New Assessment',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Material(
          color: Colors.white,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Assessment Name',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 15)),
                    TextFormField(
                      controller: assessmentName,
                      decoration: InputDecoration(
                        hintText: 'eg. Assessment 1',
                        contentPadding: const EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    RoundButton(
                      loading: false,
                      title: 'Continue',
                      textColor: Colors.white,
                      rounded: true,
                      color: Theme.of(context).primaryColor,
                      onPress: () {
                        Get.to(() => const WithCategory(),
                            transition: Transition.rightToLeft);
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

