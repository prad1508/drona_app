import 'dart:convert';

import 'package:drona/res/language/language.dart';
import 'package:drona/view/dashboard/layout.dart';
import 'package:drona/view/session_listing/view_detailsclosed.dart';
import 'package:drona/view/session_listing/view_session_details.dart';
import 'package:drona/view_model/session_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/response/status.dart';
import '../../model/sessionList_model.dart';
import '../../res/app_url.dart';
import '../../res/widget/round_button.dart';
import '../../utils/no_data.dart';
import 'create_session_details.dart';
import 'session_detailcancel.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class SessionList extends StatefulWidget {
  const SessionList({super.key});

  @override
  State<SessionList> createState() => _SessionListState();
}

class _SessionListState extends State<SessionList>
    with SingleTickerProviderStateMixin {
  SessionViewViewModel sessionViewModel = SessionViewViewModel();
  Map<String, dynamic> data = {
    "pagefilter": "",
    "search": "",
    "from_date": "",
    "to_date": ""
  };
  final FlutterLocalization _localization = FlutterLocalization.instance;
  final List<int> _selectedItems = <int>[];
  late TabController _controller;
  int _selectedIndex = 0;

  TextEditingController searchController = TextEditingController();
  TextEditingController fromDataController = TextEditingController();
  TextEditingController toDateController = TextEditingController();

  int pageSize = 20;
  int pageNo = 1;
  bool isLoading = false;
  bool isNextPage = false;
  int totalDataCount = 0;
  int scheduledCount = 0;
  int closeDataCount = 0;
  int cancelDataCount = 0;

  List<DataSessionList> foundData = [];
  List<DataSessionList> infoData = [];

  final ScrollController _scrollController = ScrollController();

  SessionListListModel? sessionListListModel;

  void sessionListApi(
      pagefilter, search, fromDate, toDate, pageSize, pageNo) async {
    print("from_date==$fromDate");
    print("to_date==$toDate");

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
        'PUT', Uri.parse('${AppUrl.sessionListEndPoint}/$pageSize/$pageNo'));
    request.body = json.encode({
      "pagefilter": pagefilter ?? "",
      "search": search ?? "",
      "from_date": fromDate.toString() ?? "",
      "to_date": toDate.toString() ?? ""
    });
    request.headers.addAll(headers);
    print("repest==${request.body}");

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      var jsonData = await response.stream.bytesToString();
      sessionListListModel =
          SessionListListModel.fromJson(jsonDecode(jsonData));
      setState(() {
        isLoading = false;
      });
      var infolist = sessionListListModel!.data!;
      print("api call success==$infolist");
      setState(() {
        infoData.addAll(infolist);
        isNextPage = sessionListListModel!.next_page_available!;

        totalDataCount = sessionListListModel!.total_data_count!;
        closeDataCount = sessionListListModel!.close!;
        cancelDataCount = sessionListListModel!.cancel!;
        scheduledCount = sessionListListModel!.scheduled!;
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
    /*  sessionViewModel.fetchSessionListSearchApi(data, pageSize, pageNo);
    _scrollController.addListener(_scrollListener);*/
    sessionListApi("", "", "", "", pageSize, pageNo);
    foundData = infoData;

    print("build in it ");
    _controller = TabController(length: 4, vsync: this);
    _controller.addListener(() {
      _selectedIndex = _controller.index;
      //});
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    toDateController.dispose();
    fromDataController.dispose();
    searchController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      pageNo++;
      sessionViewModel.fetchSessionListSearchApi(data, pageSize, pageNo);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Get.to(
                () => const Layout(selectedIndex: 0),
              ),
            ),
            Text(
              _selectedItems.isEmpty ? '' : _selectedItems.length.toString(),
              style: const TextStyle(color: Colors.black),
            )
          ],
        ),
        title: Text(
          AppLocale.sessionListing.getString(context),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: (() {
              /*Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const SessionalDetails(),
                  ),
                );*/
              Get.to(() => const SessionalDetails(),
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
        child: Container(
          height: h,
          // color: Colors.red,
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
                width: width * 1,
                child: TextField(
                  style: const TextStyle(color: Colors.black),
                  onChanged: (value) {
                    List<DataSessionList> result = [];
                    if (value.isEmpty) {
                      result = infoData;
                    } else {
                      result = infoData
                          .where((data) => data.batch_name
                              .toString()
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                          .toList();
                    }
                    setState(() {
                      foundData = result;
                    });
                    // print(foundData);
                  },
                  decoration: InputDecoration(
                      hintText: AppLocale.search.getString(context),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      suffixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 60,
                    width: width * 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.35,
                          child: TextFormField(
                            readOnly: true,
                            controller: fromDataController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              suffixIcon: const Icon(
                                Icons.calendar_month,
                                size: 30.0,
                              ),
                              hintText: "${AppLocale.eg.getString(context)}. 2023-01-01",
                              contentPadding: const EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                            onTap: () async {
                              DateTime now = DateTime.now();
                              DateTime firstDate =
                                  DateTime(now.year, now.month);
                              var date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: firstDate,
                                lastDate:
                                    DateTime.now().add(Duration(days: 90)),
                              );
                              if (date != null) {
                                fromDataController.text =
                                    DateFormat('yyyy-MM-dd').format(date);
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          width: width * 0.35,
                          child: TextFormField(
                            readOnly: true,
                            controller: toDateController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              suffixIcon: const Icon(
                                Icons.calendar_month,
                                size: 30.0,
                              ),
                              hintText: "${AppLocale.eg.getString(context)}. 2023-01-01",
                              contentPadding: const EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                            onTap: () async {
                              DateTime now = DateTime.now();
                              DateTime firstDate =
                                  DateTime(now.year, now.month);
                              var date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: firstDate,
                                lastDate:
                                    DateTime.now().add(Duration(days: 90)),
                              );
                              if (date != null) {
                                toDateController.text =
                                    DateFormat('yyyy-MM-dd').format(date);
                              }
                            },
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              print(fromDataController.text);
                              print(toDateController.text);
                              setState(() {
                                sessionListApi("", "", fromDataController.text,
                                    toDateController.text, 500, pageNo);
                                foundData = infoData;
                              });
                            },
                            child:  Text(AppLocale.filters.getString(context),),),
                      ],
                    ),
                  ),
                ],
              ),
              DefaultTabController(
                length: 4,
                initialIndex: 0,
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TabBar(
                      controller: _controller,
                      indicatorPadding: EdgeInsets.zero,
                      //dividerColor: Colors.transparent,
                      indicatorColor: Colors.cyan,
                      unselectedLabelColor: Colors.redAccent,
                      indicatorSize: TabBarIndicatorSize.tab,
                      // indicator: BoxDecoration(
                      //     //borderRadius: BorderRadius.circular(20),
                      //     color: Colors.grey),

                      //labelColor: Colors.greenAccent,
                      // unselectedLabelColor: Colors.black,
                      isScrollable: true,
                      labelPadding: EdgeInsets.zero,
                      tabs: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10, left: 10),
                          child: Chip(
                            backgroundColor: _controller.index != 0
                                ? const Color.fromARGB(255, 242, 242, 242)
                                : Colors.grey.shade100,
                            label:  Text(
                              AppLocale.all.getString(context),
                              style: TextStyle(color: Colors.blue),
                            ),
                            avatar: CircleAvatar(
                              backgroundColor: _controller.index != 0
                                  ? Colors.blue.shade100
                                  : const Color.fromARGB(255, 242, 242, 242),
                              child: Text('$totalDataCount'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Chip(
                            backgroundColor: _controller.index != 1
                                ? const Color.fromARGB(255, 242, 242, 242)
                                : Colors.green.shade100,
                            label:  Text(
                              AppLocale.scheduled.getString(context),
                            ),
                            avatar: CircleAvatar(
                              backgroundColor: _controller.index != 1
                                  ? Colors.green.shade100
                                  : const Color.fromARGB(255, 242, 242, 242),
                              child: Text("$scheduledCount"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Chip(
                            backgroundColor: _controller.index != 2
                                ? const Color.fromARGB(255, 242, 242, 242)
                                : Colors.brown.shade100,
                            label:  Text(
                              AppLocale.canceled.getString(context),
                            ),
                            avatar: CircleAvatar(
                              backgroundColor: _controller.index != 2
                                  ? Colors.brown.shade100
                                  : const Color.fromARGB(255, 242, 242, 242),
                              child: Text("$cancelDataCount"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Chip(
                            backgroundColor: _controller.index != 3
                                ? const Color.fromARGB(255, 242, 242, 242)
                                : Colors.redAccent.shade100,
                            label:  Text(
                              AppLocale.closed.getString(context),
                            ),
                            avatar: CircleAvatar(
                              backgroundColor: _controller.index != 3
                                  ? Colors.redAccent.shade100
                                  : const Color.fromARGB(255, 242, 242, 242),
                              child: Text("$closeDataCount"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: h * .6,
                      decoration: const BoxDecoration(
                          //color: Colors.green
                          ),
                      child: TabBarView(
                        controller: _controller,
                        children: <Widget>[
                          isLoading
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
                          isLoading
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
                              : buildListView1(),
                          isLoading
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
                              : buildListView2(),
                          isLoading
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
                              : buildListView3(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListView buildListView() {
    return ListView.builder(
        itemCount: foundData.length + 1,
        itemBuilder: (context, index) {
          return (index == foundData.length)
              ? foundData.isEmpty
                  ? Center(
                      child: Container(
                          height: 20,
                          width: 20,
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.45),
                          child: const CircularProgressIndicator(
                              // color: Mycolors.GradientLeftColor,
                              )),
                    )
                  : isNextPage
                      ? Container(
                          decoration: const BoxDecoration(color: Colors.blue),
                          child: TextButton(
                            child:  Text(
                              AppLocale.loadMore.getString(context),

                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            onPressed: () {
                              setState(() {
                                pageNo += 1;
                                sessionListApi(
                                    "", "", "", "", pageSize, pageNo);
                              });
                            },
                          ),
                        )
                      : const SizedBox()
              : Card(
                  // key: ValueKey(_foundUsers[index]["id"]),
                  elevation: 0,
                  margin: const EdgeInsets.symmetric(vertical: 0),
                  child: Column(
                    children: [
                      ListTile(
                        tileColor: Colors.transparent,
                        title: Row(
                          children: [
                            Text(
                              '${foundData[index].batch_name}',
                              style: const TextStyle(
                                  color: Color.fromRGBO(57, 64, 74, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Loto-Regular'),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Chip(
                                backgroundColor:
                                    foundData[index].status == 'scheduled'
                                        ? Colors.green.withOpacity(.2)
                                        : foundData[index].status == 'cancelled'
                                            ? Colors.red.withOpacity(.2)
                                            : Colors.brown.withOpacity(.2),
                                label: Text(
                                  '${foundData[index].status}',
                                  style: TextStyle(
                                      color:
                                          foundData[index].status == 'scheduled'
                                              ? Colors.green
                                              : foundData[index].status ==
                                                      'cancelled'
                                                  ? Colors.red
                                                  : Colors.brown),
                                )),
                          ],
                        ),
                        subtitle: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: '${foundData[index].program_name} ',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              const TextSpan(
                                  text: " - ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              TextSpan(
                                text:
                                    '${foundData[index].syy}-${foundData[index].smm}-${foundData[index].sdd}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              const TextSpan(
                                  text: " - ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              TextSpan(
                                  text:
                                      '  ${foundData[index].batch_timing_from} to ${foundData[index].batch_timing_to}',
                                  style: const TextStyle(color: Colors.black)),
                            ],
                          ),
                        ),
                        trailing: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 14,
                          child: Image(
                              image: NetworkImage(
                                  "${AppUrl.serviceIconEndPoint}${foundData[index].service_iconname}")),
                        ),
                        onTap: () {
                          print(foundData[index].status);
                          if (foundData[index].status == 'scheduled') {
                            Get.to(
                                () => ViewSessionalDetails(
                                      id: "${foundData[index].uid}",
                                      serviceIcon:
                                          foundData[index].service_iconname,
                                    ),
                                transition: Transition.leftToRight);
                          } else if (foundData[index].status == 'closed') {
                            Get.to(
                                () => ViewDetailClosed(
                                    id: "${foundData[index].uid}"),
                                transition: Transition.leftToRight);
                          } else if (foundData[index].status == 'cancelled') {
                            Get.to(
                                () => SessionDetailCancel(
                                    uid: foundData[index].uid.toString()),
                                transition: Transition.leftToRight);
                          }
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Divider(
                        height: 5,
                        thickness: 1,
                      ),
                    ],
                  ),
                );
        });
  }
  ListView buildListView1() {
    return ListView.builder(
        itemCount: foundData.length + 1,
        itemBuilder: (context, index) {
          return (index == foundData.length)
              ? foundData.isEmpty
              ? Center(
            child: Container(
                height: 20,
                width: 20,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.45),
                child: const CircularProgressIndicator(
                  // color: Mycolors.GradientLeftColor,
                )),
          )
              : isNextPage
              ? Container(
            decoration: const BoxDecoration(color: Colors.blue),
            child: TextButton(
              child:  Text(
                AppLocale.loadMore.getString(context),
                style:
                TextStyle(color: Colors.white, fontSize: 18),
              ),
              onPressed: () {
                setState(() {
                  pageNo += 1;
                  sessionListApi(
                      "", "", "", "", pageSize, pageNo);
                });
              },
            ),
          )
              : const SizedBox()
              :
              foundData[index].status == "scheduled" ?
          Card(
            // key: ValueKey(_foundUsers[index]["id"]),
            elevation: 0,
            margin: const EdgeInsets.symmetric(vertical: 0),
            child: Column(
              children: [
                ListTile(
                  tileColor: Colors.transparent,
                  title: Row(
                    children: [
                      Text(
                        '${foundData[index].batch_name}',
                        style: const TextStyle(
                            color: Color.fromRGBO(57, 64, 74, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Loto-Regular'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Chip(
                          backgroundColor:
                          foundData[index].status == 'scheduled'
                              ? Colors.green.withOpacity(.2)
                              : foundData[index].status == 'cancelled'
                              ? Colors.red.withOpacity(.2)
                              : Colors.brown.withOpacity(.2),
                          label: Text(
                            '${foundData[index].status}',
                            style: TextStyle(
                                color:
                                foundData[index].status == 'scheduled'
                                    ? Colors.green
                                    : foundData[index].status ==
                                    'cancelled'
                                    ? Colors.red
                                    : Colors.brown),
                          )),
                    ],
                  ),
                  subtitle: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: '${foundData[index].program_name} ',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        const TextSpan(
                            text: " - ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        TextSpan(
                          text:
                          '${foundData[index].syy}-${foundData[index].smm}-${foundData[index].sdd}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const TextSpan(
                            text: " - ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        TextSpan(
                            text:
                            '  ${foundData[index].batch_timing_from} to ${foundData[index].batch_timing_to}',
                            style: const TextStyle(color: Colors.black)),
                      ],
                    ),
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 14,
                    child: Image(
                        image: NetworkImage(
                            "${AppUrl.serviceIconEndPoint}${foundData[index].service_iconname}")),
                  ),
                  onTap: () {
                    print(foundData[index].status);
                    if (foundData[index].status == 'scheduled') {
                      Get.to(
                              () => ViewSessionalDetails(
                            id: "${foundData[index].uid}",
                            serviceIcon:
                            foundData[index].service_iconname,
                          ),
                          transition: Transition.leftToRight);
                    } else if (foundData[index].status == 'closed') {
                      Get.to(
                              () => ViewDetailClosed(
                              id: "${foundData[index].uid}"),
                          transition: Transition.leftToRight);
                    } else if (foundData[index].status == 'cancelled') {
                      Get.to(
                              () => SessionDetailCancel(
                              uid: foundData[index].uid.toString()),
                          transition: Transition.leftToRight);
                    }
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  height: 5,
                  thickness: 1,
                ),
              ],
            ),
          )
          : SizedBox()
          ;
        });
  }
  ListView buildListView2() {
    return ListView.builder(
        itemCount: foundData.length + 1,
        itemBuilder: (context, index) {
          return (index == foundData.length)
              ? foundData.isEmpty
              ? Center(
            child: Container(
                height: 20,
                width: 20,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.45),
                child: const CircularProgressIndicator(
                  // color: Mycolors.GradientLeftColor,
                )),
          )
              : isNextPage
              ? Container(
            decoration: const BoxDecoration(color: Colors.blue),
            child: TextButton(
              child:  Text(
                AppLocale.loadMore.getString(context),

                style:
                TextStyle(color: Colors.white, fontSize: 18),
              ),
              onPressed: () {
                setState(() {
                  pageNo += 1;
                  sessionListApi(
                      "", "", "", "", pageSize, pageNo);
                });
              },
            ),
          )
              : const SizedBox()
              :
          foundData[index].status == "cancelled" ?

          Card(
            // key: ValueKey(_foundUsers[index]["id"]),
            elevation: 0,
            margin: const EdgeInsets.symmetric(vertical: 0),
            child: Column(
              children: [
                ListTile(
                  tileColor: Colors.transparent,
                  title: Row(
                    children: [
                      Text(
                        '${foundData[index].batch_name}',
                        style: const TextStyle(
                            color: Color.fromRGBO(57, 64, 74, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Loto-Regular'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Chip(
                          backgroundColor:
                          foundData[index].status == 'scheduled'
                              ? Colors.green.withOpacity(.2)
                              : foundData[index].status == 'cancelled'
                              ? Colors.red.withOpacity(.2)
                              : Colors.brown.withOpacity(.2),
                          label: Text(
                            '${foundData[index].status}',
                            style: TextStyle(
                                color:
                                foundData[index].status == 'scheduled'
                                    ? Colors.green
                                    : foundData[index].status ==
                                    'cancelled'
                                    ? Colors.red
                                    : Colors.brown),
                          )),
                    ],
                  ),
                  subtitle: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: '${foundData[index].program_name} ',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        const TextSpan(
                            text: " - ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        TextSpan(
                          text:
                          '${foundData[index].syy}-${foundData[index].smm}-${foundData[index].sdd}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const TextSpan(
                            text: " - ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        TextSpan(
                            text:
                            '  ${foundData[index].batch_timing_from} to ${foundData[index].batch_timing_to}',
                            style: const TextStyle(color: Colors.black)),
                      ],
                    ),
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 14,
                    child: Image(
                        image: NetworkImage(
                            "${AppUrl.serviceIconEndPoint}${foundData[index].service_iconname}")),
                  ),
                  onTap: () {
                    print(foundData[index].status);
                    if (foundData[index].status == 'scheduled') {
                      Get.to(
                              () => ViewSessionalDetails(
                            id: "${foundData[index].uid}",
                            serviceIcon:
                            foundData[index].service_iconname,
                          ),
                          transition: Transition.leftToRight);
                    } else if (foundData[index].status == 'closed') {
                      Get.to(
                              () => ViewDetailClosed(
                              id: "${foundData[index].uid}"),
                          transition: Transition.leftToRight);
                    } else if (foundData[index].status == 'cancelled') {
                      Get.to(
                              () => SessionDetailCancel(
                              uid: foundData[index].uid.toString()),
                          transition: Transition.leftToRight);
                    }
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  height: 5,
                  thickness: 1,
                ),
              ],
            ),
          )
          : SizedBox()
          ;
        });
  }
  ListView buildListView3() {
    return ListView.builder(
        itemCount: foundData.length + 1,
        itemBuilder: (context, index) {
          return (index == foundData.length)
              ? foundData.isEmpty
              ? Center(
            child: Container(
                height: 20,
                width: 20,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.45),
                child: const CircularProgressIndicator(
                  // color: Mycolors.GradientLeftColor,
                )),
          )
              : isNextPage
              ? Container(
            decoration: const BoxDecoration(color: Colors.blue),
            child: TextButton(
              child:  Text(
                AppLocale.loadMore.getString(context),
                style:
                TextStyle(color: Colors.white, fontSize: 18),
              ),
              onPressed: () {
                setState(() {
                  pageNo += 1;
                  sessionListApi(
                      "", "", "", "", pageSize, pageNo);
                });
              },
            ),
          )
              : const SizedBox()
              :
          foundData[index].status == "closed" ?

          Card(
            // key: ValueKey(_foundUsers[index]["id"]),
            elevation: 0,
            margin: const EdgeInsets.symmetric(vertical: 0),
            child: Column(
              children: [
                ListTile(
                  tileColor: Colors.transparent,
                  title: Row(
                    children: [
                      Text(
                        '${foundData[index].batch_name}',
                        style: const TextStyle(
                            color: Color.fromRGBO(57, 64, 74, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Loto-Regular'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Chip(
                          backgroundColor:
                          foundData[index].status == 'scheduled'
                              ? Colors.green.withOpacity(.2)
                              : foundData[index].status == 'cancelled'
                              ? Colors.red.withOpacity(.2)
                              : Colors.brown.withOpacity(.2),
                          label: Text(
                            '${foundData[index].status}',
                            style: TextStyle(
                                color:
                                foundData[index].status == 'scheduled'
                                    ? Colors.green
                                    : foundData[index].status ==
                                    'cancelled'
                                    ? Colors.red
                                    : Colors.brown),
                          )),
                    ],
                  ),
                  subtitle: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: '${foundData[index].program_name} ',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        const TextSpan(
                            text: " - ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        TextSpan(
                          text:
                          '${foundData[index].syy}-${foundData[index].smm}-${foundData[index].sdd}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const TextSpan(
                            text: " - ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        TextSpan(
                            text:
                            '  ${foundData[index].batch_timing_from} to ${foundData[index].batch_timing_to}',
                            style: const TextStyle(color: Colors.black)),
                      ],
                    ),
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 14,
                    child: Image(
                        image: NetworkImage(
                            "${AppUrl.serviceIconEndPoint}${foundData[index].service_iconname}")),
                  ),
                  onTap: () {
                    print(foundData[index].status);
                    if (foundData[index].status == 'scheduled') {
                      Get.to(
                              () => ViewSessionalDetails(
                            id: "${foundData[index].uid}",
                            serviceIcon:
                            foundData[index].service_iconname,
                          ),
                          transition: Transition.leftToRight);
                    } else if (foundData[index].status == 'closed') {
                      Get.to(
                              () => ViewDetailClosed(
                              id: "${foundData[index].uid}"),
                          transition: Transition.leftToRight);
                    } else if (foundData[index].status == 'cancelled') {
                      Get.to(
                              () => SessionDetailCancel(
                              uid: foundData[index].uid.toString()),
                          transition: Transition.leftToRight);
                    }
                  },
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  height: 5,
                  thickness: 1,
                ),
              ],
            ),
          )
          : SizedBox()
          ;
        });
  }


}
