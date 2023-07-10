import 'package:drona/view/batch_listing/edit_batch_listing.dart';
import 'package:drona/view/profile/view_profile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../data/response/status.dart';
import '../../res/app_url.dart';
import '../../res/language/language.dart';
import '../../res/widget/round_button.dart';
import '../../utils/no_data.dart';
import '../../view_model/batchList_view_model.dart';
import '../../view_model/coachlist_view_model.dart';
import '../batch_listing/create_batch_listing.dart';

class CoachListSelected extends StatefulWidget {
  int Listindex ;
  CoachListSelected({super.key , this.Listindex=-1});

  @override
  State<CoachListSelected> createState() => _CoachListSelectedState();
}

class _CoachListSelectedState extends State<CoachListSelected> {
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;
  CoachlistViewViewModel coachlistViewViewModel = CoachlistViewViewModel();
  List<int> _selectedItems = <int>[];
  bool notFound = false;
  List<Map<String, dynamic>> _foundUsers = [];
  Map<String, dynamic> data = {"search": ""};
  @override
  initState() {
    super.initState();
    coachlistViewViewModel.fetchCoachlistApi(data);
  }

  void dataFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      setState(() {
        notFound = false;
      });
    } else {
      results = _foundUsers
          .where((user) =>
          user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      setState(() {
        notFound = results.isEmpty;
        _foundUsers = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // supportedLocales: _localization.supportedLocales,
      localizationsDelegates: _localization.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          leading: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
              Text(
                _selectedItems.length == 0
                    ? ''
                    : _selectedItems.length.toString(),
                style: const TextStyle(color: Colors.black),
              )
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
            _selectedItems.isEmpty
                ? IconButton(
              onPressed: (() {
                if (kDebugMode) {
                  print('add coach list');
                }
              }),
              icon: const Icon(Icons.group_add),
              iconSize: 25,
              color: Colors.black,
            )
                : IconButton(
              onPressed: (() {
                if (kDebugMode) {
                  print('add coach list');
                }
              }),
              icon: const Icon(Icons.delete_outline),
              iconSize: 25,
              color: Colors.black,
            ),
          ],
        ),
        body: Material(
          color: Colors.white,
          child:
          Container(
            // height: MediaQuery.of(context).size.height,
            // width: MediaQuery.of(context).size.width,
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
                            Container(
                                height: 36,
                                width: MediaQuery.sizeOf(context).width * .1,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: const Color(0xffDFE1E4))),
                                child: SizedBox(
                                  width: 12,
                                  height: 8,
                                  child: InkWell(
                                      child: const Icon(
                                        Icons.filter_list,
                                        color: Color(0xff39404A),
                                      ),
                                      onTap: () {
                                        //bottomsheet(context);
                                      }),
                                )),
                            Container(
                              width: MediaQuery.sizeOf(context).width * .75,
                              height: 36,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: const Color(0xffDFE1E4))),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: const UnderlineInputBorder(
                                        borderSide: BorderSide.none),
                                    enabledBorder: InputBorder.none,
                                    hintText: 'Search',
                                    hintStyle: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.normal),
                                    suffixIcon: Icon(Icons.search,
                                        color: Colors.grey.shade800),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ChangeNotifierProvider<CoachlistViewViewModel>(
                      create: (BuildContext context) => coachlistViewViewModel,
                      child: Consumer<CoachlistViewViewModel>(
                          builder: (context, value, _) {
                            // if (_foundUsers.isEmpty) {
                            //   _foundUsers = List.generate(
                            //       value.dataList.data!.coachlist.length, (index) {
                            //     return {
                            //       "name":
                            //           value.dataList.data?.coachlist[index].name,
                            //       // "img": value.dataList.data?.coachlist[index].img,
                            //       "iconImg": value.dataList.data?.coachlist[index]
                            //           .services[index].serviceIconname,
                            //       "gender":
                            //           value.dataList.data?.coachlist[index].gender,
                            //       "userid":
                            //           value.dataList.data?.coachlist[index].userid,
                            //     };
                            //   });
                            // }

                            // return Expanded(
                            //   child: notFound
                            //       ? const Text(
                            //           'No results found',
                            //           style: TextStyle(fontSize: 24),
                            //         )
                            //       :

                          switch (value.dataList1.status!) {
                            case Status.loading:
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.teal,
                                ),
                              );
                            case Status.completed:
                              return SingleChildScrollView(
                                child: SizedBox(
                                  height: MediaQuery
                                      .sizeOf(context)
                                      .height * .7,
                                  child: ListView.builder(
                                    itemCount: value.dataList1.data?.data
                                        .length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceAround,
                                        children: [
                                          Container(
                                            color: const Color(0XFFDFE1E4)
                                                .withOpacity(0.3),
                                            height: 115,
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                  8.0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .spaceAround,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment
                                                        .start,
                                                    children: [
                                                      SizedBox(
                                                        width: 41,
                                                        height: 46,
                                                        child: CircleAvatar(
                                                          backgroundImage:
                                                          NetworkImage(AppUrl
                                                              .profileserviceIconEndPoint +
                                                              value.dataList1
                                                                  .data!
                                                                  .data[index]
                                                                  .img,
                                                          ),
                                                          //   AssetImage(
                                                          //       'assets/images/user_profile.png'),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment: Alignment
                                                            .bottomLeft,
                                                        child: Container(
                                                          width: 44,
                                                          height: 20,
                                                          decoration: BoxDecoration(
                                                            color: value.dataList1.data?.data[index].status=="active" ? Color(0xff47C088) :Colors.redAccent,
                                                            borderRadius: BorderRadius
                                                                .circular(4),
                                                          ),
                                                          child:  Center(
                                                            child: value.dataList1.data?.data[index].status=="active" ?
                                                            Text(
                                                              'Active',
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xffFBFBFC),
                                                                fontSize: 10,
                                                                fontFamily: 'Lato',
                                                                fontWeight: FontWeight
                                                                    .w600,
                                                              ),
                                                            ) : Text(
                                                              'InActive',
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xffFBFBFC),
                                                                fontSize: 10,
                                                                fontFamily: 'Lato',
                                                                fontWeight: FontWeight
                                                                    .w600,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  FittedBox(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                  left: 15.0),
                                                              child: Text(
                                                                value.dataList1
                                                                    .data!
                                                                    .data[index]
                                                                    .name,
                                                                style: TextStyle(
                                                                  color: Color(
                                                                      0xff39404A),
                                                                  fontSize: 14,
                                                                  fontFamily: 'Lato',
                                                                  fontWeight: FontWeight
                                                                      .w700,
                                                                ),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                width: 10),
                                                            Container(
                                                              width: 75,
                                                              height: 20,
                                                              decoration: BoxDecoration(
                                                                color: const Color(
                                                                    0xffEDF9F3),
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    4),
                                                              ),
                                                              child: Center(
                                                                child: Container(
                                                                  decoration:  BoxDecoration(
                                                                    color: value.dataList1.data?.data[index].joinStatus == "onboarded" ?Color.fromRGBO(237, 249, 243, 1) : Colors.redAccent.withOpacity(0.3),
                                                                  ),
                                                                  child: value.dataList1.data?.data[index].joinStatus == "onboarded" ?
                                                                  const Text(
                                                                    "Onboarded",
                                                                    style: TextStyle(
                                                                      color: Color(
                                                                          0xff47C088),
                                                                      fontSize: 10,
                                                                      fontFamily: 'Lato',
                                                                      fontWeight: FontWeight
                                                                          .w400,
                                                                    ),
                                                                  ) :
                                                                  const Text(
                                                                    "Not Onboarded",
                                                                    style: TextStyle(
                                                                      color: Colors.redAccent,
                                                                      fontSize: 10,
                                                                      fontFamily: 'Lato',
                                                                      fontWeight: FontWeight
                                                                          .w400,
                                                                    ),
                                                                  )
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment: Alignment
                                                                  .center,
                                                              widthFactor: 3.5,
                                                              child: Container(
                                                                width: 24,
                                                                height: 24,
                                                                decoration: const BoxDecoration(
                                                                    image: DecorationImage(
                                                                        image: AssetImage(
                                                                            'assets/images/tennis.png'),
                                                                        alignment: Alignment
                                                                            .centerLeft)
                                                                ),
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
                                                                                .centerRight)
                                                                    ),
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
                                                                                    .centerRight)
                                                                        ),
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
                                                                                        .centerRight)
                                                                            ),
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
                                                        const SizedBox(
                                                            height: 1),
                                                        Row(
                                                          children: [
                                                            Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                    left: 15.0),
                                                                child:
                                                                value.dataList1
                                                                    .data
                                                                    ?.data[index]
                                                                    .gender ==
                                                                    'male'
                                                                    ? const Text(
                                                                  "Male",
                                                                  style: TextStyle(
                                                                    color:
                                                                    Color(
                                                                        0xff39404A),
                                                                    fontSize: 12,
                                                                    fontFamily: 'Lato',
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                  ),
                                                                )
                                                                    :
                                                                value.dataList1
                                                                    .data
                                                                    ?.data[index]
                                                                    .gender ==
                                                                    'female'
                                                                    ? const Text(
                                                                  "Female",
                                                                  style: TextStyle(
                                                                    color: Color(
                                                                        0xff39404A),
                                                                    fontSize: 12,
                                                                    fontFamily: 'Lato',
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
                                                                    fontFamily: 'Lato',
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                  ),
                                                                )),
                                                            const Text(
                                                              " | ",
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xff39404A),
                                                                fontSize: 12,
                                                                fontFamily: 'Lato',
                                                                fontWeight: FontWeight
                                                                    .w400,
                                                              ),
                                                            ),
                                                            Text(
                                                              '${value.dataList1
                                                                  .data!
                                                                  .data[index]
                                                                  .dob} | ${value
                                                                  .dataList1
                                                                  .data
                                                                  ?.data[index]
                                                                  .userid}',
                                                              //value.dataList.data!.data[index].dob,
                                                              style: const TextStyle(
                                                                color: Color(
                                                                    0xff39404A),
                                                                fontSize: 12,
                                                                fontFamily: 'Lato',
                                                                fontWeight: FontWeight
                                                                    .w400,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                            height: 12),
                                                        Row(
                                                          children: [
                                                            const Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                  left: 15.0),
                                                              child: Text(
                                                                'Total Batches : ',
                                                                // value.dataList.data!.data[index].batchname,
                                                                style: TextStyle(
                                                                  color: Color(
                                                                      0xff39404A),
                                                                  fontSize: 14,
                                                                  fontFamily: 'Lato',
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              value.dataList1
                                                                  .data!
                                                                  .data[index]
                                                                  .totalBatch
                                                                  .toString(),
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xff39404A),
                                                                fontSize: 12,
                                                                fontFamily: 'Lato',
                                                                fontWeight: FontWeight
                                                                    .w800,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                  left: 15.0),
                                                              child: Text(
                                                                'Total Trainees : ',
                                                                // value.dataList.data!.data[index].batchname,
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xff39404A),
                                                                    fontSize: 14,
                                                                    fontFamily: 'Lato',
                                                                    fontWeight: FontWeight
                                                                        .w700),
                                                              ),
                                                            ),
                                                            Text(
                                                              value.dataList1
                                                                  .data!
                                                                  .data[index]
                                                                  .totalTrainee
                                                                  .toString(),
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xff39404A),
                                                                fontSize: 12,
                                                                fontFamily: 'Lato',
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                            height: 5),
                                                        const SizedBox(
                                                            height: 5),
                                                        SizedBox(
                                                          width: 300,
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .only(left: 15),
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
                                                                    Text(
                                                                      "Date of Joining : ",
                                                                      style: TextStyle(
                                                                        color: Color(
                                                                            0xff39404A),
                                                                        fontSize: 14,
                                                                        fontFamily: 'Lato',
                                                                        fontWeight: FontWeight
                                                                            .w700,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      value
                                                                          .dataList1
                                                                          .data!
                                                                          .data[index]
                                                                          .dateOfJoining,
                                                                      //{value.dataList.data?.data[index].fees}',
                                                                      style: TextStyle(
                                                                        color: Color(
                                                                            0xff39404A),
                                                                        fontSize: 12,
                                                                        fontFamily: 'Lato',
                                                                        fontWeight: FontWeight
                                                                            .w400,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                          left: 15.0),
                                                                      child: Text(
                                                                        'Salary : ',
                                                                        // value.dataList.data!.data[index].batchname,
                                                                        style: TextStyle(
                                                                          color: Color(
                                                                              0xff39404A),
                                                                          fontSize: 14,
                                                                          fontWeight: FontWeight
                                                                              .w700,
                                                                          fontFamily: 'Lato',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      value
                                                                          .dataList1
                                                                          .data!
                                                                          .data[index]
                                                                          .salaryMonthly
                                                                          .toString(),
                                                                      style: TextStyle(
                                                                        color: Color(
                                                                            0xff39404A),
                                                                        fontSize: 12,
                                                                        fontFamily: 'Lato',
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
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.error_outline,
                                        color: Theme
                                            .of(context)
                                            .primaryColorDark,
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
                          } })),

                  const SizedBox(
                    height: 15,
                  ),
                  widget.Listindex!=-1?
                  RoundButton(
                      loading: false,
                      title: AppLocale.conts.getString(context),
                      textColor: Colors.white,
                      rounded: true,
                      color: Theme.of(context).primaryColor,
                      onPress: () {
                        print("pressssss edit");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    EditBatchListing(Listindex : widget.Listindex )));
                      }):
                  RoundButton(
                      loading: false,
                      title: AppLocale.conts.getString(context),
                      textColor: Colors.white,
                      rounded: true,
                      color: Theme.of(context).primaryColor,
                      onPress: () {
                        print("normal case");
                        Get.to(()=>   CreateBatchListing(),transition: Transition.leftToRight);
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             const CreateBatchListing()));
                      }),
                ],
              )),
        ),
      ),
    );
  }
}
