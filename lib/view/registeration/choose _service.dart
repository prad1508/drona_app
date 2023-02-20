import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../res/language/language.dart';
import '../../res/widget/customcheckbox.dart';
import '../../res/widget/progressPills.dart';
import '../../res/widget/round_button.dart';
import '../../utils/routes/routes_name.dart';

class ChooseService extends StatefulWidget {
  const ChooseService({super.key});

  @override
  State<ChooseService> createState() => _ChooseServiceState();
}

class _ChooseServiceState extends State<ChooseService> {
  @override
  Widget build(BuildContext context) {
    final Width = MediaQuery.of(context).size.width * 0.8 / 5;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Row(
            children: [
              progressPills(
                  number: 7,
                  active: 3,
                  color: Theme.of(context).primaryColorLight),
            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Material(
            color: Colors.white,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      AppLocale.title12.getString(context),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .6,
                    child: GridView.count(
                        crossAxisCount: 4,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 8.0,
                        children: List.generate(choices.length, (index) {
                          return Center(
                            child: InkWell(
                              child: SelectCard(
                                  choice: choices[index].imageUrl,
                                  index: index),
                              onLongPress: () => print(index),
                            ),
                          );
                        })),
                  ),
                  RoundButton(
                      loading: false,
                      title: AppLocale.Continue.getString(context),
                      textColor: Colors.white,
                      rounded: true,
                      color: Theme.of(context).primaryColor,
                      onPress: () {
                        Navigator.pushNamed(context, RoutesName.DetailFilled);
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Choice> choices = <Choice>[
    const Choice(imageUrl: 'assets/images/Golf.png'),
    const Choice(imageUrl: 'assets/images/Golf.png'),
    const Choice(imageUrl: 'assets/images/Golf.png'),
    const Choice(imageUrl: 'assets/images/Golf.png'),
    const Choice(imageUrl: 'assets/images/Golf.png'),
    const Choice(imageUrl: 'assets/images/Golf.png'),
    const Choice(imageUrl: 'assets/images/Golf.png'),
    const Choice(imageUrl: 'assets/images/Golf.png'),
    const Choice(imageUrl: 'assets/images/Golf.png'),
    const Choice(imageUrl: 'assets/images/Golf.png'),
    const Choice(imageUrl: 'assets/images/Golf.png'),
    const Choice(imageUrl: 'assets/images/Golf.png'),
    const Choice(imageUrl: 'assets/images/Golf.png'),
    const Choice(imageUrl: 'assets/images/Golf.png'),
    const Choice(imageUrl: 'assets/images/Golf.png'),
    const Choice(imageUrl: 'assets/images/Golf.png'),
  ];
}

class SelectCard extends StatefulWidget {
  final index;
  final choice;
  const SelectCard({super.key, required this.choice, required this.index});

  @override
  State<SelectCard> createState() => _SelectCardState();
}

class _SelectCardState extends State<SelectCard> {
  bool shouldCheck = false;
  @override
  Widget build(BuildContext context) {
    return CustomCheckBox(
      value: shouldCheck,
      checkedFillColor: Colors.green,
      imageUrl: widget.choice,
      onChanged: (val) {
        //do your stuff here
        setState(() {
          shouldCheck = val;
        });
      },
    );
  }
}

class Choice {
  const Choice({required this.imageUrl});
  final String imageUrl;
}
