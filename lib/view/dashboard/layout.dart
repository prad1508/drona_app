import 'dart:io';

import 'package:drona/res/language/language.dart';
import 'package:drona/view/batch_listing/ViewBatchDetails1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../batch_listing/ViewBatchDetails2.dart';
import '../reports/attendance.dart';
import '../trainee_listing/add_trainee_list.dart';
import '../batch_listing/batch_list.dart';
import '../batch_listing/batchlist_search.dart';
import '../batch_listing/create_batch_listing.dart';
import '../batch_listing/trainee_list.dart';
import '../batch_listing/view_batch_details.dart';
import 'home_screen.dart';
import '../session_listing/session_list.dart';

class Layout extends StatefulWidget {
  final int selectedIndex;
  const Layout({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int pageIndex = 0;

  final pages = [
    const HomeScreen(),
    const Attendance(),
    SearchBatchList(
      pathPage: 'dashBoard',
    ),
    AddTraineeList(path: 'dashBoard')
  ];

  Future<bool> showExitPopup(context) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SizedBox(
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.close_rounded,
                      color: Colors.redAccent,
                      size: 50.0,
                    ),
                  ),
                  const Text("Do you want to exit?"),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        child: const Text("No",
                            style: TextStyle(color: Colors.black)),
                      )),
                      const SizedBox(width: 15),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            exit(0);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent),
                          child: const Text(
                            "Yes",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      pageIndex = widget.selectedIndex;

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        //resizeToAvoidBottomInset : false ,
        body: Center(
            child: pages[pageIndex],
          ),
          floatingActionButton: CircleAvatar(
            radius: 40,
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            child: FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () {},
              elevation: 0,
              tooltip: 'Create',
              child: const Icon(Icons.add),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: Container(
            height: 70,
            decoration:  BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    IconButton(
                      enableFeedback: false,
                      onPressed: () {
                        setState(() {
                          pageIndex = 0;
                        });
                      },
                      icon: pageIndex == 0
                          ? Icon(
                        Icons.dashboard_rounded,
                        size: 24,
                        color: Theme.of(context).primaryColor,
                      )
                          : const Icon(
                        Icons.space_dashboard_outlined,
                        size: 24,
                        color: Color.fromARGB(255, 153, 160, 171),
                      ),
                    ),
                    pageIndex == 0
                        ?  Text(
                      AppLocale.homeText.getString(context).toString(),
                      style: const TextStyle(height: .5, fontSize: 12),
                    )
                        :  Text(
                      AppLocale.homeText.getString(context).toString(),
                      style: const TextStyle(
                          height: .5,
                          color: Color.fromARGB(255, 153, 160, 171),
                          fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      enableFeedback: false,
                      onPressed: () {
                        setState(() {
                          pageIndex = 1;
                        });
                      },
                      icon: pageIndex == 1
                          ? Icon(
                        Icons.calendar_today,
                        size: 24,
                        color: Theme.of(context).primaryColor,
                      )
                          : const Icon(
                        Icons.calendar_today_outlined,
                        size: 24,
                        color: Color.fromARGB(255, 153, 160, 171),
                      ),
                    ),
                    pageIndex == 1
                        ?  Text(
                      AppLocale.attendance.getString(context).toString(),
                      style: TextStyle(height: .5, fontSize: 12),
                    )
                        :  Text(
                      AppLocale.attendance.getString(context).toString(),
                      style: TextStyle(
                          height: .5,
                          color: Color.fromARGB(255, 153, 160, 171),
                          fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      enableFeedback: false,
                      onPressed: () {
                        setState(() {
                          pageIndex = 2;
                        });
                      },
                      icon: pageIndex == 2
                          ? Icon(
                        Icons.wallet,
                        color: Theme.of(context).primaryColor,
                        size: 24,
                      )
                          : const Icon(
                        Icons.wallet_membership,
                        color: Color.fromARGB(255, 153, 160, 171),
                        size: 24,
                      ),
                    ),
                    pageIndex == 2
                        ?  Text(
                      AppLocale.batches.getString(context),
                      style: TextStyle(height: .5, fontSize: 12),
                    )
                        :  Text(
                      AppLocale.batches.getString(context),
                      style: TextStyle(
                          height: .5,
                          color: Color.fromARGB(255, 153, 160, 171),
                          fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      enableFeedback: false,
                      onPressed: () {
                        setState(() {
                          pageIndex = 3;
                        });
                      },
                      icon: pageIndex == 3
                          ? Icon(
                        Icons.group,
                        color: Theme.of(context).primaryColor,
                        size: 24,
                      )
                          : const Icon(
                        Icons.group_outlined,
                        color: Color.fromARGB(255, 153, 160, 171),
                        size: 24,
                      ),
                    ),
                    pageIndex == 3
                        ?  Text(
                      AppLocale.trainee.getString(context),
                      style: TextStyle(height: .5, fontSize: 12),
                    )
                        :  Text(
                      AppLocale.trainee.getString(context),
                      style: TextStyle(
                          height: .5,
                          color: Color.fromARGB(255, 153, 160, 171),
                          fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 70,
      decoration:  BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
                icon: pageIndex == 0
                    ? Icon(
                        Icons.dashboard_rounded,
                        size: 24,
                        color: Theme.of(context).primaryColor,
                      )
                    : const Icon(
                        Icons.space_dashboard_outlined,
                        size: 24,
                        color: Color.fromARGB(255, 153, 160, 171),
                      ),
              ),
              pageIndex == 0
                  ?  Text(
                      AppLocale.homeText.getString.toString(),
                      style: TextStyle(height: .5, fontSize: 12),
                    )
                  :  Text(
                AppLocale.homeText.getString.toString(),
                      style: TextStyle(
                          height: .5,
                          color: Color.fromARGB(255, 153, 160, 171),
                          fontSize: 12),
                    ),
            ],
          ),
          Column(
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 1;
                  });
                },
                icon: pageIndex == 1
                    ? Icon(
                        Icons.calendar_today,
                        size: 24,
                        color: Theme.of(context).primaryColor,
                      )
                    : const Icon(
                        Icons.calendar_today_outlined,
                        size: 24,
                        color: Color.fromARGB(255, 153, 160, 171),
                      ),
              ),
              pageIndex == 1
                  ?  Text(
                      AppLocale.attendance.getString(context).toString(),
                      style: TextStyle(height: .5, fontSize: 12),
                    )
                  :  Text(
                AppLocale.attendance.getString(context).toString(),
                      style: TextStyle(
                          height: .5,
                          color: Color.fromARGB(255, 153, 160, 171),
                          fontSize: 12),
                    ),
            ],
          ),
          Column(
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 2;
                  });
                },
                icon: pageIndex == 2
                    ? Icon(
                        Icons.wallet,
                        color: Theme.of(context).primaryColor,
                        size: 24,
                      )
                    : const Icon(
                        Icons.wallet_membership,
                        color: Color.fromARGB(255, 153, 160, 171),
                        size: 24,
                      ),
              ),
              pageIndex == 2
                  ?  Text(
                      AppLocale.batches.getString(context),
                      style: TextStyle(height: .5, fontSize: 12),
                    )
                  :  Text(
                AppLocale.batches.getString(context),
                      style: TextStyle(
                          height: .5,
                          color: Color.fromARGB(255, 153, 160, 171),
                          fontSize: 12),
                    ),
            ],
          ),
          Column(
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 3;
                  });
                },
                icon: pageIndex == 3
                    ? Icon(
                        Icons.group,
                        color: Theme.of(context).primaryColor,
                        size: 24,
                      )
                    : const Icon(
                        Icons.group_outlined,
                        color: Color.fromARGB(255, 153, 160, 171),
                        size: 24,
                      ),
              ),
              pageIndex == 3
                  ?  Text(
                AppLocale.trainee.getString(context),
                      style: TextStyle(height: .5, fontSize: 12),
                    )
                  :  Text(
                AppLocale.trainee.getString(context),
                      style: TextStyle(
                          height: .5,
                          color: Color.fromARGB(255, 153, 160, 171),
                          fontSize: 12),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
