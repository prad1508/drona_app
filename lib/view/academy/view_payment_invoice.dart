// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:drona/res/widget/dashboard_card.dart';
import 'package:drona/view_model/billing_invoice_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/response/status.dart';

class Payment_Invoice_Page extends StatefulWidget {
  String billingMonth;
  String totalFeePaid;
  String totalFeeDue;
  String totalCollectionDue;
  String totalCollectionPaid;
  Payment_Invoice_Page({super.key,required this.billingMonth, required this.totalFeePaid, required this.totalFeeDue, required this.totalCollectionDue, required this.totalCollectionPaid});
  @override
  State<Payment_Invoice_Page> createState() => _Payment_Invoice_PageState();
}

class _Payment_Invoice_PageState extends State<Payment_Invoice_Page> {

  BillingInvoiceViewModel billingInvoiceViewModel = BillingInvoiceViewModel();

  int pageSize = 10;
  int pageNo = 1;

  @override
  void initState() {
    print("billingMonth==${widget.billingMonth}");
    billingInvoiceViewModel.fetchBillingViewInvoiceApi({"filter": widget.billingMonth.toString()}, pageSize, pageNo);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

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
            child: ChangeNotifierProvider<BillingInvoiceViewModel>(
              create: (context) => billingInvoiceViewModel,


              child: Consumer<BillingInvoiceViewModel>(
                builder: (context, value, _){

                  switch(value.dataList1.status!){

                    case Status.loading:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    case Status.completed:
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, top: 10),
                            child: Text(
                              widget.billingMonth,
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
                              children:  [
                                DashboardCard(
                                    color: Color(0xff173564),
                                    icon: Icons.currency_rupee_outlined,
                                    count: int.parse(widget.totalFeePaid),
                                    title: 'Fee Paid',
                                    subtitle: '${widget.totalFeeDue} Trainee Due',
                                    line: .8),
                                DashboardCard(
                                    color: Color(0xff0095F7),
                                    icon: Icons.account_balance_wallet_outlined,
                                    count:int.parse(widget.totalCollectionPaid) ,
                                    title: 'Collection',
                                    subtitle: '${widget.totalCollectionDue} - Due Amount',
                                    line: .8)
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.98,
                              height: h,
                              color: Colors.white,
                              child:
                              DataTable(
                                columnSpacing: 40,
                                dataRowHeight: 45,
                                headingRowColor: MaterialStatePropertyAll(Color(0xffEAEFF8)),
                                headingRowHeight: 35,
                                dividerThickness: double.infinity,
                                columns: <DataColumn>[
                                  DataColumn(label: Text("#")),
                                  DataColumn(label: Text("TRAINEE")),
                                  DataColumn(label: Text("FEE")),
                                  DataColumn(label: Text("PAID")),
                                  DataColumn(label: Text("DUE")),
                                ],
                                // Data Table Rows
                                rows: value.dataList1.data!.data.asMap().entries.map((entry) {
                                  final index = entry.key + 1; // Adding 1 to start counting from 1 instead of 0
                                  final e = entry.value;
                                  Color rowColor = e.paid == 0 ? Colors.grey[200]! : Colors.white;


                                  return DataRow(
                                    color: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                      if (states.contains(MaterialState.selected)) {
                                        return rowColor; // Apply color when row is selected
                                      }
                                      return Colors.white; // Use default color for unselected rows
                                    }),                                    cells: <DataCell>[
                                      DataCell(
                                        Text(
                                          index.toString(), // Display the index
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Lato',
                                            color: Color(0xff39404A),
                                          ),
                                        ),
                                      ),
                                      DataCell(Text(
                                        e.traineeName,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Lato',
                                          color: Color(0xff39404A),
                                        ),
                                      )),
                                      DataCell(
                                        Text(
                                          e.fees.toString(),
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Lato',
                                            color: Color(0xff39404A),
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                          Text(
                                        e.paid.toString(),
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Lato',
                                          color: e.paid == 0  ? Color(0xff39404A):Color(0xff47C088),
                                        ),
                                      )),
                                      DataCell(Text(
                                        e.due.toString(),
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Lato',
                                          color: Color(0xff39404A),
                                        ),
                                      )),
                                    ],
                                  );
                                }).toList(),
                              )



                            ),
                          )
                        ],
                      );
                    case Status.error:
                      return Center(child: Text("No Data Found"));

                  }


                },

              ),
            ),
          )),
    );
  }
}

