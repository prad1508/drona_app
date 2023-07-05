import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../res/language/language.dart';
import '../res/widget/circle_withtext.dart';
import '../res/widget/round_button.dart';
import '../utils/routes/routes_name.dart';
import '../view_model/academy_view_model.dart';
import '../view_model/myprofi_view_model.dart';
import 'batch_listing/create_batch_listing.dart';
import 'profile/create_profile.dart';

class WelcomeScreen extends StatefulWidget {

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  MyprofiViewViewModel myprofiViewViewModel = MyprofiViewViewModel();
  AcademyViewViewModel pacademyViewViewModel = AcademyViewViewModel();
  String role ='';
  late Future<String> futureRole;
  @override
  initState() {
    // TODO: implement initState
    futureRole = getRole();
    super.initState();
    myprofiViewViewModel.fetchMyprofiListApi();
    pacademyViewViewModel.fetchAcademyListApi();
  }

  Future<String> getRole()
  async {
    final prefsData = await SharedPreferences.getInstance();
    List<String>? items = prefsData.getStringList('registerResponse');
    role = items![4];
    print("role is $role");
    return role;
  }

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
          child: ChangeNotifierProvider<MyprofiViewViewModel>(
            create: (BuildContext context) => myprofiViewViewModel,
            child: Consumer<MyprofiViewViewModel>(builder: (context, value, _) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: FutureBuilder(
                    future: futureRole,
                    builder: (context, snapshot){
                      if(snapshot.hasData){
                        role = snapshot.data!;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppLocale.congratulation.getString(context),
                              style: const TextStyle(
                                  color: Color.fromRGBO(254, 194, 89, 1),
                                  fontSize: 25,
                                  fontFamily: 'poppin',
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              value.dataList.data?.data![0].name.toString() ?? '',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontFamily: 'poppin',
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              AppLocale.your.getString(context),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'poppin',
                                  fontWeight: FontWeight.w700),
                            ),
                            ChangeNotifierProvider<AcademyViewViewModel>(
                              create: (BuildContext context) => pacademyViewViewModel,
                              child: Consumer<AcademyViewViewModel>(
                                  builder: (context, value, _) {
                                    return Text(
                                      value.dataList.data?.academyname.toString() ?? '',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontFamily: 'poppin',
                                          fontWeight: FontWeight.w600),
                                    );
                                  }),
                            ),
                            Text(
                              AppLocale.title14.getString(context),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontFamily: 'poppin',
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'You are ',
                                style: const TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontFamily: 'Loto-Regular',
                                    fontWeight: FontWeight.w400),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: role == '0'
                                        ? '3 steps'
                                        : '2 steps',
                                    style: const TextStyle(
                                        decoration: TextDecoration.none,
                                        color: Colors.white,
                                        fontSize: 21,
                                        fontFamily: 'Loto-Regular',
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const TextSpan(
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
                            role == '1'
                                ? Column(children: [
                              CircleWidthtext(
                                  numb: 1,
                                  label: AppLocale.createBatch.getString(context),
                                  color: Colors.white),
                            ])
                                : Column(
                              children: [
                                CircleWidthtext(
                                    numb: 1,
                                    label: AppLocale.addCoach.getString(context),
                                    color: Colors.white),
                                CircleWidthtext(
                                    numb: 2,
                                    label: AppLocale.createBatch.getString(context),
                                    color: Colors.white),
                              ],
                            ),
                            CircleWidthtext(
                                numb: role =='0'
                                    ? 3
                                    : 2,
                                label: AppLocale.title16.getString(context),
                                color: Colors.white),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.2,
                            ),
                            role == '1'
                                ? RoundButton(
                                loading: false,
                                title: AppLocale.title17.getString(context),
                                // title: AppLocale.title18.getString(context),
                                textColor: Colors.white,
                                rounded: true,
                                color: const Color.fromRGBO(241, 94, 83, 1),
                                onPress: () {
                                  // Navigator.pushNamed(context, RoutesName.createProfile);
                                  Get.to(()=>  CreateBatchListing(pathPage: "onboarding",),transition: Transition.leftToRight);

                                })
                                : RoundButton(
                                loading: false,
                                // title: AppLocale.title17.getString(context),
                                title: AppLocale.title18.getString(context),
                                textColor: Colors.white,
                                rounded: true,
                                color: const Color.fromRGBO(241, 94, 83, 1),
                                onPress: () {
                                  // Navigator.pushNamed(context, RoutesName.createProfile);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                      CreateProfile(),
                                    ),
                                  );
                                }),
                          ],
                        );
                      }else{
                        return const CircularProgressIndicator();
                      }
                    }
                ),
              );
            }),
          ),
        ));
  }
}
