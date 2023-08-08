import 'package:drona/view/dashboard/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/widget/datefield.dart';
import 'bar_chart.dart';

class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  final TextEditingController dob = TextEditingController();

  @override
  initState() {
    super.initState();
  }
  String dropdownValue = 'Tennis';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                //=>
                setState(() {
                  Get.to(()=> const Layout(selectedIndex: 0));

                });
              },
            ),
          ],
        ),
        title: Text(
          'Attendance',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
           // mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Overall Avg Attendance',
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      height: 60,
                      width: 100,
                      padding: const EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(237, 249, 243, 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Present'),
                          Text(
                            '54%',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),

                  Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      height: 60,
                      width: 100,
                      padding: const EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(254, 239, 238, 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Absent/Leave'),
                          Text(
                            '36%',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      height: 60,
                      width: 100,
                      padding: const EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Not Marked'),
                          Text(
                            '10%',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * .4,
                    height: 50,
                    child: DateOfBirth(controller: dob, hintText: 'Jun 2023'),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                      height: 50.0,
                      width: 120.0,
                      child: Padding(
                        padding: const EdgeInsets.all(1),
                        child: InputDecorator(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.all(10),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              value: dropdownValue,
                              icon: const Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              isExpanded: true,
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.grey.shade700),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              items: <String>[
                                'Tennis',
                                'Football'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const BarChartDrona(),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Batch Wise Attendance',
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * .4,
                    height: 50,
                    child: DateOfBirth(controller: dob, hintText: 'Jun 2023'),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                      height: 50.0,
                      width: 120.0,
                      child: Padding(
                        padding: const EdgeInsets.all(1),
                        child: InputDecorator(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.all(10),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              value: dropdownValue = 'Tennis',
                              icon: const Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              isExpanded: true,
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.grey.shade700),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              items: <String>[
                                'Tennis',
                                'Football'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const BarChartDrona(),
            ],
          ),
        ),
      ),
    );
  }
}
