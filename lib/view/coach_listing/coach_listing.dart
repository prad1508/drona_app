// ignore_for_file: prefer_const_constructors

import 'package:drona/res/widget/Coach_Listing_Class/coach_listing_profile.dart';
import 'package:flutter/material.dart';

import '../../res/widget/Coach_Listing_Class/coachoption_btn.dart';

class Coach_Listing extends StatefulWidget {
  const Coach_Listing({super.key});

  @override
  State<Coach_Listing> createState() => _Coach_ListingState();
}

class _Coach_ListingState extends State<Coach_Listing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Coach Listing',
            style: TextStyle(color: Colors.black, fontSize: 18)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.52),
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                //OptionMenu Class Will Call;
                coachoptionbottomsheet(context);
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
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
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
                                  //bottomsheet(context);
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
            SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: const SizedBox(height: 20)),
            //Coach Details;
            Coach_Listing_Profile(),
          ],
        ),
      ),
    );
  }
}

//Option Buttom Sheet;
void coachoptionbottomsheet(context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Container(
        width: double.infinity,
        height: 335,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
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
                  Divider(
                    color: Colors.grey,
                    height: 31,
                  ),
                ],
              ),
              CoachOption_Button(),
            ],
          ),
        ),
      ),
    ),
  );
}
