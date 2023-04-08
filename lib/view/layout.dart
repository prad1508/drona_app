import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'batch_listing/add_trainee_list.dart';
import 'batch_listing/batch_list.dart';
import 'batch_listing/batchlist_search.dart';
import 'batch_listing/create_batch_listing.dart';
import 'batch_listing/trainee_list.dart';
import 'batch_listing/view_batch_details.dart';
import 'home_screen.dart';
import 'session_listing/session_list.dart';

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
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.selectedIndex;
  }

  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const SessionList(),
    const Text(''),
    const SearchBatchList(),
     AddTraineeList()
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
                  Align(
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
                        child:const Text("No",
                            style: TextStyle(color: Colors.black)
                            ),
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
                            "Yes", style: TextStyle(color: Colors.white),
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
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_currentIndex),
        ),
        floatingActionButton: CircleAvatar(
            radius: 40,
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            child: FloatingActionButton(
              onPressed: () {},
              elevation: 0,
              tooltip: 'Create',
              child: const Icon(Icons.add),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
        
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_rounded,
                size: 20,
              ),
              label: 'Home',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon:  Icon(Icons.calendar_today_rounded),
          
              label: 'Attendence',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon:  Icon(null),
              label: '',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet_membership,
                size: 24,
              ),
              label: 'Batches',
              backgroundColor: Colors.white,
            ),
    
            BottomNavigationBarItem(
              icon: Icon(Icons.group_outlined,
                size: 22,
              ),
              label: 'Members',
              backgroundColor: Colors.white,
            ),
          ],
          currentIndex: _currentIndex,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.black,
          onTap: (index) => setState(() => _currentIndex = index),
          
        ),
         ),
    );
  }
}
