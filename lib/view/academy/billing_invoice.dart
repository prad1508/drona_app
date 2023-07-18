// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:drona/res/widget/Academy_Listing/edit_billing_invoice.dart';
import 'package:drona/view/academy/view_payment_invoice.dart';
import 'package:drona/view_model/billing_invoice_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../data/response/status.dart';

class Billing_And_Invoice extends StatefulWidget {
  const Billing_And_Invoice({super.key});

  @override
  State<Billing_And_Invoice> createState() => _Billing_And_InvoiceState();
}

class _Billing_And_InvoiceState extends State<Billing_And_Invoice> {
  BillingInvoiceViewModel billingInvoiceViewModel = BillingInvoiceViewModel();
  //Months DropDown List;
  List<DropdownMenuItem<String>> get monthsItems {
    List<DropdownMenuItem<String>> monthsCycle = [
      DropdownMenuItem(value: "Weekly", child: Text("Weekly")),
      DropdownMenuItem(value: "Monthly", child: Text("Monthly")),
      DropdownMenuItem(value: "Yearly", child: Text("Yearly")),
    ];
    return monthsCycle;
  }

  String monthsSelect = "Monthly";

  //Billing Day DropDown List;

  List<DropdownMenuItem<String>> get dayItems {
    List<DropdownMenuItem<String>> billingCycle = [
      DropdownMenuItem(
          value: "1 of Every Months", child: Text("1 of Every Months")),
      DropdownMenuItem(
          value: "5 Of Every Months", child: Text("5 Of Every Months")),
      DropdownMenuItem(
          value: "10 Of Every Months", child: Text("10 Of Every Months")),
    ];
    return billingCycle;
  }

  int pageSize = 10;
  int pageNo = 1;
  var data = {"filter": ""};

  @override
  void initState() {
    billingInvoiceViewModel.fetchBillingInvoiceApi(data, pageSize, pageNo);
    super.initState();
  }

  String daySelect = "1 of Every Months";

  //Payment DueDate DropDown List;

  List<DropdownMenuItem<String>> get paymentItems {
    List<DropdownMenuItem<String>> paymentCycle = [
      DropdownMenuItem(
          value: "1 of Every Months", child: Text("1 of Every Months")),
      DropdownMenuItem(
          value: "2 Of Every Months", child: Text("2 Of Every Months")),
      DropdownMenuItem(
          value: "3 Of Every Months", child: Text("3 Of Every Months")),
      DropdownMenuItem(
          value: "4 Of Every Months", child: Text("4 Of Every Months")),
      DropdownMenuItem(
          value: "5 Of Every Months", child: Text("5 Of Every Months")),
      DropdownMenuItem(
          value: "6 Of Every Months", child: Text("6 Of Every Months")),
      DropdownMenuItem(
          value: "7 Of Every Months", child: Text("7 Of Every Months")),
      DropdownMenuItem(
          value: "8 Of Every Months", child: Text("8 Of Every Months")),
      DropdownMenuItem(
          value: "9 Of Every Months", child: Text("9 Of Every Months")),
      DropdownMenuItem(
          value: "10 Of Every Months", child: Text("10 Of Every Months")),
      DropdownMenuItem(
          value: "11 Of Every Months", child: Text("11 Of Every Months")),
      DropdownMenuItem(
          value: "12 Of Every Months", child: Text("12 Of Every Months")),
      DropdownMenuItem(
          value: "13 Of Every Months", child: Text("13 Of Every Months")),
      DropdownMenuItem(
          value: "14 Of Every Months", child: Text("14 Of Every Months")),
      DropdownMenuItem(
          value: "15 Of Every Months", child: Text("15 Of Every Months")),
      DropdownMenuItem(
          value: "16 Of Every Months", child: Text("16 Of Every Months")),
      DropdownMenuItem(
          value: "17 Of Every Months", child: Text("17 Of Every Months")),
      DropdownMenuItem(
          value: "18 Of Every Months", child: Text("18 Of Every Months")),
      DropdownMenuItem(
          value: "19 Of Every Months", child: Text("19 Of Every Months")),
      DropdownMenuItem(
          value: "20 Of Every Months", child: Text("20 Of Every Months")),
      DropdownMenuItem(
          value: "21 Of Every Months", child: Text("21 Of Every Months")),
      DropdownMenuItem(
          value: "22 Of Every Months", child: Text("22 Of Every Months")),
      DropdownMenuItem(
          value: "23 Of Every Months", child: Text("23 Of Every Months")),
      DropdownMenuItem(
          value: "24 Of Every Months", child: Text("24 Of Every Months")),
      DropdownMenuItem(
          value: "25 Of Every Months", child: Text("25 Of Every Months")),
      DropdownMenuItem(
          value: "26 Of Every Months", child: Text("26 Of Every Months")),
      DropdownMenuItem(
          value: "27 Of Every Months", child: Text("27 Of Every Months")),
      DropdownMenuItem(
          value: "28 Of Every Months", child: Text("28 Of Every Months")),
      DropdownMenuItem(
          value: "29 Of Every Months", child: Text("29 Of Every Months")),
      DropdownMenuItem(
          value: "30 Of Every Months", child: Text("30 Of Every Months")),
      DropdownMenuItem(
          value: "31 Of Every Months", child: Text("31 Of Every Months")),
    ];
    return paymentCycle;
  }

  String paymentSelect = "1 of Every Months";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Billing & Invoices',
            style: TextStyle(color: Colors.black, fontSize: 18)),
        elevation: 0,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
            child: ChangeNotifierProvider<BillingInvoiceViewModel>(
          create: (BuildContext context) => billingInvoiceViewModel,
          child: Consumer<BillingInvoiceViewModel>(
            builder: (context, value, _) {
              switch (value.dataList.status!) {
                case Status.loading:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case Status.completed:
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 25, right: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Billing Detail",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Lato',
                                      color: Color(0xff39404A)),
                                ),
                                /*InkWell(
                                  child: SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: SvgPicture.asset(
                                        'assets/images/edit_square.svg',
                                        color: Color(0xff99A0AB),
                                      )),
                                  onTap: () {
                                    *//* Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const Edit_Billing_Invoice()),
                            );*//*
                                    Get.to(() => const Edit_Billing_Invoice(),
                                        transition: Transition.leftToRight);
                                  },
                                ),*/
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Billing Cycle",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Lato',
                                      color: Color(0xff39404A)),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xffDFE1E4)),
                                      borderRadius: BorderRadius.circular(8)),
                                  width: 114,
                                  height: 35,
                                  child: Center(child: Text("Monthly"))
                                  /*DropdownButtonHideUnderline(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: DropdownButton(
                                        icon: Icon(Icons.expand_more_outlined),
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Lato',
                                            color: Color(0xff39404A)),
                                        value: monthsSelect,
                                        onChanged: (value) {
                                          setState(() {
                                            monthsSelect = value!;
                                          });
                                        },
                                        items: monthsItems,
                                      ),
                                    ),
                                  ),*/
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Billing Day",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Lato',
                                      color: Color(0xff39404A)),
                                ),
                                Container(
                                  width: 157,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xffDFE1E4)),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Center(child: Text("${value.dataList.data!.billingDate} of Every Month"),)
                                 /* DropdownButtonHideUnderline(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: DropdownButton(
                                        icon: Icon(Icons.expand_more_outlined),
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Lato',
                                            color: Color(0xff39404A)),
                                        value: daySelect,
                                        onChanged: (value) {
                                          setState(() {
                                            daySelect = value!;
                                          });
                                        },
                                        items: dayItems,
                                      ),
                                    ),
                                  ),*/
                                ),
                              ],
                            ),
                            /*SizedBox(height: 15),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Payment Due By",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Lato',
                                        color: Color(0xff39404A)),
                                  ),
                                  Container(
                                    width: 161,
                                    height: 35,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xffDFE1E4)),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: DropdownButtonHideUnderline(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: DropdownButton(
                                          icon:
                                              Icon(Icons.expand_more_outlined),
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Lato',
                                              color: Color(0xff39404A)),
                                          value: paymentSelect,
                                          onChanged: (value) {
                                            setState(() {
                                              paymentSelect = value!;
                                            });
                                          },
                                          items: paymentItems,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),*/
                            //SizedBox(height: 35),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        //color: Colors.red,
                        width: MediaQuery.of(context).size.width * 0.97,
                        height: MediaQuery.of(context).size.height * 0.65,
                        child: ListView.builder(
                          itemCount: value.dataList.data!.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:
                              const EdgeInsets.only(left: 8.0, right: 5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Invoice Generated",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Lato',
                                        color: Color(0xff39404A)),
                                  ),
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.95,
                                      height: 70,
                                      decoration: BoxDecoration(),
                                      child: ListTile(
                                        title: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children:  [
                                            Text(
                                              "${value.dataList.data!.data[index].mm}-${value.dataList.data!.data[index].yy}",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Lato',
                                                  color: Color(0xff39404A)),
                                            ),
                                            Text(
                                              "Generated on ${value.dataList.data!.data[index].createDd}-${value.dataList.data!.data[index].createMm}-${value.dataList.data!.data[index].createYy}",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: 'Lato',
                                                  color: Color(0xff47C088)),
                                            ),
                                          ],
                                        ),
                                        subtitle: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children:  [
                                            Text(
                                              "${value.dataList.data!.totalDataCount} Trainee",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Lato',
                                                  color: Color(0xff39404A)),
                                            ),
                                            Text(
                                              "₹${value.dataList.data!.data[index].totalAmount}",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Lato',
                                                  color: Color(0xff39404A)),
                                            )
                                          ],
                                        ),
                                        trailing: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: 15,
                                        ),
                                        onTap: () {
                                          /* Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Payment_Invoice_Page()),
                                );*/
                                          Get.to(
                                                  () =>  Payment_Invoice_Page(
                                                    totalFeePaid: value.dataList.data!.data[index].totalTraineeFeePaid.toString(),
                                                    totalFeeDue: value.dataList.data!.data[index].totalTraineeFeeDue.toString(),
                                                    totalCollectionDue: value.dataList.data!.data[index].totalDue.toString(),
                                                    totalCollectionPaid: value.dataList.data!.data[index].totalCollection.toString(),
                                                    billingMonth: "${value.dataList.data!.data[index].mm}-${value.dataList.data!.data[index].yy}",),
                                              transition: Transition.leftToRight);
                                        },
                                      )),

                                ],
                              ),
                            );
                          },

                        ),
                      ),
                     /* Align(
                        alignment: Alignment.bottomCenter,
                        child: Center(
                          child: Container(
                              width: MediaQuery.of(context).size.width *
                                  0.85,
                              height: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xff2A62B8)),
                                  borderRadius:
                                  BorderRadius.circular(8)),
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "View More...",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Lato',
                                        color: Color(0xff2A62B8)),
                                  ))),
                        ),
                      )*/
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
