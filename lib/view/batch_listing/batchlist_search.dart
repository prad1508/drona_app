import 'package:drona/utils/routes/routes_name.dart';
import 'package:drona/view/profile/view_profile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../res/widget/round_button.dart';
import 'create_batch_listing.dart';
class SearchBatchList extends StatefulWidget {
  const SearchBatchList({super.key});

  @override
  State<SearchBatchList> createState() => _SearchBatchListState();
}

class _SearchBatchListState extends State<SearchBatchList> {
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;

  List<int> _selectedItems = <int>[];

  final List<Map<String, dynamic>> _allUsers = [
    {
      "id": 1,
      "name": "Tennis Batch",
      "detail": 'Male, +9199555296811',
      "proImg": "assets/images/Golf.png",
      "categorgyImg": "assets/images/Golf.png"
    },
    {
      "id": 2,
      "name": "Tennis Batch night with lihghts...",
      "detail": 'Male, +9188555296811',
      "proImg": "assets/images/Golf.png",
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
            IconButton(
              onPressed: (() {
               Navigator.push(
                         context,
                         MaterialPageRoute(
                           builder: (BuildContext context) =>
                               const CreateBatchListing(),
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
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 55,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey)),
                      child: Image.asset(
                        "assets/images/menu.png",
                        height: 20,
                      ),
                    ),
                    Expanded(
                      child: Card(
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
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 0.0),
                                hintText: 'Search',
                                border: InputBorder.none),
                          ),
                          trailing: const Icon(Icons.search),
                        ),
                      ),
                    ),
                  ],
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
                                      ? Color.fromARGB(255, 218, 218, 219)
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
                                  title: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          _foundUsers[index]['name'],
                                          style: const TextStyle(
                                              color:
                                                  Color.fromRGBO(57, 64, 74, 1),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'Loto-Regular'),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 23,
                                          width: 23,
                                          decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Text("06"),
                                        ),
                                      ),
                                    ],
                                  ),
                                  subtitle: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 25),
                                        child: Text(
                                          _foundUsers[index]["detail"]
                                              .toString(),
                                          style: const TextStyle(
                                              color:
                                                  Color.fromRGBO(57, 64, 74, 1),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Loto-Regular'),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text("Coach Name:",
                                              style: TextStyle(
                                                  color: Colors.black)),
                                          Text(
                                            "John Smith",
                                            style: TextStyle(),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  trailing: Container(
                                    alignment: Alignment.center,
                                    height: 20,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        color: Colors.green.shade700,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text(
                                      "Active",
                                      style: TextStyle(color: Colors.white),
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
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
