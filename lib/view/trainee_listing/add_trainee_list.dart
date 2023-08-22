import 'package:cached_network_image/cached_network_image.dart';
import 'package:drona/view/batch_listing/add_coach_profile.dart';
import 'package:drona/view/batch_listing/viewprofile_details.dart';
import 'package:drona/view/profile/batch_list.dart';
import 'package:drona/view/trainee_listing/ledger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../data/response/status.dart';
import '../../model/trainee_list_model.dart';
import '../../res/app_url.dart';
import '../../res/language/language.dart';
import '../../res/widget/Trainee_Listing_Class/batch_name.dart';
import '../../res/widget/Trainee_Listing_Class/filter_trainee_list.dart';
import '../../res/widget/customTextField.dart';
import '../../res/widget/customradio.dart';
import '../../res/widget/progressPills.dart';
import '../../res/widget/round_button.dart';
import '../../utils/no_data.dart';
import '../../utils/routes/routes_name.dart';
import '../../utils/color.dart' as AppColor;
import '../../view_model/academy_view_model.dart';
import '../../view_model/trainee_view_model.dart';
import '../dashboard/layout.dart';
import '../performance/new_assignment.dart';
import 'activate.dart';
import 'add_trainee_in_existingBatch.dart';
import 'deactivate.dart';
import 'edit_batch.dart';
import 'record_payment.dart';

class AddTraineeList extends StatefulWidget {
  AddTraineeList({
    super.key,
  });

  @override
  State<AddTraineeList> createState() => _AddTraineeListState();
}

class _AddTraineeListState extends State<AddTraineeList> {
  //bottomsheet popup
  //bottomsheet popup
  showBottomSheet(
      {bool? status, required int index, required List<Datum> traineeList}) {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Container(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0),
                      ),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            height: 3,
                            width: 50,
                            color: Colors.grey[400],
                          ),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Select Option',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Loto-Regular'),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(color: Colors.grey),
                        const SizedBox(
                          height: 5,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: TextButton(
                            onPressed: () {
                              Get.to(() => ViewProfileDetails(index: index),
                                  transition: Transition.rightToLeft);
                            },
                            child: Text(
                              'View Profile',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ),
                        status == true
                            ? Align(
                                alignment: Alignment.topLeft,
                                child: TextButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return SizedBox(
                                            width: 342,
                                            height: 266,
                                            child: AlertDialog(
                                              icon: SizedBox(
                                                width: 44,
                                                height: 44,
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      Colors.yellow.shade800,
                                                  child: Text(
                                                    "!",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 24),
                                                  ),
                                                ),
                                              ),
                                              title: const Text(
                                                "Send Reminder",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                    fontFamily: 'Lato',
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              alignment: Alignment.center,
                                              content: Wrap(children: [
                                                Center(
                                                  child: SizedBox(
                                                    width: 209,
                                                    height: 60,
                                                    child: Text(
                                                      "Are You Sure Youn Want To Send\nReminder To ${traineeList[index].traineeName}!",
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff626D7E),
                                                          fontSize: 16,
                                                          fontFamily: 'Lato',
                                                          fontWeight:
                                                              FontWeight.w600),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                              // contentPadding: EdgeInsets.all(24),
                                              actions: [
                                                Container(
                                                  width: 139,
                                                  height: 48,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            Color(0xffDFE1E4),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(8),
                                                          ),
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text(
                                                        "Cancel",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff23282E),
                                                            fontSize: 15,
                                                            fontFamily: 'Lato',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      )),
                                                ),
                                                Container(
                                                  width: 139,
                                                  height: 48,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            const Color(
                                                                0xff2A62B8),
                                                        shape:
                                                            const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(8),
                                                          ),
                                                        ),
                                                      ),
                                                      onPressed: () {},
                                                      child: const Text(
                                                        "Confirm",
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xffFBFBFC),
                                                            fontSize: 15,
                                                            fontFamily: 'Lato',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      )),
                                                )
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                  child: Text(
                                    'Remind For Payment',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              )
                            : Container(),
                        Align(
                          alignment: Alignment.topLeft,
                          child: TextButton(
                            onPressed: () {
                              Get.to(() => RecordPayment(
                                    traineeList: traineeList,
                                    index: index,
                                    fess: traineeList[index].fees.toDouble(),
                                  ));
                            },
                            child: Text(
                              'Record A Payment',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: TextButton(
                            onPressed: () {
                              Get.to(() => Ledger_Page(
                                    traineeList: traineeList,
                                    traineeProfileUid:
                                        traineeList[index].traineeProfileUid,
                                    index: index,
                                  ));
                            },
                            child: Text(
                              'View Ledger',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ),
                        status == true
                            ? Align(
                                alignment: Alignment.topLeft,
                                child: TextButton(
                                  onPressed: () {
                                    Get.to(
                                        () => Edit_Page(
                                            traineeList: traineeList,
                                            traineeProfileUid:
                                                traineeList[index]
                                                    .traineeProfileUid,
                                            index: index),
                                        transition: Transition.rightToLeft);
                                  },
                                  child: Text(
                                    'Edit Batch',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              )
                            : Container(),
                        status == true
                            ? Align(
                                alignment: Alignment.topLeft,
                                child: TextButton(
                                  onPressed: () {
                                    Get.to(() => const NewAssignment(),
                                        transition: Transition.rightToLeft);
                                  },
                                  child: Text(
                                    'Performance Assessment',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              )
                            : Container(),
                        status == true
                            ? Align(
                                alignment: Alignment.topLeft,
                                child: TextButton(
                                  onPressed: () {
                                    Get.to(
                                        () => Deactivate_Page(
                                              traineeList: traineeList,
                                              traineeProfileUid:
                                                  traineeList[index]
                                                      .traineeProfileUid,
                                              index: index,
                                            ),
                                        transition: Transition.rightToLeft);
                                  },
                                  child: Text(
                                    'Deactivate',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              )
                            : Align(
                                alignment: Alignment.topLeft,
                                child: TextButton(
                                  onPressed: () {
                                    Get.to(
                                        () => Activate_Page(
                                              traineeList: traineeList,
                                              traineeProfileUid:
                                                  traineeList[index]
                                                      .traineeProfileUid,
                                              index: index,
                                            ),
                                        transition: Transition.rightToLeft);
                                  },
                                  child: Text(
                                    'Activate',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;
  final TextEditingController FullName = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  TraineeViewModel traineeViewModel = TraineeViewModel();
  List<Map<String, dynamic>> _foundUsers = [];
  List<int> _selectedItems = <int>[];
  int _selectedIndex = -1;
  late Map<String, dynamic> data;

  final List<Map<String, dynamic>> _allUsers = [
    {
      "id": 1,
      "name": "Shivendar Singh",
      "proImg": "assets/images/user_profile.png",
      "categorgyImg": "assets/images/Golf.png"
    },
    {
      "id": 2,
      "name": "Aarush mishra",
      "proImg": "assets/images/user_profile.png",
      "categorgyImg": "assets/images/Golf.png"
    },
    {
      "id": 3,
      "name": "Divya Shah",
      "detail": 'Male, +9189555296811',
      "proImg": "assets/images/user_profile.png",
      "categorgyImg": "assets/images/Golf.png"
    }
  ];
  @override
  initState() {
    data = {"filter_batch_uid": "", "search": ""};
    traineeViewModel.fetchTraineeListSearchApi(data);
    _foundUsers = _allUsers;
    super.initState();
  }

  void dataFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: _localization.supportedLocales,
      localizationsDelegates: _localization.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Get.to(() => const Layout(selectedIndex: 0),
                  transition: Transition.rightToLeft),
            ),
            title: Text(
              'Trainee Listing',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            actions: [
              IconButton(
                onPressed: (() {
                  Get.to(() => AddTrainneInExisitingBatch(),
                      transition: Transition.rightToLeft);
                }),
                icon: const Icon(Icons.add),
                iconSize: 25,
                color: Colors.black,
              ),
            ],
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    InkWell(
                      onTap: showFilter,
                      child: Container(
                        alignment: Alignment.center,
                        height: 55,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey)),
                        child: const Icon(
                          Icons.filter_list,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          side: BorderSide(
                            color: Color.fromARGB(255, 197, 196, 196),
                          ),
                        ),
                        elevation: 0,
                        child: ListTile(
                          title: TextField(
                            onChanged: (searchData) => dataFilter(searchData),
                            decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 0.0),
                                hintText: 'Search',
                                border: InputBorder.none),
                          ),
                          trailing: const Icon(Icons.search),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ChangeNotifierProvider<TraineeViewModel>(
                create: (BuildContext context) => traineeViewModel,
                child: Consumer<TraineeViewModel>(
                  builder: (context, value, _) {
                    switch (value.dataList.status!) {
                      case Status.loading:
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.teal,
                          ),
                        );
                      case Status.completed:
                        return SingleChildScrollView(
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            //color:Colors.green,
                            height: MediaQuery.of(context).size.height * 0.6,
                            child: ListView.builder(
                              itemCount: value.dataList.data?.data.length,
                              itemBuilder: (context, index) {
                                print(
                                    ' traineeProfileUid UID ${value.dataList.data!.data[index].traineeProfileUid}  Trainee Name ${value.dataList.data!.data[index].image}');
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        showBottomSheet(
                                          status: value.dataList.data!
                                                      .data[index].status ==
                                                  'active'
                                              ? true
                                              : false,
                                          index: index,
                                          traineeList:
                                              value.dataList.data!.data,
                                        );
                                      },
                                      child: Container(
                                        color: const Color(0XFFDFE1E4)
                                            .withOpacity(0.3),
                                        //padding: const EdgeInsets.all(5),
                                        height: 110,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const SizedBox(height: 5),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 8.0),
                                                  child: Container(
                                                    width: 30,
                                                    height: 30,
                                                    decoration:
                                                        const BoxDecoration(
                                                            color: Colors.grey,
                                                            shape: BoxShape
                                                                .circle),
                                                    child: value
                                                            .dataList
                                                            .data!
                                                            .data[index]
                                                            .image
                                                            .isNotEmpty
                                                        ? CachedNetworkImage(
                                                            fit: BoxFit.contain,
                                                            imageUrl: AppUrl
                                                                    .ouserProfileimgListEndPoint +
                                                                value
                                                                    .dataList
                                                                    .data!
                                                                    .data[index]
                                                                    .image,
                                                            errorWidget: (context,
                                                                    url,
                                                                    error) =>
                                                                // Image.asset("assets/images/user.png")
                                                                Icon(
                                                                  Icons.person,
                                                                  size: 30,
                                                                ))
                                                        : CircleAvatar(
                                                            backgroundColor:
                                                                Colors.blue,
                                                            child: Text(
                                                              getInitials(value
                                                                  .dataList
                                                                  .data!
                                                                  .data[index]
                                                                  .traineeName),
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            // backgroundImage: getInitials(value.dataList.data!.data[index].traineeName),
                                                          ),
                                                    // AssetImage('assets/images/user_profile.png'),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 2,
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Container(
                                                    width: 40,
                                                    height: 20,
                                                    decoration: BoxDecoration(
                                                      color: value
                                                                  .dataList
                                                                  .data!
                                                                  .data[index]
                                                                  .status ==
                                                              "active"
                                                          ? const Color(
                                                              0xff47C088)
                                                          : Colors.redAccent,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                    ),
                                                    child: Center(
                                                        child: value
                                                                    .dataList
                                                                    .data!
                                                                    .data[index]
                                                                    .status ==
                                                                "active"
                                                            ? const Text(
                                                                "Active",
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                      0xffFBFBFC),
                                                                  fontSize: 10,
                                                                  fontFamily:
                                                                      'Lato',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              )
                                                            : const Text(
                                                                "Inactive",
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                      0xffFBFBFC),
                                                                  fontSize: 10,
                                                                  fontFamily:
                                                                      'Lato',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(height: 5),
                                                Container(
                                                  //color: Colors.grey,
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          .8,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 10.0),
                                                        child: Text(
                                                          value
                                                              .dataList
                                                              .data!
                                                              .data[index]
                                                              .traineeName,
                                                          style:
                                                              const TextStyle(
                                                            color: Color(
                                                                0xff39404A),
                                                            fontSize: 14,
                                                            fontFamily: 'Lato',
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                      ),
                                                      // const SizedBox(width: 10),
                                                      Container(
                                                        height: 20,
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 5,
                                                                right: 5,
                                                                top: 2),
                                                        decoration: BoxDecoration(
                                                            color: value
                                                                        .dataList
                                                                        .data!
                                                                        .data[
                                                                            index]
                                                                        .join_status ==
                                                                    'not_onboarded'
                                                                ? const Color
                                                                        .fromRGBO(
                                                                    255,
                                                                    232,
                                                                    231,
                                                                    1)
                                                                : const Color(
                                                                    0xffEDF9F3),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: Text(
                                                          value
                                                                      .dataList
                                                                      .data!
                                                                      .data[
                                                                          index]
                                                                      .join_status ==
                                                                  'not_onboarded'
                                                              ? 'Not Onboarded'
                                                              : 'Onboarded',
                                                          style: TextStyle(
                                                              color: value
                                                                          .dataList
                                                                          .data!
                                                                          .data[
                                                                              index]
                                                                          .join_status ==
                                                                      'not_onboarded'
                                                                  ? const Color
                                                                          .fromRGBO(
                                                                      253,
                                                                      29,
                                                                      13,
                                                                      1)
                                                                  : Colors
                                                                      .green,
                                                              fontSize: 12),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          width: 24,
                                                          height: 24,
                                                          child: Image.network(
                                                            AppUrl.serviceIconEndPoint +
                                                                value
                                                                    .dataList
                                                                    .data!
                                                                    .data[index]
                                                                    .serviceicon,
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 1),
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          .5,
                                                  padding: EdgeInsets.only(
                                                      left: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          .025),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      value
                                                                  .dataList
                                                                  .data
                                                                  ?.data[index]
                                                                  .gender ==
                                                              'male'
                                                          ? const Text(
                                                              "Male",
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xff39404A),
                                                                fontSize: 12,
                                                                fontFamily:
                                                                    'Lato',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            )
                                                          : value
                                                                      .dataList
                                                                      .data
                                                                      ?.data[
                                                                          index]
                                                                      .gender ==
                                                                  'female'
                                                              ? const Text(
                                                                  "Female",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xff39404A),
                                                                    fontSize:
                                                                        12,
                                                                    fontFamily:
                                                                        'Lato',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                )
                                                              : const Text(
                                                                  "Others",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xff39404A),
                                                                    fontSize:
                                                                        12,
                                                                    fontFamily:
                                                                        'Lato',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                ),
                                                      const Text(
                                                        " | ",
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff39404A),
                                                          fontSize: 12,
                                                          fontFamily: 'Lato',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      Text(
                                                        value.dataList.data!
                                                            .data[index].dob,
                                                        style: const TextStyle(
                                                          color:
                                                              Color(0xff39404A),
                                                          fontSize: 12,
                                                          fontFamily: 'Lato',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 12),
                                                SizedBox(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          .75,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 15.0),
                                                        child: Text(
                                                          value
                                                              .dataList
                                                              .data!
                                                              .data[index]
                                                              .batchname,
                                                          style:
                                                              const TextStyle(
                                                            color: Color(
                                                                0xff39404A),
                                                            fontSize: 14,
                                                            fontFamily: 'Lato',
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        '${value.dataList.data!.data[index].batch_timing_from} to ${value.dataList.data!.data[index].batch_timing_to}',
                                                        style: const TextStyle(
                                                          color:
                                                              Color(0xff39404A),
                                                          fontSize: 12,
                                                          fontFamily: 'Lato',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 5),
                                                //const SizedBox(height: 5),
                                                Container(
                                                  width: 300,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 15),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            const Text(
                                                              "Fee : ",
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xff39404A),
                                                                fontSize: 14,
                                                                fontFamily:
                                                                    'Lato',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                            ),
                                                            Text(
                                                              '₹ ${value.dataList.data?.data[index].fees}',
                                                              style:
                                                                  const TextStyle(
                                                                color: Color(
                                                                    0xff39404A),
                                                                fontSize: 12,
                                                                fontFamily:
                                                                    'Lato',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        // Row(
                                                        //   children: [
                                                        //     const Text(
                                                        //       "Due : ",
                                                        //       style: TextStyle(
                                                        //         color: Color(0xff39404A),
                                                        //         fontSize: 14,
                                                        //         fontFamily: 'Lato',
                                                        //         fontWeight: FontWeight.w700,
                                                        //       ),
                                                        //     ),
                                                        //     Text(
                                                        //       '₹ ${value.dataList.data?.data[index].fees}',
                                                        //       style: const TextStyle(
                                                        //         color: Color(0xff39404A),
                                                        //         fontSize: 12,
                                                        //         fontFamily: 'Lato',
                                                        //         fontWeight: FontWeight.w400,
                                                        //       ),
                                                        //     ),
                                                        //   ],
                                                        // )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Divider(
                                      height: 1,
                                      thickness: 1,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        );
                      case Status.error:
                        return Center(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              color: Theme.of(context).primaryColorDark,
                              size: 100.0,
                            ),
                            const NoData()
                            // Text(
                            //   value.dataList.message.toString(),
                            //   style: TextStyle(
                            //       color: Theme.of(context).primaryColor,
                            //       fontSize: 20,
                            //       height: 2),
                            // )
                          ],
                        ));
                    }
                  },
                ),
              ),
            ],
          )),
    );
  }

  String getInitials(String name) {
    List<String> nameParts = name.split(' ');
    if (nameParts.length > 1) {
      return nameParts[0][0].toUpperCase() + nameParts[1][0].toUpperCase();
    } else if (nameParts.length == 1) {
      String firstName = nameParts[0];
      if (firstName.length >= 2) {
        return firstName.substring(0, 2).toUpperCase();
      } else {
        return firstName[0].toUpperCase();
      }
    } else {
      return '';
    }
  }

  showAlertDialog(BuildContext context) {
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(10),

          backgroundColor: Colors.white,
          title: const Text(
            "Confirm Addition Of The Trainee",
            style: TextStyle(fontSize: 14),
          ),

          content: ListView.separated(
            itemCount: 3,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                height: 115,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(10.0))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/user_profile.png"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 2,
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                height: 20,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.green.shade700,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Text(
                                  "Active",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 5, bottom: 10),
                              child: Text(
                                "Shivendra Singh",
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 50),
                              child: Text(
                                "Male | 34 Year",
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Container(
                            padding: const EdgeInsets.only(),
                            decoration: BoxDecoration(
                                color: Colors.green.shade100,
                                borderRadius: BorderRadius.circular(5)),
                            child: const Text(
                              "Onboarded",
                              style:
                                  TextStyle(fontSize: 10, color: Colors.green),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            bottom: 10,
                            top: 5,
                          ),
                          child: SizedBox(
                            height: 30,
                            width: 40,
                            child: CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/images/Golf.png")),
                          ),
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 55),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Tenni Batch Evening",
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            "03:00 PM to 05:30 PM",
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 50),
                      child: Row(
                        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                " Joining Date:",
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                "01 Jan,23",
                                style:
                                    TextStyle(fontSize: 10, color: Colors.grey),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                " Billing Date:",
                                style: TextStyle(fontSize: 12),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Text(
                                  "10 Jan,23",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.grey,
                height: 1,
              );
            },
          ),

          actions: [
            SizedBox(
              height: 40,
              width: 130,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.grey.shade300,
                    textStyle: const TextStyle(
                        // fontSize: 20,
                        fontWeight: FontWeight.bold)),
                child: const Text(
                  "Cancle",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
            ),
            SizedBox(
              height: 40,
              width: 130,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    textStyle: const TextStyle(
                        // fontSize: 20,
                        fontWeight: FontWeight.bold)),
                child: const Text("Confirm",
                    style: TextStyle(
                      //    color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )),
                onPressed: () {
                  // showAlertDialogs(context);
                },
              ),
            ),
          ],
          actionsAlignment: MainAxisAlignment.center,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(20),
          // ),
        );
      },
    );
  }

  //bottomsheet popup
  showFilter() {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        double screenWidth = MediaQuery.of(context).size.width;
        double screenHeight = MediaQuery.of(context).size.height;
        AcademyViewViewModel academyViewViewModel = AcademyViewViewModel();
        academyViewViewModel.fetchAcademyListApi();
        List<DropdownMenuItem<String>> activeServices = [];
        String? selectedService;
        return Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: false,
          body: Container(
            height: screenHeight * .7,
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: screenHeight * .45,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0),
                    ),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          height: 3,
                          width: 50,
                          color: Colors.grey[400],
                        ),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Filters',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Loto-Regular'),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(color: Colors.grey),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 342,
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffDFE1E4)),
                            borderRadius: BorderRadius.circular(8)),
                        child: const Batch_DropDown(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: screenHeight * .25,
                        padding: const EdgeInsets.only(left: 8.0),
                        // decoration: BoxDecoration(
                        //   border: Border.all(
                        //       width: 1,
                        //       color: const Color.fromARGB(255, 218, 216, 216)),
                        //   borderRadius:
                        //   const BorderRadius.all(Radius.circular(5)),
                        // ),
                        child: ChangeNotifierProvider<AcademyViewViewModel>(
                            create: (context) => academyViewViewModel,
                            child: Consumer<AcademyViewViewModel>(
                                builder: (context, value, child) {
                              return
                                  //Custom Filter Bar
                                  const Filter();
                            })),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
