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

class SessionList extends StatefulWidget {
  const SessionList({super.key});

  @override
  State<SessionList> createState() => _SessionListState();
}

enum Status { sheduled, close, cancel }

class _SessionListState extends State<SessionList> {
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;

  final List<int> _selectedItems = <int>[];

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
    },
  ];
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
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
                           builder: (BuildContext context) =>
                               const SessionalDetails(),
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
                DefaultTabController(
                    length: 5,
                    initialIndex: 0,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          TabBar(
                            indicatorPadding: EdgeInsets.all(10),
                            isScrollable: true,
                            labelColor: Colors.black,
                            labelPadding: EdgeInsets.all(0),
                            unselectedLabelColor: Colors.grey,
                            tabs: [
                              SizedBox(
                                height: 60,
                                width: 180,
                                child: TextFormField(
                                  // controller: acadmicName,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                      hintText: 'Jan 2022 to Mar 2023',
                                      contentPadding: const EdgeInsets.all(10),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      prefixIcon: Icon(Icons.date_range)),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 10, left: 10),
                                child: Chip(
                                  label: Text(
                                    'All',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  avatar: CircleAvatar(
                                    backgroundColor: Colors.blue.shade100,
                                    child: Text('3'),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Chip(
                                  backgroundColor:
                                      Color.fromARGB(255, 242, 242, 242),
                                  label: Text(
                                    'Scheduled',
                                  ),
                                  avatar: CircleAvatar(
                                    backgroundColor: Colors.green.shade100,
                                    child: Text(
                                      '01',
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Chip(
                                  label: Text(
                                    'Canceled',
                                  ),
                                  avatar: CircleAvatar(
                                    backgroundColor: Colors.brown.shade100,
                                    child: Text('01'),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Chip(
                                  label: Text(
                                    'Closed',
                                  ),
                                  avatar: CircleAvatar(
                                    backgroundColor: Colors.redAccent.shade100,
                                    child: Text('01'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 400,
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: Colors.grey, width: 0.5))),
                            child: TabBarView(
                              children: <Widget>[
                                Text('tab 2'),
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
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const ViewSessionalDetails()));
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
                                Text('tab 2'),
                                Text('tab 2'),
                                Text('tab 2'),
                                Text('tab 2'),
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
                ],
              ),
            ),
          );
        });
  }
}
