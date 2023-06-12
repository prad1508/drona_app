import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import 'session_detail_edit.dart';

class ViewDetailClosed extends StatefulWidget {
  String id;
  ViewDetailClosed({super.key, required this.id});

  @override
  State<ViewDetailClosed> createState() => _ViewDetailClosedState();
}

class _ViewDetailClosedState extends State<ViewDetailClosed> {
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;

  final List<int> _selectedItems = <int>[];
  bool value = false;
  final List<Map<String, dynamic>> _allUsers = [
    {
      "id": 1,
      "name": "Aarav saxena",
      "detail": 'M / 24 / Due :  ₹200',
      "proImg": "assets/images/user_profile.png",
      "categorgyImg": "assets/images/Golf.png",
      "level": "Advance"
    },
    {
      "id": 2,
      "name": "Riyaz mohammed",
      "detail": 'M / 26 / Due :  ₹200',
      "proImg": "",
      "categorgyImg": "assets/images/Golf.png",
      "level": "Beginner"
    },
    {
      "id": 2,
      "name": "Riyaz mohammed",
      "detail": 'M / 26 / Due :  ₹200',
      "proImg": "",
      "categorgyImg": "assets/images/Golf.png",
      "level": "Beginner"
    },
    {
      "id": 3,
      "name": "Riyaz mohammed",
      "detail": 'M / 26 / Due :  ₹200',
      "proImg": "",
      "categorgyImg": "assets/images/Golf.png",
      "level": "Beginner"
    },
    {
      "id": 4,
      "name": "Riyaz mohammed",
      "detail": 'M / 26 / Due :  ₹200',
      "proImg": "",
      "categorgyImg": "assets/images/Golf.png",
      "level": "Beginner"
    },
    {
      "id": 5,
      "name": "Riyaz mohammed",
      "detail": 'M / 26 / Due :  ₹200',
      "proImg": "",
      "categorgyImg": "assets/images/Golf.png",
      "level": "Beginner"
    },
    {
      "id": 6,
      "name": "Riyaz mohammed",
      "detail": 'M / 26 / Due :  ₹200',
      "proImg": "",
      "categorgyImg": "assets/images/Golf.png",
      "level": "Beginner"
    }
  ];
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    _foundUsers = _allUsers;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
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
            'View Session Details',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: const Color.fromARGB(255, 244, 247, 245),
                    elevation: 1,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10, bottom: 10, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Chip(
                                    backgroundColor:
                                        Colors.redAccent.withOpacity(.2),
                                    label: const Text(
                                      'Closed',
                                      style: TextStyle(color: Colors.redAccent),
                                    )),
                                const CircleAvatar(
                                  radius: 20,
                                  backgroundColor:
                                      Color.fromARGB(255, 217, 217, 217),
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/tennis.png')),
                                )
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Cricket Batch',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    height: 2),
                              ),
                              Text(
                                'Advance -  Tue, 04 Feb 2023 - 09:30 AM to 10:30 AM',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: value,
                            onChanged: (value) {
                              setState(() {
                                this.value = value!;
                                print('checked');
                              });
                            },
                          ),
                          const Text('Attendance Marked')
                        ],
                      ),
                    ],
                  ),
                ),
                DefaultTabController(
                    length: 3,
                    initialIndex: 0,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          TabBar(
                            indicatorPadding: const EdgeInsets.all(10),
                            isScrollable: true,
                            labelColor: Colors.black,
                            labelPadding: const EdgeInsets.all(0),
                            unselectedLabelColor: Colors.grey,
                            tabs: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 10, left: 10),
                                child: Chip(
                                  backgroundColor:
                                      const Color.fromARGB(255, 242, 242, 242),
                                  label: const Text(
                                    'Present',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  avatar: CircleAvatar(
                                    backgroundColor: Colors.blue.shade100,
                                    child: Text(_foundUsers.length.toString()),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Chip(
                                  backgroundColor:
                                      const Color.fromARGB(255, 242, 242, 242),
                                  label: const Text(
                                    'Absent',
                                  ),
                                  avatar: CircleAvatar(
                                    backgroundColor: Colors.green.shade100,
                                    child: const Text(
                                      '01',
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Chip(
                                  backgroundColor:
                                      const Color.fromARGB(255, 242, 242, 242),
                                  label: const Text(
                                    'Leave',
                                  ),
                                  avatar: CircleAvatar(
                                    backgroundColor: Colors.brown.shade100,
                                    child: const Text('01'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: height * .6,
                            decoration: const BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: Colors.grey, width: 0.5))),
                            child: TabBarView(
                              children: <Widget>[
                                SingleChildScrollView(
                                  child: SizedBox(
                                    height: height * .57,
                                    child: _foundUsers.isNotEmpty
                                        ? ListView.builder(
                                            itemCount: _foundUsers.length,
                                            itemBuilder: (context, index) {
                                              var nameText = _foundUsers[index]
                                                      ['name']
                                                  .split(' ');
                                              return Card(
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
                                                      leading: CircleAvatar(
                                                          radius: 20.5,
                                                          backgroundColor:
                                                              const Color
                                                                      .fromRGBO(
                                                                  194,
                                                                  235,
                                                                  216,
                                                                  1),
                                                          child:
                                                              _selectedItems
                                                                      .contains(
                                                                          index)
                                                                  ? const Icon(
                                                                      Icons
                                                                          .check,
                                                                      color: Color.fromRGBO(
                                                                          71,
                                                                          192,
                                                                          136,
                                                                          1),
                                                                      size:
                                                                          30.0,
                                                                    )
                                                                  : Text(
                                                                      (nameText[0][0].toString() +
                                                                              nameText[1][0].toString())
                                                                          .toUpperCase(),
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              14),
                                                                    )),
                                                      title: Text(
                                                        _foundUsers[index]
                                                            ['name'],
                                                        style: const TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    57,
                                                                    64,
                                                                    74,
                                                                    1),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontFamily:
                                                                'Loto-Regular'),
                                                      ),
                                                      subtitle: Text(
                                                        _foundUsers[index]
                                                                ["detail"]
                                                            .toString(),
                                                        style: const TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    57,
                                                                    64,
                                                                    74,
                                                                    1),
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily:
                                                                'Loto-Regular'),
                                                      ),
                                                      trailing: SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.25,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: const [
                                                            CircleAvatar(
                                                                radius: 13,
                                                                backgroundColor:
                                                                    Colors
                                                                        .green,
                                                                child: Text(
                                                                  'P',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                )),
                                                          ],
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const SessionDetailEdit()));
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
                                              );
                                            })
                                        : const Text(
                                            'No results found',
                                            style: TextStyle(fontSize: 24),
                                          ),
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: SizedBox(
                                    height: height * .57,
                                    child: _foundUsers.isNotEmpty
                                        ? ListView.builder(
                                            itemCount: _foundUsers.length,
                                            itemBuilder: (context, index) {
                                              var nameText = _foundUsers[index]
                                                      ['name']
                                                  .split(' ');
                                              return Card(
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
                                                      leading: CircleAvatar(
                                                          radius: 20.5,
                                                          backgroundColor:
                                                              const Color
                                                                      .fromRGBO(
                                                                  194,
                                                                  235,
                                                                  216,
                                                                  1),
                                                          child:
                                                              _selectedItems
                                                                      .contains(
                                                                          index)
                                                                  ? const Icon(
                                                                      Icons
                                                                          .check,
                                                                      color: Color.fromRGBO(
                                                                          71,
                                                                          192,
                                                                          136,
                                                                          1),
                                                                      size:
                                                                          30.0,
                                                                    )
                                                                  : Text(
                                                                      (nameText[0][0].toString() +
                                                                              nameText[1][0].toString())
                                                                          .toUpperCase(),
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              14),
                                                                    )),
                                                      title: Text(
                                                        _foundUsers[index]
                                                            ['name'],
                                                        style: const TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    57,
                                                                    64,
                                                                    74,
                                                                    1),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontFamily:
                                                                'Loto-Regular'),
                                                      ),
                                                      subtitle: Text(
                                                        _foundUsers[index]
                                                                ["detail"]
                                                            .toString(),
                                                        style: const TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    57,
                                                                    64,
                                                                    74,
                                                                    1),
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily:
                                                                'Loto-Regular'),
                                                      ),
                                                      trailing: SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.25,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: const [
                                                            CircleAvatar(
                                                                radius: 13,
                                                                backgroundColor:
                                                                    Colors
                                                                        .redAccent,
                                                                child: Text(
                                                                  'A',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                )),
                                                          ],
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const SessionDetailEdit()));
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
                                              );
                                            })
                                        : const Text(
                                            'No results found',
                                            style: TextStyle(fontSize: 24),
                                          ),
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: SizedBox(
                                    height: height * .57,
                                    child: _foundUsers.isNotEmpty
                                        ? ListView.builder(
                                            itemCount: _foundUsers.length,
                                            itemBuilder: (context, index) {
                                              var nameText = _foundUsers[index]
                                                      ['name']
                                                  .split(' ');
                                              return Card(
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
                                                      leading: CircleAvatar(
                                                          radius: 20.5,
                                                          backgroundColor:
                                                              const Color
                                                                      .fromRGBO(
                                                                  194,
                                                                  235,
                                                                  216,
                                                                  1),
                                                          child:
                                                              _selectedItems
                                                                      .contains(
                                                                          index)
                                                                  ? const Icon(
                                                                      Icons
                                                                          .check,
                                                                      color: Color.fromRGBO(
                                                                          71,
                                                                          192,
                                                                          136,
                                                                          1),
                                                                      size:
                                                                          30.0,
                                                                    )
                                                                  : Text(
                                                                      (nameText[0][0].toString() +
                                                                              nameText[1][0].toString())
                                                                          .toUpperCase(),
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              14),
                                                                    )),
                                                      title: Text(
                                                        _foundUsers[index]
                                                            ['name'],
                                                        style: const TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    57,
                                                                    64,
                                                                    74,
                                                                    1),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontFamily:
                                                                'Loto-Regular'),
                                                      ),
                                                      subtitle: Text(
                                                        _foundUsers[index]
                                                                ["detail"]
                                                            .toString(),
                                                        style: const TextStyle(
                                                            color:
                                                                Color.fromRGBO(
                                                                    57,
                                                                    64,
                                                                    74,
                                                                    1),
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily:
                                                                'Loto-Regular'),
                                                      ),
                                                      trailing: SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.25,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: const [
                                                            CircleAvatar(
                                                                radius: 13,
                                                                backgroundColor:
                                                                    Colors.blue,
                                                                child: Text(
                                                                  'L',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                )),
                                                          ],
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const SessionDetailEdit()));
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
                                              );
                                            })
                                        : const Text(
                                            'No results found',
                                            style: TextStyle(fontSize: 24),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ])),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(44, 98, 163, 243),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                            radius: 25,
                            backgroundColor: Color.fromARGB(44, 98, 163, 243),
                            child: Icon(
                              Icons.attach_file,
                              color: Colors.blueAccent,
                              size: 30.0,
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: const [
                            Text(
                              'View File',
                              style: TextStyle(
                                color: Colors.black,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'abc.pdf',
                              style: TextStyle(
                                color: Colors.grey,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Feedback for Trainee',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
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
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Feedback	for	Academy',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
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
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
