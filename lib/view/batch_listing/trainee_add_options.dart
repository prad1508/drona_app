import 'package:drona/view/profile/batch_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../res/language/language.dart';
import '../../res/widget/customTextField.dart';
import '../../res/widget/customradio.dart';
import '../../res/widget/progressPills.dart';
import '../../res/widget/round_button.dart';
import '../../utils/routes/routes_name.dart';
import '../../utils/color.dart' as AppColor;

class TraineeAddOptions extends StatefulWidget {
  const TraineeAddOptions({super.key});

  @override
  State<TraineeAddOptions> createState() => _TraineeAddOptionsState();
}

class _TraineeAddOptionsState extends State<TraineeAddOptions> {
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;
  //custom radio
  // custum radio call in seprate page
  bool value = true;
  bool agree = true;

  Future<bool> isValidPasscode(String value) async {
    return await Future.delayed(Duration(seconds: 1),
        () => value.isNotEmpty && value.toLowerCase() == 'batman');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: _localization.supportedLocales,
      localizationsDelegates: _localization.localizationsDelegates,
      home: Scaffold(
        body: Center(
            child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25.0),
                      ),
                    ),
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 250,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            SizedBox(
                              height: 15,
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text('Add Trainee In Tennis Batch'),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(),
                            SizedBox(
                              height: 15,
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, RoutesName.TraineeList);
                                        },
                                        child: Text(
                                          'Enter Manually',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        )))),
                            SizedBox(
                              height: 15,
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Select From Existing Trainees',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ))),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Text('data'))),
      ),
    );
  }
}
