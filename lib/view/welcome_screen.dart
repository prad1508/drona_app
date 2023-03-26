import 'package:drona/view/create_batch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../res/language/language.dart';
import '../res/widget/circle_withtext.dart';
import '../res/widget/round_button.dart';
import '../utils/routes/routes_name.dart';

import '../res/widget/circle_withtext.dart';
import '../res/widget/round_button.dart';
import '../utils/routes/routes_name.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg2.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'CONGRATULATION',
                  style: TextStyle(
                      color: Color.fromRGBO(254, 194, 89, 1),
                      fontSize: 25,
                      fontFamily: 'poppin',
                      fontWeight: FontWeight.w600),
                ),
                const Text(
                  'John Smith!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: 'poppin',
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Your',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'poppin',
                      fontWeight: FontWeight.w700),
                ),
                const Text(
                  'Abc Academy',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'poppin',
                      fontWeight: FontWeight.w600),
                ),
                const Text(
                  'Is Now Registered',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: 'poppin',
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text: const TextSpan(
                    text: 'You are ',
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.white,
                        fontSize: 17,
                        fontFamily: 'Loto-Regular',
                        fontWeight: FontWeight.w400),
                    children: <TextSpan>[
                      TextSpan(
                        text: '2 steps',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.white,
                            fontSize: 21,
                            fontFamily: 'Loto-Regular',
                            fontWeight: FontWeight.w700),
                      ),
                      TextSpan(
                        text:
                            ' away from \n setting the Drona App for your \n Academy',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: 'Loto-Regular',
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
          
                const CircleWidthtext(numb: 1, label: 'Create batch', color: Colors.white),
                const CircleWidthtext(numb: 2, label: 'Add Trainee in created batch', color: Colors.white),
                SizedBox(height: MediaQuery.of(context).size.height * 0.2,),
                RoundButton(
                      loading: false,
                      title: 'Proceed here to Create Batch',
                      textColor: Colors.white,
                      rounded: true,
                      color: Color.fromRGBO(241, 94, 83, 1),
                      onPress: () {
                       
                        Navigator.pushNamed(context, RoutesName.CreateProfile);
                      }),
              ],
            ),
          )),
    );
  }
}
