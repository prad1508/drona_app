import 'package:drona/view/session_listing/view_detailsclosed.dart';
import 'package:drona/view/session_listing/view_session_details.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../res/language/language.dart';
import '../../res/widget/round_button.dart';
import '../layout.dart';
import '../profile/view_profile.dart';
import '../traine_invite.dart';
import 'create_session_details.dart';
import 'session_detailcancel.dart';

class SessionList extends StatefulWidget {
  const SessionList({super.key});

  @override
  State<SessionList> createState() => _SessionListState();
}

enum Status { sheduled, close, cancel }

class _SessionListState extends State<SessionList>
    with SingleTickerProviderStateMixin {
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;

  final List<int> _selectedItems = <int>[];
  late TabController _controller;
  int _selectedIndex = 0;
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
      "name": "Tenis Batch",
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
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    _foundUsers = _allUsers;
    super.initState();

    _controller = TabController(length: 4, vsync: this);
    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
    });
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
    final width = MediaQuery.of(context).size.width;
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
                onPressed: () => Navigator.of(context).pop(),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const SessionalDetails(),
                  ),
                );
              }),
              icon: const Icon(Icons.add),
              iconSize: 25,
              color: Colors.black,
            ),
          ],
        ),
        body: Material(
          color: Colors.white,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
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
                      onChanged: (value) => dataFilter(value),
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 0.0),
                          hintText: 'Search by Batch',
                          border: InputBorder.none),
                    ),
                    trailing: const Icon(Icons.search),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 60,
                  width: width * 1,
                  child: TextFormField(
                    // controller: acadmicName,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        hintText: 'Jan 2022 to Mar 2023',
                        contentPadding: const EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        prefixIcon: const Icon(Icons.date_range)),
                  ),
                ),
                DefaultTabController(
                    length: 4,
                    initialIndex: 0,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          TabBar(
                            controller: _controller,
                            indicatorPadding: EdgeInsets.zero,
                            dividerColor: Colors.transparent,
                            indicatorColor: Colors.transparent,
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.black,
                            isScrollable: true,
                            labelPadding: EdgeInsets.zero,
                            tabs: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 10, left: 10),
                                child: Chip(
                                  backgroundColor: _controller.index != 0
                                      ? const Color.fromARGB(255, 242, 242, 242)
                                      : Colors.blue.shade100,
                                  label: const Text(
                                    'All',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  avatar: CircleAvatar(
                                    backgroundColor: _controller.index != 0
                                        ? Colors.blue.shade100
                                        : const Color.fromARGB(
                                            255, 242, 242, 242),
                                    child: Text(_foundUsers.length.toString()),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Chip(
                                  backgroundColor: _controller.index != 1
                                      ? const Color.fromARGB(255, 242, 242, 242)
                                      : Colors.green.shade100,
                                  label: const Text(
                                    'Scheduled',
                                  ),
                                  avatar: CircleAvatar(
                                    backgroundColor: _controller.index != 1
                                        ? Colors.green.shade100
                                        : const Color.fromARGB(
                                            255, 242, 242, 242),
                                    child: const Text(
                                      '01',
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Chip(
                                  backgroundColor: _controller.index != 2
                                      ? const Color.fromARGB(255, 242, 242, 242)
                                      : Colors.brown.shade100,
                                  label: const Text(
                                    'Canceled',
                                  ),
                                  avatar: CircleAvatar(
                                    backgroundColor: _controller.index != 2
                                        ? Colors.brown.shade100
                                        : const Color.fromARGB(
                                            255, 242, 242, 242),
                                    child: const Text('01'),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Chip(
                                  backgroundColor: _controller.index != 3
                                      ? const Color.fromARGB(255, 242, 242, 242)
                                      : Colors.redAccent.shade100,
                                  label: const Text(
                                    'Closed',
                                  ),
                                  avatar: CircleAvatar(
                                    backgroundColor: _controller.index != 3
                                        ? Colors.redAccent.shade100
                                        : const Color.fromARGB(
                                            255, 242, 242, 242),
                                    child: const Text('01'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 400,
                            decoration: const BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: Colors.grey, width: 0.5))),
                            child: TabBarView(
                              controller: _controller,
                              children: <Widget>[
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [],
                                    ),
                                    Expanded(
                                      child: _foundUsers.isNotEmpty
                                          ? ListView.builder(
                                              itemCount: _foundUsers.length,
                                              itemBuilder: (context, index) =>
                                                  Card(
                                                key: ValueKey(
                                                    _foundUsers[index]["id"]),
                                                elevation: 0,
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 0),
                                                child: Column(
                                                  children: [
                                                    ListTile(
                                                      tileColor: (_selectedItems
                                                              .contains(index))
                                                          ? const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  218,
                                                                  218,
                                                                  219)
                                                              .withOpacity(0.5)
                                                          : Colors.transparent,
                                                      title: Row(
                                                        children: [
                                                          Text(
                                                            _foundUsers[index]
                                                                ['name'],
                                                            style: const TextStyle(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        57,
                                                                        64,
                                                                        74,
                                                                        1),
                                                                fontSize: 14,
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
                                                              backgroundColor:
                                                                  _foundUsers[index]
                                                                          [
                                                                          'color']
                                                                      .withOpacity(
                                                                          .2),
                                                              label: Text(
                                                                _foundUsers[
                                                                        index]
                                                                    ["status"],
                                                                style: TextStyle(
                                                                    color: _foundUsers[
                                                                            index]
                                                                        [
                                                                        'color']),
                                                              )),
                                                        ],
                                                      ),
                                                      subtitle: RichText(
                                                        text: TextSpan(
                                                          children: <TextSpan>[
                                                            TextSpan(
                                                                text:
                                                                    "${_foundUsers[index]["level"]} ",
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .black)),
                                                            TextSpan(
                                                                text: _foundUsers[
                                                                            index]
                                                                        [
                                                                        "detail"]
                                                                    .toString(),
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .black)),
                                                          ],
                                                        ),
                                                      ),
                                                      trailing: CircleAvatar(
                                                        radius: 12,
                                                        child: Image(
                                                            image: AssetImage(
                                                                _foundUsers[
                                                                        index][
                                                                    "categorgyImg"])),
                                                      ),
                                                      onTap: () {
                                                        if (_foundUsers[index]
                                                                    ["status"]
                                                                .toString() ==
                                                            'Scheduled') {
                                                          Navigator.of(context).push(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          const ViewSessionalDetails()));
                                                        } else if (_foundUsers[
                                                                        index]
                                                                    ["status"]
                                                                .toString() ==
                                                            'Closed') {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (BuildContext
                                                                      context) =>
                                                                  const ViewDetailClosed(),
                                                            ),
                                                          );
                                                        } else if (_foundUsers[
                                                                        index]
                                                                    ["status"]
                                                                .toString() ==
                                                            'Cancel') {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (BuildContext
                                                                      context) =>
                                                                  const SessionDetailCancel(),
                                                            ),
                                                          );
                                                        }
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
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          : const Text(
                                              'No results found',
                                              style: TextStyle(fontSize: 24),
                                            ),
                                    ),
                                  ],
                                ),
                                const Text('tab 2'),
                                const Text('tab 3'),
                                const Text('tab 4'),
                              ],
                            ),
                          )
                        ])),
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
