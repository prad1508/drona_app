// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Edit_Billing_Invoice extends StatefulWidget {
  const Edit_Billing_Invoice({super.key});

  @override
  State<Edit_Billing_Invoice> createState() => _Edit_Billing_InvoiceState();
}

class _Edit_Billing_InvoiceState extends State<Edit_Billing_Invoice> {
  //Months DropDown List;
  List<DropdownMenuItem<String>> get monthsItems {
    List<DropdownMenuItem<String>> monthsCycle = [
      DropdownMenuItem(child: Text("Weekly"), value: "Weekly"),
      DropdownMenuItem(child: Text("Monthly"), value: "Monthly"),
      DropdownMenuItem(child: Text("Yearly"), value: "Yearly"),
    ];
    return monthsCycle;
  }

  String monthsSelect = "Monthly";

  //Billing Day DropDown List;

  List<DropdownMenuItem<String>> get dayItems {
    List<DropdownMenuItem<String>> billingCycle = [
      DropdownMenuItem(
          child: Text("1 of Every Months"), value: "1 of Every Months"),
      DropdownMenuItem(
          child: Text("5 Of Every Months"), value: "5 Of Every Months"),
      DropdownMenuItem(
          child: Text("10 Of Every Months"), value: "10 Of Every Months"),
    ];
    return billingCycle;
  }

  String daySelect = "1 of Every Months";

  //Payment DueDate DropDown List;

  List<DropdownMenuItem<String>> get paymentItems {
    List<DropdownMenuItem<String>> paymentCycle = [
      DropdownMenuItem(
          child: Text("1 of Every Months"), value: "1 of Every Months"),
      DropdownMenuItem(
          child: Text("2 Of Every Months"), value: "2 Of Every Months"),
      DropdownMenuItem(
          child: Text("3 Of Every Months"), value: "3 Of Every Months"),
      DropdownMenuItem(
          child: Text("4 Of Every Months"), value: "4 Of Every Months"),
      DropdownMenuItem(
          child: Text("5 Of Every Months"), value: "5 Of Every Months"),
      DropdownMenuItem(
          child: Text("6 Of Every Months"), value: "6 Of Every Months"),
      DropdownMenuItem(
          child: Text("7 Of Every Months"), value: "7 Of Every Months"),
      DropdownMenuItem(
          child: Text("8 Of Every Months"), value: "8 Of Every Months"),
      DropdownMenuItem(
          child: Text("9 Of Every Months"), value: "9 Of Every Months"),
      DropdownMenuItem(
          child: Text("10 Of Every Months"), value: "10 Of Every Months"),
      DropdownMenuItem(
          child: Text("11 Of Every Months"), value: "11 Of Every Months"),
      DropdownMenuItem(
          child: Text("12 Of Every Months"), value: "12 Of Every Months"),
      DropdownMenuItem(
          child: Text("13 Of Every Months"), value: "13 Of Every Months"),
      DropdownMenuItem(
          child: Text("14 Of Every Months"), value: "14 Of Every Months"),
      DropdownMenuItem(
          child: Text("15 Of Every Months"), value: "15 Of Every Months"),
      DropdownMenuItem(
          child: Text("16 Of Every Months"), value: "16 Of Every Months"),
      DropdownMenuItem(
          child: Text("17 Of Every Months"), value: "17 Of Every Months"),
      DropdownMenuItem(
          child: Text("18 Of Every Months"), value: "18 Of Every Months"),
      DropdownMenuItem(
          child: Text("19 Of Every Months"), value: "19 Of Every Months"),
      DropdownMenuItem(
          child: Text("20 Of Every Months"), value: "20 Of Every Months"),
      DropdownMenuItem(
          child: Text("21 Of Every Months"), value: "21 Of Every Months"),
      DropdownMenuItem(
          child: Text("22 Of Every Months"), value: "22 Of Every Months"),
      DropdownMenuItem(
          child: Text("23 Of Every Months"), value: "23 Of Every Months"),
      DropdownMenuItem(
          child: Text("24 Of Every Months"), value: "24 Of Every Months"),
      DropdownMenuItem(
          child: Text("25 Of Every Months"), value: "25 Of Every Months"),
      DropdownMenuItem(
          child: Text("26 Of Every Months"), value: "26 Of Every Months"),
      DropdownMenuItem(
          child: Text("27 Of Every Months"), value: "27 Of Every Months"),
      DropdownMenuItem(
          child: Text("28 Of Every Months"), value: "28 Of Every Months"),
      DropdownMenuItem(
          child: Text("29 Of Every Months"), value: "29 Of Every Months"),
      DropdownMenuItem(
          child: Text("30 Of Every Months"), value: "30 Of Every Months"),
      DropdownMenuItem(
          child: Text("31 Of Every Months"), value: "31 Of Every Months"),
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
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.99,
                height: MediaQuery.of(context).size.width * 1.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10.0, left: 25, right: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Billing Detail",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Lato',
                                    color: Color(0xff39404A)),
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
                                    border:
                                        Border.all(color: Color(0xffDFE1E4)),
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
                                    border:
                                        Border.all(color: Color(0xffDFE1E4)),
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
                                    border:
                                        Border.all(color: Color(0xffDFE1E4)),
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
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 342,
                  height: 45,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          backgroundColor: Color(0xff2A62B8)),
                      onPressed: () {},
                      child: const Text(
                        "Submit",
                        style: TextStyle(fontSize: 15, fontFamily: 'Lato'),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
