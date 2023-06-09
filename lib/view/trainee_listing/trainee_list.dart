import 'package:drona/view/layout.dart';
import 'package:drona/view_model/trainee_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';

import '../../res/app_url.dart';
import '../../res/language/language.dart';
import '../../res/widget/round_button.dart';
import '../../view_model/coachlist_view_model.dart';

class TraineeNewList extends StatefulWidget {
  const TraineeNewList({super.key});

  @override
  State<TraineeNewList> createState() => _TraineeNewListState();
}

class _TraineeNewListState extends State<TraineeNewList> {
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;
  TraineeViewModel traineeViewModel = TraineeViewModel();
  List<int> _selectedItems = <int>[];
  bool notFound = false;
  List<Map<String, dynamic>> _foundUsers = [];

  Map<String, dynamic> data = {"filter_batch_uid": "", "search": ""};
  @override
  initState() {
    super.initState();
    traineeViewModel.fetchTraineeListSearchApi(data);
  }

  void dataFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      setState(() {
        notFound = false;
      });
    } else {
      results = _foundUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      setState(() {
        notFound = results.isEmpty;
        _foundUsers = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: _localization.supportedLocales,
      localizationsDelegates: _localization.localizationsDelegates,
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
                style: const TextStyle(color: Colors.black),
              )
            ],
          ),
          title: Text(
            'Trainee List',
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
                        print('add coach list');
                      }
                    }),
                    icon: const Icon(Icons.group_add),
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
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
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
                              onChanged: (searchData) => dataFilter(searchData),
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
                  ChangeNotifierProvider<TraineeViewModel>(
                      create: (BuildContext context) => traineeViewModel,
                      child: Consumer<TraineeViewModel>(
                          builder: (context, value, _) {
                        if (_foundUsers.isEmpty) {
                          _foundUsers = List.generate(
                              value.dataList.data?.data.length ?? 0, (index) {
                            return {
                              "name":
                                  value.dataList.data?.data[index].traineeName,
                              "img": value
                                  .dataList.data?.data[index].traineeProfileUid,
                              // "gender":
                              //     value.dataList.data?.data![index].,
                              "userid":
                                  value.dataList.data?.data[index].traineeUserid
                            };
                          });
                        }

                        // return Expanded(
                        //   child: notFound
                        //       ? const Text(
                        //           'No results found',
                        //           style: TextStyle(fontSize: 24),
                        //         )
                        //       : ListView.builder(
                        //           itemCount: _foundUsers.length,
                        //           itemBuilder: (context, index) {
                        //             print("_foundUsers==${_foundUsers.length}");

                        //             return Card(
                        //               key: ValueKey(_foundUsers[index]["id"]),
                        //               elevation: 0,
                        //               margin: const EdgeInsets.symmetric(
                        //                   vertical: 0),
                        //               child: Column(
                        //                 children: [
                        //                   ListTile(
                        //                     tileColor:
                        //                         (_selectedItems.contains(index))
                        //                             ? const Color.fromARGB(
                        //                                     255, 218, 218, 219)
                        //                                 .withOpacity(0.5)
                        //                             : Colors.transparent,
                        //                     leading: CircleAvatar(
                        //                         radius: 20.5,
                        //                         backgroundColor:
                        //                             const Color.fromRGBO(
                        //                                 194, 235, 216, 1),
                        //                         child: _selectedItems
                        //                                 .contains(index)
                        //                             ? const Icon(
                        //                                 Icons.check,
                        //                                 color: Color.fromRGBO(
                        //                                     71, 192, 136, 1),
                        //                                 size: 30.0,
                        //                               )
                        //                             : Image(
                        //                                 image: NetworkImage(AppUrl
                        //                                         .imageListendPoint +
                        //                                     _foundUsers[index]
                        //                                         ["img"]))),
                        //                     title: Row(
                        //                       children: [
                        //                         Expanded(
                        //                           child: Text(
                        //                             _foundUsers[index]['name'],
                        //                             style: const TextStyle(
                        //                                 color: Color.fromRGBO(
                        //                                     57, 64, 74, 1),
                        //                                 fontSize: 14,
                        //                                 fontWeight:
                        //                                     FontWeight.w700,
                        //                                 fontFamily:
                        //                                     'Loto-Regular'),
                        //                           ),
                        //                         ),
                        //                       ],
                        //                     ),
                        //                     // subtitle: Column(
                        //                     //   children: [
                        //                     //     _foundUsers[index]['name'],                                            ],
                        //                     // ),

                        //                     // subtitle: Padding(
                        //                     //   padding: const EdgeInsets.only(
                        //                     //       right: 25),
                        //                     //   child: Text(
                        //                     //     _foundUsers[index]['gender'] +
                        //                     //         ", " +
                        //                     //         _foundUsers[index]['userid'],
                        //                     //     style: const TextStyle(
                        //                     //         color: Color.fromRGBO(
                        //                     //             57, 64, 74, 1),
                        //                     //         fontSize: 12,
                        //                     //         fontWeight: FontWeight.w400,
                        //                     //         fontFamily: 'Loto-Regular'),
                        //                     //   ),
                        //                     // ),
                        //                     //         trailing: CircleAvatar(
                        //                     //   radius: 12,
                        //                     //   child: Image(
                        //                     //       image: AssetImage(_foundUsers[index]
                        //                     //           ["categorgyImg"])),
                        //                     // ),
                        //                     onTap: () {},
                        //                     onLongPress: () {
                        //                       if (!_selectedItems
                        //                           .contains(index)) {
                        //                         setState(() {
                        //                           _selectedItems.add(index);
                        //                         });
                        //                       } else {
                        //                         setState(() {
                        //                           _selectedItems.removeWhere(
                        //                               (val) => val == index);
                        //                         });
                        //                       }
                        //                     },
                        //                   ),
                        //                   const Divider(
                        //                     height: 5,
                        //                   ),
                        //                 ],
                        //               ),
                        //             );
                        //           }),
                        // );
                        // //
                        //
                        return Expanded(
                          child: ListView.builder(
                              itemCount:
                                  traineeViewModel.dataList.data!.data.length,
                              itemBuilder: (context, index) {
                                print("_foundUsers==${_foundUsers.length}");

                                return Card(
                                  // key: ValueKey(_foundUsers[index]["id"]),
                                  elevation: 0,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 0),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        tileColor:
                                            (_selectedItems.contains(index))
                                                ? const Color.fromARGB(
                                                        255, 218, 218, 219)
                                                    .withOpacity(0.5)
                                                : Colors.transparent,
                                        leading: CircleAvatar(
                                          radius: 20.5,
                                          backgroundColor: const Color.fromRGBO(
                                              194, 235, 216, 1),
                                          child: Text(
                                            "${traineeViewModel.dataList.data!.data[index].traineeName[0].characters.first.toUpperCase()}${traineeViewModel.dataList.data!.data[index].traineeName[0].characters.last.toUpperCase()}",
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                                color: Color.fromRGBO(
                                                    57, 64, 74, 1),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: 'Loto-Regular'),
                                          ),
                                        ),
                                        title: Text(
                                          //_foundUsers[index]['name'],
                                          traineeViewModel.dataList.data!
                                              .data[index].traineeName,
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                              color:
                                                  Color.fromRGBO(57, 64, 74, 1),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'Loto-Regular'),
                                        ),
                                        subtitle: Column(
                                          children: [
                                            Row(children: [
                                              Text(
                                                "+${traineeViewModel.dataList.data!.data[index].traineeUserid}",
                                                textAlign: TextAlign.start,
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 3),
                                                height: 12,
                                                width: 1,
                                                color: Colors.black54,
                                              ),
                                              Text(
                                                "₹${traineeViewModel.dataList.data!.data[index].fees.toString()}",
                                                textAlign: TextAlign.start,
                                              ),
                                            ]),
                                            Row(children: [
                                              Text(
                                                "Joining Date: ${traineeViewModel.dataList.data!.data[index].dateOfJoining}",
                                                textAlign: TextAlign.start,
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 3),
                                                height: 12,
                                                width: 1,
                                                color: Colors.black54,
                                              ),
                                              Text(
                                                "Billing Date${traineeViewModel.dataList.data!.data[index].monthOfBilling}",
                                                textAlign: TextAlign.start,
                                              ),
                                            ]),
                                          ],
                                        ),
                                        onTap: () {},
                                        onLongPress: () {
                                          if (!_selectedItems.contains(index)) {
                                            setState(() {
                                              _selectedItems.add(index);
                                            });
                                          } else {
                                            setState(() {
                                              _selectedItems.removeWhere(
                                                  (val) => val == index);
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
                              }),
                        );
                      })),
                  const SizedBox(
                    height: 15,
                  ),
                  RoundButton(
                      loading: false,
                      title: AppLocale.conts.getString(context),
                      textColor: Colors.white,
                      rounded: true,
                      color: Theme.of(context).primaryColor,
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Layout(
                                      selectedIndex: 0,
                                    )));
                      }),
                ],
              )),
        ),
      ),
    );
  }
}
