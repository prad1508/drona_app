import 'dart:convert';

import 'package:drona/view/dashboard/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/response/status.dart';
import '../../model/batch_Filter_model.dart';
import '../../res/app_url.dart';
import '../../res/language/language.dart';
import '../../res/widget/round_button.dart';
import '../../utils/no_data.dart';
import '../../view_model/academy_view_model.dart';
import '../../view_model/batchList_view_model.dart';
import '../../view_model/myprogram_view_model.dart';
import '../academy/academy_details.dart';
import 'create_batch_listing.dart';
import 'view_batch_details.dart';

// ignore: must_be_immutable
class SearchBatchList extends StatefulWidget {
  String pathPage;

  SearchBatchList({super.key, required this.pathPage});
  @override
  State<SearchBatchList> createState() => _SearchBatchListState();
}

class _SearchBatchListState extends State<SearchBatchList> {
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;
  BatchListViewViewModel batchListViewViewModel = BatchListViewViewModel();
  MyProgramViewViewModel myProgramViewViewModel = MyProgramViewViewModel();
  List<int> _selectedItems = <int>[];
  bool notFound = false;
  bool agree = false;
  List<Map<String, dynamic>> _foundUsers = [];
  int pageSize = 10;
  int pageNo = 1;
  final ScrollController _scrollController = ScrollController();
  TextEditingController searchController = TextEditingController();

  Future<BatchFilterModel?>? batchFilterModel;

  List<Datum> items = [];
  int? totalDataCount;
  var newDataLength = 1;

  Future<BatchFilterModel?> batchFilterModelApi(
      {required String status,
      required String serviceUid,
      required String searchText,
      required int newDataLength}) async {
    final prefsToken = await SharedPreferences.getInstance();
    dynamic token = prefsToken.getString('token');

    print("token$token");
    var headers = {
      'Content-Type': 'application/json',
      'token': token.toString()
    };
    var request =
        http.Request('PUT', Uri.parse("${AppUrl.batchsearch}/10/$newDataLength"));

    request.body = json.encode({
      "filter_status": status,
      "filter_service_uid": serviceUid,
      "search": searchText
    });
    request.headers.addAll(headers);
    print("request$request");

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final str = await response.stream.bytesToString();
      print("productListApi Api res-----$str");
      //

      var user = BatchFilterModel.fromJson(json.decode(str));
      setState(() {
        totalDataCount = user.totalDataCount;
      });
      for (var element in user.data) {
        setState(() {
          items.add(element);
        });
      }

      return user;
    } else {
      print(response.reasonPhrase);
      print("api not hit");
    }
  }


  @override
  initState() {
    super.initState();
    // batchListViewViewModel.fetchBatchSearchListApi(data, pageSize, pageNo);
    batchFilterModel = batchFilterModelApi(
        newDataLength: newDataLength,
        status: '',
        serviceUid: '',
        searchText: '');

/*
    _scrollController.addListener(_scrollListener);
*/
  }

  /* void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      batchListViewViewModel.fetchBatchSearchListApi(data, pageSize, ++pageNo);
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    searchController.dispose();
    super.dispose();
  }*/
/*
  void dataFilter(String enteredKeyword) {
    /// call api
    batchListViewViewModel.fetchBatchSearchListApi({"data" : enteredKeyword});
    // ChangeNotifierProvider<BatchListViewViewModel>(
    //     create: (context) => batchListViewViewModel,
    //     child: Consumer<BatchListViewViewModel>(
    //         builder: (context, value, child)
    //         {
    //           notFound = false;
    //           _foundUsers = value.dataList
    //           print(value.dataList.data!.data?[0].batchName);
    //           return Text("aaaa");
    //
    //         }));

    List<Map<String, dynamic>>results = [];
    if (enteredKeyword.isEmpty) {
      setState(() {
        notFound = false;
      });
    } else {
      results = _foundUsers.where((user) => user["name"].toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
      setState(() {
        notFound = results.isEmpty;
        _foundUsers = results;
      });
    }

    }
*/

  //bottomsheet popup
  showFilter() {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        AcademyViewViewModel academyViewViewModel = AcademyViewViewModel();
        academyViewViewModel.fetchAcademyListApi();
        List<DropdownMenuItem<String>> activeServices = [];
        String selectedService = '';

        return StatefulBuilder(
          // Use StatefulBuilder to handle state updates within the build method
          builder: (BuildContext context, StateSetter setState) {
            /* assignSeviceId(selectedServiceValue) {
              setState(() {
                selectedService = selectedServiceValue;
              });
              //myProgramViewViewModel.fetchMyProgramListApi(selectedService);
            }*/

            return Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Filters',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Loto-Regular',
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(color: Colors.grey),
                          const SizedBox(
                            height: 5,
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text('Services'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: const Color.fromARGB(255, 218, 216, 216),
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                            ),
                            child: ChangeNotifierProvider<AcademyViewViewModel>(
                              create: (context) => academyViewViewModel,
                              child: Consumer<AcademyViewViewModel>(
                                builder: (context, value, child) {
                                  activeServices = List.generate(
                                    value.dataList.data!.services.length,
                                    (index) {
                                      value.dataList.data != null
                                          ? selectedService = value.dataList
                                              .data!.services[index].uid
                                          : null;

                                      return DropdownMenuItem(
                                        value: value
                                            .dataList.data!.services[index].uid
                                            .toString(),
                                        child: Text(value.dataList.data!
                                            .services[index].serviceName
                                            .toString()),
                                      );
                                    },
                                  );

                                  return DropdownButton(
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                    isExpanded: true,
                                    underline: DropdownButtonHideUnderline(
                                      child: Container(),
                                    ),
                                    value: selectedService,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedService = newValue!;
                                      });
                                    },
                                    items: activeServices,
                                  );
                                },
                              ),
                            ),
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
      },
    );
  }

  String PageRfreshedText = "Page Refreshed";

  Future<void> refreshItems() async {
    print("api call api call");

    setState(() {
      newDataLength = 0;
      //items.clear();

      batchFilterModel = batchFilterModelApi(
          status: '',
          serviceUid: '',
          searchText: '',
          newDataLength: newDataLength);
      //productByCatModel = productListApi2();
    });
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return MaterialApp(
      supportedLocales: _localization.supportedLocales,
      localizationsDelegates: _localization.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          leading: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Get.to(const Layout(selectedIndex: 0)),
              ),
              Text(
                _selectedItems.isEmpty ? '' : _selectedItems.length.toString(),
                style: const TextStyle(color: Colors.black),
              )
            ],
          ),
          title: Text(
            'Batch List',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            widget.pathPage == "onBoarding"
                ? const SizedBox()
                : IconButton(
                    onPressed: (() {
                      /* Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const CreateBatchListing(),
                        ),
                      );*/
                      Get.to(
                          () => CreateBatchListing(
                                pathPage: "dashBoard",
                              ),
                          transition: Transition.rightToLeft);
                    }),
                    icon: const Icon(Icons.add),
                    iconSize: 25,
                    color: Colors.black,
                  ),
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
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
                      title: TextFormField(
                        controller: searchController,
                        onChanged: (val) {
                          setState(() {
                            searchController.text;
                           batchFilterModelApi(status: "", serviceUid: "", searchText: searchController.text, newDataLength: newDataLength);



                           /* batchListViewViewModel.fetchBatchSearchListApi(
                                data, pageSize, pageNo);*/
                          });
                        },
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
          const SizedBox(
            height: 15,
          ),
          Container(
            child: RefreshIndicator(
                onRefresh: () {
                  return Future.delayed(
                    Duration(seconds: 1),
                    () {
                      setState(() {
                        print("api call");
                        refreshItems();
                      });
                      Fluttertoast.showToast(
                          msg: PageRfreshedText,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 2,
                          textColor: Colors.white,
                          fontSize: 18.0);
                    },
                  );
                },
                child: FutureBuilder<BatchFilterModel?>(
                    future: batchFilterModel,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return
                          searchController.text.isEmpty ?
                          ListView.builder(
                            padding:
                                EdgeInsets.symmetric(horizontal: w * 0.01),
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: items.length + 1,
                            itemBuilder: (context, index) {
                              // items = snapshot.data!.data.products;
                              // print("wishlist===${items[index].wishList1}");
                              return (index == items.length)
                                  ? items.isEmpty
                                      ? Center(
                                          child: Container(
                                              height: 20,
                                              width: 20,
                                              margin: EdgeInsets.only(
                                                  top: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.45),
                                              child: CircularProgressIndicator(
                                                  // color: Mycolors.GradientLeftColor,
                                                  )),
                                        )
                                      : totalDataCount! > items.length
                                          ? Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.brown),
                                              child: TextButton(
                                                child: Text(
                                                  "Load More",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18),
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    newDataLength += 1;
                                                    // newvarlength = newDataLength;
                                                    //   print("newvarlength$newvarlength");
                                                    //print("newDataLength print$newDataLength");
                                                    batchFilterModel =
                                                        batchFilterModelApi(
                                                            status: '',
                                                            serviceUid: '',
                                                            searchText: '',
                                                            newDataLength:
                                                                newDataLength);
                                                  });
                                                },
                                              ),
                                            )
                                          : SizedBox()
                                  : GestureDetector(
                                      onTap: () {},
                                      child: Card(
                                          key: ValueKey(items[index].id),
                                          elevation: 0,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 0),
                                          child: Column(
                                            children: [
                                              ListTile(
                                                tileColor: Color(0XFFDFE1E4)
                                                    .withOpacity(0.3),
                                                // isThreeLine: true,
                                                leading: Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                    color: Color(0XFFDFE1E4),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: CircleAvatar(
                                                      radius: 10,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      child: _selectedItems
                                                              .contains(index)
                                                          ? const Icon(
                                                              Icons.check,
                                                              color: Color
                                                                  .fromRGBO(
                                                                      71,
                                                                      192,
                                                                      136,
                                                                      1),
                                                              size: 30.0)
                                                          : Image(
                                                              image: NetworkImage(AppUrl
                                                                      .serviceIconEndPoint +
                                                                  items[index]
                                                                      .serviceIconname)),
                                                    ),
                                                  ),
                                                ),
                                                title: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        items[index]
                                                            .batchName,
                                                        style: const TextStyle(
                                                            color: Color
                                                                .fromRGBO(
                                                                    57,
                                                                    64,
                                                                    74,
                                                                    1),
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700,
                                                            fontFamily:
                                                                'Loto-Regular'),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets
                                                              .only(left: 8),
                                                      child: Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      20.0)),
                                                          color: Color(
                                                              0XFFDFE1E4),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  3.0),
                                                          child: Text(
                                                            items[index]
                                                                .totalTrainee
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 12),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                trailing: Container(
                                                  height: 20,
                                                  width: 60,
                                                  decoration: BoxDecoration(
                                                      color: items[index]
                                                                  .status ==
                                                              "Active"
                                                          ? Colors.green
                                                          : items[index]
                                                                      .status ==
                                                                  "New"
                                                              ? Colors.blue
                                                              : Colors.red,
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(10)),
                                                  child: Center(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets
                                                              .all(2.0),
                                                      child: Text(
                                                        items[index]
                                                            .status
                                                            .toString(),
                                                        maxLines: 2,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            const TextStyle(
                                                                fontSize: 10,
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                subtitle: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                  children: [
                                                    Text(
                                                      '${items[index].programName} - ${items[index].batchDaysShort.join(",").characters} - ${items[index].batchTimingFrom} to ${items[index].batchTimingTo}',
                                                      style: const TextStyle(
                                                          // color: Color.fromRGBO(57, 64, 74, 1),
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily:
                                                              'Loto-Regular'),
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Text(
                                                            "Coach Name : ",
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xff39404A),
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                        Text(
                                                          items[index]
                                                              .coachName,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ViewBatchDetails(
                                                                ListIndex:
                                                                    index,
                                                                batchUid: items[
                                                                        index]
                                                                    .uid
                                                                    .toString(),
                                                                totalTrainee: items[
                                                                        index]
                                                                    .totalTrainee
                                                                    .toString(),
                                                                pathPage: widget
                                                                    .pathPage,
                                                              )));
                                                },
                                                onLongPress: () {
                                                  if (!_selectedItems
                                                      .contains(index)) {
                                                    setState(() {
                                                      _selectedItems
                                                          .add(index);
                                                    });
                                                  } else {
                                                    setState(() {
                                                      _selectedItems
                                                          .removeWhere(
                                                              (val) =>
                                                                  val ==
                                                                  index);
                                                    });
                                                  }
                                                },
                                              ),
                                              const Divider(
                                                height: 5,
                                                thickness: 1,
                                              ),
                                            ],
                                          )));
                            })
                              :ListView.builder(
                              padding:
                              EdgeInsets.symmetric(horizontal: w * 0.01),
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: items.length + 1,
                              itemBuilder: (context, index) {
                                // items = snapshot.data!.data.products;
                                // print("wishlist===${items[index].wishList1}");
                                return (index == items.length)
                                    ? items.isEmpty
                                    ? Center(
                                  child: Container(
                                      height: 20,
                                      width: 20,
                                      margin: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.45),
                                      child: CircularProgressIndicator(
                                        // color: Mycolors.GradientLeftColor,
                                      )),
                                )
                                    : totalDataCount! > items.length
                                    ? Container(
                                  decoration: BoxDecoration(
                                      color: Colors.brown),
                                  child: TextButton(
                                    child: Text(
                                      "Load More",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        newDataLength += 1;
                                        // newvarlength = newDataLength;
                                        //   print("newvarlength$newvarlength");
                                        //print("newDataLength print$newDataLength");
                                        batchFilterModel =
                                            batchFilterModelApi(
                                                status: '',
                                                serviceUid: '',
                                                searchText: '',
                                                newDataLength:
                                                newDataLength);
                                      });
                                    },
                                  ),
                                )
                                    : SizedBox()
                                    : GestureDetector(
                                    onTap: () {},
                                    child: Card(
                                        key: ValueKey(items[index].id),
                                        elevation: 0,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 0),
                                        child: Column(
                                          children: [
                                            ListTile(
                                              tileColor: Color(0XFFDFE1E4)
                                                  .withOpacity(0.3),
                                              // isThreeLine: true,
                                              leading: Container(
                                                decoration:
                                                const BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.all(
                                                      Radius.circular(
                                                          20)),
                                                  color: Color(0XFFDFE1E4),
                                                ),
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.all(
                                                      8.0),
                                                  child: CircleAvatar(
                                                    radius: 10,
                                                    backgroundColor:
                                                    Colors.transparent,
                                                    child: _selectedItems
                                                        .contains(index)
                                                        ? const Icon(
                                                        Icons.check,
                                                        color: Color
                                                            .fromRGBO(
                                                            71,
                                                            192,
                                                            136,
                                                            1),
                                                        size: 30.0)
                                                        : Image(
                                                        image: NetworkImage(AppUrl
                                                            .serviceIconEndPoint +
                                                            items[index]
                                                                .serviceIconname)),
                                                  ),
                                                ),
                                              ),
                                              title: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      items[index]
                                                          .batchName,
                                                      style: const TextStyle(
                                                          color: Color
                                                              .fromRGBO(
                                                              57,
                                                              64,
                                                              74,
                                                              1),
                                                          fontSize: 15,
                                                          fontWeight:
                                                          FontWeight
                                                              .w700,
                                                          fontFamily:
                                                          'Loto-Regular'),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .only(left: 8),
                                                    child: Container(
                                                      decoration:
                                                      const BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20.0)),
                                                        color: Color(
                                                            0XFFDFE1E4),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                        EdgeInsets.all(
                                                            3.0),
                                                        child: Text(
                                                          items[index]
                                                              .totalTrainee
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 12),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              trailing: Container(
                                                height: 20,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                    color: items[index]
                                                        .status ==
                                                        "Active"
                                                        ? Colors.green
                                                        : items[index]
                                                        .status ==
                                                        "New"
                                                        ? Colors.blue
                                                        : Colors.red,
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(10)),
                                                child: Center(
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(2.0),
                                                    child: Text(
                                                      items[index]
                                                          .status
                                                          .toString(),
                                                      maxLines: 2,
                                                      textAlign:
                                                      TextAlign.center,
                                                      style:
                                                      const TextStyle(
                                                          fontSize: 10,
                                                          color: Colors
                                                              .white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              subtitle: Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Text(
                                                    '${items[index].programName} - ${items[index].batchDaysShort.join(",").characters} - ${items[index].batchTimingFrom} to ${items[index].batchTimingTo}',
                                                    style: const TextStyle(
                                                      // color: Color.fromRGBO(57, 64, 74, 1),
                                                        fontSize: 13,
                                                        fontWeight:
                                                        FontWeight.w400,
                                                        fontFamily:
                                                        'Loto-Regular'),
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Text(
                                                          "Coach Name : ",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff39404A),
                                                              fontSize: 13,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w500)),
                                                      Text(
                                                        items[index]
                                                            .coachName,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ViewBatchDetails(
                                                              ListIndex:
                                                              index,
                                                              batchUid: items[
                                                              index]
                                                                  .uid
                                                                  .toString(),
                                                              totalTrainee: items[
                                                              index]
                                                                  .totalTrainee
                                                                  .toString(),
                                                              pathPage: widget
                                                                  .pathPage,
                                                            )));
                                              },
                                              onLongPress: () {
                                                if (!_selectedItems
                                                    .contains(index)) {
                                                  setState(() {
                                                    _selectedItems
                                                        .add(index);
                                                  });
                                                } else {
                                                  setState(() {
                                                    _selectedItems
                                                        .removeWhere(
                                                            (val) =>
                                                        val ==
                                                            index);
                                                  });
                                                }
                                              },
                                            ),
                                            const Divider(
                                              height: 5,
                                              thickness: 1,
                                            ),
                                          ],
                                        )));
                              });
                      } else if (snapshot.hasError) {
                        return Center(
                          child: NoData(),
                        );
                        //Text('${snapshot.error}');
                      }
                      return Center(
                        child: Container(
                            height: 30,
                            width: 30,
                            child: const CircularProgressIndicator()),
                      );
                    })),
          ),
          const SizedBox(
            height: 15,
          ),
          widget.pathPage == "onBoarding"
              ? RoundButton(
                  loading: false,
                  title: AppLocale.conts.getString(context),
                  textColor: Colors.white,
                  rounded: true,
                  color: Theme.of(context).primaryColor,
                  onPress: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             Layout(selectedIndex: 0)));
                    Get.to(() => const Layout(selectedIndex: 0),
                        transition: Transition.rightToLeft);
                  })
              : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
