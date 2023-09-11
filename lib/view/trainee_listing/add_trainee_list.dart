import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:drona/res/language/language.dart';
import 'package:drona/view/batch_listing/viewprofile_details.dart';
import 'package:drona/view/trainee_listing/ledger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../model/trainee_list_model.dart';
import '../../res/app_url.dart';

import '../../res/widget/Trainee_Listing_Class/filter_trainee_list.dart';

import '../../view_model/trainee_view_model.dart';
import '../dashboard/layout.dart';
import '../performance/new_assignment.dart';
import 'activate.dart';
import 'add_trainee_in_existingBatch.dart';
import 'deactivate.dart';
import 'edit_batch.dart';
import 'record_payment.dart';

class AddTraineeList extends StatefulWidget {
  String path;
   AddTraineeList({
    super.key,
    required this.path
  });

  @override
  State<AddTraineeList> createState() => _AddTraineeListState();
}

class _AddTraineeListState extends State<AddTraineeList> {
  int pageSize = 20;
  int pageNo = 1;

  TraineeListModel? traineeListModel;

  List<Datum> foundData = [];
  List<Datum> infoData = [];
  bool isNextPage = false;
  bool isLoading = false;

  int? totalDataCount;
  var newDataLength = 1;

  TraineeViewModel traineeViewModel = TraineeViewModel();

  void getData({required int newDataLength}) async {
    setState(() {
      isLoading = true;
    });
    final prefsToken = await SharedPreferences.getInstance();
    dynamic token = prefsToken.getString('token');
    var headers = {
      'Content-Type': 'application/json',
      'token': token.toString()
    };
    var request = http.Request('PUT',
        Uri.parse("${AppUrl.traineeListEndpoint}/$pageSize/$newDataLength"));
    request.body = json.encode({"filter_batch_uid": "", "search": ""});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonData = await response.stream.bytesToString();
      print(jsonData.toString());

      traineeListModel = TraineeListModel.fromJson(jsonDecode(jsonData));
      setState(() {
        isLoading = false;
      });
      var infolist = traineeListModel!.data;
      print("api call success==$infolist");
      setState(() {
        infoData.addAll(infolist);
        isNextPage = traineeListModel!.nextPageAvailable;
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
    getData(newDataLength: newDataLength);
    foundData = infoData;

    super.initState();
  }

  runFilter(String enteredKey) {
    List<Datum> result = [];
    if (enteredKey.isEmpty) {
      result = infoData;
    } else {
      result = infoData
          .where((data) => data.traineeName
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

  runFilter1(String enteredKey, String myStatus, String onBoardStatus) {
    print("enteredKey==$enteredKey");
    print("myStatus==$myStatus");
    print("onBoardStatus==$onBoardStatus");
    // print("key==.$enteredKey");
    List<Datum> result = [];
    if (enteredKey.isEmpty && myStatus.isEmpty && onBoardStatus.isEmpty) {
      result = infoData;
    } else {
      result = infoData
          .where((data) => data.batchname
              .toString()
              .toLowerCase()
              .contains(enteredKey.toLowerCase()))
          .where((element) => element.status.toString().contains(myStatus))
          .where((element) =>
              element.join_status.toString().contains(onBoardStatus))
          .toList();
    }
    setState(() {
      foundData = result;
    });
    // print("key==.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              widget.path == "dashBoard"?
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const Layout(selectedIndex: 0),),)
              : Navigator.of(context).pop();


               },
          ),
          title: Text(
            AppLocale.traineeList.getString(context),
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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
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
              SingleChildScrollView(
                child: Container(
                    margin: const EdgeInsets.all(10),
                    //color:Colors.green,
                    height: MediaQuery.of(context).size.height * 0.6,
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
                        : buildListView()),
              ),
            ],
          ),
        ));
  }

  buildListView() {
    return foundData.isEmpty
        ?  Center(child: Text(AppLocale.noData.getString(context)))
        : ListView.builder(
            itemCount: foundData.length,
            itemBuilder: (context, index) {
              /*print(
                        'traineeProfileUid UID ${foundData[index].traineeProfileUid}  Trainee Name ${foundData[index].image}');*/
              return (index == foundData.length)
                  ? foundData.isEmpty
                      ? Center(
                          child: Container(
                              height: 20,
                              width: 20,
                              margin: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.45),
                              child: const CircularProgressIndicator(
                                  // color: Mycolors.GradientLeftColor,
                                  )),
                        )
                      : isNextPage
                          ? Container(
                              decoration:
                                  const BoxDecoration(color: Colors.brown),
                              child: TextButton(
                                child:  Text(
                                  AppLocale.loadMore.getString(context),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                onPressed: () {
                                  setState(() {
                                    newDataLength += 1;

                                    getData(newDataLength: newDataLength);
                                  });
                                },
                              ),
                            )
                          : SizedBox()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            showBottomSheet(
                              status: foundData[index].status == 'active'
                                  ? true
                                  : false,
                              index: index,
                              traineeList: foundData,
                            );
                          },
                          child: Container(
                            color: const Color(0XFFDFE1E4).withOpacity(0.3),
                            //padding: const EdgeInsets.all(5),
                            height: 110,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 5),
                                    Padding(
                                      padding: EdgeInsets.only(top: 8.0),
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: const BoxDecoration(
                                            color: Colors.grey,
                                            shape: BoxShape.circle),
                                        child: foundData[index].image.isNotEmpty
                                            ? CachedNetworkImage(
                                                fit: BoxFit.contain,
                                                imageUrl: AppUrl
                                                        .ouserProfileimgListEndPoint +
                                                    foundData[index].image,
                                                errorWidget: (context, url,
                                                        error) =>
                                                    // Image.asset("assets/images/user.png")
                                                    Icon(
                                                      Icons.person,
                                                      size: 30,
                                                    ))
                                            : CircleAvatar(
                                                backgroundColor: Colors.blue,
                                                child: Text(
                                                  getInitials(foundData[index]
                                                      .traineeName),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white),
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
                                      alignment: Alignment.bottomLeft,
                                      child: Container(
                                        width: 40,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: foundData[index].status ==
                                                  "active"
                                              ? const Color(0xff47C088)
                                              : Colors.redAccent,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Center(
                                            child: foundData[index].status ==
                                                    "active"
                                                ?  Text(
                                              AppLocale.active.getString(context),
                                                    style: TextStyle(
                                                      color: Color(0xffFBFBFC),
                                                      fontSize: 10,
                                                      fontFamily: 'Lato',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  )
                                                :  Text(
                                              AppLocale.inActive.getString(context),
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
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 5),
                                    Container(
                                      //color: Colors.grey,
                                      width:
                                          MediaQuery.sizeOf(context).width * .8,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0),
                                            child: Text(
                                              foundData[index].traineeName,
                                              style: const TextStyle(
                                                color: Color(0xff39404A),
                                                fontSize: 14,
                                                fontFamily: 'Lato',
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          // const SizedBox(width: 10),
                                          Container(
                                            height: 20,
                                            padding: const EdgeInsets.only(
                                                left: 5, right: 5, top: 2),
                                            decoration: BoxDecoration(
                                                color: foundData[index]
                                                            .join_status ==
                                                        'not_onboarded'
                                                    ? const Color.fromRGBO(
                                                        255, 232, 231, 1)
                                                    : const Color(0xffEDF9F3),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Text(
                                              foundData[index].join_status ==
                                                      'not_onboarded'
                                                  ? AppLocale.notOnboarded.getString(context)
                                                  : AppLocale.onboarded.getString(context),
                                              style: TextStyle(
                                                  color: foundData[index]
                                                              .join_status ==
                                                          'not_onboarded'
                                                      ? const Color.fromRGBO(
                                                          253, 29, 13, 1)
                                                      : Colors.green,
                                                  fontSize: 12),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          SizedBox(
                                              width: 24,
                                              height: 24,
                                              child: Image.network(
                                                AppUrl.serviceIconEndPoint +
                                                    foundData[index]
                                                        .serviceicon,
                                              )),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 1),
                                    Container(
                                      width:
                                          MediaQuery.sizeOf(context).width * .5,
                                      padding: EdgeInsets.only(
                                          left:
                                              MediaQuery.sizeOf(context).width *
                                                  .025),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          foundData[index].gender == 'male'
                                              ?  Text(
                                      AppLocale.male.getString(context),
                                                  style: TextStyle(
                                                    color: Color(0xff39404A),
                                                    fontSize: 12,
                                                    fontFamily: 'Lato',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                )
                                              : foundData[index].gender ==
                                                      'female'
                                                  ?  Text(
                                            AppLocale.female.getString(context),
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff39404A),
                                                        fontSize: 12,
                                                        fontFamily: 'Lato',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    )
                                                  :  Text(
                                            AppLocale.other.getString(context),
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff39404A),
                                                        fontSize: 12,
                                                        fontFamily: 'Lato',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
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
                                            foundData[index].dob,
                                            style: const TextStyle(
                                              color: Color(0xff39404A),
                                              fontSize: 12,
                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          .75,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15.0),
                                            child: Text(
                                              foundData[index].batchname,
                                              style: const TextStyle(
                                                color: Color(0xff39404A),
                                                fontSize: 14,
                                                fontFamily: 'Lato',
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '${foundData[index].batch_timing_from} to ${foundData[index].batch_timing_to}',
                                            style: const TextStyle(
                                              color: Color(0xff39404A),
                                              fontSize: 12,
                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.w400,
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
                                            const EdgeInsets.only(left: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                  '₹ ${foundData[index].fees}',
                                                  style: const TextStyle(
                                                    color: Color(0xff39404A),
                                                    fontSize: 12,
                                                    fontFamily: 'Lato',
                                                    fontWeight: FontWeight.w400,
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

  TextField bottomSheetWidget() {
    return TextField(
      readOnly: true,
      onTap: () {
        showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
            ),
            builder: (context) => Filter(
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
          hintText: AppLocale.search.getString(context),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          suffixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
    );
  }

  ///bottomsheet popup
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
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocale.selectOption.getString(context),
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
                              AppLocale.viewProfile.getString(context),
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
                                              title:  Text(
                                              AppLocale.sendReminder.getString(context),
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
                                                    //Are You Sure You Want To Send\nReminder To ${traineeList[index].traineeName}!

                                                    child: Text(
                                                      AppLocale.sendReminderToTrainee.getString(context).trParams({"key": traineeList[index].traineeName}),
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

                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    SizedBox(
                                                      width: 100,
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
                                                          child:  Text(
                                                            AppLocale.cancel.getString(context),
                                                            style: const TextStyle(
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
                                                      width: 100,
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
                                                          child:  Text(
                                                            AppLocale.confirm.getString(context),
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

                                              ],
                                            ),
                                          );
                                        });
                                  },
                                  child: Text(
                                    AppLocale.paymentRemind.getString(context),
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
                              AppLocale.recordPayment.getString(context),
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
                              AppLocale.viewLedge.getString(context),
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
                                    AppLocale.editBatch.getString(context),
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              )
                            : Container(),
                     /*   status == true
                            ? Align(
                                alignment: Alignment.topLeft,
                                child: TextButton(
                                  onPressed: () {
                                    Get.to(() => const NewAssignment(),
                                        transition: Transition.rightToLeft);
                                  },
                                  child: Text(
                                    AppLocale.performanceAssessment.getString(context),
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              )
                            : Container(),*/
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
                                    AppLocale.deactivate.getString(context),
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
                                    AppLocale.activate.getString(context),
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
}
