import 'dart:core';

import 'package:drona/res/language/language.dart';
import 'package:drona/view/academy/academy_setting.dart';
import 'package:drona/view/dashboard/layout.dart';
import 'package:drona/view/profile/view_profile_details.dart';
import 'package:drona/view/registeration/login_view.dart';
import 'package:drona/view/reports/attendance.dart';
import 'package:drona/view/reports/finance.dart';
import 'package:drona/view/reports/finance_ledger.dart';
import 'package:drona/view/reports/owner_edit_profile.dart';
import 'package:drona/view/trainee_listing/record_payment.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import '../../data/response/status.dart';
import '../../res/app_url.dart';
import '../../view_model/academy_view_model.dart';
import '../../view_model/user_view_model.dart';
import '../Support and Feedback/support_Feedback_Page.dart';
import '../drawer_screens/change_password.dart';
import '../language.dart';
import '../performance/new_assignment.dart';
import '../trainee_listing/add_trainee_list.dart';
import '../batch_listing/batchlist_search.dart';
import '../coach_listing/coach_listselected.dart';
import '../session_listing/session_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'activity_log.dart';

class MainMenu extends StatefulWidget {
  final String? name;
  final String? academyName;

  const MainMenu({super.key, this.name, this.academyName});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  //multi language support
  List details = [];
  String academicname = '';
  String fullname = '';
  final FlutterLocalization _localization = FlutterLocalization.instance;
  final TextEditingController fullName = TextEditingController();
  final TextEditingController doj = TextEditingController();
  final TextEditingController dobilling = TextEditingController();
  final TextEditingController phone = TextEditingController();
  AcademyViewViewModel academyListViewViewModel = AcademyViewViewModel();
  String name = '';
  @override
  initState() {
    getData();
    academyListViewViewModel.fetchAcademyListApi();
  }

  getData() async {
    final prefs = await SharedPreferences.getInstance();
    details = prefs.getStringList('registerResponse')!;
    String? items = prefs.getString('acadmicName')!;
    fullname = details[0];
    academicname = prefs.getString('acadmicName')!;

    print("full name is ${details[0]}");
    print("number is ${details[3]}");
  }

  @override
  Widget build(BuildContext context) {
    final userPrefernece = Provider.of<UserViewModel>(context);
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(w, h * 0.04),
        child: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: (() {
                Navigator.pop(context);
              }),
              icon: const Icon(Icons.close),
              color: Colors.black,
              iconSize: 20,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Material(
          color: Colors.white,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(
                        () => academy_setting(
                              pathofpage: '',
                            ),
                        transition: Transition.rightToLeft);
                  },
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: const Color.fromARGB(255, 244, 247, 245),
                      elevation: 1,
                      child:

                          /// call api
                          ChangeNotifierProvider<AcademyViewViewModel>(
                              create: (BuildContext context) =>
                                  academyListViewViewModel,
                              child: Consumer<AcademyViewViewModel>(
                                  builder: (context, value, _) {
                                switch (value.dataList.status!) {
                                  case Status.loading:
                                    return const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.teal,
                                      ),
                                    );
                                  case Status.completed:
                                    return Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8),
                                                      child: Text(
                                                        '${value.dataList.data?.academyname}',
                                                        style: const TextStyle(
                                                          color: Colors.blue,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                         Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 12),
                                                          child: Text(
                                                            AppLocale.services.getString(context),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .normal,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 16,
                                                                height: 2),
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 20,
                                                          width: 150,
                                                          child:
                                                              ListView.builder(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            itemCount: value
                                                                .dataList
                                                                .data
                                                                ?.totalService,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              return Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            4),
                                                                child: Image(
                                                                  image:
                                                                      NetworkImage(
                                                                    AppUrl.serviceIconEndPoint +
                                                                        value
                                                                            .dataList
                                                                            .data!
                                                                            .services![index]
                                                                            .serviceIconname!,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    value.dataList.data!.islogo
                                                        ? Container(
                                                            width: 90,
                                                            height: 90,
                                                            child: Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: FittedBox(
                                                                fit: BoxFit
                                                                    .contain,
                                                                child: Stack(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      width: 80,
                                                                      height:
                                                                          80,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                      child:
                                                                          CircleAvatar(
                                                                        radius:
                                                                            40,
                                                                        backgroundColor:
                                                                            Colors.white,
                                                                        backgroundImage:
                                                                            NetworkImage(
                                                                          AppUrl.academylogo +
                                                                              value.dataList.data!.logo,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: 80,
                                                                      height:
                                                                          80,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                        color: Colors
                                                                            .transparent,
                                                                      ),
                                                                      child:
                                                                          CircularPercentIndicator(
                                                                        radius:
                                                                            40,
                                                                        lineWidth:
                                                                            4,
                                                                        percent:
                                                                            value.dataList.data!.academyProgress /
                                                                                100,
                                                                        center:
                                                                            CircleAvatar(
                                                                          radius:
                                                                              38,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                        ),
                                                                        progressColor:
                                                                            Colors.green,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        circularStrokeCap:
                                                                            CircularStrokeCap.round,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        : const Image(
                                                            image: AssetImage(
                                                                'assets/images/coachlogo.png'),
                                                            width: 80,
                                                          ),
                                                    ElevatedButton(
                                                      onPressed: () {},
                                                      style: ElevatedButton.styleFrom(
                                                          shape: const StadiumBorder(
                                                              side: BorderSide(
                                                                  color: Colors
                                                                      .green,
                                                                  width: 2)),
                                                          backgroundColor:
                                                              Colors.green),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                              '${value.dataList.data?.academyProgress} %'),
                                                          Icon(
                                                            Icons
                                                                .arrow_forward_ios,
                                                            size: 10,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  case Status.error:
                                    return Center(child: Text(''));
                                }
                              }))),
                ),
                SizedBox(
                  height: 15,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.all(18),
                  tileColor: Colors.grey.shade100,
                  leading: const Image(
                      image: AssetImage('assets/images/user_profile.png')),
                  title: Text(
                    widget.name.toString(),
                  ),
                  onTap: () {
                    Get.to(() => const ViewProfileDetails(),
                        transition: Transition.rightToLeft);
                  },
                  trailing: IconButton(
                    onPressed: (() {
                      Get.to(() => const ViewProfileDetails(),
                          transition: Transition.rightToLeft);
                    }),
                    icon: const Icon(Icons.arrow_forward_ios),
                    iconSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: const Color.fromARGB(255, 253, 253, 253),
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            AppLocale.batchAndSession.getString(context),
                            style: const TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Get.to(
                                () => const Layout(
                                      selectedIndex: 2,
                                    ),
                                transition: Transition.rightToLeft);
                          },
                          leading: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey.shade100,
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Image(
                                  image:
                                      AssetImage('assets/images/batchlist.png'),
                                  width: 15,
                                ),
                              )),
                          title:  Text(
                            AppLocale.batchListing.getString(context),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            /* Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                  const SessionList(),
                                ),
                              );*/
                            Get.to(() => const SessionList(),
                                transition: Transition.rightToLeft);
                          },
                          leading: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey.shade100,
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/sessionlist.png'),
                                  width: 15,
                                ),
                              )),
                          title:  Text(
                            AppLocale.sessionListing.getString(context),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: const Color.fromARGB(255, 253, 253, 253),
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            AppLocale.members.getString(context),
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Get.to(
                                () => CoachListSelected(
                                      enabled: 1,
                                    ),
                                transition: Transition.rightToLeft);
                          },
                          leading: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey.shade100,
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Image(
                                  image: AssetImage('assets/images/coach.png'),
                                  width: 15,
                                ),
                              )),
                          title:  Text(
                            AppLocale.members.getString(context),
                          ),
                          trailing:
                              const Icon(Icons.arrow_forward_ios, size: 20),
                        ),
                        ListTile(
                          onTap: () {
                            /* Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                  const Trainee_Listing(),
                                ),
                              );*/
                            //   Get.to(()=> const Trainee_Listing(),transition: Transition.rightToLeft);
                            Get.to(() => const Layout(selectedIndex: 3),
                                transition: Transition.rightToLeft);
                          },
                          leading: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey.shade100,
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Image(
                                  image: AssetImage('assets/images/user.png'),
                                  width: 15,
                                ),
                              )),
                          title:  Text(
                            AppLocale.trainee.getString(context),
                          ),
                          trailing:
                              const Icon(Icons.arrow_forward_ios, size: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                /* Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: const Color.fromARGB(255, 253, 253, 253),
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              'Payments',
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          ListTile(
                            leading: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey.shade100,
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/matchbatch.png'),
                                    width: 15,
                                  ),
                                )),
                            title: const Text(
                              'Record Payment',
                            ),
                            trailing: IconButton(
                              onPressed: (() {
                                */
                /* Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const Coach_Listing()),
                                );*/
                /*
                                */
                /*Get.to(() =>  RecordPayment(traineeList: [],),
                                    transition: Transition.rightToLeft);*/
                /*
                              }),
                              icon: const Icon(Icons.arrow_forward_ios),
                              iconSize: 20,
                            ),
                          ),
                          ListTile(
                            leading: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey.shade100,
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Image(
                                    image:
                                    AssetImage('assets/images/rupee.png'),
                                    width: 10,
                                  ),
                                )),
                            title: const Text(
                              'Adjust Fee',
                            ),
                            trailing: IconButton(
                              onPressed: (() {
                                // Get.to(() => CoachListSelected(),
                                //     transition: Transition.rightToLeft);
                              }),
                              icon: const Icon(Icons.arrow_forward_ios),
                              iconSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),*/
                /*Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: const Color.fromARGB(255, 253, 253, 253),
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            AppLocale.reports.getString(context),
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Get.to(() => const Attendance(),
                                transition: Transition.rightToLeft);
                          },
                          leading: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey.shade100,
                              child: const Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/atten_report.png'),
                                  width: 20,
                                ),
                              )),
                          title:  Text(
                            '${AppLocale.attendance.getString(context)} ${AppLocale.reports.getString(context)}',
                          ),
                          trailing: IconButton(
                            onPressed: (() {
                              Get.to(() => const Attendance(),
                                  transition: Transition.rightToLeft);
                            }),
                            icon: const Icon(Icons.arrow_forward_ios),
                            iconSize: 20,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Get.to(() => const FinanceLedger(),
                                transition: Transition.rightToLeft);
                          },
                          leading: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey.shade100,
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Image(
                                  image:
                                      AssetImage('assets/images/finance.png'),
                                  width: 20,
                                ),
                              )),
                          title:  Text(
                            '${AppLocale.finance.getString(context)} ${AppLocale.reports.getString(context)}',
                          ),
                          trailing: IconButton(
                            onPressed: (() {
                              Get.to(() => const FinanceLedger(),
                                  transition: Transition.rightToLeft);
                            }),
                            icon: const Icon(Icons.arrow_forward_ios),
                            iconSize: 20,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Get.to(() => const Finance(),
                                transition: Transition.rightToLeft);
                          },
                          leading: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey.shade100,
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Image(
                                    image: AssetImage(
                                        'assets/images/academy_report.png')),
                              )),
                          title:  Text(
                            '${AppLocale.academy.getString(context)} ${AppLocale.reports.getString(context)}',
                          ),
                          trailing: IconButton(
                            onPressed: (() {
                              Get.to(() => const OwnerEditProfile(),
                                  transition: Transition.rightToLeft);
                            }),
                            icon: const Icon(Icons.arrow_forward_ios),
                            iconSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),*/
                const SizedBox(
                  height: 5,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: const Color.fromARGB(255, 253, 253, 253),
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            AppLocale.more.getString(context),
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        ListTile(
                          leading: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey.shade100,
                              child: const Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/g_translate.png'),
                                  width: 20,
                                ),
                              )),
                          title:  Text(
                            AppLocale.chooseLanguage.getString(context),
                          ),
                          trailing: IconButton(
                            onPressed: (() {
                              Get.to(
                                () =>  Language(path: "drawer",),
                              );
                            }),
                            icon: const Icon(Icons.arrow_forward_ios),
                            iconSize: 20,
                          ),
                        ),
                        //
                        ListTile(
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey.shade100,
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Image(
                                image: AssetImage(
                                    'assets/images/changePassword.png'),
                              ),
                            ),
                          ),
                          title:  Text(
                           AppLocale.changePassword.getString(context) ,
                          ),
                          trailing: IconButton(
                            onPressed: (() {
                              Get.to(() => const ChangePassword(),
                                  transition: Transition.rightToLeft);
                            }),
                            icon: const Icon(Icons.arrow_forward_ios),
                            iconSize: 20,
                          ),
                        ),
                        /*ListTile(
                          leading: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey.shade100,
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Image(
                                    image: AssetImage(
                                        'assets/images/activity.png')),
                              )),
                          title:  Text(
                            AppLocale.activitLog.getString(context),
                          ),
                          trailing: IconButton(
                            onPressed: (() {
                              Get.to(() => const Activity_Log(),
                                  transition: Transition.rightToLeft);
                            }),
                            icon: const Icon(Icons.arrow_forward_ios),
                            iconSize: 20,
                          ),
                        ),
                        ListTile(
                          leading: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey.shade100,
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Image(
                                    image:
                                        AssetImage('assets/images/info.png')),
                              )),
                          title:  Text(
                            AppLocale.about.getString(context),
                          ),
                          trailing: IconButton(
                            onPressed: (() {}),
                            icon: const Icon(Icons.arrow_forward_ios),
                            iconSize: 20,
                          ),
                        ),
                        ListTile(
                          leading: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey.shade100,
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Image(
                                    image: AssetImage(
                                        'assets/images/support_agent.png')),
                              )),
                          title:  Text(
                            AppLocale.supportAndFeedback.getString(context),
                          ),
                          trailing: IconButton(
                            onPressed: (() {
                              Get.to(const Support_Feedback_Page());
                            }),
                            icon: const Icon(Icons.arrow_forward_ios),
                            iconSize: 20,
                          ),
                        ),*/
                        InkWell(
                          onTap: ()  {
                            userPrefernece.remove(context).then((value) {
                              Get.to(() => const LoginView(),
                                  transition: Transition.rightToLeft);
                            });
                          },
                          child: ListTile(
                            leading: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey.shade100,
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/logout.png')),
                                )),
                            title:  Text(
                              AppLocale.logout.getString(context),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Image(
                    image: AssetImage('assets/images/logo2.png'),
                    width: 150,
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
