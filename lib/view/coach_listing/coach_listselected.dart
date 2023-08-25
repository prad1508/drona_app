import 'dart:convert';

import 'package:drona/view/batch_listing/edit_batch_listing.dart';
import 'package:drona/view/coach_listing/coach_access_management.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../data/response/status.dart';
import '../../model/coach_list_model.dart';
import '../../res/app_url.dart';
import '../../res/language/language.dart';
import '../../res/widget/round_button.dart';
import '../../utils/color.dart';
import '../../utils/no_data.dart';
import '../../view_model/coachlist_view_model.dart';
import '../batch_listing/create_batch_listing.dart';
import '../profile/create_profile.dart';
import 'coach_activateprofile.dart';
import 'coach_deactivateprofile.dart';
import 'coach_filter.dart';
import 'coach_viewprofile.dart';

class CoachListSelected extends StatefulWidget {
  int enabled;
  int Listindex;
  CoachListSelected({super.key, this.Listindex = -1, this.enabled = 0});

  @override
  State<CoachListSelected> createState() => _CoachListSelectedState();
}

class _CoachListSelectedState extends State<CoachListSelected> {
  List<Datum> foundData = [];
  List<Datum> infoData = [];
  bool isNextPage = false;
  bool isLoading = false;

  int? totalDataCount;
  var newDataLength = 1;
  int pageSize = 20;
  CoachlistModel? coachListModel;

  CoachlistViewViewModel coachlistViewViewModel = CoachlistViewViewModel();

  void coachListApi({required int newDataLength}) async {
    setState(() {
      isLoading = true;
    });
    final prefsToken = await SharedPreferences.getInstance();
    dynamic token = prefsToken.getString('token');
    var headers = {
      'Content-Type': 'application/json',
      'token': token.toString()
    };
    var request = http.Request(
        'PUT', Uri.parse('${AppUrl.coachList}/$pageSize/$newDataLength'));
    request.body = json.encode({"search": ""});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonData = await response.stream.bytesToString();
      print(jsonData.toString());

      coachListModel = CoachlistModel.fromJson(jsonDecode(jsonData));
      setState(() {
        isLoading = false;
      });
      var infolist = coachListModel!.data;
      print("api call success==$infolist");
      setState(() {
        infoData.addAll(infolist);
        isNextPage = coachListModel!.nextPageAvailable;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      print(response.reasonPhrase);
    }
  }

  @override
  initState() {
    super.initState();
    coachListApi(newDataLength: newDataLength);
    foundData = infoData;
  }

  runFilter(String enteredKey) {
    List<Datum> result = [];
    if (enteredKey.isEmpty) {
      result = infoData;
    } else {
      result = infoData
          .where((data) => data.name
              .toString()
              .toLowerCase()
              .contains(enteredKey.toLowerCase()))
          .toList();
    }
    setState(() {
      foundData = result;
    });
    // print(foundData);
  }

  runFilter1(/*String enteredKey,*/ String myStatus, String onBoardStatus) {
    //print("enteredKey==$enteredKey");
    print("myStatus==$myStatus");
    print("onBoardStatus==$onBoardStatus");
    // print("key==.$enteredKey");
    List<Datum> result = [];
    if (/*enteredKey.isEmpty &&*/ myStatus.isEmpty && onBoardStatus.isEmpty) {
      result = infoData;
    } else {
      result = infoData
          /*.where((data) => data.name
          .toString()
          .toLowerCase()
          .contains(enteredKey.toLowerCase()))*/
          .where((element) => element.status.toString().contains(myStatus))
          .where((element) =>
              element.joinStatus.toString().contains(onBoardStatus))
          .toList();
    }
    setState(() {
      foundData = result;
    });
    // print("key==.");
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
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
          'Coach List',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: (() {
              Get.to(() => CreateProfile(pathPage: "dashBoard"))!.then((value) {
                print("value==$value");
                value == "" ? null : coachListApi(newDataLength: newDataLength);
              });
            }),
            icon: const Icon(Icons.add),
            iconSize: 25,
            color: Colors.black,
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: bottomSheetWidget(),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        flex: 8,
                        child: searchWidget(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.all(10),

              //color:Colors.green,
              height: h,
              child: isLoading
                  ? const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator(
                              color: Colors.teal,
                            ),
                          ),
                        )
                      ],
                    )
                  : buildListView(),
            ),
            const SizedBox(
              height: 15,
            ),
            widget.enabled == 0
                ? widget.Listindex != -1
                    ? RoundButton(
                        loading: false,
                        title: AppLocale.conts.getString(context),
                        textColor: Colors.white,
                        rounded: true,
                        color: Theme.of(context).primaryColor,
                        onPress: () {
                          Get.to(() => EditBatchListing(),
                              transition: Transition.rightToLeft);
                          print("pressssss edit");
                        })
                    : RoundButton(
                        loading: false,
                        title: AppLocale.conts.getString(context),
                        textColor: Colors.white,
                        rounded: true,
                        color: Theme.of(context).primaryColor,
                        onPress: () {
                          print("normal case");
                          Get.to(() => CreateBatchListing(),
                              transition: Transition.rightToLeft);
                        })
                : Text('')
          ],
        ),
      ),
    );
  }

  buildListView() {
    return foundData.isEmpty
        ? const Center(child: Text("No Data"))
        : ListView.builder(
            shrinkWrap: true,
            itemCount: foundData.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      showBottomSheet(
                          status: foundData[index].status,
                          index: index,
                          fullname: foundData[index].name,
                          coachList: foundData);
                    },
                    child: Container(
                      color: const Color(0XFFDFE1E4).withOpacity(0.3),
                      height: 115,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width: 41,
                                    height: 46,
                                    child: foundData[index].img.isNotEmpty
                                        ? CircleAvatar(
                                            backgroundImage: NetworkImage(
                                            AppUrl.profileserviceIconEndPoint +
                                                foundData[index].img,
                                          ))
                                        : const CircleAvatar(
                                            backgroundImage: AssetImage(
                                                'assets/images/user_profile.png'),
                                          )),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    width: 44,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: foundData[index].status == "active"
                                          ? const Color(0xff47C088)
                                          : foundData[index].status ==
                                                  "unassigned"
                                              ? Colors.blue
                                              : Colors.redAccent,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Center(
                                        child: foundData[index].status ==
                                                "active"
                                            ? const Text(
                                                'Active',
                                                style: TextStyle(
                                                  color: Color(0xffFBFBFC),
                                                  fontSize: 10,
                                                  fontFamily: 'Lato',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              )
                                            : foundData[index].status ==
                                                    "unassigned"
                                                ? const Text(
                                                    'UnAssigned',
                                                    style: TextStyle(
                                                      color: Color(0xffFBFBFC),
                                                      fontSize: 7,
                                                      fontFamily: 'Lato',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  )
                                                : const Text(
                                                    'InActive',
                                                    style: TextStyle(
                                                      color: Color(0xffFBFBFC),
                                                      fontSize: 10,
                                                      fontFamily: 'Lato',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  )),
                                  ),
                                ),
                              ],
                            ),
                            FittedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width * .6,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0, right: 10),
                                          child: Text(
                                            foundData[index].name,
                                            style: const TextStyle(
                                              color: Color(0xff39404A),
                                              fontSize: 14,
                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 20,
                                          padding: const EdgeInsets.only(
                                              left: 5, right: 5, top: 2),
                                          decoration: BoxDecoration(
                                              color:
                                                  foundData[index].joinStatus ==
                                                          "not_onboarded"
                                                      ? const Color.fromRGBO(
                                                          255, 232, 231, 1)
                                                      : const Color(0xffEDF9F3),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Text(
                                            foundData[index].joinStatus ==
                                                    "not_onboarded"
                                                ? 'Not Onboarded'
                                                : 'Onboarded',
                                            style: TextStyle(
                                                color: foundData[index]
                                                            .joinStatus ==
                                                        "not_onboarded"
                                                    ? secondryColor
                                                    : successColor,
                                                fontSize: 10,
                                                height: 1.5),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width * .7,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0),
                                                child: foundData[index]
                                                                .gender ==
                                                            'm' ||
                                                        foundData[index]
                                                                .gender ==
                                                            'male'
                                                    ? const Text(
                                                        "Male",
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff39404A),
                                                          fontSize: 12,
                                                          fontFamily: 'Lato',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      )
                                                    : foundData[index].gender ==
                                                            'f'
                                                        ? const Text(
                                                            "Female",
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
                                                        : const Text(
                                                            "Others",
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
                                                          )),
                                            const Text(
                                              " | ",
                                              style: TextStyle(
                                                color: Color(0xff39404A),
                                                fontSize: 12,
                                                fontFamily: 'Lato',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            Text(
                                              '${foundData[index].dob} Yrs | ${foundData[index].userid}',
                                              //value.dataList.data!.data[index].dob,
                                              style: const TextStyle(
                                                color: Color(0xff39404A),
                                                fontSize: 12,
                                                fontFamily: 'Lato',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          widthFactor: 2,
                                          child: Container(
                                            width: 24,
                                            height: 24,
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/tennis.png'),
                                                    alignment:
                                                        Alignment.centerLeft)),
                                            child: OverflowBox(
                                              maxWidth: 42,
                                              maxHeight: 30,
                                              child: Container(
                                                width: 48,
                                                height: 24,
                                                decoration: const BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            'assets/images/Golf.png'),
                                                        alignment: Alignment
                                                            .centerRight)),
                                                child: OverflowBox(
                                                  maxWidth: 66,
                                                  maxHeight: 30,
                                                  child: Container(
                                                    width: 58,
                                                    height: 24,
                                                    decoration: const BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'assets/images/tennis.png'),
                                                            alignment: Alignment
                                                                .centerRight)),
                                                    child: OverflowBox(
                                                      maxWidth: 120,
                                                      maxHeight: 30,
                                                      child: Container(
                                                        width: 74,
                                                        height: 24,
                                                        decoration: const BoxDecoration(
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    'assets/images/Golf.png'),
                                                                alignment: Alignment
                                                                    .centerRight)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),

                                            // child: CircleAvatar(
                                            //   backgroundImage:
                                            //       // NetworkImage(AppUrl.serviceIconEndPoint +
                                            //       //     value.dataList.data!.data[index].serviceicon,
                                            //       // ),
                                            //       AssetImage(
                                            //           'assets/images/tennis.png'),
                                            //   //  backgroundColor: Colors.white,
                                            // ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width * .75,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10.0),
                                              child: Text(
                                                'Total Batches : ',
                                                style: TextStyle(
                                                  color: Color(0xff39404A),
                                                  fontSize: 14,
                                                  fontFamily: 'Lato',
                                                ),
                                              ),
                                            ),
                                            Text(
                                              foundData[index]
                                                  .totalBatch
                                                  .toString(),
                                              style: const TextStyle(
                                                color: Color(0xff39404A),
                                                fontSize: 12,
                                                fontFamily: 'Lato',
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 15.0),
                                              child: Text(
                                                'Total Trainees : ',
                                                // value.dataList.data!.data[index].batchname,
                                                style: TextStyle(
                                                    color: Color(0xff39404A),
                                                    fontSize: 14,
                                                    fontFamily: 'Lato',
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                            Text(
                                              foundData[index]
                                                  .totalTrainee
                                                  .toString(),
                                              style: const TextStyle(
                                                color: Color(0xff39404A),
                                                fontSize: 12,
                                                fontFamily: 'Lato',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  const SizedBox(height: 5),
                                  SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width * .75,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "Date of Joining : ",
                                                style: TextStyle(
                                                  color: Color(0xff39404A),
                                                  fontSize: 14,
                                                  fontFamily: 'Lato',
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Text(
                                                foundData[index].dateOfJoining,
                                                //{value.dataList.data?.data[index].fees}',
                                                style: const TextStyle(
                                                  color: Color(0xff39404A),
                                                  fontSize: 12,
                                                  fontFamily: 'Lato',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 15.0),
                                                child: Text(
                                                  'Salary : ',
                                                  // value.dataList.data!.data[index].batchname,
                                                  style: TextStyle(
                                                    color: Color(0xff39404A),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w700,
                                                    fontFamily: 'Lato',
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                foundData[index]
                                                    .salaryMonthly
                                                    .toString(),
                                                style: const TextStyle(
                                                  color: Color(0xff39404A),
                                                  fontSize: 12,
                                                  fontFamily: 'Lato',
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
          );
  }

  //bottomsheet popup
  showBottomSheet(
      {required String status,
      int? index,
      String? fullname,
      required List<Datum> coachList}) {
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
                  SizedBox(
                    height: status == 'active'
                        ? 200
                        : status == "unassigned"
                            ? 300
                            : 350,
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
                        status == "active"
                            ? Align(
                                alignment: Alignment.topLeft,
                                child: TextButton(
                                  onPressed: () {
                                    Get.to(
                                        () => CoachDeactivateProfile(
                                            index: index!,
                                            coachProfileUid:
                                                coachList[index].uid,
                                            coachList: coachList),
                                        transition: Transition.leftToRight);
                                  },
                                  child: Text(
                                    'Deactivate',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              )
                            : status == "deactive"
                                ? Align(
                                    alignment: Alignment.topLeft,
                                    child: TextButton(
                                      onPressed: () {
                                        Get.to(
                                            () => CoachActivateProfile(
                                                  index: index!,
                                                  coachProfileUid:
                                                      coachList[index].uid,
                                                  coachList: coachList,
                                                ),
                                            transition: Transition.leftToRight);
                                      },
                                      child: Text(
                                        'Activate',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ),
                                  )
                                : Container(),
                        Align(
                          alignment: Alignment.topLeft,
                          child: TextButton(
                            onPressed: () {
                              Get.to(() => CoachViewProfile(index: index!),
                                  transition: Transition.leftToRight);
                            },
                            child: Text(
                              'View Profile',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ),
                        status == "active" || status == "unassigned"
                            ? Align(
                                alignment: Alignment.topLeft,
                                child: TextButton(
                                  onPressed: () {
                                    Get.to(() => Access_Management_Page(),
                                        transition: Transition.leftToRight);
                                  },
                                  child: Text(
                                    'Access Management',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              )
                            : Container(),
                        status == "active" || status == " unassigned"
                            ? Align(
                                alignment: Alignment.topLeft,
                                child: TextButton(
                                  onPressed: () {
                                    showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Center(
                                          child: AlertDialog(
                                            //  title: const Center(child: Text('')),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.green,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: const Icon(
                                                    Icons.check,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                const SizedBox(height: 5),
                                                const Text(
                                                  "Are You Sure?",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                  "You Want To Invite To",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey[500],
                                                      fontWeight:
                                                          FontWeight.w200),
                                                ),
                                                Text(
                                                  '$fullname!',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey[500],
                                                      fontWeight:
                                                          FontWeight.w200),
                                                ),
                                              ],
                                            ),
                                            contentPadding:
                                                const EdgeInsets.all(15),
                                            actions: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0, right: 10.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              .3,
                                                      child: RoundButton(
                                                        title: 'Cancel',
                                                        onPress: () async {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        rounded: true,
                                                        color: Theme.of(context)
                                                            .dividerColor,
                                                        textColor: Colors.black,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              .3,
                                                      child: RoundButton(
                                                        title: 'Yes',
                                                        onPress: () async {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        rounded: true,
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                        textColor: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    'Resend Invite Code',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              )
                            : Container(),
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

  TextField bottomSheetWidget() {
    return TextField(
      readOnly: true,
      onTap: () {
        showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
            ),
            builder: (context) => CoachFilter(
                  // drop: infoData,
                  search: runFilter1,
                ));
      },
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
          prefixIcon: const Center(child: Icon(Icons.filter_list)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
    );
  }

  TextField searchWidget() {
    return TextField(
      style: const TextStyle(color: Colors.black),
      onChanged: (value) {
        runFilter(value);
      },
      decoration: InputDecoration(
          hintText: "Search",
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          suffixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
    );
  }
}
