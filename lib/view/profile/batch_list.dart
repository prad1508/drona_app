import 'package:drona/utils/routes/routes_name.dart';
import 'package:drona/view/profile/view_profile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import '../../res/widget/round_button.dart';
import '../batch_details.dart';

class BatchList extends StatefulWidget {
  const BatchList({super.key});

  @override
  State<BatchList> createState() => _BatchListState();
}

class _BatchListState extends State<BatchList> {
  List<int> _selectedItems = <int>[];

  final List<Map<String, dynamic>> _allUsers = [
    {
      "id": 1,
      "name": "Tennis Batch",
      "detail": 'M,W,F - 09:15am to 10:15am',
      "proImg": "assets/images/user_profile.png",
      "categorgyImg": "assets/images/Golf.png",
      "level": "Advance"
    },
    {
      "id": 2,
      "name": "Hockey Batch",
      "detail": 'S,M,T - 03:00pm to 04:15pm',
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
                _selectedItems.length == 0
                    ? ''
                    : _selectedItems.length.toString(),
                style: TextStyle(color: Colors.black),
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
            _selectedItems.length == 0
                ? IconButton(
                    onPressed: (() {
                      if (kDebugMode) {
                        print('Batch List');
                      }
                    }),
                    icon: const Icon(Icons.add),
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
                                      ? Color.fromARGB(255, 218, 218, 219)
                                          .withOpacity(0.5)
                                      : Colors.transparent,
                                  leading: CircleAvatar(
                                      radius: 20.5,
                                      backgroundColor: const Color.fromRGBO(
                                          194, 235, 216, 1),
                                      child: _selectedItems.contains(index)
                                          ? Icon(
                                              Icons.check,
                                              color: Color.fromRGBO(
                                                  71, 192, 136, 1),
                                              size: 30.0,
                                            )
                                          : Text(
                                              'TGH',
                                              style: TextStyle(fontSize: 14),
                                            )),
                                  title: Row(
                                    children: [
                                      Text(
                                        _foundUsers[index]['name'],
                                        style: const TextStyle(
                                            color:
                                                Color.fromRGBO(57, 64, 74, 1),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Loto-Regular'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Chip(
                                          backgroundColor: Color.fromARGB(
                                              255, 237, 244, 240),
                                          label: Text(
                                            _foundUsers[index]['level'],
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.greenAccent),
                                          ),
                                        ),
                                      ),
                                    ],
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
                    title: 'Continue',
                    textColor: Colors.white,
                    rounded: true,
                    color: Theme.of(context).primaryColor,
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const BatchDetail(),
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
