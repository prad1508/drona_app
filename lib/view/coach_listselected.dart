import 'package:drona/view/profile/view_profile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../res/language/language.dart';
import '../res/widget/round_button.dart';

class CoachListSelected extends StatefulWidget {
  const CoachListSelected({super.key});

  @override
  State<CoachListSelected> createState() => _CoachListSelectedState();
}

class _CoachListSelectedState extends State<CoachListSelected> {
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;

  final List<int> _selectedItems = <int>[];

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
          title: Text(AppLocale.coachList.getString(context),
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
              icon: const Icon(Icons.group_add),
              iconSize: 25,
              color: Colors.black,
            ),
            IconButton(
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
                      decoration:  InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                          hintText: AppLocale.search.getString(context),
                          border: InputBorder.none),
                    ),
                    trailing: const Icon(Icons.search),
                  ),
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
                                  tileColor: (_selectedItems.contains(index))
                                      ? const Color.fromARGB(255, 218, 218, 219)
                                          .withOpacity(0.5)
                                      : Colors.transparent,
                                  leading: CircleAvatar(
                                      radius: 20.5,
                                      backgroundColor: const Color.fromRGBO(
                                          194, 235, 216, 1),
                                      child: _selectedItems.contains(index)
                                          ? const Icon(
                                              Icons.check,
                                              color: Color.fromRGBO(
                                                  71, 192, 136, 1),
                                              size: 30.0,
                                            )
                                          : Image(
                                              image: AssetImage(
                                                  _foundUsers[index]
                                                      ["proImg"]))),
                                  title: Text(
                                    _foundUsers[index]['name'],
                                    style: const TextStyle(
                                        color: Color.fromRGBO(57, 64, 74, 1),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Loto-Regular'),
                                  ),
                                  subtitle: Text(
                                    _foundUsers[index]["detail"].toString(),
                                    style: const TextStyle(
                                        color: Color.fromRGBO(57, 64, 74, 1),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Loto-Regular'),
                                  ),
                                  trailing: CircleAvatar(
                                    radius: 12,
                                    child: Image(
                                        image: AssetImage(_foundUsers[index]
                                            ["categorgyImg"])),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ViewProfilenew()));
                                  },
                                  onLongPress: () {
                                    if (!_selectedItems.contains(index)) {
                                      setState(() {
                                        _selectedItems.add(index);
                                      });
                                    } else {
                                      setState(() {
                                        _selectedItems
                                            .removeWhere((val) => val == index);
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
                const SizedBox(
                  height: 15,
                ),
                RoundButton(
                    loading: false,
                    title: AppLocale.sendInvite.getString(context),
                    textColor: Colors.white,
                    rounded: true,
                    color: Theme.of(context).primaryColor,
                    onPress: () {
                      // Navigator.pushNamed(context, RoutesName.ChooseService);
                      showExitPopup(context);
                    }),
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
