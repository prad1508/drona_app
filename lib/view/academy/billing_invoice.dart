// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:drona/res/widget/Academy_Listing/edit_billing_invoice.dart';
import 'package:drona/view/academy/view_payment_invoice.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Billing_And_Invoice extends StatefulWidget {
  const Billing_And_Invoice({super.key});

  @override
  State<Billing_And_Invoice> createState() => _Billing_And_InvoiceState();
}

class _Billing_And_InvoiceState extends State<Billing_And_Invoice> {
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
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 25, right: 25),
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
                    InkWell(
                      child: SizedBox(
                          width: 20,
                          height: 20,
                          child: SvgPicture.asset(
                            'assets/images/edit_square.svg',
                            color: Color(0xff99A0AB),
                          )),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const Edit_Billing_Invoice()),
                        );
                      },
                    ),
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
                          border: Border.all(color: Color(0xffDFE1E4)),
                          borderRadius: BorderRadius.circular(8)),
                      width: 114,
                      height: 35,
                      child: DropdownButtonHideUnderline(
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
                      ),
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
                          border: Border.all(color: Color(0xffDFE1E4)),
                          borderRadius: BorderRadius.circular(8)),
                      child: DropdownButtonHideUnderline(
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
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            border: Border.all(color: Color(0xffDFE1E4)),
                            borderRadius: BorderRadius.circular(8)),
                        child: DropdownButtonHideUnderline(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: DropdownButton(
                              icon: Icon(Icons.expand_more_outlined),
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
                    ]),
                //SizedBox(height: 35),
              ],
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.97,
            height: MediaQuery.of(context).size.height * 0.55,
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
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
                        width: MediaQuery.of(context).size.width * 0.95,
                        height: 70,
                        decoration: BoxDecoration(),
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Mar, 23",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Lato',
                                    color: Color(0xff39404A)),
                              ),
                              Text(
                                "Generated on 1 Mar, 23 ",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Lato',
                                    color: Color(0xff47C088)),
                              ),
                            ],
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "20 Trainees",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Lato',
                                    color: Color(0xff39404A)),
                              ),
                              Text(
                                "₹36,000",
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const Payment_Invoice_Page()),
                            );
                          },
                        )),
                    Divider(),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        height: 70,
                        decoration: BoxDecoration(),
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Apr, 23",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Lato',
                                    color: Color(0xff39404A)),
                              ),
                              Text(
                                "Generated on 1 Apr, 23 ",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Lato',
                                    color: Color(0xff47C088)),
                              ),
                            ],
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "20 Trainees",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Lato',
                                    color: Color(0xff39404A)),
                              ),
                              Text(
                                "₹20,000",
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
                          onTap: () {},
                        )),
                    Divider(),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        height: 70,
                        decoration: BoxDecoration(),
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "May, 23",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Lato',
                                    color: Color(0xff39404A)),
                              ),
                              Text(
                                "Generated on 1 May, 23 ",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Lato',
                                    color: Color(0xff47C088)),
                              ),
                            ],
                          ),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "20 Trainees",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Lato',
                                    color: Color(0xff39404A)),
                              ),
                              Text(
                                "₹20,000",
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
                          onTap: () {},
                        )),
                    Divider(),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      height: 70,
                      decoration: BoxDecoration(),
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Jul, 23",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Lato',
                                  color: Color(0xff39404A)),
                            ),
                            Text(
                              "Generated on 1 Jul, 23 ",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Lato',
                                  color: Color(0xff47C088)),
                            ),
                          ],
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "20 Trainees",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Lato',
                                  color: Color(0xff39404A)),
                            ),
                            Text(
                              "₹36,000",
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
                        onTap: () {},
                      ),
                    ),
                    Divider(),
                    SizedBox(height: 10),
                    Center(
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff2A62B8)),
                              borderRadius: BorderRadius.circular(8)),
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
                    )
                  ],
                ),
              ),
            ),
          ),
        ]),
      )),
    );
  }
}
