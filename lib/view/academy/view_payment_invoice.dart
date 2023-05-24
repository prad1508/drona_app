// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:drona/res/widget/dashboard_card.dart';
import 'package:flutter/material.dart';

class Payment_Invoice_Page extends StatefulWidget {
  const Payment_Invoice_Page({super.key});

  @override
  State<Payment_Invoice_Page> createState() => _Payment_Invoice_PageState();
}

class _Payment_Invoice_PageState extends State<Payment_Invoice_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('View Invoices & Payment',
            style: TextStyle(color: Colors.black, fontSize: 18)),
        elevation: 0,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10),
              child: Text(
                "May, 23",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Lato',
                    color: Color(0xff39404A)),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  DashboardCard(
                      color: Color(0xff173564),
                      icon: Icons.currency_rupee_outlined,
                      count: '8',
                      title: 'Fee Paid',
                      subtitle: '12 Trainee Due',
                      line: .8),
                  DashboardCard(
                      color: Color(0xff0095F7),
                      icon: Icons.account_balance_wallet_outlined,
                      count: '14,000',
                      title: 'Collection',
                      subtitle: '21,600 - Due Amount',
                      line: .8)
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.98,
                child: DataTable(
                    columnSpacing: 40,
                    dataRowHeight: 45,
                    headingRowColor:
                        MaterialStatePropertyAll(Color(0xffEAEFF8)),
                    headingRowHeight: 35,
                    dividerThickness: double.infinity,
                    columns: <DataColumn>[
                      DataColumn(label: Text("#")),
                      DataColumn(label: Text("TRAINEE")),
                      DataColumn(label: Text("FEE")),
                      DataColumn(label: Text("PAID")),
                      DataColumn(label: Text("DUE")),
                    ],
                    //Data Table Row;
                    rows: <DataRow>[
                      DataRow(cells: <DataCell>[
                        DataCell(Text(
                          "1",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(Text(
                          "Arya Sharma",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(
                          Text(
                            "₹1,800",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Lato',
                                color: Color(0xff39404A)),
                          ),
                        ),
                        DataCell(Text(
                          "+ ₹1,800",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff47C088)),
                        )),
                        DataCell(Text(
                          "0",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                      ]),
                      DataRow(cells: <DataCell>[
                        DataCell(Text(
                          "2",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(Text(
                          "Supriya Jha",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(
                          Text(
                            "₹1,800",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Lato',
                                color: Color(0xff39404A)),
                          ),
                        ),
                        DataCell(Text(
                          " 0",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(Text(
                          "₹1,800",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                      ]),
                      DataRow(cells: <DataCell>[
                        DataCell(Text(
                          "3",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(Text(
                          "Yamini Gowda",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(
                          Text(
                            "₹1,800",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Lato',
                                color: Color(0xff39404A)),
                          ),
                        ),
                        DataCell(Text(
                          "+ ₹1,800",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff47C088)),
                        )),
                        DataCell(Text(
                          "0",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                      ]),
                      DataRow(cells: <DataCell>[
                        DataCell(Text(
                          "4",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(Text(
                          "Rupa chandrasekar",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(
                          Text(
                            "₹1,800",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Lato',
                                color: Color(0xff39404A)),
                          ),
                        ),
                        DataCell(Text(
                          "0",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(Text(
                          "₹1,800",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                      ]),
                      DataRow(cells: <DataCell>[
                        DataCell(Text(
                          "5",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(Text(
                          "Priyanka Jadhav",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(
                          Text(
                            "₹1,800",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Lato',
                                color: Color(0xff39404A)),
                          ),
                        ),
                        DataCell(Text(
                          "+ ₹1,800",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff47C088)),
                        )),
                        DataCell(Text(
                          "0",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                      ]),
                      DataRow(cells: <DataCell>[
                        DataCell(Text(
                          "6",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(Text(
                          "Ramesh Sharma",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(
                          Text(
                            "₹1,800",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Lato',
                                color: Color(0xff39404A)),
                          ),
                        ),
                        DataCell(Text(
                          "0",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(Text(
                          "+ ₹1,800",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                      ]),
                      DataRow(cells: <DataCell>[
                        DataCell(Text(
                          "7",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(Text(
                          "Yamini Gowda",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(
                          Text(
                            "₹1,800",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Lato',
                                color: Color(0xff39404A)),
                          ),
                        ),
                        DataCell(Text(
                          "+ ₹1,800",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff47C088)),
                        )),
                        DataCell(Text(
                          "0",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                      ]),
                      DataRow(cells: <DataCell>[
                        DataCell(Text(
                          "8",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(Text(
                          "Suraj Pandey",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(
                          Text(
                            "₹1,800",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Lato',
                                color: Color(0xff39404A)),
                          ),
                        ),
                        DataCell(Text(
                          "0",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(Text(
                          "+ ₹1,800",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                      ]),
                      DataRow(cells: <DataCell>[
                        DataCell(Text(
                          "9",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(Text(
                          "Kanishka Kapoor",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(
                          Text(
                            "₹1,800",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Lato',
                                color: Color(0xff39404A)),
                          ),
                        ),
                        DataCell(Text(
                          "+ ₹1,800",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff47C088)),
                        )),
                        DataCell(Text(
                          "0",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                      ]),
                      DataRow(cells: <DataCell>[
                        DataCell(Text(
                          "10",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(Text(
                          "Anuja Shinde",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(
                          Text(
                            "₹1,800",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Lato',
                                color: Color(0xff39404A)),
                          ),
                        ),
                        DataCell(Text(
                          "0",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(Text(
                          "+ ₹1,800",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                      ]),
                      DataRow(cells: <DataCell>[
                        DataCell(Text(
                          "11",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(Text(
                          "Aarav saxena",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(
                          Text(
                            "₹1,800",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Lato',
                                color: Color(0xff39404A)),
                          ),
                        ),
                        DataCell(Text(
                          "+ ₹1,800",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff47C088)),
                        )),
                        DataCell(Text(
                          "0",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                      ]),
                      DataRow(cells: <DataCell>[
                        DataCell(Text(
                          "12",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(Text(
                          "Swapnaja Shirode",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(
                          Text(
                            "₹1,800",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Lato',
                                color: Color(0xff39404A)),
                          ),
                        ),
                        DataCell(Text(
                          "0",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(Text(
                          "+ ₹1,800",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                      ]),
                      DataRow(cells: <DataCell>[
                        DataCell(Text(
                          "13",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(Text(
                          "Kapil Ojha",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(
                          Text(
                            "₹1,800",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Lato',
                                color: Color(0xff39404A)),
                          ),
                        ),
                        DataCell(Text(
                          "+ ₹1,800",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff47C088)),
                        )),
                        DataCell(Text(
                          "0",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                      ]),
                      DataRow(cells: <DataCell>[
                        DataCell(Text(
                          "14",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(Text(
                          "Raghu Nadh",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(
                          Text(
                            "₹1,800",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Lato',
                                color: Color(0xff39404A)),
                          ),
                        ),
                        DataCell(Text(
                          "0",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(Text(
                          "+ ₹1,800",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                      ]),
                      DataRow(cells: <DataCell>[
                        DataCell(Text(
                          "15",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(Text(
                          "Rajveer mishra",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(
                          Text(
                            "₹1,800",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Lato',
                                color: Color(0xff39404A)),
                          ),
                        ),
                        DataCell(Text(
                          "+ ₹1,800",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff47C088)),
                        )),
                        DataCell(Text(
                          "0",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                      ]),
                      DataRow(cells: <DataCell>[
                        DataCell(Text(
                          "16",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(Text(
                          "Richa Verma",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(
                          Text(
                            "₹1,800",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Lato',
                                color: Color(0xff39404A)),
                          ),
                        ),
                        DataCell(Text(
                          "0",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(Text(
                          "+ ₹1,800",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                      ]),
                      DataRow(cells: <DataCell>[
                        DataCell(Text(
                          "17",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(Text(
                          "Ramesh Sharma",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(
                          Text(
                            "₹1,800",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Lato',
                                color: Color(0xff39404A)),
                          ),
                        ),
                        DataCell(Text(
                          "0",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(Text(
                          "+ ₹1,800",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                      ]),
                      DataRow(cells: <DataCell>[
                        DataCell(Text(
                          "18",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(Text(
                          "Kishore Kumar",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(
                          Text(
                            "₹1,800",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Lato',
                                color: Color(0xff39404A)),
                          ),
                        ),
                        DataCell(Text(
                          "0",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(Text(
                          "+ ₹1,800",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                      ]),
                      DataRow(cells: <DataCell>[
                        DataCell(Text(
                          "19",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(Text(
                          "Pappu Yadav",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(
                          Text(
                            "₹1,800",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Lato',
                                color: Color(0xff39404A)),
                          ),
                        ),
                        DataCell(Text(
                          "0",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(Text(
                          "+ ₹1,800",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                      ]),
                      DataRow(cells: <DataCell>[
                        DataCell(Text(
                          "20",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(Text(
                          "Aaradhya Anand",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(
                          Text(
                            "₹1,800",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Lato',
                                color: Color(0xff39404A)),
                          ),
                        ),
                        DataCell(Text(
                          "0",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                        DataCell(Text(
                          "+ ₹1,800",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                              color: Color(0xff39404A)),
                        )),
                      ]),
                    ]),
              ),
            )
          ],
        ),
      )),
    );
  }
}
