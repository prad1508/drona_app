// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:drona/data/response/status.dart';
import 'package:drona/res/language/language.dart';
import 'package:drona/utils/no_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../res/app_url.dart';
import '../../res/widget/round_button.dart';
import '../../view_model/batchList_view_model.dart';
import '../../view_model/trainee_view_model.dart';
import '../academy/academy_details.dart';
import '../trainne_addmanual.dart';
import 'edit_batch_listing.dart';

class ViewBatchDetails extends StatefulWidget {
  final int ListIndex;
  final String batchUid;
  final String pathPage;
  final String totalTrainee;
  const ViewBatchDetails(
      {super.key,
      required this.ListIndex,
      this.batchUid = '',
      this.pathPage = '',
      this.totalTrainee = ''});

  @override
  State<ViewBatchDetails> createState() => _ViewBatchDetailsState();
}

class _ViewBatchDetailsState extends State<ViewBatchDetails> {
  String batchFees = '';
  //multi language support
  late Map<String, dynamic> data;
  final FlutterLocalization _localization = FlutterLocalization.instance;
  BatchListViewViewModel batchListViewViewModel = BatchListViewViewModel();
  TraineeViewModel traineeViewModel = TraineeViewModel();

  @override
  initState() {
    super.initState();
    data = {"filter_batch_uid": widget.batchUid, "search": ""};
    traineeViewModel.fetchTraineeListSearchApi(data);
    batchListViewViewModel.fetchBatchListListApi();
  }

  bool value = true;
  bool agree = true;
  final TextEditingController BatchName = TextEditingController();
  final TextEditingController service = TextEditingController();
  final TextEditingController assignCoach = TextEditingController();
  final TextEditingController BatchTime = TextEditingController();
  final TextEditingController fee = TextEditingController();
  final TextEditingController onlineUrl = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();

  Future<bool> isValidPasscode(String value) async {
    return await Future.delayed(const Duration(seconds: 1),
        () => value.isNotEmpty && value.toLowerCase() == 'batman');
  }

  String selectedCategory = 'Tennis';
  String selectedAssignCoach = 'john';
  String batchUid = '';
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: _localization.supportedLocales,
      localizationsDelegates: _localization.localizationsDelegates,
      home: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            AppLocale.viewBatchDetails.getString(context),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (BuildContext context) =>
                  //         EditBatchListing(Listindex: widget.ListIndex),
                  //   ),
                  // );
                  Get.to(() => EditBatchListing(Listindex: widget.ListIndex),
                      transition: Transition.rightToLeft);
                },
                icon: const Icon(
                  Icons.edit,
                  size: 20,
                  color: Colors.black,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Material(
            color: Colors.white,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: ChangeNotifierProvider<BatchListViewViewModel>(
                create: (BuildContext context) => batchListViewViewModel,
                child: Consumer<BatchListViewViewModel>(
                    builder: (context, value, _) {
                  // batchUid = value.dataList.data!.data![0].uid.toString();
                  //   print("object==$batchUid");
                  switch (value.dataList.status!) {
                    case Status.loading:
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.teal,
                        ),
                      );

                    case Status.completed:
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              AppLocale.batchName.getString(context),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            enabled: false,
                            controller: BatchName
                              ..text = value.dataList.data
                                      ?.data![widget.ListIndex].batchName
                                      .toString() ??
                                  '',
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                AppLocale.serviceText.getString(context),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            enabled: false,
                            controller: service
                              ..text = value.dataList.data
                                      ?.data![widget.ListIndex].serviceName
                                      .toString() ??
                                  '',
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              AppLocale.assignCoach.getString(context),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            enabled: false,
                            controller: assignCoach
                              ..text = value.dataList.data
                                      ?.data![widget.ListIndex].coachName
                                      .toString() ??
                                  '',
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              AppLocale.program.getString(context),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.black.withOpacity(0.5),
                                  padding: const EdgeInsets.fromLTRB(
                                      25, 15, 25, 15)),
                              child: Text(value.dataList.data
                                      ?.data![widget.ListIndex].programName
                                      .toString() ??
                                  ''),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              AppLocale.fee.getString(context),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            enabled: false,
                            controller: fee
                              ..text = value.dataList.data
                                      ?.data![widget.ListIndex].fees
                                      .toString() ??
                                  '',
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              AppLocale.tYOB.getString(context),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.black.withOpacity(0.5),
                                  padding: const EdgeInsets.fromLTRB(
                                      25, 15, 25, 15)),
                              child: Text(value.dataList.data
                                      ?.data![widget.ListIndex].batch_type
                                      .toString() ??
                                  ''),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              AppLocale.title22.getString(context),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            enabled: false,
                            controller: onlineUrl
                              ..text = value.dataList.data
                                      ?.data![widget.ListIndex].onlineSessionUrl
                                      .toString() ??
                                  '',
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              AppLocale.batchDays.getString(context),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 50,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: value
                                        .dataList
                                        .data
                                        ?.data![widget.ListIndex]
                                        .batchDaysShort
                                        ?.length ??
                                    0,
                                itemBuilder: (context, index) {
                                  return Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Colors.black.withOpacity(0.5),
                                            padding: const EdgeInsets.fromLTRB(
                                                25, 15, 25, 15)),
                                        child: Text(value
                                                .dataList
                                                .data
                                                ?.data![widget.ListIndex]
                                                .batchDaysShort![index] ??
                                            ''),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      )
                                    ],
                                  );
                                }),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              AppLocale.batchTiming.getString(context),
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            enabled: false,
                            controller: BatchTime
                              ..text = value.dataList.data!
                                      .data![widget.ListIndex].batchTimingFrom
                                      .toString() +
                                  ' to ' +
                                  value.dataList.data!.data![widget.ListIndex]
                                      .batchTimingTo
                                      .toString(),
                            decoration: InputDecoration(
                              suffixIcon: const Icon(Icons.access_time),
                              contentPadding: const EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),

                          //Trainee List View

                          SizedBox(height: 20),
                          //List

                          // SingleChildScrollView(
                          // child: Expanded(
                          // height:
                          // child:
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
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                AppLocale.traineeList
                                                    .getString(context),
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 10)),
                                              Text(
                                                widget.totalTrainee,
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            height: 500,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              padding: EdgeInsets.zero,
                                              itemCount: value
                                                  .dataList.data?.data.length,
                                              itemBuilder: (context, index) {
                                                return Column(
                                                  children: [
                                                    Container(
                                                      color: Color(0XFFDFE1E4)
                                                          .withOpacity(0.3),
                                                      width: screenWidth,
                                                      height:
                                                          screenHeight * 0.22,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 5),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                SizedBox(
                                                                  width: 35,
                                                                  height: 46,
                                                                  child: value
                                                                          .dataList
                                                                          .data!
                                                                          .data[
                                                                              index]
                                                                          .image
                                                                          .isNotEmpty
                                                                      ? CircleAvatar(
                                                                          backgroundImage:
                                                                              NetworkImage(
                                                                            AppUrl.profileserviceIconEndPoint +
                                                                                value.dataList.data!.data[index].image,
                                                                          ),
                                                                          // AssetImage('assets/images/user_profile.png'),
                                                                        )
                                                                      : CircleAvatar(
                                                                          backgroundColor:
                                                                              Colors.blue,
                                                                          child:
                                                                              Text(
                                                                            getInitials(value.dataList.data!.data[index].traineeName),
                                                                            style:
                                                                                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
                                                                          ),
                                                                          // backgroundImage: getInitials(value.dataList.data!.data[index].traineeName),
                                                                        ),
                                                                  // AssetImage('assets/images/user_profile.png'),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .bottomLeft,
                                                                  child:
                                                                      Container(
                                                                    width: 44,
                                                                    height: 20,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: value.dataList.data!.data[index].status ==
                                                                              "active"
                                                                          ? Color(
                                                                              0xff47C088)
                                                                          : Colors
                                                                              .redAccent,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4),
                                                                    ),
                                                                    child: Center(
                                                                        child: value.dataList.data!.data[index].status == "active"
                                                                            ? Text(
                                                                                AppLocale.active.getString(context),
                                                                                style: TextStyle(
                                                                                  color: Color(0xffFBFBFC),
                                                                                  fontSize: 10,
                                                                                  fontFamily: 'Lato',
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                              )
                                                                            : Text(
                                                                                AppLocale.inActive.getString(context),
                                                                                style: TextStyle(
                                                                                  color: Color(0xffFBFBFC),
                                                                                  fontSize: 10,
                                                                                  fontFamily: 'Lato',
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                              )),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                SizedBox(
                                                                  width:
                                                                      screenWidth *
                                                                          0.82,
                                                                  //color:Colors.yellow,
                                                                  child: Row(
                                                                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                    children: [
                                                                      Expanded(
                                                                        flex: 3,
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.only(left: 12.0),
                                                                          child:
                                                                              Text(
                                                                            value.dataList.data!.data[index].traineeName,
                                                                            maxLines:
                                                                                2,
                                                                            style:
                                                                                TextStyle(
                                                                              color: Color(0xff39404A),
                                                                              fontSize: 14,
                                                                              fontFamily: 'Lato',
                                                                              fontWeight: FontWeight.w700,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 2,
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              75,
                                                                          height:
                                                                              20,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color: value.dataList.data!.data[index].join_status == "not_onboarded"
                                                                                ? Colors.redAccent.shade100.withOpacity(0.3)
                                                                                : Color(0xffEDF9F3),
                                                                            borderRadius:
                                                                                BorderRadius.circular(4),
                                                                          ),
                                                                          child: Center(
                                                                              child: value.dataList.data!.data[index].join_status == "not_onboarded"
                                                                                  ? Text(
                                                                                      AppLocale.notOnboarded.getString(context),
                                                                                      style: TextStyle(
                                                                                        color: Colors.redAccent,
                                                                                        fontSize: 10,
                                                                                        fontFamily: 'Lato',
                                                                                        fontWeight: FontWeight.w400,
                                                                                      ),
                                                                                    )
                                                                                  : Text(
                                                                                      AppLocale.onboarded.getString(context),
                                                                                      style: TextStyle(
                                                                                        color: Color(0xff47C088),
                                                                                        fontSize: 10,
                                                                                        fontFamily: 'Lato',
                                                                                        fontWeight: FontWeight.w400,
                                                                                      ),
                                                                                    )),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            CircleAvatar(
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          child:
                                                                              Image.network(
                                                                            AppUrl.serviceIconEndPoint +
                                                                                value.dataList.data!.data[index].serviceicon,
                                                                            height:
                                                                                25,
                                                                            width:
                                                                                25,
                                                                          ),
                                                                        ),
                                                                        // AssetImage('assets/images/tennis.png'),
                                                                        //  backgroundColor: Colors.white,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    height: 1),
                                                                Row(
                                                                  children: [
                                                                    Padding(
                                                                        padding: EdgeInsets.only(
                                                                            left:
                                                                                15.0),
                                                                        child: value.dataList.data?.data[index].gender ==
                                                                                'male'
                                                                            ? Text(
                                                                                AppLocale.male.getString(context),
                                                                                style: TextStyle(
                                                                                  color: Color(0xff39404A),
                                                                                  fontSize: 12,
                                                                                  fontFamily: 'Lato',
                                                                                  fontWeight: FontWeight.w400,
                                                                                ),
                                                                              )
                                                                            : value.dataList.data?.data[index].gender == 'female'
                                                                                ? Text(
                                                                                    AppLocale.female.getString(context),
                                                                                    style: TextStyle(
                                                                                      color: Color(0xff39404A),
                                                                                      fontSize: 12,
                                                                                      fontFamily: 'Lato',
                                                                                      fontWeight: FontWeight.w400,
                                                                                    ),
                                                                                  )
                                                                                : Text(
                                                                                    AppLocale.other.getString(context),
                                                                                    style: TextStyle(
                                                                                      color: Color(0xff39404A),
                                                                                      fontSize: 12,
                                                                                      fontFamily: 'Lato',
                                                                                      fontWeight: FontWeight.w400,
                                                                                    ),
                                                                                  )),
                                                                    Text(
                                                                      " | ",
                                                                      style:
                                                                          TextStyle(
                                                                        color: Color(
                                                                            0xff39404A),
                                                                        fontSize:
                                                                            12,
                                                                        fontFamily:
                                                                            'Lato',
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      value
                                                                          .dataList
                                                                          .data!
                                                                          .data[
                                                                              index]
                                                                          .dob,
                                                                      style:
                                                                          TextStyle(
                                                                        color: Color(
                                                                            0xff39404A),
                                                                        fontSize:
                                                                            12,
                                                                        fontFamily:
                                                                            'Lato',
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                    height: 12),
                                                                Row(
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsets.only(
                                                                          left:
                                                                              15.0),
                                                                      child:
                                                                          Text(
                                                                        value
                                                                            .dataList
                                                                            .data!
                                                                            .data[index]
                                                                            .batchname,
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Color(0xff39404A),
                                                                          fontSize:
                                                                              14,
                                                                          fontFamily:
                                                                              'Lato',
                                                                          fontWeight:
                                                                              FontWeight.w700,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          left:
                                                                              15),
                                                                      child:
                                                                          Text(
                                                                        '${value.dataList.data?.data[index].batch_timing_from} to ${value.dataList.data?.data[index].batch_timing_to}',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Color(0xff39404A),
                                                                          fontSize:
                                                                              12,
                                                                          fontFamily:
                                                                              'Lato',
                                                                          fontWeight:
                                                                              FontWeight.w400,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                    height: 5),
                                                                SizedBox(
                                                                    height: 5),
                                                                Container(
                                                                  width: 300,
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            15),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              "${AppLocale.fee.getString(context)} : ",
                                                                              style: TextStyle(
                                                                                color: Color(0xff39404A),
                                                                                fontSize: 14,
                                                                                fontFamily: 'Lato',
                                                                                fontWeight: FontWeight.w700,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              '₹ ${value.dataList.data?.data[index].fees}',
                                                                              style: TextStyle(
                                                                                color: Color(0xff39404A),
                                                                                fontSize: 12,
                                                                                fontFamily: 'Lato',
                                                                                fontWeight: FontWeight.w400,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
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
                                                    Divider(
                                                      height: 1,
                                                      thickness: 1,
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  case Status.error:
                                    return Center(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // Icon(
                                        //   Icons.error_outline,
                                        //   color: Theme.of(context).primaryColorDark,
                                        //   size: 100.0,
                                        // ),
                                        //   NoData()
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
                          // ),
                          // ),

                          //
                          RoundButton(
                              loading: false,
                              title: AppLocale.addTrainee.getString(context),
                              textColor: Colors.white,
                              rounded: true,
                              color: Theme.of(context).primaryColor,
                              onPress: () {
                                // Map<String, dynamic> data = {
                                //   "batch_uid": "$batchUid",
                                //   "fullname":
                                //       "${value.dataList.data?.data![widget.ListIndex].coachName}",
                                //   "ccode":
                                //       "${value.dataList.data?.data![widget.ListIndex].cdd}",
                                //   "mobno":
                                //       "${value.dataList.data?.data![widget.ListIndex].cmm}",
                                //   "gender": "male",
                                //   "fees": 20000,
                                //   "dateofjoining": "12-04-2023",
                                //   "monthofbilling": "1",
                                //   "img": "izf5azt0sy2iurz.jpeg",
                                //   "relation": "self"
                                // };
                                // print("object$data");
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (BuildContext context) =>
                                //         TrainAddManualy(batchId: batchUid),
                                //   ),
                                // );
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Text(
                                                AppLocale.title23
                                                    .getString(context)
                                                    .trParams(
                                                  {
                                                    'key':
                                                        "${value.dataList.data?.data![widget.ListIndex].batchName.toString().toUpperCase()}",
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Divider(
                                            thickness: 2,
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: TextButton(
                                                      onPressed: () {
                                                        Get.to(
                                                            () =>
                                                                TrainAddManualy(
                                                                  batchId: value
                                                                      .dataList
                                                                      .data!
                                                                      .data![0]
                                                                      .uid
                                                                      .toString(),
                                                                  batchName:
                                                                      "${value.dataList.data?.data![widget.ListIndex].batchName.toString().toUpperCase()}",
                                                                  pathPage: widget
                                                                      .pathPage,
                                                                  fees: value
                                                                      .dataList
                                                                      .data!
                                                                      .data![widget
                                                                          .ListIndex]
                                                                      .fees
                                                                      .toString(),
                                                                ),
                                                            transition: Transition
                                                                .rightToLeft);
                                                      },
                                                      child: Text(
                                                        AppLocale.enterManually.getString(context),
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: TextButton(
                                                    onPressed: () {},
                                                    child: Text(
                                                      AppLocale.selectFromExistingTrainee.getString(context),
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
                              }),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
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
                          NoData()
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
                }),
              ),
            ),
          ),
        ),
      ),
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
}
