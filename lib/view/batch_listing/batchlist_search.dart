import 'dart:convert';
import 'dart:io';

import 'package:drona/utils/utils.dart';
import 'package:drona/view/dashboard/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/batch_Filter_model.dart';
import '../../res/app_url.dart';
import '../../res/language/language.dart';
import '../../res/widget/round_button.dart';

import 'batch_filter.dart';
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
  int pageSize = 20;
  int pageNo = 1;

  BatchFilterModel? batchFilterModel;

  List<Datum> foundData = [];
  List<Datum> infoData = [];
  bool isNextPage = false;
  int? totalDataCount;
  var newDataLength = 1;
  bool isLoading = false;

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
        Uri.parse("${AppUrl.batchListListEndPoint}/$pageSize/$newDataLength"));
    request.body = json
        .encode({"filter_status": "", "filter_service_uid": "", "search": ""});
    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var jsonData = await response.stream.bytesToString();
        batchFilterModel = BatchFilterModel.fromJson(jsonDecode(jsonData));
        setState(() {
          isLoading = false;
        });
        var infolist = batchFilterModel!.data;
        print("api call success");
        setState(() {
          infoData.addAll(infolist);
          isNextPage = batchFilterModel!.nextPageAvailable;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        print(response.reasonPhrase);
      }
    } on SocketException catch (e) {
      setState(() {
        isLoading = false;
      });
      print(
        "Exceptioin:---${e}",
      );
      return null;
    }
  }

  runFilter(String enteredKey) {
    List<Datum> result = [];
    if (enteredKey.isEmpty) {
      result = infoData;
    } else {
      result = infoData
          .where((data) => data.batchName
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

  runFilter1(String enteredKey, String myStatus) {
    // print("key==.$enteredKey");
    List<Datum> result = [];
    if (enteredKey.isEmpty && myStatus.isEmpty) {
      result = infoData;
    } else {
      result = infoData
          .where((data) => data.serviceName
              .toString()
              .toLowerCase()
              .contains(enteredKey.toLowerCase()))
          .where((element) => element.status.toString().contains(myStatus))
          .toList();
    }
    setState(() {
      foundData = result;
    });
    // print("key==.");
  }

  @override
  initState() {
    super.initState();
    getData(newDataLength: newDataLength);
    foundData = infoData;
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    //DashBoardViewViewModel dashBoardViewViewModel = DashBoardViewViewModel();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: Row(
          children: [
            IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  widget.pathPage == "dashBoard"
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const Layout(selectedIndex: 0),
                          ),
                        )
                      : Navigator.of(context).pop();
                }),
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
            const SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SizedBox(
                  height: h * 0.65,
                  width: w,
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
                      : buildListView(w)),
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
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  buildListView(double w) {
    return foundData.isEmpty
        ? const Center(child: Text("No Data"))
        : ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: w * 0.01),
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: foundData.length + 1,
            itemBuilder: (context, index) {
              // items = snapshot.data!.data.products;
              // print("wishlist===${items[index].wishList1}");
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
                                child: const Text(
                                  "Load More",
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
                  : GestureDetector(
                      onTap: () {},
                      child: Card(
                          elevation: 0,
                          margin: const EdgeInsets.symmetric(vertical: 0),
                          child: Column(
                            children: [
                              ListTile(
                                tileColor: Color(0XFFDFE1E4).withOpacity(0.3),
                                // isThreeLine: true,
                                leading: Container(
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Color(0XFFDFE1E4),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: 10,
                                      backgroundColor: Colors.transparent,
                                      child: Image(
                                          image: NetworkImage(
                                              AppUrl.serviceIconEndPoint +
                                                  foundData[index]
                                                      .serviceIconname)),
                                    ),
                                  ),
                                ),
                                title: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        foundData[index].batchName,
                                        style: const TextStyle(
                                            color:
                                                Color.fromRGBO(57, 64, 74, 1),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Loto-Regular'),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0)),
                                          color: Color(0XFFDFE1E4),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(3.0),
                                          child: Text(
                                            foundData[index]
                                                .totalTrainee
                                                .toString(),
                                            style: TextStyle(fontSize: 12),
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
                                      color: foundData[index].status == "Active"
                                          ? Colors.green
                                          : foundData[index].status == "New"
                                              ? Colors.blue
                                              : Colors.red,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        foundData[index].status.toString(),
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 10, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${foundData[index].programName} - ${foundData[index].batchDaysShort.join(",").characters} - ${foundData[index].batchTimingFrom} to ${foundData[index].batchTimingTo}',
                                      style: const TextStyle(
                                          // color: Color.fromRGBO(57, 64, 74, 1),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Loto-Regular'),
                                    ),
                                    Row(
                                      children: [
                                        const Text("Coach Name : ",
                                            style: TextStyle(
                                                color: Color(0xff39404A),
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500)),
                                        Text(
                                          foundData[index].coachName,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ViewBatchDetails(
                                            ListIndex: index,
                                            batchUid:
                                                foundData[index].uid.toString(),
                                            totalTrainee: foundData[index]
                                                .totalTrainee
                                                .toString(),
                                            pathPage: widget.pathPage,
                                          )));
                                },
                              ),
                              const Divider(
                                height: 5,
                                thickness: 1,
                              ),
                            ],
                          )));
            });
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
            builder: (context) => BatchFilterPage(
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
