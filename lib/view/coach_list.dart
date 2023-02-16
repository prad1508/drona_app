import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../res/widget/round_button.dart';
import '../utils/routes/routes_name.dart';

class CoachList extends StatefulWidget {
  const CoachList({super.key});

  @override
  State<CoachList> createState() => _CoachListState();
}

class _CoachListState extends State<CoachList> {
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;

  final List<Map<String, dynamic>> _allUsers = [
    {
      "id": 1,
      "name": "Rakesh Mishra",
      "detail": 'Male, +9199555296811',
      "proImg": "assets/images/user_profile.png",
      "categorgyImg": "assets/images/Golf.png"
    },
    {
      "id": 2,
      "name": "Amit Suman",
      "detail": 'Male, +9188555296811',
      "proImg": "assets/images/user_profile.png",
      "categorgyImg": "assets/images/Golf.png"
    },
    {
      "id": 3,
      "name": "Akhshay Khana",
      "detail": 'Male, +9189555296811',
      "proImg": "assets/images/user_profile.png",
      "categorgyImg": "assets/images/Golf.png"
    },
    {
      "id": 4,
      "name": "Rani",
      "detail": 'Female, +9189555296871',
      "proImg": "assets/images/user_profile.png",
      "categorgyImg": "assets/images/Golf.png"
    },
    {
      "id": 5,
      "name": "komal",
      "detail": 'Female, +9189555286871',
      "proImg": "assets/images/user_profile.png",
      "categorgyImg": "assets/images/Golf.png"
    },
    {
      "id": 6,
      "name": "Sapna",
      "detail": 'Female, +9189555286851',
      "proImg": "assets/images/user_profile.png",
      "categorgyImg": "assets/images/Golf.png"
    },
    {
      "id": 7,
      "name": "Shrikant Maurya",
      "detail": 'Male, +9189555293411',
      "proImg": "assets/images/user_profile.png",
      "categorgyImg": "assets/images/Golf.png"
    },
    {
      "id": 8,
      "name": "Aman",
      "detail": 'Male, +9180555293411',
      "proImg": "assets/images/user_profile.png",
      "categorgyImg": "assets/images/Golf.png"
    },
    {
      "id": 9,
      "name": "Pankaj",
      "detail": 'Male, +9180555293411',
      "proImg": "assets/images/user_profile.png",
      "categorgyImg": "assets/images/Golf.png"
    },
    {
      "id": 10,
      "name": "Neha",
      "detail": 'Female, +9180555293411',
      "proImg": "assets/images/user_profile.png",
      "categorgyImg": "assets/images/Golf.png"
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
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
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
                if (kDebugMode) {
                  print('add coach list');
                }
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
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Color.fromARGB(255, 197, 196, 196),
                    ),
                  ),
                  elevation: 0,
                  child: ListTile(
                      title: TextField(
                        onChanged: (value) => dataFilter(value),
                        decoration: const InputDecoration(
                            hintText: 'Search', border: InputBorder.none),
                      ),
                      trailing: const Icon(Icons.search)),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: _foundUsers.isNotEmpty
                      ? ListView.builder(
                          itemCount: _foundUsers.length,
                          itemBuilder: (context, index) => Card(
                            key: ValueKey(_foundUsers[index]["id"]),
                            elevation: 0,
                            margin: const EdgeInsets.symmetric(vertical: 0),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
                                    radius: 30,
                                    child: Image(
                                        image: AssetImage(
                                            _foundUsers[index]["proImg"])),
                                  ),
                                  title: Text(_foundUsers[index]['name']),
                                  subtitle: Text(
                                      _foundUsers[index]["detail"].toString()),
                                  trailing: CircleAvatar(
                                    radius: 12,
                                    child: Image(
                                        image: AssetImage(_foundUsers[index]
                                            ["categorgyImg"])),
                                  ),
                                ),
                                Divider(
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
                const SizedBox(
                  height: 15,
                ),
                RoundButton(
                    loading: false,
                    title: 'Send Invite',
                    textColor: Colors.white,
                    rounded: true,
                    color: Theme.of(context).primaryColor,
                    onPress: () {
                      Navigator.pushNamed(context, RoutesName.CoachListSelected);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
