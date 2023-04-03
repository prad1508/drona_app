import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../res/language/language.dart';
import '../../res/widget/round_button.dart';
import '../layout.dart';
import '../profile/view_profile.dart';

class ViewSessionalDetails extends StatefulWidget {
  const ViewSessionalDetails({super.key});

  @override
  State<ViewSessionalDetails> createState() => _ViewSessionalDetailsState();
}

class _ViewSessionalDetailsState extends State<ViewSessionalDetails> {
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;

  final List<int> _selectedItems = <int>[];

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
          actions: [
            _selectedItems.isEmpty
                ? IconButton(
                    onPressed: (() {
                      if (kDebugMode) {
                        print('Batch List');
                      }
                    }),
                    icon: const Icon(Icons.edit),
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
                                        Colors.greenAccent.withOpacity(.2),
                                    label: const Text(
                                      'Scheduled',
                                      style:
                                          TextStyle(color: Colors.greenAccent),
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
                Expanded(
                  child: _foundUsers.isNotEmpty
                      ? ListView.builder(
                          itemCount: _foundUsers.length,
                          itemBuilder: (context, index) {
                            var nameText = _foundUsers[index]['name'].split(' ');
                            return Card(
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
                                          : Text((nameText[0][0].toString() + nameText[1][0].toString()).toUpperCase(),
                                              style: const TextStyle(fontSize: 14),
                                            )),
                                  title: Text(
                                        _foundUsers[index]['name'],
                                        style: const TextStyle(
                                            color:
                                                Color.fromRGBO(57, 64, 74, 1),
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
                                  trailing: SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.25,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children:  [
                                        CircleAvatar(
                                                                  radius: 13,
                                                                  backgroundColor: Colors.greenAccent.withOpacity(0.1),
                                                                  child:  const Text('P', style: TextStyle(color: Colors.greenAccent),)
                                                                ),
                                                                
                                                                CircleAvatar(
                                                                  radius: 13,
                                                                  backgroundColor: Colors.redAccent.withOpacity(0.1),
                                                                  child: const Text('A', style: TextStyle(color: Colors.redAccent))
                                                                ),
                                                                CircleAvatar(
                                                                  radius: 13,
                                                                  backgroundColor: Colors.blue.withOpacity(0.1),
                                                                  child: const Text('P', style: TextStyle(color: Colors.blue))
                                                                ),
                                      ],
                                    ),
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
                          );
                         }
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
                    title: 'Submit Attendance',
                    textColor: Colors.white,
                    rounded: true,
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const Layout(
                            selectedIndex: 0,
                          ),
                        ),
                      );
                    }),
                    SizedBox(height: 10,),
                    RoundButton(
                    loading: false,
                    title: 'Submit Attendance',
                    textColor: Colors.white,
                    rounded: true,
                    color: Colors.redAccent,
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const Layout(
                            selectedIndex: 0,
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
