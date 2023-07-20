import 'package:drona/view/reports/line_chart.dart';
import 'package:drona/view/reports/owner_edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/widget/datefield.dart';


class Finance extends StatefulWidget {
  const Finance({super.key});

  @override
  State<Finance> createState() => _FinanceState();
}

class _FinanceState extends State<Finance> {
  @override
  initState() {
    super.initState();
  }
  final TextEditingController dob = TextEditingController();
  String dropdownValue = 'Tennis';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          title: Text(
            'Finance',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * .6,
                      height: 50,
                      child: YearMonthPicker(controller: dob, hintText: 'Jun 2023 to Jun 2023'),
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
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Container(
                  height: 110,
                  width: MediaQuery.sizeOf(context).width*.95,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(234, 239, 248, 1),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const FittedBox(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Revenue Collected'),
                                Text(
                                  '₹72,000',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Container(
                              height: 45,
                              width: 45,
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(42, 98, 184, 1), shape: BoxShape.circle),
                              child: const Icon(
                                Icons.people_alt_outlined,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: 200,
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 80,
                              height: 10,
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(42, 98, 184, 1),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        'Billed ₹75,000',
                        style: TextStyle(
                          color: Color.fromRGBO(98, 109, 126, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const LineChartDrona(),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Leger',
                          style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                        ),
                        Text(
                          'Last 7 Months',
                          style:
                          TextStyle(fontSize: 18, color: Colors.grey.shade700),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: FittedBox(
                      child: DataTable(
                          headingRowColor: MaterialStateProperty.all(
                              const Color.fromRGBO(234, 239, 248, 1)),
                          headingTextStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black),
                          dividerThickness: 0,
                          dataRowMaxHeight: 0,
                          dataRowMinHeight: 0,
                          columns: const [
                            DataColumn(
                              label: Text(' '),
                            ),
                            DataColumn(
                              label: Text('Month'),
                            ),
                            DataColumn(
                              label: Text('Billed'),
                            ),
                            DataColumn(
                              label: Text('Net Due'),
                            ),
                            DataColumn(
                              label: Text('Collected'),
                            ),
                          ],
                          //------------NO USE--------------
                          rows: const [
                            DataRow(cells: [
                              DataCell(Text(
                                '',
                                style: TextStyle(fontSize: 0.1, height: 0.01),
                              )),
                              DataCell(Text(
                                '',
                                style: TextStyle(fontSize: 0.1, height: 0.01),
                              )),
                              DataCell(Text('',
                                  style:
                                  TextStyle(fontSize: 0.1, height: 0.01))),
                              DataCell(Text('',
                                  style:
                                  TextStyle(fontSize: 0.1, height: 0.01))),
                              DataCell(
                                Text(
                                  '',
                                  style: TextStyle(fontSize: 0.1, height: 0.01),
                                ),
                              )
                            ]),
                          ]),
                    ),
                  ),
                  ExpansionTile(
                    title: SizedBox(
                      width: MediaQuery.sizeOf(context).width * .4,
                      child: FittedBox(
                        child: DataTable(
                            headingTextStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.black),
                            dividerThickness: 0,
                            dataRowMaxHeight: 0,
                            dataRowMinHeight: 0,
                            columns: const [
                              DataColumn(
                                label: Text('Jul 23'),
                              ),
                              DataColumn(
                                label: Text('₹28,000'),
                              ),
                              DataColumn(
                                label: Text('₹27,000'),
                              ),
                              DataColumn(
                                label: Text('₹22,000'),
                              ),
                            ],
                            //------------NO USE--------------
                            rows: const [
                              DataRow(cells: [
                                DataCell(Text(
                                  '',
                                  style: TextStyle(fontSize: 0.1, height: 0.01),
                                )),
                                DataCell(Text('',
                                    style: TextStyle(
                                        fontSize: 0.1, height: 0.01))),
                                DataCell(Text('',
                                    style: TextStyle(
                                        fontSize: 0.1, height: 0.01))),
                                DataCell(
                                  Text(
                                    ' ',
                                    style:
                                    TextStyle(fontSize: 0.1, height: 0.01),
                                  ),
                                )
                              ]),
                            ]),
                      ),
                    ),
                    tilePadding: const EdgeInsets.only(left: 4),
                    controlAffinity: ListTileControlAffinity.leading,
                    children: <Widget>[
                      SizedBox(
                        child: FittedBox(
                          child: DataTable(
                              headingRowColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(234, 239, 248, 1)),
                              headingTextStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              dividerThickness: 2,
                              headingRowHeight: .01,
                              dataRowMinHeight: 0,
                              //------------NO USE OF COLUMN--------------
                              columns: const [
                                DataColumn(
                                  label: Text(''),
                                ),
                                DataColumn(
                                  label: Text(''),
                                ),
                                DataColumn(
                                  label: Text(''),
                                ),
                                DataColumn(
                                  label: Text(''),
                                ),
                                DataColumn(
                                  label: Text(''),
                                ),
                              ],
                              //------------NO USE OF COLUMN--------------
                              rows: [
                                DataRow(cells: [
                                  const DataCell(Text('           ')),
                                  const DataCell(Text('           ')),
                                  const DataCell(Text('Misc.')),
                                  DataCell(InkWell(
                                    onTap: (){
                                      Get.to(() => const OwnerEditProfile(),
                                          transition: Transition.rightToLeft);
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text('+ ₹1,000', style: TextStyle(color :Color.fromRGBO(71, 192, 136, 1)),),
                                        Image.asset(
                                          'assets/images/info.png',
                                          height: 32,
                                          width: 32,
                                        ),
                                      ],
                                    ),
                                  )),
                                  const DataCell(Text(
                                    '            ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(241, 94, 83, 1)),
                                  )),
                                ]),
                                DataRow(cells: [
                                  const DataCell(Text('')),
                                  const DataCell(Text('')),
                                  const DataCell(Text('Con.')),
                                  DataCell(InkWell(
                                    onTap: (){
                                      Get.to(() => const OwnerEditProfile(),
                                          transition: Transition.rightToLeft);
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text('- ₹2,000', style: TextStyle(color: Color.fromRGBO(241, 94, 83, 1)),),
                                        Image.asset(
                                          'assets/images/info.png',
                                          height: 32,
                                          width: 32,
                                        ),
                                      ],
                                    ),
                                  )),
                                  const DataCell(Text(
                                    '',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(241, 94, 83, 1)),
                                  )),
                                ]),
                              ]),
                        ),
                      ),
                    ],
                  ),

                  ExpansionTile(
                    title: SizedBox(
                      width: MediaQuery.sizeOf(context).width * .4,
                      child: FittedBox(
                        child: DataTable(
                            headingTextStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.black),
                            dividerThickness: 0,
                            dataRowMaxHeight: 0,
                            dataRowMinHeight: 0,
                            columns: const [
                              DataColumn(
                                label: Text('Jul 23'),
                              ),
                              DataColumn(
                                label: Text('₹28,000'),
                              ),
                              DataColumn(
                                label: Text('₹27,000'),
                              ),
                              DataColumn(
                                label: Text('₹22,000'),
                              ),
                            ],
                            //------------NO USE--------------
                            rows: const [
                              DataRow(cells: [
                                DataCell(Text(
                                  '',
                                  style: TextStyle(fontSize: 0.1, height: 0.01),
                                )),
                                DataCell(Text('',
                                    style: TextStyle(
                                        fontSize: 0.1, height: 0.01))),
                                DataCell(Text('',
                                    style: TextStyle(
                                        fontSize: 0.1, height: 0.01))),
                                DataCell(
                                  Text(
                                    ' ',
                                    style:
                                    TextStyle(fontSize: 0.1, height: 0.01),
                                  ),
                                )
                              ]),
                            ]),
                      ),
                    ),
                    tilePadding: const EdgeInsets.only(left: 4),
                    controlAffinity: ListTileControlAffinity.leading,
                    children: <Widget>[
                      SizedBox(
                        child: FittedBox(
                          child: DataTable(
                              headingRowColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(234, 239, 248, 1)),
                              headingTextStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              dividerThickness: 2,
                              headingRowHeight: .01,
                              dataRowMinHeight: 0,
                              //------------NO USE OF COLUMN--------------
                              columns: const [
                                DataColumn(
                                  label: Text(''),
                                ),
                                DataColumn(
                                  label: Text(''),
                                ),
                                DataColumn(
                                  label: Text(''),
                                ),
                                DataColumn(
                                  label: Text(''),
                                ),
                                DataColumn(
                                  label: Text(''),
                                ),
                              ],
                              //------------NO USE OF COLUMN--------------
                              rows: [
                                DataRow(cells: [
                                  const DataCell(Text('           ')),
                                  const DataCell(Text('           ')),
                                  const DataCell(Text('Misc.')),
                                  DataCell(InkWell(
                                    onTap: (){
                                      Get.to(() => const OwnerEditProfile(),
                                          transition: Transition.rightToLeft);
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text('+ ₹1,000', style: TextStyle(color :Color.fromRGBO(71, 192, 136, 1)),),
                                        Image.asset(
                                          'assets/images/info.png',
                                          height: 32,
                                          width: 32,
                                        ),
                                      ],
                                    ),
                                  )),
                                  const DataCell(Text(
                                    '            ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(241, 94, 83, 1)),
                                  )),
                                ]),
                                DataRow(cells: [
                                  const DataCell(Text('')),
                                  const DataCell(Text('')),
                                  const DataCell(Text('Con.')),
                                  DataCell(InkWell(
                                    onTap: (){
                                      Get.to(() => const OwnerEditProfile(),
                                          transition: Transition.rightToLeft);
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text('- ₹2,000', style: TextStyle(color: Color.fromRGBO(241, 94, 83, 1)),),
                                        Image.asset(
                                          'assets/images/info.png',
                                          height: 32,
                                          width: 32,
                                        ),
                                      ],
                                    ),
                                  )),
                                  const DataCell(Text(
                                    '',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(241, 94, 83, 1)),
                                  )),
                                ]),
                              ]),
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: SizedBox(
                      width: MediaQuery.sizeOf(context).width * .4,
                      child: FittedBox(
                        child: DataTable(
                            headingTextStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.black),
                            dividerThickness: 0,
                            dataRowMaxHeight: 0,
                            dataRowMinHeight: 0,
                            columns: const [
                              DataColumn(
                                label: Text('Jul 23'),
                              ),
                              DataColumn(
                                label: Text('₹28,000'),
                              ),
                              DataColumn(
                                label: Text('₹27,000'),
                              ),
                              DataColumn(
                                label: Text('₹22,000'),
                              ),
                            ],
                            //------------NO USE--------------
                            rows: const [
                              DataRow(cells: [
                                DataCell(Text(
                                  '',
                                  style: TextStyle(fontSize: 0.1, height: 0.01),
                                )),
                                DataCell(Text('',
                                    style: TextStyle(
                                        fontSize: 0.1, height: 0.01))),
                                DataCell(Text('',
                                    style: TextStyle(
                                        fontSize: 0.1, height: 0.01))),
                                DataCell(
                                  Text(
                                    ' ',
                                    style:
                                    TextStyle(fontSize: 0.1, height: 0.01),
                                  ),
                                )
                              ]),
                            ]),
                      ),
                    ),
                    tilePadding: const EdgeInsets.only(left: 4),
                    controlAffinity: ListTileControlAffinity.leading,
                    children: <Widget>[
                      SizedBox(
                        child: FittedBox(
                          child: DataTable(
                              headingRowColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(234, 239, 248, 1)),
                              headingTextStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              dividerThickness: 2,
                              headingRowHeight: .01,
                              dataRowMinHeight: 0,
                              //------------NO USE OF COLUMN--------------
                              columns: const [
                                DataColumn(
                                  label: Text(''),
                                ),
                                DataColumn(
                                  label: Text(''),
                                ),
                                DataColumn(
                                  label: Text(''),
                                ),
                                DataColumn(
                                  label: Text(''),
                                ),
                                DataColumn(
                                  label: Text(''),
                                ),
                              ],
                              //------------NO USE OF COLUMN--------------
                              rows: [
                                DataRow(cells: [
                                  const DataCell(Text('           ')),
                                  const DataCell(Text('           ')),
                                  const DataCell(Text('Misc.')),
                                  DataCell(InkWell(
                                    onTap: (){
                                      Get.to(() => const OwnerEditProfile(),
                                          transition: Transition.rightToLeft);
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text('+ ₹1,000', style: TextStyle(color :Color.fromRGBO(71, 192, 136, 1)),),
                                        Image.asset(
                                          'assets/images/info.png',
                                          height: 32,
                                          width: 32,
                                        ),
                                      ],
                                    ),
                                  )),
                                  const DataCell(Text(
                                    '            ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(241, 94, 83, 1)),
                                  )),
                                ]),
                                DataRow(cells: [
                                  const DataCell(Text('')),
                                  const DataCell(Text('')),
                                  const DataCell(Text('Con.')),
                                  DataCell(InkWell(
                                    onTap: (){
                                      Get.to(() => const OwnerEditProfile(),
                                          transition: Transition.rightToLeft);
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text('- ₹2,000', style: TextStyle(color: Color.fromRGBO(241, 94, 83, 1)),),
                                        Image.asset(
                                          'assets/images/info.png',
                                          height: 32,
                                          width: 32,
                                        ),
                                      ],
                                    ),
                                  )),
                                  const DataCell(Text(
                                    '',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(241, 94, 83, 1)),
                                  )),
                                ]),
                              ]),
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: SizedBox(
                      width: MediaQuery.sizeOf(context).width * .4,
                      child: FittedBox(
                        child: DataTable(
                            headingTextStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.black),
                            dividerThickness: 0,
                            dataRowMaxHeight: 0,
                            dataRowMinHeight: 0,
                            columns: const [
                              DataColumn(
                                label: Text('Jul 23'),
                              ),
                              DataColumn(
                                label: Text('₹28,000'),
                              ),
                              DataColumn(
                                label: Text('₹27,000'),
                              ),
                              DataColumn(
                                label: Text('₹22,000'),
                              ),
                            ],
                            //------------NO USE--------------
                            rows: const [
                              DataRow(cells: [
                                DataCell(Text(
                                  '',
                                  style: TextStyle(fontSize: 0.1, height: 0.01),
                                )),
                                DataCell(Text('',
                                    style: TextStyle(
                                        fontSize: 0.1, height: 0.01))),
                                DataCell(Text('',
                                    style: TextStyle(
                                        fontSize: 0.1, height: 0.01))),
                                DataCell(
                                  Text(
                                    ' ',
                                    style:
                                    TextStyle(fontSize: 0.1, height: 0.01),
                                  ),
                                )
                              ]),
                            ]),
                      ),
                    ),
                    tilePadding: const EdgeInsets.only(left: 4),
                    controlAffinity: ListTileControlAffinity.leading,
                    children: <Widget>[
                      SizedBox(
                        child: FittedBox(
                          child: DataTable(
                              headingRowColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(234, 239, 248, 1)),
                              headingTextStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              dividerThickness: 2,
                              headingRowHeight: .01,
                              dataRowMinHeight: 0,
                              //------------NO USE OF COLUMN--------------
                              columns: const [
                                DataColumn(
                                  label: Text(''),
                                ),
                                DataColumn(
                                  label: Text(''),
                                ),
                                DataColumn(
                                  label: Text(''),
                                ),
                                DataColumn(
                                  label: Text(''),
                                ),
                                DataColumn(
                                  label: Text(''),
                                ),
                              ],
                              //------------NO USE OF COLUMN--------------
                              rows: [
                                DataRow(cells: [
                                  const DataCell(Text('           ')),
                                  const DataCell(Text('           ')),
                                  const DataCell(Text('Misc.')),
                                  DataCell(InkWell(
                                    onTap: (){
                                      Get.to(() => const OwnerEditProfile(),
                                          transition: Transition.rightToLeft);
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text('+ ₹1,000', style: TextStyle(color :Color.fromRGBO(71, 192, 136, 1)),),
                                        Image.asset(
                                          'assets/images/info.png',
                                          height: 32,
                                          width: 32,
                                        ),
                                      ],
                                    ),
                                  )),
                                  const DataCell(Text(
                                    '            ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(241, 94, 83, 1)),
                                  )),
                                ]),
                                DataRow(cells: [
                                  const DataCell(Text('')),
                                  const DataCell(Text('')),
                                  const DataCell(Text('Con.')),
                                  DataCell(InkWell(
                                    onTap: (){
                                      Get.to(() => const OwnerEditProfile(),
                                          transition: Transition.rightToLeft);
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text('- ₹2,000', style: TextStyle(color: Color.fromRGBO(241, 94, 83, 1)),),
                                        Image.asset(
                                          'assets/images/info.png',
                                          height: 32,
                                          width: 32,
                                        ),
                                      ],
                                    ),
                                  )),
                                  const DataCell(Text(
                                    '',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(241, 94, 83, 1)),
                                  )),
                                ]),
                              ]),
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: SizedBox(
                      width: MediaQuery.sizeOf(context).width * .4,
                      child: FittedBox(
                        child: DataTable(
                            headingTextStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.black),
                            dividerThickness: 0,
                            dataRowMaxHeight: 0,
                            dataRowMinHeight: 0,
                            columns: const [
                              DataColumn(
                                label: Text('Jul 23'),
                              ),
                              DataColumn(
                                label: Text('₹28,000'),
                              ),
                              DataColumn(
                                label: Text('₹27,000'),
                              ),
                              DataColumn(
                                label: Text('₹22,000'),
                              ),
                            ],
                            //------------NO USE--------------
                            rows: const [
                              DataRow(cells: [
                                DataCell(Text(
                                  '',
                                  style: TextStyle(fontSize: 0.1, height: 0.01),
                                )),
                                DataCell(Text('',
                                    style: TextStyle(
                                        fontSize: 0.1, height: 0.01))),
                                DataCell(Text('',
                                    style: TextStyle(
                                        fontSize: 0.1, height: 0.01))),
                                DataCell(
                                  Text(
                                    ' ',
                                    style:
                                    TextStyle(fontSize: 0.1, height: 0.01),
                                  ),
                                )
                              ]),
                            ]),
                      ),
                    ),
                    tilePadding: const EdgeInsets.only(left: 4),
                    controlAffinity: ListTileControlAffinity.leading,
                    children: <Widget>[
                      SizedBox(
                        child: FittedBox(
                          child: DataTable(
                              headingRowColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(234, 239, 248, 1)),
                              headingTextStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              dividerThickness: 2,
                              headingRowHeight: .01,
                              dataRowMinHeight: 0,
                              //------------NO USE OF COLUMN--------------
                              columns: const [
                                DataColumn(
                                  label: Text(''),
                                ),
                                DataColumn(
                                  label: Text(''),
                                ),
                                DataColumn(
                                  label: Text(''),
                                ),
                                DataColumn(
                                  label: Text(''),
                                ),
                                DataColumn(
                                  label: Text(''),
                                ),
                              ],
                              //------------NO USE OF COLUMN--------------
                              rows: [
                                DataRow(cells: [
                                  const DataCell(Text('           ')),
                                  const DataCell(Text('           ')),
                                  const DataCell(Text('Misc.')),
                                  DataCell(InkWell(
                                    onTap: (){
                                      Get.to(() => const OwnerEditProfile(),
                                          transition: Transition.rightToLeft);
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text('+ ₹1,000', style: TextStyle(color :Color.fromRGBO(71, 192, 136, 1)),),
                                        Image.asset(
                                          'assets/images/info.png',
                                          height: 32,
                                          width: 32,
                                        ),
                                      ],
                                    ),
                                  )),
                                  const DataCell(Text(
                                    '            ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(241, 94, 83, 1)),
                                  )),
                                ]),
                                DataRow(cells: [
                                  const DataCell(Text('')),
                                  const DataCell(Text('')),
                                  const DataCell(Text('Con.')),
                                  DataCell(InkWell(
                                    onTap: (){
                                      Get.to(() => const OwnerEditProfile(),
                                          transition: Transition.rightToLeft);
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text('- ₹2,000', style: TextStyle(color: Color.fromRGBO(241, 94, 83, 1)),),
                                        Image.asset(
                                          'assets/images/info.png',
                                          height: 32,
                                          width: 32,
                                        ),
                                      ],
                                    ),
                                  )),
                                  const DataCell(Text(
                                    '',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(241, 94, 83, 1)),
                                  )),
                                ]),
                              ]),
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: SizedBox(
                      width: MediaQuery.sizeOf(context).width * .4,
                      child: FittedBox(
                        child: DataTable(
                            headingTextStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.black),
                            dividerThickness: 0,
                            dataRowMaxHeight: 0,
                            dataRowMinHeight: 0,
                            columns: const [
                              DataColumn(
                                label: Text('Jul 23'),
                              ),
                              DataColumn(
                                label: Text('₹28,000'),
                              ),
                              DataColumn(
                                label: Text('₹27,000'),
                              ),
                              DataColumn(
                                label: Text('₹22,000'),
                              ),
                            ],
                            //------------NO USE--------------
                            rows: const [
                              DataRow(cells: [
                                DataCell(Text(
                                  '',
                                  style: TextStyle(fontSize: 0.1, height: 0.01),
                                )),
                                DataCell(Text('',
                                    style: TextStyle(
                                        fontSize: 0.1, height: 0.01))),
                                DataCell(Text('',
                                    style: TextStyle(
                                        fontSize: 0.1, height: 0.01))),
                                DataCell(
                                  Text(
                                    ' ',
                                    style:
                                    TextStyle(fontSize: 0.1, height: 0.01),
                                  ),
                                )
                              ]),
                            ]),
                      ),
                    ),
                    tilePadding: const EdgeInsets.only(left: 4),
                    controlAffinity: ListTileControlAffinity.leading,
                    children: <Widget>[
                      SizedBox(
                        child: FittedBox(
                          child: DataTable(
                              headingRowColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(234, 239, 248, 1)),
                              headingTextStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              dividerThickness: 2,
                              headingRowHeight: .01,
                              dataRowMinHeight: 0,
                              //------------NO USE OF COLUMN--------------
                              columns: const [
                                DataColumn(
                                  label: Text(''),
                                ),
                                DataColumn(
                                  label: Text(''),
                                ),
                                DataColumn(
                                  label: Text(''),
                                ),
                                DataColumn(
                                  label: Text(''),
                                ),
                                DataColumn(
                                  label: Text(''),
                                ),
                              ],
                              //------------NO USE OF COLUMN--------------
                              rows: [
                                DataRow(cells: [
                                  const DataCell(Text('           ')),
                                  const DataCell(Text('           ')),
                                  const DataCell(Text('Misc.')),
                                  DataCell(InkWell(
                                    onTap: (){
                                      Get.to(() => const OwnerEditProfile(),
                                          transition: Transition.rightToLeft);
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text('+ ₹1,000', style: TextStyle(color :Color.fromRGBO(71, 192, 136, 1)),),
                                        Image.asset(
                                          'assets/images/info.png',
                                          height: 32,
                                          width: 32,
                                        ),
                                      ],
                                    ),
                                  )),
                                  const DataCell(Text(
                                    '            ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(241, 94, 83, 1)),
                                  )),
                                ]),
                                DataRow(cells: [
                                  const DataCell(Text('')),
                                  const DataCell(Text('')),
                                  const DataCell(Text('Con.')),
                                  DataCell(InkWell(
                                    onTap: (){
                                      Get.to(() => const OwnerEditProfile(),
                                          transition: Transition.rightToLeft);
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text('- ₹2,000', style: TextStyle(color: Color.fromRGBO(241, 94, 83, 1)),),
                                        Image.asset(
                                          'assets/images/info.png',
                                          height: 32,
                                          width: 32,
                                        ),
                                      ],
                                    ),
                                  )),
                                  const DataCell(Text(
                                    '',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(241, 94, 83, 1)),
                                  )),
                                ]),
                              ]),
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: SizedBox(
                      width: MediaQuery.sizeOf(context).width * .4,
                      child: FittedBox(
                        child: DataTable(
                            headingTextStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.black),
                            dividerThickness: 0,
                            dataRowMaxHeight: 0,
                            dataRowMinHeight: 0,
                            columns: const [
                              DataColumn(
                                label: Text('Jul 23'),
                              ),
                              DataColumn(
                                label: Text('₹28,000'),
                              ),
                              DataColumn(
                                label: Text('₹27,000'),
                              ),
                              DataColumn(
                                label: Text('₹22,000'),
                              ),
                            ],
                            //------------NO USE--------------
                            rows: const [
                              DataRow(cells: [
                                DataCell(Text(
                                  '',
                                  style: TextStyle(fontSize: 0.1, height: 0.01),
                                )),
                                DataCell(Text('',
                                    style: TextStyle(
                                        fontSize: 0.1, height: 0.01))),
                                DataCell(Text('',
                                    style: TextStyle(
                                        fontSize: 0.1, height: 0.01))),
                                DataCell(
                                  Text(
                                    ' ',
                                    style:
                                    TextStyle(fontSize: 0.1, height: 0.01),
                                  ),
                                )
                              ]),
                            ]),
                      ),
                    ),
                    tilePadding: const EdgeInsets.only(left: 4),
                    controlAffinity: ListTileControlAffinity.leading,
                    children: <Widget>[
                      SizedBox(
                        child: FittedBox(
                          child: DataTable(
                              headingRowColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(234, 239, 248, 1)),
                              headingTextStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              dividerThickness: 2,
                              headingRowHeight: .01,
                              dataRowMinHeight: 0,
                              //------------NO USE OF COLUMN--------------
                              columns: const [
                                DataColumn(
                                  label: Text(''),
                                ),
                                DataColumn(
                                  label: Text(''),
                                ),
                                DataColumn(
                                  label: Text(''),
                                ),
                                DataColumn(
                                  label: Text(''),
                                ),
                                DataColumn(
                                  label: Text(''),
                                ),
                              ],
                              //------------NO USE OF COLUMN--------------
                              rows: [
                                DataRow(cells: [
                                  const DataCell(Text('           ')),
                                  const DataCell(Text('           ')),
                                  const DataCell(Text('Misc.')),
                                  DataCell(InkWell(
                                    onTap: (){
                                      Get.to(() => const OwnerEditProfile(),
                                          transition: Transition.rightToLeft);
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text('+ ₹1,000', style: TextStyle(color :Color.fromRGBO(71, 192, 136, 1)),),
                                        Image.asset(
                                          'assets/images/info.png',
                                          height: 32,
                                          width: 32,
                                        ),
                                      ],
                                    ),
                                  )),
                                  const DataCell(Text(
                                    '            ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(241, 94, 83, 1)),
                                  )),
                                ]),
                                DataRow(cells: [
                                  const DataCell(Text('')),
                                  const DataCell(Text('')),
                                  const DataCell(Text('Con.')),
                                  DataCell(InkWell(
                                    onTap: (){
                                      Get.to(() => const OwnerEditProfile(),
                                          transition: Transition.rightToLeft);
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text('- ₹2,000', style: TextStyle(color: Color.fromRGBO(241, 94, 83, 1)),),
                                        Image.asset(
                                          'assets/images/info.png',
                                          height: 32,
                                          width: 32,
                                        ),
                                      ],
                                    ),
                                  )),
                                  const DataCell(Text(
                                    '',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(241, 94, 83, 1)),
                                  )),
                                ]),
                              ]),
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: SizedBox(
                      width: MediaQuery.sizeOf(context).width * .4,
                      child: FittedBox(
                        child: DataTable(
                            headingTextStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.black),
                            dividerThickness: 0,
                            dataRowMaxHeight: 0,
                            dataRowMinHeight: 0,
                            columns: const [
                              DataColumn(
                                label: Text('Jul 23'),
                              ),
                              DataColumn(
                                label: Text('₹28,000'),
                              ),
                              DataColumn(
                                label: Text('₹27,000'),
                              ),
                              DataColumn(
                                label: Text('₹22,000'),
                              ),
                            ],
                            //------------NO USE--------------
                            rows: const [
                              DataRow(cells: [
                                DataCell(Text(
                                  '',
                                  style: TextStyle(fontSize: 0.1, height: 0.01),
                                )),
                                DataCell(Text('',
                                    style: TextStyle(
                                        fontSize: 0.1, height: 0.01))),
                                DataCell(Text('',
                                    style: TextStyle(
                                        fontSize: 0.1, height: 0.01))),
                                DataCell(
                                  Text(
                                    ' ',
                                    style:
                                    TextStyle(fontSize: 0.1, height: 0.01),
                                  ),
                                )
                              ]),
                            ]),
                      ),
                    ),
                    tilePadding: const EdgeInsets.only(left: 4),
                    controlAffinity: ListTileControlAffinity.leading,
                    children: <Widget>[
                      SizedBox(
                        child: FittedBox(
                          child: DataTable(
                              headingRowColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(234, 239, 248, 1)),
                              headingTextStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              dividerThickness: 2,
                              headingRowHeight: .01,
                              dataRowMinHeight: 0,
                              //------------NO USE OF COLUMN--------------
                              columns: const [
                                DataColumn(
                                  label: Text(''),
                                ),
                                DataColumn(
                                  label: Text(''),
                                ),
                                DataColumn(
                                  label: Text(''),
                                ),
                                DataColumn(
                                  label: Text(''),
                                ),
                                DataColumn(
                                  label: Text(''),
                                ),
                              ],
                              //------------NO USE OF COLUMN--------------
                              rows: [
                                DataRow(cells: [
                                  const DataCell(Text('           ')),
                                  const DataCell(Text('           ')),
                                  const DataCell(Text('Misc.')),
                                  DataCell(InkWell(
                                    onTap: (){
                                      Get.to(() => const OwnerEditProfile(),
                                          transition: Transition.rightToLeft);
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text('+ ₹1,000', style: TextStyle(color :Color.fromRGBO(71, 192, 136, 1)),),
                                        Image.asset(
                                          'assets/images/info.png',
                                          height: 32,
                                          width: 32,
                                        ),
                                      ],
                                    ),
                                  )),
                                  const DataCell(Text(
                                    '            ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(241, 94, 83, 1)),
                                  )),
                                ]),
                                DataRow(cells: [
                                  const DataCell(Text('')),
                                  const DataCell(Text('')),
                                  const DataCell(Text('Con.')),
                                  DataCell(InkWell(
                                    onTap: (){
                                      Get.to(() => const OwnerEditProfile(),
                                          transition: Transition.rightToLeft);
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text('- ₹2,000', style: TextStyle(color: Color.fromRGBO(241, 94, 83, 1)),),
                                        Image.asset(
                                          'assets/images/info.png',
                                          height: 32,
                                          width: 32,
                                        ),
                                      ],
                                    ),
                                  )),
                                  const DataCell(Text(
                                    '',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(241, 94, 83, 1)),
                                  )),
                                ]),
                              ]),
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: SizedBox(
                      width: MediaQuery.sizeOf(context).width * .4,
                      child: FittedBox(
                        child: DataTable(
                            headingTextStyle: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.black),
                            dividerThickness: 0,
                            dataRowMaxHeight: 0,
                            dataRowMinHeight: 0,
                            columns: const [
                              DataColumn(
                                label: Text('Jul 23'),
                              ),
                              DataColumn(
                                label: Text('₹28,000'),
                              ),
                              DataColumn(
                                label: Text('₹27,000'),
                              ),
                              DataColumn(
                                label: Text('₹22,000'),
                              ),
                            ],
                            //------------NO USE--------------
                            rows: const [
                              DataRow(cells: [
                                DataCell(Text(
                                  '',
                                  style: TextStyle(fontSize: 0.1, height: 0.01),
                                )),
                                DataCell(Text('',
                                    style: TextStyle(
                                        fontSize: 0.1, height: 0.01))),
                                DataCell(Text('',
                                    style: TextStyle(
                                        fontSize: 0.1, height: 0.01))),
                                DataCell(
                                  Text(
                                    ' ',
                                    style:
                                    TextStyle(fontSize: 0.1, height: 0.01),
                                  ),
                                )
                              ]),
                            ]),
                      ),
                    ),
                    tilePadding: const EdgeInsets.only(left: 4),
                    controlAffinity: ListTileControlAffinity.leading,
                    children: <Widget>[
                      SizedBox(
                        child: FittedBox(
                          child: DataTable(
                              headingRowColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(234, 239, 248, 1)),
                              headingTextStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              dividerThickness: 2,
                              headingRowHeight: .01,
                              dataRowMinHeight: 0,
                              //------------NO USE OF COLUMN--------------
                              columns: const [
                                DataColumn(
                                  label: Text(''),
                                ),
                                DataColumn(
                                  label: Text(''),
                                ),
                                DataColumn(
                                  label: Text(''),
                                ),
                                DataColumn(
                                  label: Text(''),
                                ),
                                DataColumn(
                                  label: Text(''),
                                ),
                              ],
                              //------------NO USE OF COLUMN--------------
                              rows: [
                                DataRow(cells: [
                                  const DataCell(Text('           ')),
                                  const DataCell(Text('           ')),
                                  const DataCell(Text('Misc.')),
                                  DataCell(InkWell(
                                    onTap: (){
                                      Get.to(() => const OwnerEditProfile(),
                                          transition: Transition.rightToLeft);
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text('+ ₹1,000', style: TextStyle(color :Color.fromRGBO(71, 192, 136, 1)),),
                                        Image.asset(
                                          'assets/images/info.png',
                                          height: 32,
                                          width: 32,
                                        ),
                                      ],
                                    ),
                                  )),
                                  const DataCell(Text(
                                    '            ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(241, 94, 83, 1)),
                                  )),
                                ]),
                                DataRow(cells: [
                                  const DataCell(Text('')),
                                  const DataCell(Text('')),
                                  const DataCell(Text('Con.')),
                                  DataCell(InkWell(
                                    onTap: (){
                                      Get.to(() => const OwnerEditProfile(),
                                          transition: Transition.rightToLeft);
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text('- ₹2,000', style: TextStyle(color: Color.fromRGBO(241, 94, 83, 1)),),
                                        Image.asset(
                                          'assets/images/info.png',
                                          height: 32,
                                          width: 32,
                                        ),
                                      ],
                                    ),
                                  )),
                                  const DataCell(Text(
                                    '',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(241, 94, 83, 1)),
                                  )),
                                ]),
                              ]),
                        ),
                      ),
                    ],
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  List<DataRow> expandedValue;
  List<DataColumn> headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(headerValue: [
      DataColumn(label: Text(index.toString())),
      DataColumn(label: Text(index.toString())),
      DataColumn(label: Text(index.toString())),
      DataColumn(label: Text(index.toString())),
    ], expandedValue: [
      const DataRow(cells: [
        DataCell(Text('07, July')),
        DataCell(Text('Misc.')),
        DataCell(Text('Raj Verma')),
        DataCell(Text(
          '+₹1000',
          style: TextStyle(color: Color.fromRGBO(71, 192, 136, 1)),
        )),
      ]),
    ]);
  });
}
