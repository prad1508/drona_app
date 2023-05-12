// ignore_for_file: prefer_const_constructors

import 'package:drona/res/widget/Trainee_Listing_Class/batch_name.dart';
import 'package:drona/res/widget/Trainee_Listing_Class/filter_trainee_list.dart';
import 'package:drona/res/widget/Trainee_Listing_Class/option_btn.dart';
import 'package:drona/res/widget/Trainee_Listing_Class/trainee_listing_profile.dart';
import 'package:drona/view/trainee_listing/ledger.dart';
import 'package:drona/view/trainee_listing/record_payment.dart';
import 'package:flutter/material.dart';

import 'activate.dart';
import 'deactivate.dart';
import 'edit_batch.dart';

class Trainee_Listing extends StatefulWidget {
  const Trainee_Listing({super.key});

  @override
  State<Trainee_Listing> createState() => _Trainee_ListingState();
}

class _Trainee_ListingState extends State<Trainee_Listing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Training Listing',
            style: TextStyle(color: Colors.black, fontSize: 18)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.52),
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                //OptionMenu Class Will Call;
                optionbottomsheet(context);
              },
            ),
          )
        ],
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 25.0, right: 25.0, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 36,
                          width: 48,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Color(0xffDFE1E4))),
                          child: SizedBox(
                            width: 12,
                            height: 8,
                            child: InkWell(
                                child: Icon(
                                  Icons.filter_list,
                                  color: Color(0xff39404A),
                                ),
                                onTap: () {
                                  bottomsheet(context);
                                }),
                          )),
                      Container(
                        width: 282,
                        height: 36,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Color(0xffDFE1E4))),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide.none),
                              enabledBorder: InputBorder.none,
                              hintText: 'Search',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.normal),
                              suffixIcon: Icon(Icons.search,
                                  color: Colors.grey.shade800),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              child: Trainee_Listing_Profile(),
            )
          ],
        ),
      ),
    );
  }
}

//Filter Bottom Sheet Class;
void bottomsheet(context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => Container(
      width: 390,
      height: 402,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 35),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Filters",
                      style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff39404A)),
                    ),
                    Divider(),
                    SizedBox(height: 40),
                    Container(
                      width: 342,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffDFE1E4)),
                          borderRadius: BorderRadius.circular(8)),
                      child: Batch_DropDown(),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Trainee Status",
                      style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff39404A)),
                    ),
                    Filter()
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

//Option Buttom Sheet;
void optionbottomsheet(context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Container(
        width: 390,
        height: 479,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 35),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Select Option",
                      style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff39404A)),
                    ),
                    Divider(),
                    SizedBox(height: 30),
                  ],
                ),
                Option_Button(),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
