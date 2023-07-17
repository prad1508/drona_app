import 'package:drona/view/dashboard/layout.dart';
import 'package:drona/view/session_listing/view_detailsclosed.dart';
import 'package:drona/view/session_listing/view_session_details.dart';
import 'package:drona/view_model/session_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import '../../data/response/status.dart';
import '../../res/app_url.dart';
import '../../res/widget/round_button.dart';
import '../../utils/no_data.dart';
import 'create_session_details.dart';
import 'session_detailcancel.dart';
import 'package:intl/intl.dart';

class SessionList extends StatefulWidget {
  const SessionList({super.key});

  @override
  State<SessionList> createState() => _SessionListState();
}

int data1 = 0;

class _SessionListState extends State<SessionList>
    with SingleTickerProviderStateMixin {
  SessionViewViewModel sessionViewModel = SessionViewViewModel();
  //multi language support
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
/*
  final List<Map<String, dynamic>> _allUsers = [
    {
      "id": 1,
      "name": "Cricket Batch",
      "categorgyImg": "assets/images/tennis.png",
      "level": "Advance",
      "detail": "M,W,F - 09:15am to 10:15am",
      "status": "Scheduled",
      "color": Colors.green
    },
    {
      "id": 2,
      "name": "Tenis Batch  controller: _controller,",
      "categorgyImg": "assets/images/tennis.png",
      "level": "Advance",
      "detail": "M,W,F - 09:15am to 10:15am",
      "status": "Closed",
      "color": Colors.red
    },
    {
      "id": 3,
      "name": "Karata Batch",
      "categorgyImg": "assets/images/Golf.png",
      "level": "Advance",
      "detail": "M,W,F - 09:15am to 10:15am",
      "status": "Cancel",
      "color": Colors.brown
    }
  ];
  List<Map<String, dynamic>> _foundUsers = [];*/

  int pageSize = 10;
  int pageNo = 1;

  final ScrollController _scrollController = ScrollController();

  @override
  initState() {
    super.initState();
    sessionViewModel.fetchSessionListSearchApi(data, pageSize, pageNo);
    _scrollController.addListener(_scrollListener);

    print("build in it ");
    _controller = TabController(length: 4, vsync: this);
    _controller.addListener(() {
      //setState(() {
      _selectedIndex = _controller.index;
      //});
    });
    // _foundUsers = _allUsers;
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
      sessionViewModel.fetchSessionListSearchApi(data, pageSize, ++pageNo);
    }
  }

/*
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
*/

  @override
  Widget build(BuildContext context) {
    // sessionViewModel.fetchSessionListSearchApi(data);
    print("build in ");
    // sessionViewModel.fetchSessionListSearchApi(data);
    double width = MediaQuery.of(context).size.width;
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
            'Session Listing',
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
                    transition: Transition.leftToRight);
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
            padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                  width: width * 1,
                  child: TextFormField(
                    controller: searchController,
                    onChanged: (val) {
                      setState(() {
                        searchController.text;
                        Map<String, dynamic> data = {
                          "pagefilter": "",
                          "search": searchController.text,
                          "from_date": "",
                          "to_date": ""
                        };
                        sessionViewModel.fetchSessionListSearchApi(
                            data, pageSize, pageNo);
                      });
                    },
                    //onChanged: (value) => dataFilter(value),
                    decoration: InputDecoration(
                      hintText: 'Search by Batch',
                      contentPadding: const EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      suffixIcon: Icon(Icons.search),
                    ),
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
                                hintText: "2023-01-01",
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
                                hintText: "2023-01-01",
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
                                setState(() {
                                  //fromDataController.text;
                                  Map<String, dynamic> data = {
                                    "pagefilter": "",
                                    "search": "",
                                    "from_date": fromDataController.text,
                                    "to_date": toDateController.text
                                  };
                                  sessionViewModel.fetchSessionListSearchApi(
                                      data, pageSize, pageNo);
                                });
                              },
                              child: const Text("Filter")),
                        ],
                      ),
                    ),
                  ],
                ),
                DefaultTabController(
                  length: 4,
                  initialIndex: 0,
                  child: ChangeNotifierProvider<SessionViewViewModel>(
                    create: (context) => sessionViewModel,
                    child: Consumer<SessionViewViewModel>(
                      builder: (context, value, _) {
                        switch (value.dataList.status!) {
                          case Status.loading:
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.teal,
                              ),
                            );
                          case Status.completed:
                            return Column(
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
                                      padding: const EdgeInsets.only(
                                          right: 10, left: 10),
                                      child: Chip(
                                        backgroundColor:
                                        _controller.index != 0
                                            ? const Color.fromARGB(
                                            255, 242, 242, 242)
                                            : Colors.grey.shade100,
                                        label: const Text(
                                          'All',
                                          style:
                                          TextStyle(color: Colors.blue),
                                        ),
                                        avatar: CircleAvatar(
                                          backgroundColor:
                                          _controller.index != 0
                                              ? Colors.blue.shade100
                                              : const Color.fromARGB(
                                              255, 242, 242, 242),
                                          child: Text(
                                              '${value.dataList.data!.total_data_count}'),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(right: 10),
                                      child: Chip(
                                        backgroundColor:
                                        _controller.index != 1
                                            ? const Color.fromARGB(
                                            255, 242, 242, 242)
                                            : Colors.green.shade100,
                                        label: const Text(
                                          'Scheduled',
                                        ),
                                        avatar: CircleAvatar(
                                          backgroundColor:
                                          _controller.index != 1
                                              ? Colors.green.shade100
                                              : const Color.fromARGB(
                                              255, 242, 242, 242),
                                          child: Text(value.dataList.data!.scheduled.toString()),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(right: 10),
                                      child: Chip(
                                        backgroundColor:
                                        _controller.index != 2
                                            ? const Color.fromARGB(
                                            255, 242, 242, 242)
                                            : Colors.brown.shade100,
                                        label: const Text(
                                          'Canceled',
                                        ),
                                        avatar: CircleAvatar(
                                          backgroundColor:
                                          _controller.index != 2
                                              ? Colors.brown.shade100
                                              : const Color.fromARGB(
                                              255, 242, 242, 242),
                                          child: Text(value.dataList.data!.cancel.toString()),

                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(right: 10),
                                      child: Chip(
                                        backgroundColor:
                                        _controller.index != 3
                                            ? const Color.fromARGB(
                                            255, 242, 242, 242)
                                            : Colors.redAccent.shade100,
                                        label: const Text(
                                          'Closed',
                                        ),
                                        avatar: CircleAvatar(
                                          backgroundColor:
                                          _controller.index != 3
                                              ? Colors.redAccent.shade100
                                              : const Color.fromARGB(
                                              255, 242, 242, 242),
                                          child: Text(value.dataList.data!.close.toString()),

                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: h * .51,
                                  decoration: const BoxDecoration(
                                    //color: Colors.green
                                  ),
                                  child: TabBarView(
                                    controller: _controller,
                                    children: <Widget>[
                                      searchController.text == ""
                                          ? (fromDataController
                                          .text.isEmpty &&
                                          toDateController
                                              .text.isEmpty)
                                          ? ListView.builder(
                                          controller:
                                          _scrollController,
                                          itemCount: value
                                              .dataList
                                              .data!
                                              .data!
                                              .length +
                                              1,
                                          itemBuilder:
                                              (context, index) {
                                            // print("uid of batch ==${value.dataList.data!.data?[index].sdd}");
                                            if (index <
                                                value.dataList.data!
                                                    .data!.length) {
                                              return Card(
                                                // key: ValueKey(_foundUsers[index]["id"]),
                                                elevation: 0,
                                                margin:
                                                const EdgeInsets
                                                    .symmetric(
                                                    vertical: 0),
                                                child: Column(
                                                  children: [
                                                    ListTile(
                                                      tileColor: (_selectedItems.contains(
                                                          index))
                                                          ? const Color.fromARGB(
                                                          255,
                                                          218,
                                                          218,
                                                          219)
                                                          .withOpacity(
                                                          0.5)
                                                          : Colors
                                                          .transparent,
                                                      title: Row(
                                                        children: [
                                                          Text(
                                                            '${value.dataList.data!.data?[index].batch_name}',
                                                            style: const TextStyle(
                                                                color: Color.fromRGBO(
                                                                    57,
                                                                    64,
                                                                    74,
                                                                    1),
                                                                fontSize:
                                                                14,
                                                                fontWeight: FontWeight
                                                                    .w700,
                                                                fontFamily:
                                                                'Loto-Regular'),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Chip(
                                                              backgroundColor: value.dataList.data!.data?[index].status ==
                                                                  'scheduled'
                                                                  ? Colors.green.withOpacity(.2)
                                                                  : value.dataList.data!.data?[index].status == 'canceled'
                                                                  ? Colors.red.withOpacity(.2)
                                                                  : Colors.brown.withOpacity(.2),
                                                              label: Text(
                                                                '${value.dataList.data!.data?[index].status}',
                                                                style: TextStyle(
                                                                    color: value.dataList.data!.data?[index].status == 'scheduled'
                                                                        ? Colors.green
                                                                        : value.dataList.data!.data?[index].status == 'canceled'
                                                                        ? Colors.red
                                                                        : Colors.brown),
                                                              )),
                                                        ],
                                                      ),
                                                      subtitle:
                                                      RichText(
                                                        text:
                                                        TextSpan(
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                                text:
                                                                '${value.dataList.data!.data?[index].program_name} ',
                                                                style: const TextStyle(
                                                                    fontWeight: FontWeight.bold,
                                                                    color: Colors.black)),
                                                            TextSpan(
                                                                text:
                                                                " - ",
                                                                style: const TextStyle(
                                                                    fontWeight: FontWeight.bold,
                                                                    color: Colors.black)),
                                                            TextSpan(
                                                              text:
                                                              '${value.dataList.data!.data?[index].syy}-${value.dataList.data!.data?[index].smm}-${value.dataList.data!.data?[index].sdd}',
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                  FontWeight.bold,
                                                                  color: Colors.black),
                                                            ),
                                                            TextSpan(
                                                                text:
                                                                " - ",
                                                                style: const TextStyle(
                                                                    fontWeight: FontWeight.bold,
                                                                    color: Colors.black)),
                                                            TextSpan(
                                                                text:
                                                                '  ${value.dataList.data!.data?[index].batch_timing_from} to ${value.dataList.data!.data?[index].batch_timing_to}',
                                                                style:
                                                                const TextStyle(color: Colors.black)),
                                                          ],
                                                        ),
                                                      ),
                                                      trailing:
                                                      CircleAvatar(
                                                        backgroundColor:
                                                        Colors
                                                            .transparent,
                                                        radius: 14,
                                                        child: Image(
                                                            image: NetworkImage(
                                                                "${AppUrl.serviceIconEndPoint}${value.dataList.data!.data?[index].service_iconname}")),
                                                      ),
                                                      onTap: () {
                                                        print(value
                                                            .dataList
                                                            .data!
                                                            .data?[
                                                        index]
                                                            .status);
                                                        if (value
                                                            .dataList
                                                            .data!
                                                            .data?[
                                                        index]
                                                            .status ==
                                                            'scheduled') {
                                                          Get.to(
                                                                  () =>
                                                                  ViewSessionalDetails(
                                                                    id: "${value.dataList.data!.data?[index].uid}",
                                                                    serviceIcon: value.dataList.data!.data?[index].service_iconname,
                                                                  ),
                                                              transition:
                                                              Transition.leftToRight);
                                                        } else if (value
                                                            .dataList
                                                            .data!
                                                            .data?[
                                                        index]
                                                            .status ==
                                                            'close') {
                                                          Get.to(
                                                                  () => ViewDetailClosed(
                                                                  id:
                                                                  "${value.dataList.data!.data?[index].uid}"),
                                                              transition:
                                                              Transition.leftToRight);
                                                        } else if (value
                                                            .dataList
                                                            .data!
                                                            .data![
                                                        index]
                                                            .status ==
                                                            'cancel') {
                                                          Get.to(
                                                                  () => SessionDetailCancel(
                                                                  uid: value.dataList.data!.data![index].uid
                                                                      .toString()),
                                                              transition:
                                                              Transition.leftToRight);
                                                        }
                                                      },
                                                      onLongPress:
                                                          () {
                                                        if (!_selectedItems
                                                            .contains(
                                                            index)) {
                                                          setState(
                                                                  () {
                                                                _selectedItems
                                                                    .add(
                                                                    index);
                                                              });
                                                        } else {
                                                          setState(
                                                                  () {
                                                                _selectedItems.removeWhere((val) =>
                                                                val ==
                                                                    index);
                                                              });
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
                                            } else {
                                              return Padding(
                                                padding:
                                                const EdgeInsets
                                                    .all(16.0),
                                                child: Center(
                                                    child: value
                                                        .loading
                                                        ? const CircularProgressIndicator()
                                                        : const SizedBox()
                                                  // Empty SizedBox when not loading
                                                ),
                                              );
                                            }
                                          })
                                          : ListView.builder(
                                          controller:
                                          _scrollController,
                                          itemCount: value
                                              .dataList
                                              .data!
                                              .data!
                                              .length +
                                              1,
                                          itemBuilder:
                                              (context, index) {
                                            // print("uid of batch ==${value.dataList.data!.data?[index].sdd}");
                                            if (index < value.dataList.data!.data!.length) {
                                              return Card(
                                                // key: ValueKey(_foundUsers[index]["id"]),
                                                elevation: 0,
                                                margin:
                                                const EdgeInsets
                                                    .symmetric(
                                                    vertical: 0),
                                                child: Column(
                                                  children: [
                                                    ListTile(
                                                      tileColor: (_selectedItems.contains(
                                                          index))
                                                          ? const Color.fromARGB(
                                                          255,
                                                          218,
                                                          218,
                                                          219)
                                                          .withOpacity(
                                                          0.5)
                                                          : Colors
                                                          .transparent,
                                                      title: Row(
                                                        children: [
                                                          Text(
                                                            '${value.dataList.data!.data?[index].batch_name}',
                                                            style: const TextStyle(
                                                                color: Color.fromRGBO(
                                                                    57,
                                                                    64,
                                                                    74,
                                                                    1),
                                                                fontSize:
                                                                14,
                                                                fontWeight: FontWeight
                                                                    .w700,
                                                                fontFamily:
                                                                'Loto-Regular'),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Chip(
                                                              backgroundColor: value.dataList.data!.data?[index].status ==
                                                                  'scheduled'
                                                                  ? Colors.green.withOpacity(.2)
                                                                  : value.dataList.data!.data?[index].status == 'cancel'
                                                                  ? Colors.red.withOpacity(.2)
                                                                  : Colors.brown.withOpacity(.2),
                                                              label: Text(
                                                                '${value.dataList.data!.data?[index].status}',
                                                                style: TextStyle(
                                                                    color: value.dataList.data!.data?[index].status == 'scheduled'
                                                                        ? Colors.green
                                                                        : value.dataList.data!.data?[index].status == 'cancel'
                                                                        ? Colors.red
                                                                        : Colors.brown),
                                                              )),
                                                        ],
                                                      ),
                                                      subtitle:
                                                      RichText(
                                                        text:
                                                        TextSpan(
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                                text:
                                                                '${value.dataList.data!.data?[index].program_name} ',
                                                                style: const TextStyle(
                                                                    fontWeight: FontWeight.bold,
                                                                    color: Colors.black)),
                                                            TextSpan(
                                                                text:
                                                                " - ",
                                                                style: const TextStyle(
                                                                    fontWeight: FontWeight.bold,
                                                                    color: Colors.black)),
                                                            TextSpan(
                                                              text:
                                                              '${value.dataList.data!.data?[index].syy}-${value.dataList.data!.data?[index].smm}-${value.dataList.data!.data?[index].sdd}',
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                  FontWeight.bold,
                                                                  color: Colors.black),
                                                            ),
                                                            TextSpan(
                                                                text:
                                                                " - ",
                                                                style: const TextStyle(
                                                                    fontWeight: FontWeight.bold,
                                                                    color: Colors.black)),
                                                            TextSpan(
                                                                text:
                                                                '  ${value.dataList.data!.data?[index].batch_timing_from} to ${value.dataList.data!.data?[index].batch_timing_to}',
                                                                style:
                                                                const TextStyle(color: Colors.black)),
                                                          ],
                                                        ),
                                                      ),
                                                      trailing:
                                                      CircleAvatar(
                                                        backgroundColor:
                                                        Colors
                                                            .transparent,
                                                        radius: 14,
                                                        child: Image(
                                                            image: NetworkImage(
                                                                "${AppUrl.serviceIconEndPoint}${value.dataList.data!.data?[index].service_iconname}")),
                                                      ),
                                                      onTap: () {
                                                        print(value
                                                            .dataList
                                                            .data!
                                                            .data?[
                                                        index]
                                                            .status);
                                                        if (value
                                                            .dataList
                                                            .data!
                                                            .data?[
                                                        index]
                                                            .status ==
                                                            'scheduled') {
                                                          Get.to(
                                                                  () =>
                                                                  ViewSessionalDetails(
                                                                    id: "${value.dataList.data!.data?[index].uid}",
                                                                    serviceIcon: value.dataList.data!.data?[index].service_iconname,
                                                                  ),
                                                              transition:
                                                              Transition.leftToRight);
                                                        } else if (value
                                                            .dataList
                                                            .data!
                                                            .data?[
                                                        index]
                                                            .status ==
                                                            'close') {
                                                          Get.to(
                                                                  () => ViewDetailClosed(
                                                                  id:
                                                                  "${value.dataList.data!.data?[index].uid}"),
                                                              transition:
                                                              Transition.leftToRight);
                                                        } else if (value
                                                            .dataList
                                                            .data!
                                                            .data![
                                                        index]
                                                            .status ==
                                                            'cancel') {
                                                          Get.to(
                                                                  () => SessionDetailCancel(
                                                                  uid: value.dataList.data!.data![index].uid
                                                                      .toString()),
                                                              transition:
                                                              Transition.leftToRight);
                                                        }
                                                      },
                                                      onLongPress:
                                                          () {
                                                        if (!_selectedItems
                                                            .contains(
                                                            index)) {
                                                          setState(
                                                                  () {
                                                                _selectedItems
                                                                    .add(
                                                                    index);
                                                              });
                                                        } else {
                                                          setState(
                                                                  () {
                                                                _selectedItems.removeWhere((val) =>
                                                                val ==
                                                                    index);
                                                              });
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
                                            } else {
                                              return Padding(
                                                padding:
                                                const EdgeInsets
                                                    .all(16.0),
                                                child: Center(
                                                    child: value
                                                        .loading
                                                        ? const CircularProgressIndicator()
                                                        : const SizedBox()
                                                  // Empty SizedBox when not loading
                                                ),
                                              );
                                            }
                                          })
                                          : ListView.builder(
                                          controller: _scrollController,
                                          itemCount: value.dataList.data!
                                              .data!.length +
                                              1,
                                          itemBuilder: (context, index) {
                                            // print("uid of batch ==${value.dataList.data!.data?[index].sdd}");
                                            if (index <
                                                value.dataList.data!.data!
                                                    .length) {
                                              return Card(
                                                // key: ValueKey(_foundUsers[index]["id"]),
                                                elevation: 0,
                                                margin: const EdgeInsets
                                                    .symmetric(
                                                    vertical: 0),
                                                child: Column(
                                                  children: [
                                                    ListTile(
                                                      tileColor: (_selectedItems
                                                          .contains(
                                                          index))
                                                          ? const Color
                                                          .fromARGB(
                                                          255,
                                                          218,
                                                          218,
                                                          219)
                                                          .withOpacity(
                                                          0.5)
                                                          : Colors
                                                          .transparent,
                                                      title: Row(
                                                        children: [
                                                          Text(
                                                            '${value.dataList.data!.data?[index].batch_name}',
                                                            style: const TextStyle(
                                                                color: Color
                                                                    .fromRGBO(
                                                                    57,
                                                                    64,
                                                                    74,
                                                                    1),
                                                                fontSize:
                                                                14,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w700,
                                                                fontFamily:
                                                                'Loto-Regular'),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Chip(
                                                              backgroundColor: value.dataList.data!.data?[index].status ==
                                                                  'scheduled'
                                                                  ? Colors
                                                                  .green
                                                                  .withOpacity(
                                                                  .2)
                                                                  : value.dataList.data!.data?[index].status ==
                                                                  'cancel'
                                                                  ? Colors.red.withOpacity(.2)
                                                                  : Colors.brown.withOpacity(.2),
                                                              label: Text(
                                                                '${value.dataList.data!.data?[index].status}',
                                                                style: TextStyle(
                                                                    color: value.dataList.data!.data?[index].status == 'scheduled'
                                                                        ? Colors.green
                                                                        : value.dataList.data!.data?[index].status == 'cancel'
                                                                        ? Colors.red
                                                                        : Colors.brown),
                                                              )),
                                                        ],
                                                      ),
                                                      subtitle: RichText(
                                                        text: TextSpan(
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                                text:
                                                                '${value.dataList.data!.data?[index].program_name} ',
                                                                style: const TextStyle(
                                                                    fontWeight: FontWeight
                                                                        .bold,
                                                                    color:
                                                                    Colors.black)),
                                                            TextSpan(
                                                                text:
                                                                " - ",
                                                                style: const TextStyle(
                                                                    fontWeight: FontWeight
                                                                        .bold,
                                                                    color:
                                                                    Colors.black)),
                                                            TextSpan(
                                                              text:
                                                              '${value.dataList.data!.data?[index].syy}-${value.dataList.data!.data?[index].smm}-${value.dataList.data!.data?[index].sdd}',
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            TextSpan(
                                                                text:
                                                                " - ",
                                                                style: const TextStyle(
                                                                    fontWeight: FontWeight
                                                                        .bold,
                                                                    color:
                                                                    Colors.black)),
                                                            TextSpan(
                                                                text:
                                                                '  ${value.dataList.data!.data?[index].batch_timing_from} to ${value.dataList.data!.data?[index].batch_timing_to}',
                                                                style: const TextStyle(
                                                                    color:
                                                                    Colors.black)),
                                                          ],
                                                        ),
                                                      ),
                                                      trailing:
                                                      CircleAvatar(
                                                        backgroundColor:
                                                        Colors
                                                            .transparent,
                                                        radius: 14,
                                                        child: Image(
                                                            image: NetworkImage(
                                                                "${AppUrl.serviceIconEndPoint}${value.dataList.data!.data?[index].service_iconname}")),
                                                      ),
                                                      onTap: () {
                                                        print(value
                                                            .dataList
                                                            .data!
                                                            .data?[index]
                                                            .status);
                                                        if (value
                                                            .dataList
                                                            .data!
                                                            .data?[
                                                        index]
                                                            .status ==
                                                            'scheduled') {
                                                          Get.to(
                                                                  () =>
                                                                  ViewSessionalDetails(
                                                                    id: "${value.dataList.data!.data?[index].uid}",
                                                                    serviceIcon: value
                                                                        .dataList
                                                                        .data!
                                                                        .data?[index]
                                                                        .service_iconname,
                                                                  ),
                                                              transition:
                                                              Transition
                                                                  .leftToRight);
                                                        } else if (value
                                                            .dataList
                                                            .data!
                                                            .data?[
                                                        index]
                                                            .status ==
                                                            'close') {
                                                          Get.to(
                                                                  () => ViewDetailClosed(
                                                                  id:
                                                                  "${value.dataList.data!.data?[index].uid}"),
                                                              transition:
                                                              Transition
                                                                  .leftToRight);
                                                        } else if (value
                                                            .dataList
                                                            .data!
                                                            .data![
                                                        index]
                                                            .status ==
                                                            'cancel') {
                                                          Get.to(
                                                                  () => SessionDetailCancel(
                                                                  uid: value
                                                                      .dataList
                                                                      .data!
                                                                      .data![
                                                                  index]
                                                                      .uid
                                                                      .toString()),
                                                              transition:
                                                              Transition
                                                                  .leftToRight);
                                                        }
                                                      },
                                                      onLongPress: () {
                                                        if (!_selectedItems
                                                            .contains(
                                                            index)) {
                                                          setState(() {
                                                            _selectedItems
                                                                .add(
                                                                index);
                                                          });
                                                        } else {
                                                          setState(() {
                                                            _selectedItems
                                                                .removeWhere((val) =>
                                                            val ==
                                                                index);
                                                          });
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
                                            } else {
                                              return Padding(
                                                padding:
                                                const EdgeInsets.all(
                                                    16.0),
                                                child: Center(
                                                    child: value.loading
                                                        ? const CircularProgressIndicator()
                                                        : const SizedBox()
                                                  // Empty SizedBox when not loading
                                                ),
                                              );
                                            }
                                          }),

                                      searchController.text == ""
                                          ? (fromDataController
                                          .text.isEmpty &&
                                          toDateController
                                              .text.isEmpty)
                                     ? ListView.builder(
                                          controller: _scrollController,
                                          itemCount: value.dataList.data!
                                              .data!.length +
                                              1,
                                          itemBuilder: (context, index) {
                                            // print("uid of batch ==${value.dataList.data!.data?[index].sdd}");
                                            if (index <
                                                value.dataList.data!.data!
                                                    .length) {
                                              return value
                                                  .dataList
                                                  .data!
                                                  .data![index]
                                                  .status ==
                                                  "scheduled"
                                                  ? Card(
                                                // key: ValueKey(_foundUsers[index]["id"]),
                                                elevation: 0,
                                                margin: const EdgeInsets
                                                    .symmetric(
                                                    vertical: 0),
                                                child: Column(
                                                  children: [
                                                    ListTile(
                                                      tileColor: (_selectedItems
                                                          .contains(
                                                          index))
                                                          ? const Color
                                                          .fromARGB(
                                                          255,
                                                          218,
                                                          218,
                                                          219)
                                                          .withOpacity(
                                                          0.5)
                                                          : Colors
                                                          .transparent,
                                                      title: Row(
                                                        children: [
                                                          Text(
                                                            '${value.dataList.data!.data?[index].batch_name}',
                                                            style: const TextStyle(
                                                                color: Color.fromRGBO(
                                                                    57,
                                                                    64,
                                                                    74,
                                                                    1),
                                                                fontSize:
                                                                14,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w700,
                                                                fontFamily:
                                                                'Loto-Regular'),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Chip(
                                                              backgroundColor: value.dataList.data!.data?[index].status ==
                                                                  'scheduled'
                                                                  ? Colors
                                                                  .green
                                                                  .withOpacity(.2)
                                                                  : value.dataList.data!.data?[index].status == 'cancel'
                                                                  ? Colors.red.withOpacity(.2)
                                                                  : Colors.brown.withOpacity(.2),
                                                              label: Text(
                                                                '${value.dataList.data!.data?[index].status}',
                                                                style: TextStyle(
                                                                    color: value.dataList.data!.data?[index].status == 'scheduled'
                                                                        ? Colors.green
                                                                        : value.dataList.data!.data?[index].status == 'cancel'
                                                                        ? Colors.red
                                                                        : Colors.brown),
                                                              )),
                                                        ],
                                                      ),
                                                      subtitle:
                                                      RichText(
                                                        text: TextSpan(
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                                text:
                                                                '${value.dataList.data!.data?[index].program_name} ',
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color: Colors.black)),
                                                            TextSpan(
                                                                text:
                                                                " - ",
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color: Colors.black)),
                                                            TextSpan(
                                                              text:
                                                              '${value.dataList.data!.data?[index].syy}-${value.dataList.data!.data?[index].smm}-${value.dataList.data!.data?[index].sdd}',
                                                              style: const TextStyle(
                                                                  fontWeight: FontWeight
                                                                      .bold,
                                                                  color:
                                                                  Colors.black),
                                                            ),
                                                            TextSpan(
                                                                text:
                                                                " - ",
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color: Colors.black)),
                                                            TextSpan(
                                                                text:
                                                                '  ${value.dataList.data!.data?[index].batch_timing_from} to ${value.dataList.data!.data?[index].batch_timing_to}',
                                                                style: const TextStyle(
                                                                    color:
                                                                    Colors.black)),
                                                          ],
                                                        ),
                                                      ),
                                                      trailing:
                                                      CircleAvatar(
                                                        backgroundColor:
                                                        Colors
                                                            .transparent,
                                                        radius: 14,
                                                        child: Image(
                                                            image: NetworkImage(
                                                                "${AppUrl.serviceIconEndPoint}${value.dataList.data!.data?[index].service_iconname}")),
                                                      ),
                                                      onTap: () {
                                                        print(value
                                                            .dataList
                                                            .data!
                                                            .data?[
                                                        index]
                                                            .status);
                                                        if (value
                                                            .dataList
                                                            .data!
                                                            .data?[
                                                        index]
                                                            .status ==
                                                            'scheduled') {
                                                          Get.to(
                                                                  () =>
                                                                  ViewSessionalDetails(
                                                                    id: "${value.dataList.data!.data?[index].uid}",
                                                                    serviceIcon:
                                                                    value.dataList.data!.data?[index].service_iconname,
                                                                  ),
                                                              transition:
                                                              Transition
                                                                  .leftToRight);
                                                        } else if (value
                                                            .dataList
                                                            .data!
                                                            .data?[
                                                        index]
                                                            .status ==
                                                            'close') {
                                                          Get.to(
                                                                  () => ViewDetailClosed(
                                                                  id:
                                                                  "${value.dataList.data!.data?[index].uid}"),
                                                              transition:
                                                              Transition
                                                                  .leftToRight);
                                                        } else if (value
                                                            .dataList
                                                            .data!
                                                            .data![
                                                        index]
                                                            .status ==
                                                            'cancel') {
                                                          Get.to(
                                                                  () => SessionDetailCancel(
                                                                  uid: value
                                                                      .dataList
                                                                      .data!
                                                                      .data![
                                                                  index]
                                                                      .uid
                                                                      .toString()),
                                                              transition:
                                                              Transition
                                                                  .leftToRight);
                                                        }
                                                      },
                                                      onLongPress: () {
                                                        if (!_selectedItems
                                                            .contains(
                                                            index)) {
                                                          setState(() {
                                                            _selectedItems
                                                                .add(
                                                                index);
                                                          });
                                                        } else {
                                                          setState(() {
                                                            _selectedItems.removeWhere(
                                                                    (val) =>
                                                                val ==
                                                                    index);
                                                          });
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
                                                  : const SizedBox();
                                            } else {
                                              return Padding(
                                                padding: const EdgeInsets.all(
                                                    16.0),
                                                child: Center(
                                                    child: value.loading
                                                        ? const CircularProgressIndicator()
                                                        : const SizedBox()
                                                  // Empty SizedBox when not loading
                                                ),
                                              );
                                            }
                                          })
                                     : ListView.builder(
                                          controller: _scrollController,
                                          itemCount: value.dataList.data!
                                              .data!.length +
                                              1,
                                          itemBuilder: (context, index) {
                                            // print("uid of batch ==${value.dataList.data!.data?[index].sdd}");
                                            if (index <
                                                value.dataList.data!.data!
                                                    .length) {
                                              return value
                                                  .dataList
                                                  .data!
                                                  .data![index]
                                                  .status ==
                                                  "scheduled"
                                                  ? Card(
                                                // key: ValueKey(_foundUsers[index]["id"]),
                                                elevation: 0,
                                                margin: const EdgeInsets
                                                    .symmetric(
                                                    vertical: 0),
                                                child: Column(
                                                  children: [
                                                    ListTile(
                                                      tileColor: (_selectedItems
                                                          .contains(
                                                          index))
                                                          ? const Color
                                                          .fromARGB(
                                                          255,
                                                          218,
                                                          218,
                                                          219)
                                                          .withOpacity(
                                                          0.5)
                                                          : Colors
                                                          .transparent,
                                                      title: Row(
                                                        children: [
                                                          Text(
                                                            '${value.dataList.data!.data?[index].batch_name}',
                                                            style: const TextStyle(
                                                                color: Color.fromRGBO(
                                                                    57,
                                                                    64,
                                                                    74,
                                                                    1),
                                                                fontSize:
                                                                14,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w700,
                                                                fontFamily:
                                                                'Loto-Regular'),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Chip(
                                                              backgroundColor: value.dataList.data!.data?[index].status ==
                                                                  'scheduled'
                                                                  ? Colors
                                                                  .green
                                                                  .withOpacity(.2)
                                                                  : value.dataList.data!.data?[index].status == 'canceled'
                                                                  ? Colors.red.withOpacity(.2)
                                                                  : Colors.brown.withOpacity(.2),
                                                              label: Text(
                                                                '${value.dataList.data!.data?[index].status}',
                                                                style: TextStyle(
                                                                    color: value.dataList.data!.data?[index].status == 'scheduled'
                                                                        ? Colors.green
                                                                        : value.dataList.data!.data?[index].status == 'canceled'
                                                                        ? Colors.red
                                                                        : Colors.brown),
                                                              )),
                                                        ],
                                                      ),
                                                      subtitle:
                                                      RichText(
                                                        text: TextSpan(
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                                text:
                                                                '${value.dataList.data!.data?[index].program_name} ',
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color: Colors.black)),
                                                            TextSpan(
                                                                text:
                                                                " - ",
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color: Colors.black)),
                                                            TextSpan(
                                                              text:
                                                              '${value.dataList.data!.data?[index].syy}-${value.dataList.data!.data?[index].smm}-${value.dataList.data!.data?[index].sdd}',
                                                              style: const TextStyle(
                                                                  fontWeight: FontWeight
                                                                      .bold,
                                                                  color:
                                                                  Colors.black),
                                                            ),
                                                            TextSpan(
                                                                text:
                                                                " - ",
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color: Colors.black)),
                                                            TextSpan(
                                                                text:
                                                                '  ${value.dataList.data!.data?[index].batch_timing_from} to ${value.dataList.data!.data?[index].batch_timing_to}',
                                                                style: const TextStyle(
                                                                    color:
                                                                    Colors.black)),
                                                          ],
                                                        ),
                                                      ),
                                                      trailing:
                                                      CircleAvatar(
                                                        backgroundColor:
                                                        Colors
                                                            .transparent,
                                                        radius: 14,
                                                        child: Image(
                                                            image: NetworkImage(
                                                                "${AppUrl.serviceIconEndPoint}${value.dataList.data!.data?[index].service_iconname}")),
                                                      ),
                                                      onTap: () {
                                                        print(value
                                                            .dataList
                                                            .data!
                                                            .data?[
                                                        index]
                                                            .status);
                                                        if (value
                                                            .dataList
                                                            .data!
                                                            .data?[
                                                        index]
                                                            .status ==
                                                            'scheduled') {
                                                          Get.to(
                                                                  () =>
                                                                  ViewSessionalDetails(
                                                                    id: "${value.dataList.data!.data?[index].uid}",
                                                                    serviceIcon:
                                                                    value.dataList.data!.data?[index].service_iconname,
                                                                  ),
                                                              transition:
                                                              Transition
                                                                  .leftToRight);
                                                        } else if (value
                                                            .dataList
                                                            .data!
                                                            .data?[
                                                        index]
                                                            .status ==
                                                            'close') {
                                                          Get.to(
                                                                  () => ViewDetailClosed(
                                                                  id:
                                                                  "${value.dataList.data!.data?[index].uid}"),
                                                              transition:
                                                              Transition
                                                                  .leftToRight);
                                                        } else if (value
                                                            .dataList
                                                            .data!
                                                            .data![
                                                        index]
                                                            .status ==
                                                            'cancel') {
                                                          Get.to(
                                                                  () => SessionDetailCancel(
                                                                  uid: value
                                                                      .dataList
                                                                      .data!
                                                                      .data![
                                                                  index]
                                                                      .uid
                                                                      .toString()),
                                                              transition:
                                                              Transition
                                                                  .leftToRight);
                                                        }
                                                      },
                                                      onLongPress: () {
                                                        if (!_selectedItems
                                                            .contains(
                                                            index)) {
                                                          setState(() {
                                                            _selectedItems
                                                                .add(
                                                                index);
                                                          });
                                                        } else {
                                                          setState(() {
                                                            _selectedItems.removeWhere(
                                                                    (val) =>
                                                                val ==
                                                                    index);
                                                          });
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
                                                  : const SizedBox();
                                            } else {
                                              return Padding(
                                                padding: const EdgeInsets.all(
                                                    16.0),
                                                child: Center(
                                                    child: value.loading
                                                        ? const CircularProgressIndicator()
                                                        : const SizedBox()
                                                  // Empty SizedBox when not loading
                                                ),
                                              );
                                            }
                                          })
                                      :ListView.builder(
                                          controller: _scrollController,
                                          itemCount: value.dataList.data!
                                              .data!.length +
                                              1,
                                          itemBuilder: (context, index) {
                                            // print("uid of batch ==${value.dataList.data!.data?[index].sdd}");
                                            if (index <
                                                value.dataList.data!.data!
                                                    .length) {
                                              return value
                                                  .dataList
                                                  .data!
                                                  .data![index]
                                                  .status ==
                                                  "scheduled"
                                                  ? Card(
                                                // key: ValueKey(_foundUsers[index]["id"]),
                                                elevation: 0,
                                                margin: const EdgeInsets
                                                    .symmetric(
                                                    vertical: 0),
                                                child: Column(
                                                  children: [
                                                    ListTile(
                                                      tileColor: (_selectedItems
                                                          .contains(
                                                          index))
                                                          ? const Color
                                                          .fromARGB(
                                                          255,
                                                          218,
                                                          218,
                                                          219)
                                                          .withOpacity(
                                                          0.5)
                                                          : Colors
                                                          .transparent,
                                                      title: Row(
                                                        children: [
                                                          Text(
                                                            '${value.dataList.data!.data?[index].batch_name}',
                                                            style: const TextStyle(
                                                                color: Color.fromRGBO(
                                                                    57,
                                                                    64,
                                                                    74,
                                                                    1),
                                                                fontSize:
                                                                14,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w700,
                                                                fontFamily:
                                                                'Loto-Regular'),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Chip(
                                                              backgroundColor: value.dataList.data!.data?[index].status ==
                                                                  'scheduled'
                                                                  ? Colors
                                                                  .green
                                                                  .withOpacity(.2)
                                                                  : value.dataList.data!.data?[index].status == 'cancel'
                                                                  ? Colors.red.withOpacity(.2)
                                                                  : Colors.brown.withOpacity(.2),
                                                              label: Text(
                                                                '${value.dataList.data!.data?[index].status}',
                                                                style: TextStyle(
                                                                    color: value.dataList.data!.data?[index].status == 'scheduled'
                                                                        ? Colors.green
                                                                        : value.dataList.data!.data?[index].status == 'cancel'
                                                                        ? Colors.red
                                                                        : Colors.brown),
                                                              )),
                                                        ],
                                                      ),
                                                      subtitle:
                                                      RichText(
                                                        text: TextSpan(
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                                text:
                                                                '${value.dataList.data!.data?[index].program_name} ',
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color: Colors.black)),
                                                            TextSpan(
                                                                text:
                                                                " - ",
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color: Colors.black)),
                                                            TextSpan(
                                                              text:
                                                              '${value.dataList.data!.data?[index].syy}-${value.dataList.data!.data?[index].smm}-${value.dataList.data!.data?[index].sdd}',
                                                              style: const TextStyle(
                                                                  fontWeight: FontWeight
                                                                      .bold,
                                                                  color:
                                                                  Colors.black),
                                                            ),
                                                            TextSpan(
                                                                text:
                                                                " - ",
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color: Colors.black)),
                                                            TextSpan(
                                                                text:
                                                                '  ${value.dataList.data!.data?[index].batch_timing_from} to ${value.dataList.data!.data?[index].batch_timing_to}',
                                                                style: const TextStyle(
                                                                    color:
                                                                    Colors.black)),
                                                          ],
                                                        ),
                                                      ),
                                                      trailing:
                                                      CircleAvatar(
                                                        backgroundColor:
                                                        Colors
                                                            .transparent,
                                                        radius: 14,
                                                        child: Image(
                                                            image: NetworkImage(
                                                                "${AppUrl.serviceIconEndPoint}${value.dataList.data!.data?[index].service_iconname}")),
                                                      ),
                                                      onTap: () {
                                                        print(value
                                                            .dataList
                                                            .data!
                                                            .data?[
                                                        index]
                                                            .status);
                                                        if (value
                                                            .dataList
                                                            .data!
                                                            .data?[
                                                        index]
                                                            .status ==
                                                            'scheduled') {
                                                          Get.to(
                                                                  () =>
                                                                  ViewSessionalDetails(
                                                                    id: "${value.dataList.data!.data?[index].uid}",
                                                                    serviceIcon:
                                                                    value.dataList.data!.data?[index].service_iconname,
                                                                  ),
                                                              transition:
                                                              Transition
                                                                  .leftToRight);
                                                        } else if (value
                                                            .dataList
                                                            .data!
                                                            .data?[
                                                        index]
                                                            .status ==
                                                            'close') {
                                                          Get.to(
                                                                  () => ViewDetailClosed(
                                                                  id:
                                                                  "${value.dataList.data!.data?[index].uid}"),
                                                              transition:
                                                              Transition
                                                                  .leftToRight);
                                                        } else if (value
                                                            .dataList
                                                            .data!
                                                            .data![
                                                        index]
                                                            .status ==
                                                            'cancel') {
                                                          Get.to(
                                                                  () => SessionDetailCancel(
                                                                  uid: value
                                                                      .dataList
                                                                      .data!
                                                                      .data![
                                                                  index]
                                                                      .uid
                                                                      .toString()),
                                                              transition:
                                                              Transition
                                                                  .leftToRight);
                                                        }
                                                      },
                                                      onLongPress: () {
                                                        if (!_selectedItems
                                                            .contains(
                                                            index)) {
                                                          setState(() {
                                                            _selectedItems
                                                                .add(
                                                                index);
                                                          });
                                                        } else {
                                                          setState(() {
                                                            _selectedItems.removeWhere(
                                                                    (val) =>
                                                                val ==
                                                                    index);
                                                          });
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
                                                  : const SizedBox();
                                            } else {
                                              return Padding(
                                                padding: const EdgeInsets.all(
                                                    16.0),
                                                child: Center(
                                                    child: value.loading
                                                        ? const CircularProgressIndicator()
                                                        : const SizedBox()
                                                  // Empty SizedBox when not loading
                                                ),
                                              );
                                            }
                                          }),



                                      searchController.text == ""
                                          ? (fromDataController
                                          .text.isEmpty &&
                                          toDateController
                                              .text.isEmpty)
                                          ? ListView.builder(
                                          controller: _scrollController,
                                          itemCount: value.dataList.data!
                                              .data!.length +
                                              1,
                                          itemBuilder: (context, index) {
                                            // print("uid of batch ==${value.dataList.data!.data?[index].sdd}");
                                            if (index <
                                                value.dataList.data!.data!
                                                    .length) {
                                              return value
                                                  .dataList
                                                  .data!
                                                  .data![index]
                                                  .status ==
                                                  "cancel"
                                                  ? Card(
                                                // key: ValueKey(_foundUsers[index]["id"]),
                                                elevation: 0,
                                                margin: const EdgeInsets
                                                    .symmetric(
                                                    vertical: 0),
                                                child: Column(
                                                  children: [
                                                    ListTile(
                                                      tileColor: (_selectedItems
                                                          .contains(
                                                          index))
                                                          ? const Color
                                                          .fromARGB(
                                                          255,
                                                          218,
                                                          218,
                                                          219)
                                                          .withOpacity(
                                                          0.5)
                                                          : Colors
                                                          .transparent,
                                                      title: Row(
                                                        children: [
                                                          Text(
                                                            '${value.dataList.data!.data?[index].batch_name}',
                                                            style: const TextStyle(
                                                                color: Color.fromRGBO(
                                                                    57,
                                                                    64,
                                                                    74,
                                                                    1),
                                                                fontSize:
                                                                14,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w700,
                                                                fontFamily:
                                                                'Loto-Regular'),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Chip(
                                                              backgroundColor: value.dataList.data!.data?[index].status ==
                                                                  'scheduled'
                                                                  ? Colors
                                                                  .green
                                                                  .withOpacity(.2)
                                                                  : value.dataList.data!.data?[index].status == 'canceled'
                                                                  ? Colors.red.withOpacity(.2)
                                                                  : Colors.brown.withOpacity(.2),
                                                              label: Text(
                                                                '${value.dataList.data!.data?[index].status}',
                                                                style: TextStyle(
                                                                    color: value.dataList.data!.data?[index].status == 'scheduled'
                                                                        ? Colors.green
                                                                        : value.dataList.data!.data?[index].status == 'canceled'
                                                                        ? Colors.red
                                                                        : Colors.brown),
                                                              )),
                                                        ],
                                                      ),
                                                      subtitle:
                                                      RichText(
                                                        text: TextSpan(
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                                text:
                                                                '${value.dataList.data!.data?[index].program_name} ',
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color: Colors.black)),
                                                            TextSpan(
                                                                text:
                                                                " - ",
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color: Colors.black)),
                                                            TextSpan(
                                                              text:
                                                              '${value.dataList.data!.data?[index].syy}-${value.dataList.data!.data?[index].smm}-${value.dataList.data!.data?[index].sdd}',
                                                              style: const TextStyle(
                                                                  fontWeight: FontWeight
                                                                      .bold,
                                                                  color:
                                                                  Colors.black),
                                                            ),
                                                            TextSpan(
                                                                text:
                                                                " - ",
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color: Colors.black)),
                                                            TextSpan(
                                                                text:
                                                                '  ${value.dataList.data!.data?[index].batch_timing_from} to ${value.dataList.data!.data?[index].batch_timing_to}',
                                                                style: const TextStyle(
                                                                    color:
                                                                    Colors.black)),
                                                          ],
                                                        ),
                                                      ),
                                                      trailing:
                                                      CircleAvatar(
                                                        backgroundColor:
                                                        Colors
                                                            .transparent,
                                                        radius: 14,
                                                        child: Image(
                                                            image: NetworkImage(
                                                                "${AppUrl.serviceIconEndPoint}${value.dataList.data!.data?[index].service_iconname}")),
                                                      ),
                                                      onTap: () {
                                                        print(value
                                                            .dataList
                                                            .data!
                                                            .data?[
                                                        index]
                                                            .status);
                                                        if (value
                                                            .dataList
                                                            .data!
                                                            .data?[
                                                        index]
                                                            .status ==
                                                            'scheduled') {
                                                          Get.to(
                                                                  () =>
                                                                  ViewSessionalDetails(
                                                                    id: "${value.dataList.data!.data?[index].uid}",
                                                                    serviceIcon:
                                                                    value.dataList.data!.data?[index].service_iconname,
                                                                  ),
                                                              transition:
                                                              Transition
                                                                  .leftToRight);
                                                        } else if (value
                                                            .dataList
                                                            .data!
                                                            .data?[
                                                        index]
                                                            .status ==
                                                            'close') {
                                                          Get.to(
                                                                  () => ViewDetailClosed(
                                                                  id:
                                                                  "${value.dataList.data!.data?[index].uid}"),
                                                              transition:
                                                              Transition
                                                                  .leftToRight);
                                                        } else if (value
                                                            .dataList
                                                            .data!
                                                            .data![
                                                        index]
                                                            .status ==
                                                            'cancel') {
                                                          Get.to(
                                                                  () => SessionDetailCancel(
                                                                  uid: value
                                                                      .dataList
                                                                      .data!
                                                                      .data![
                                                                  index]
                                                                      .uid
                                                                      .toString()),
                                                              transition:
                                                              Transition
                                                                  .leftToRight);
                                                        }
                                                      },
                                                      onLongPress: () {
                                                        if (!_selectedItems
                                                            .contains(
                                                            index)) {
                                                          setState(() {
                                                            _selectedItems
                                                                .add(
                                                                index);
                                                          });
                                                        } else {
                                                          setState(() {
                                                            _selectedItems.removeWhere(
                                                                    (val) =>
                                                                val ==
                                                                    index);
                                                          });
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
                                                  : const SizedBox();
                                            } else {
                                              return Padding(
                                                padding: const EdgeInsets.all(
                                                    16.0),
                                                child: Center(
                                                    child: value.loading
                                                        ? const CircularProgressIndicator()
                                                        : const SizedBox()
                                                  // Empty SizedBox when not loading
                                                ),
                                              );
                                            }
                                          })
                                          : ListView.builder(
                                          controller: _scrollController,
                                          itemCount: value.dataList.data!
                                              .data!.length +
                                              1,
                                          itemBuilder: (context, index) {
                                            // print("uid of batch ==${value.dataList.data!.data?[index].sdd}");
                                            if (index <
                                                value.dataList.data!.data!
                                                    .length) {
                                              return value
                                                  .dataList
                                                  .data!
                                                  .data![index]
                                                  .status ==
                                                  "cancel"
                                                  ? Card(
                                                // key: ValueKey(_foundUsers[index]["id"]),
                                                elevation: 0,
                                                margin: const EdgeInsets
                                                    .symmetric(
                                                    vertical: 0),
                                                child: Column(
                                                  children: [
                                                    ListTile(
                                                      tileColor: (_selectedItems
                                                          .contains(
                                                          index))
                                                          ? const Color
                                                          .fromARGB(
                                                          255,
                                                          218,
                                                          218,
                                                          219)
                                                          .withOpacity(
                                                          0.5)
                                                          : Colors
                                                          .transparent,
                                                      title: Row(
                                                        children: [
                                                          Text(
                                                            '${value.dataList.data!.data?[index].batch_name}',
                                                            style: const TextStyle(
                                                                color: Color.fromRGBO(
                                                                    57,
                                                                    64,
                                                                    74,
                                                                    1),
                                                                fontSize:
                                                                14,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w700,
                                                                fontFamily:
                                                                'Loto-Regular'),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Chip(
                                                              backgroundColor: value.dataList.data!.data?[index].status ==
                                                                  'scheduled'
                                                                  ? Colors
                                                                  .green
                                                                  .withOpacity(.2)
                                                                  : value.dataList.data!.data?[index].status == 'canceled'
                                                                  ? Colors.red.withOpacity(.2)
                                                                  : Colors.brown.withOpacity(.2),
                                                              label: Text(
                                                                '${value.dataList.data!.data?[index].status}',
                                                                style: TextStyle(
                                                                    color: value.dataList.data!.data?[index].status == 'scheduled'
                                                                        ? Colors.green
                                                                        : value.dataList.data!.data?[index].status == 'canceled'
                                                                        ? Colors.red
                                                                        : Colors.brown),
                                                              )),
                                                        ],
                                                      ),
                                                      subtitle:
                                                      RichText(
                                                        text: TextSpan(
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                                text:
                                                                '${value.dataList.data!.data?[index].program_name} ',
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color: Colors.black)),
                                                            TextSpan(
                                                                text:
                                                                " - ",
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color: Colors.black)),
                                                            TextSpan(
                                                              text:
                                                              '${value.dataList.data!.data?[index].syy}-${value.dataList.data!.data?[index].smm}-${value.dataList.data!.data?[index].sdd}',
                                                              style: const TextStyle(
                                                                  fontWeight: FontWeight
                                                                      .bold,
                                                                  color:
                                                                  Colors.black),
                                                            ),
                                                            TextSpan(
                                                                text:
                                                                " - ",
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color: Colors.black)),
                                                            TextSpan(
                                                                text:
                                                                '  ${value.dataList.data!.data?[index].batch_timing_from} to ${value.dataList.data!.data?[index].batch_timing_to}',
                                                                style: const TextStyle(
                                                                    color:
                                                                    Colors.black)),
                                                          ],
                                                        ),
                                                      ),
                                                      trailing:
                                                      CircleAvatar(
                                                        backgroundColor:
                                                        Colors
                                                            .transparent,
                                                        radius: 14,
                                                        child: Image(
                                                            image: NetworkImage(
                                                                "${AppUrl.serviceIconEndPoint}${value.dataList.data!.data?[index].service_iconname}")),
                                                      ),
                                                      onTap: () {
                                                        print(value
                                                            .dataList
                                                            .data!
                                                            .data?[
                                                        index]
                                                            .status);
                                                        if (value
                                                            .dataList
                                                            .data!
                                                            .data?[
                                                        index]
                                                            .status ==
                                                            'scheduled') {
                                                          Get.to(
                                                                  () =>
                                                                  ViewSessionalDetails(
                                                                    id: "${value.dataList.data!.data?[index].uid}",
                                                                    serviceIcon:
                                                                    value.dataList.data!.data?[index].service_iconname,
                                                                  ),
                                                              transition:
                                                              Transition
                                                                  .leftToRight);
                                                        } else if (value
                                                            .dataList
                                                            .data!
                                                            .data?[
                                                        index]
                                                            .status ==
                                                            'close') {
                                                          Get.to(
                                                                  () => ViewDetailClosed(
                                                                  id:
                                                                  "${value.dataList.data!.data?[index].uid}"),
                                                              transition:
                                                              Transition
                                                                  .leftToRight);
                                                        } else if (value
                                                            .dataList
                                                            .data!
                                                            .data![
                                                        index]
                                                            .status ==
                                                            'cancel') {
                                                          Get.to(
                                                                  () => SessionDetailCancel(
                                                                  uid: value
                                                                      .dataList
                                                                      .data!
                                                                      .data![
                                                                  index]
                                                                      .uid
                                                                      .toString()),
                                                              transition:
                                                              Transition
                                                                  .leftToRight);
                                                        }
                                                      },
                                                      onLongPress: () {
                                                        if (!_selectedItems
                                                            .contains(
                                                            index)) {
                                                          setState(() {
                                                            _selectedItems
                                                                .add(
                                                                index);
                                                          });
                                                        } else {
                                                          setState(() {
                                                            _selectedItems.removeWhere(
                                                                    (val) =>
                                                                val ==
                                                                    index);
                                                          });
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
                                                  : const SizedBox();
                                            } else {
                                              return Padding(
                                                padding: const EdgeInsets.all(
                                                    16.0),
                                                child: Center(
                                                    child: value.loading
                                                        ? const CircularProgressIndicator()
                                                        : const SizedBox()
                                                  // Empty SizedBox when not loading
                                                ),
                                              );
                                            }
                                          })
                                      :ListView.builder(
                                          controller: _scrollController,
                                          itemCount: value.dataList.data!
                                              .data!.length +
                                              1,
                                          itemBuilder: (context, index) {
                                            // print("uid of batch ==${value.dataList.data!.data?[index].sdd}");
                                            if (index <
                                                value.dataList.data!.data!
                                                    .length) {
                                              return value
                                                  .dataList
                                                  .data!
                                                  .data![index]
                                                  .status ==
                                                  "cancel"
                                                  ? Card(
                                                // key: ValueKey(_foundUsers[index]["id"]),
                                                elevation: 0,
                                                margin: const EdgeInsets
                                                    .symmetric(
                                                    vertical: 0),
                                                child: Column(
                                                  children: [
                                                    ListTile(
                                                      tileColor: (_selectedItems
                                                          .contains(
                                                          index))
                                                          ? const Color
                                                          .fromARGB(
                                                          255,
                                                          218,
                                                          218,
                                                          219)
                                                          .withOpacity(
                                                          0.5)
                                                          : Colors
                                                          .transparent,
                                                      title: Row(
                                                        children: [
                                                          Text(
                                                            '${value.dataList.data!.data?[index].batch_name}',
                                                            style: const TextStyle(
                                                                color: Color.fromRGBO(
                                                                    57,
                                                                    64,
                                                                    74,
                                                                    1),
                                                                fontSize:
                                                                14,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w700,
                                                                fontFamily:
                                                                'Loto-Regular'),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Chip(
                                                              backgroundColor: value.dataList.data!.data?[index].status ==
                                                                  'scheduled'
                                                                  ? Colors
                                                                  .green
                                                                  .withOpacity(.2)
                                                                  : value.dataList.data!.data?[index].status == 'cancel'
                                                                  ? Colors.red.withOpacity(.2)
                                                                  : Colors.brown.withOpacity(.2),
                                                              label: Text(
                                                                '${value.dataList.data!.data?[index].status}',
                                                                style: TextStyle(
                                                                    color: value.dataList.data!.data?[index].status == 'scheduled'
                                                                        ? Colors.green
                                                                        : value.dataList.data!.data?[index].status == 'cancel'
                                                                        ? Colors.red
                                                                        : Colors.brown),
                                                              )),
                                                        ],
                                                      ),
                                                      subtitle:
                                                      RichText(
                                                        text: TextSpan(
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                                text:
                                                                '${value.dataList.data!.data?[index].program_name} ',
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color: Colors.black)),
                                                            TextSpan(
                                                                text:
                                                                " - ",
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color: Colors.black)),
                                                            TextSpan(
                                                              text:
                                                              '${value.dataList.data!.data?[index].syy}-${value.dataList.data!.data?[index].smm}-${value.dataList.data!.data?[index].sdd}',
                                                              style: const TextStyle(
                                                                  fontWeight: FontWeight
                                                                      .bold,
                                                                  color:
                                                                  Colors.black),
                                                            ),
                                                            TextSpan(
                                                                text:
                                                                " - ",
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color: Colors.black)),
                                                            TextSpan(
                                                                text:
                                                                '  ${value.dataList.data!.data?[index].batch_timing_from} to ${value.dataList.data!.data?[index].batch_timing_to}',
                                                                style: const TextStyle(
                                                                    color:
                                                                    Colors.black)),
                                                          ],
                                                        ),
                                                      ),
                                                      trailing:
                                                      CircleAvatar(
                                                        backgroundColor:
                                                        Colors
                                                            .transparent,
                                                        radius: 14,
                                                        child: Image(
                                                            image: NetworkImage(
                                                                "${AppUrl.serviceIconEndPoint}${value.dataList.data!.data?[index].service_iconname}")),
                                                      ),
                                                      onTap: () {
                                                        print(value
                                                            .dataList
                                                            .data!
                                                            .data?[
                                                        index]
                                                            .status);
                                                        if (value
                                                            .dataList
                                                            .data!
                                                            .data?[
                                                        index]
                                                            .status ==
                                                            'scheduled') {
                                                          Get.to(
                                                                  () =>
                                                                  ViewSessionalDetails(
                                                                    id: "${value.dataList.data!.data?[index].uid}",
                                                                    serviceIcon:
                                                                    value.dataList.data!.data?[index].service_iconname,
                                                                  ),
                                                              transition:
                                                              Transition
                                                                  .leftToRight);
                                                        } else if (value
                                                            .dataList
                                                            .data!
                                                            .data?[
                                                        index]
                                                            .status ==
                                                            'close') {
                                                          Get.to(
                                                                  () => ViewDetailClosed(
                                                                  id:
                                                                  "${value.dataList.data!.data?[index].uid}"),
                                                              transition:
                                                              Transition
                                                                  .leftToRight);
                                                        } else if (value
                                                            .dataList
                                                            .data!
                                                            .data![
                                                        index]
                                                            .status ==
                                                            'cancel') {
                                                          Get.to(
                                                                  () => SessionDetailCancel(
                                                                  uid: value
                                                                      .dataList
                                                                      .data!
                                                                      .data![
                                                                  index]
                                                                      .uid
                                                                      .toString()),
                                                              transition:
                                                              Transition
                                                                  .leftToRight);
                                                        }
                                                      },
                                                      onLongPress: () {
                                                        if (!_selectedItems
                                                            .contains(
                                                            index)) {
                                                          setState(() {
                                                            _selectedItems
                                                                .add(
                                                                index);
                                                          });
                                                        } else {
                                                          setState(() {
                                                            _selectedItems.removeWhere(
                                                                    (val) =>
                                                                val ==
                                                                    index);
                                                          });
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
                                                  : const SizedBox();
                                            } else {
                                              return Padding(
                                                padding: const EdgeInsets.all(
                                                    16.0),
                                                child: Center(
                                                    child: value.loading
                                                        ? const CircularProgressIndicator()
                                                        : const SizedBox()
                                                  // Empty SizedBox when not loading
                                                ),
                                              );
                                            }
                                          }),


                                      searchController.text == ""
                                          ? (fromDataController
                                          .text.isEmpty &&
                                          toDateController
                                              .text.isEmpty)
                                          ?
                                      ListView.builder(
                                          controller: _scrollController,
                                          itemCount: value.dataList.data!
                                              .data!.length +
                                              1,
                                          itemBuilder: (context, index) {
                                            // print("uid of batch ==${value.dataList.data!.data?[index].sdd}");
                                            if (index <
                                                value.dataList.data!.data!
                                                    .length) {
                                              return value
                                                  .dataList
                                                  .data!
                                                  .data![index]
                                                  .status ==
                                                  "close"
                                                  ? Card(
                                                // key: ValueKey(_foundUsers[index]["id"]),
                                                elevation: 0,
                                                margin: const EdgeInsets
                                                    .symmetric(
                                                    vertical: 0),
                                                child: Column(
                                                  children: [
                                                    ListTile(
                                                      tileColor: (_selectedItems
                                                          .contains(
                                                          index))
                                                          ? const Color
                                                          .fromARGB(
                                                          255,
                                                          218,
                                                          218,
                                                          219)
                                                          .withOpacity(
                                                          0.5)
                                                          : Colors
                                                          .transparent,
                                                      title: Row(
                                                        children: [
                                                          Text(
                                                            '${value.dataList.data!.data?[index].batch_name}',
                                                            style: const TextStyle(
                                                                color: Color.fromRGBO(
                                                                    57,
                                                                    64,
                                                                    74,
                                                                    1),
                                                                fontSize:
                                                                14,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w700,
                                                                fontFamily:
                                                                'Loto-Regular'),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Chip(
                                                              backgroundColor: value.dataList.data!.data?[index].status ==
                                                                  'scheduled'
                                                                  ? Colors
                                                                  .green
                                                                  .withOpacity(.2)
                                                                  : value.dataList.data!.data?[index].status == 'cancel'
                                                                  ? Colors.red.withOpacity(.2)
                                                                  : Colors.brown.withOpacity(.2),
                                                              label: Text(
                                                                '${value.dataList.data!.data?[index].status}',
                                                                style: TextStyle(
                                                                    color: value.dataList.data!.data?[index].status == 'scheduled'
                                                                        ? Colors.green
                                                                        : value.dataList.data!.data?[index].status == 'cancel'
                                                                        ? Colors.red
                                                                        : Colors.brown),
                                                              )),
                                                        ],
                                                      ),
                                                      subtitle:
                                                      RichText(
                                                        text: TextSpan(
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                                text:
                                                                '${value.dataList.data!.data?[index].program_name} ',
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color: Colors.black)),
                                                            TextSpan(
                                                                text:
                                                                " - ",
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color: Colors.black)),
                                                            TextSpan(
                                                              text:
                                                              '${value.dataList.data!.data?[index].syy}-${value.dataList.data!.data?[index].smm}-${value.dataList.data!.data?[index].sdd}',
                                                              style: const TextStyle(
                                                                  fontWeight: FontWeight
                                                                      .bold,
                                                                  color:
                                                                  Colors.black),
                                                            ),
                                                            TextSpan(
                                                                text:
                                                                " - ",
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color: Colors.black)),
                                                            TextSpan(
                                                                text:
                                                                '  ${value.dataList.data!.data?[index].batch_timing_from} to ${value.dataList.data!.data?[index].batch_timing_to}',
                                                                style: const TextStyle(
                                                                    color:
                                                                    Colors.black)),
                                                          ],
                                                        ),
                                                      ),
                                                      trailing:
                                                      CircleAvatar(
                                                        backgroundColor:
                                                        Colors
                                                            .transparent,
                                                        radius: 14,
                                                        child: Image(
                                                            image: NetworkImage(
                                                                "${AppUrl.serviceIconEndPoint}${value.dataList.data!.data?[index].service_iconname}")),
                                                      ),
                                                      onTap: () {
                                                        print(value
                                                            .dataList
                                                            .data!
                                                            .data?[
                                                        index]
                                                            .status);
                                                        if (value
                                                            .dataList
                                                            .data!
                                                            .data?[
                                                        index]
                                                            .status ==
                                                            'scheduled') {
                                                          Get.to(
                                                                  () =>
                                                                  ViewSessionalDetails(
                                                                    id: "${value.dataList.data!.data?[index].uid}",
                                                                    serviceIcon:
                                                                    value.dataList.data!.data?[index].service_iconname,
                                                                  ),
                                                              transition:
                                                              Transition
                                                                  .leftToRight);
                                                        } else if (value
                                                            .dataList
                                                            .data!
                                                            .data?[
                                                        index]
                                                            .status ==
                                                            'close') {
                                                          Get.to(
                                                                  () => ViewDetailClosed(
                                                                  id:
                                                                  "${value.dataList.data!.data?[index].uid}"),
                                                              transition:
                                                              Transition
                                                                  .leftToRight);
                                                        } else if (value
                                                            .dataList
                                                            .data!
                                                            .data![
                                                        index]
                                                            .status ==
                                                            'cancel') {
                                                          Get.to(
                                                                  () => SessionDetailCancel(
                                                                  uid: value
                                                                      .dataList
                                                                      .data!
                                                                      .data![
                                                                  index]
                                                                      .uid
                                                                      .toString()),
                                                              transition:
                                                              Transition
                                                                  .leftToRight);
                                                        }
                                                      },
                                                      onLongPress: () {
                                                        if (!_selectedItems
                                                            .contains(
                                                            index)) {
                                                          setState(() {
                                                            _selectedItems
                                                                .add(
                                                                index);
                                                          });
                                                        } else {
                                                          setState(() {
                                                            _selectedItems.removeWhere(
                                                                    (val) =>
                                                                val ==
                                                                    index);
                                                          });
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
                                                  : const SizedBox();
                                            } else {
                                              return Padding(
                                                padding: const EdgeInsets.all(
                                                    16.0),
                                                child: Center(
                                                    child: value.loading
                                                        ? const CircularProgressIndicator()
                                                        : const SizedBox()
                                                  // Empty SizedBox when not loading
                                                ),
                                              );
                                            }
                                          })
                                          :ListView.builder(
                                          controller: _scrollController,
                                          itemCount: value.dataList.data!
                                              .data!.length +
                                              1,
                                          itemBuilder: (context, index) {
                                            // print("uid of batch ==${value.dataList.data!.data?[index].sdd}");
                                            if (index <
                                                value.dataList.data!.data!
                                                    .length) {
                                              return value
                                                  .dataList
                                                  .data!
                                                  .data![index]
                                                  .status ==
                                                  "close"
                                                  ? Card(
                                                // key: ValueKey(_foundUsers[index]["id"]),
                                                elevation: 0,
                                                margin: const EdgeInsets
                                                    .symmetric(
                                                    vertical: 0),
                                                child: Column(
                                                  children: [
                                                    ListTile(
                                                      tileColor: (_selectedItems
                                                          .contains(
                                                          index))
                                                          ? const Color
                                                          .fromARGB(
                                                          255,
                                                          218,
                                                          218,
                                                          219)
                                                          .withOpacity(
                                                          0.5)
                                                          : Colors
                                                          .transparent,
                                                      title: Row(
                                                        children: [
                                                          Text(
                                                            '${value.dataList.data!.data?[index].batch_name}',
                                                            style: const TextStyle(
                                                                color: Color.fromRGBO(
                                                                    57,
                                                                    64,
                                                                    74,
                                                                    1),
                                                                fontSize:
                                                                14,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w700,
                                                                fontFamily:
                                                                'Loto-Regular'),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Chip(
                                                              backgroundColor: value.dataList.data!.data?[index].status ==
                                                                  'scheduled'
                                                                  ? Colors
                                                                  .green
                                                                  .withOpacity(.2)
                                                                  : value.dataList.data!.data?[index].status == 'cancel'
                                                                  ? Colors.red.withOpacity(.2)
                                                                  : Colors.brown.withOpacity(.2),
                                                              label: Text(
                                                                '${value.dataList.data!.data?[index].status}',
                                                                style: TextStyle(
                                                                    color: value.dataList.data!.data?[index].status == 'scheduled'
                                                                        ? Colors.green
                                                                        : value.dataList.data!.data?[index].status == 'cancel'
                                                                        ? Colors.red
                                                                        : Colors.brown),
                                                              )),
                                                        ],
                                                      ),
                                                      subtitle:
                                                      RichText(
                                                        text: TextSpan(
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                                text:
                                                                '${value.dataList.data!.data?[index].program_name} ',
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color: Colors.black)),
                                                            TextSpan(
                                                                text:
                                                                " - ",
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color: Colors.black)),
                                                            TextSpan(
                                                              text:
                                                              '${value.dataList.data!.data?[index].syy}-${value.dataList.data!.data?[index].smm}-${value.dataList.data!.data?[index].sdd}',
                                                              style: const TextStyle(
                                                                  fontWeight: FontWeight
                                                                      .bold,
                                                                  color:
                                                                  Colors.black),
                                                            ),
                                                            TextSpan(
                                                                text:
                                                                " - ",
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color: Colors.black)),
                                                            TextSpan(
                                                                text:
                                                                '  ${value.dataList.data!.data?[index].batch_timing_from} to ${value.dataList.data!.data?[index].batch_timing_to}',
                                                                style: const TextStyle(
                                                                    color:
                                                                    Colors.black)),
                                                          ],
                                                        ),
                                                      ),
                                                      trailing:
                                                      CircleAvatar(
                                                        backgroundColor:
                                                        Colors
                                                            .transparent,
                                                        radius: 14,
                                                        child: Image(
                                                            image: NetworkImage(
                                                                "${AppUrl.serviceIconEndPoint}${value.dataList.data!.data?[index].service_iconname}")),
                                                      ),
                                                      onTap: () {
                                                        print(value
                                                            .dataList
                                                            .data!
                                                            .data?[
                                                        index]
                                                            .status);
                                                        if (value
                                                            .dataList
                                                            .data!
                                                            .data?[
                                                        index]
                                                            .status ==
                                                            'scheduled') {
                                                          Get.to(
                                                                  () =>
                                                                  ViewSessionalDetails(
                                                                    id: "${value.dataList.data!.data?[index].uid}",
                                                                    serviceIcon:
                                                                    value.dataList.data!.data?[index].service_iconname,
                                                                  ),
                                                              transition:
                                                              Transition
                                                                  .leftToRight);
                                                        } else if (value
                                                            .dataList
                                                            .data!
                                                            .data?[
                                                        index]
                                                            .status ==
                                                            'close') {
                                                          Get.to(
                                                                  () => ViewDetailClosed(
                                                                  id:
                                                                  "${value.dataList.data!.data?[index].uid}"),
                                                              transition:
                                                              Transition
                                                                  .leftToRight);
                                                        } else if (value
                                                            .dataList
                                                            .data!
                                                            .data![
                                                        index]
                                                            .status ==
                                                            'cancel') {
                                                          Get.to(
                                                                  () => SessionDetailCancel(
                                                                  uid: value
                                                                      .dataList
                                                                      .data!
                                                                      .data![
                                                                  index]
                                                                      .uid
                                                                      .toString()),
                                                              transition:
                                                              Transition
                                                                  .leftToRight);
                                                        }
                                                      },
                                                      onLongPress: () {
                                                        if (!_selectedItems
                                                            .contains(
                                                            index)) {
                                                          setState(() {
                                                            _selectedItems
                                                                .add(
                                                                index);
                                                          });
                                                        } else {
                                                          setState(() {
                                                            _selectedItems.removeWhere(
                                                                    (val) =>
                                                                val ==
                                                                    index);
                                                          });
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
                                                  : const SizedBox();
                                            } else {
                                              return Padding(
                                                padding: const EdgeInsets.all(
                                                    16.0),
                                                child: Center(
                                                    child: value.loading
                                                        ? const CircularProgressIndicator()
                                                        : const SizedBox()
                                                  // Empty SizedBox when not loading
                                                ),
                                              );
                                            }
                                          })
                                          :ListView.builder(
                                          controller: _scrollController,
                                          itemCount: value.dataList.data!
                                              .data!.length +
                                              1,
                                          itemBuilder: (context, index) {
                                            // print("uid of batch ==${value.dataList.data!.data?[index].sdd}");
                                            if (index <
                                                value.dataList.data!.data!
                                                    .length) {
                                              return value
                                                  .dataList
                                                  .data!
                                                  .data![index]
                                                  .status ==
                                                  "close"
                                                  ? Card(
                                                // key: ValueKey(_foundUsers[index]["id"]),
                                                elevation: 0,
                                                margin: const EdgeInsets
                                                    .symmetric(
                                                    vertical: 0),
                                                child: Column(
                                                  children: [
                                                    ListTile(
                                                      tileColor: (_selectedItems
                                                          .contains(
                                                          index))
                                                          ? const Color
                                                          .fromARGB(
                                                          255,
                                                          218,
                                                          218,
                                                          219)
                                                          .withOpacity(
                                                          0.5)
                                                          : Colors
                                                          .transparent,
                                                      title: Row(
                                                        children: [
                                                          Text(
                                                            '${value.dataList.data!.data?[index].batch_name}',
                                                            style: const TextStyle(
                                                                color: Color.fromRGBO(
                                                                    57,
                                                                    64,
                                                                    74,
                                                                    1),
                                                                fontSize:
                                                                14,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w700,
                                                                fontFamily:
                                                                'Loto-Regular'),
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Chip(
                                                              backgroundColor: value.dataList.data!.data?[index].status ==
                                                                  'scheduled'
                                                                  ? Colors
                                                                  .green
                                                                  .withOpacity(.2)
                                                                  : value.dataList.data!.data?[index].status == 'canceled'
                                                                  ? Colors.red.withOpacity(.2)
                                                                  : Colors.brown.withOpacity(.2),
                                                              label: Text(
                                                                '${value.dataList.data!.data?[index].status}',
                                                                style: TextStyle(
                                                                    color: value.dataList.data!.data?[index].status == 'scheduled'
                                                                        ? Colors.green
                                                                        : value.dataList.data!.data?[index].status == 'canceled'
                                                                        ? Colors.red
                                                                        : Colors.brown),
                                                              )),
                                                        ],
                                                      ),
                                                      subtitle:
                                                      RichText(
                                                        text: TextSpan(
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                                text:
                                                                '${value.dataList.data!.data?[index].program_name} ',
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color: Colors.black)),
                                                            TextSpan(
                                                                text:
                                                                " - ",
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color: Colors.black)),
                                                            TextSpan(
                                                              text:
                                                              '${value.dataList.data!.data?[index].syy}-${value.dataList.data!.data?[index].smm}-${value.dataList.data!.data?[index].sdd}',
                                                              style: const TextStyle(
                                                                  fontWeight: FontWeight
                                                                      .bold,
                                                                  color:
                                                                  Colors.black),
                                                            ),
                                                            TextSpan(
                                                                text:
                                                                " - ",
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color: Colors.black)),
                                                            TextSpan(
                                                                text:
                                                                '  ${value.dataList.data!.data?[index].batch_timing_from} to ${value.dataList.data!.data?[index].batch_timing_to}',
                                                                style: const TextStyle(
                                                                    color:
                                                                    Colors.black)),
                                                          ],
                                                        ),
                                                      ),
                                                      trailing:
                                                      CircleAvatar(
                                                        backgroundColor:
                                                        Colors
                                                            .transparent,
                                                        radius: 14,
                                                        child: Image(
                                                            image: NetworkImage(
                                                                "${AppUrl.serviceIconEndPoint}${value.dataList.data!.data?[index].service_iconname}")),
                                                      ),
                                                      onTap: () {
                                                        print(value
                                                            .dataList
                                                            .data!
                                                            .data?[
                                                        index]
                                                            .status);
                                                        if (value
                                                            .dataList
                                                            .data!
                                                            .data?[
                                                        index]
                                                            .status ==
                                                            'scheduled') {
                                                          Get.to(
                                                                  () =>
                                                                  ViewSessionalDetails(
                                                                    id: "${value.dataList.data!.data?[index].uid}",
                                                                    serviceIcon:
                                                                    value.dataList.data!.data?[index].service_iconname,
                                                                  ),
                                                              transition:
                                                              Transition
                                                                  .leftToRight);
                                                        } else if (value
                                                            .dataList
                                                            .data!
                                                            .data?[
                                                        index]
                                                            .status ==
                                                            'close') {
                                                          Get.to(
                                                                  () => ViewDetailClosed(
                                                                  id:
                                                                  "${value.dataList.data!.data?[index].uid}"),
                                                              transition:
                                                              Transition
                                                                  .leftToRight);
                                                        } else if (value
                                                            .dataList
                                                            .data!
                                                            .data![
                                                        index]
                                                            .status ==
                                                            'cancel') {
                                                          Get.to(
                                                                  () => SessionDetailCancel(
                                                                  uid: value
                                                                      .dataList
                                                                      .data!
                                                                      .data![
                                                                  index]
                                                                      .uid
                                                                      .toString()),
                                                              transition:
                                                              Transition
                                                                  .leftToRight);
                                                        }
                                                      },
                                                      onLongPress: () {
                                                        if (!_selectedItems
                                                            .contains(
                                                            index)) {
                                                          setState(() {
                                                            _selectedItems
                                                                .add(
                                                                index);
                                                          });
                                                        } else {
                                                          setState(() {
                                                            _selectedItems.removeWhere(
                                                                    (val) =>
                                                                val ==
                                                                    index);
                                                          });
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
                                                  : const SizedBox();
                                            } else {
                                              return Padding(
                                                padding: const EdgeInsets.all(
                                                    16.0),
                                                child: Center(
                                                    child: value.loading
                                                        ? const CircularProgressIndicator()
                                                        : const SizedBox()
                                                  // Empty SizedBox when not loading
                                                ),
                                              );
                                            }
                                          })
                                    ],
                                  ),
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
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //notification invitation send
  Future<bool> showExitPopup(context) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SizedBox(
              height: 170,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Send invite ",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        fontFamily: 'Loto-Regular'),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  const Text(
                    "Send invitation to all the coaches",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        fontFamily: 'Loto-Regular'),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  const SizedBox(height: 15),
                  RoundButton(
                    loading: false,
                    title: 'Okay',
                    textColor: Colors.white,
                    rounded: true,
                    color: Theme.of(context).primaryColor,
                    onPress: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          );
        });
  }
}

