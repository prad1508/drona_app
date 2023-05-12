// ignore_for_file: prefer_const_constructors

import 'package:drona/res/widget/customradio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Personal_Details extends StatefulWidget {
  const Personal_Details({super.key});

  @override
  State<Personal_Details> createState() => _Personal_DetailsState();
}

class _Personal_DetailsState extends State<Personal_Details> {
  List<String> coach_service = [
    "Golf",
    "Cricket",
    "Tennis",
    "Football",
    "Bedminton"
  ];
  List selectDetails = [];

  List<String> GMode = ["Male", "Female", "Others"];
  String? gender = 'f';
  ValueChanged<String?> _genderChanger() {
    return (value) => setState(() => gender = value!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Personal & Contact Details',
          style: TextStyle(
              fontSize: 18,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w700,
              color: Color(0xff39404A)),
        ),
        elevation: 0,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Full Name",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w600,
                    color: Color(0xff39404A)),
              ),
              SizedBox(height: 4),
              Container(
                width: 342,
                height: 48,
                child: TextField(
                  cursorHeight: 15,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400,
                      color: Color(0xff39404A)),
                  decoration: InputDecoration(
                    hintText: 'e.g Riyaz Mohammed',
                    hintStyle: TextStyle(color: Color(0xffC0C4CB)),
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffDFE1E4))),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Phone Number",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w600,
                    color: Color(0xff39404A)),
              ),
              SizedBox(height: 4),
              SizedBox(
                width: 342,
                height: 48,
                child: TextField(
                  cursorHeight: 15,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400,
                      color: Color(0xff39404A)),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'e.g 9876512345',
                    hintStyle: TextStyle(color: Color(0xffC0C4CB)),
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffDFE1E4))),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Gender",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w600,
                    color: Color(0xff39404A)),
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomRadio(
                      value: 'm',
                      groupValue: gender,
                      label: GMode[0],
                      onChanged: _genderChanger(),
                      btnColor: Colors.black),
                  CustomRadio(
                      value: 'f',
                      groupValue: gender,
                      label: GMode[1],
                      onChanged: _genderChanger(),
                      btnColor: Colors.black),
                  CustomRadio(
                      value: 'o',
                      groupValue: gender,
                      label: GMode[2],
                      onChanged: _genderChanger(),
                      btnColor: Colors.black),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date of Birth",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w600,
                            color: Color(0xff39404A)),
                      ),
                      SizedBox(height: 4),
                      SizedBox(
                        width: 163,
                        height: 48,
                        child: TextField(
                          readOnly: true,
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400,
                              color: Color(0xff39404A)),
                          decoration: InputDecoration(
                            hintText: '20 March 1989',
                            hintStyle: TextStyle(color: Color(0xffC0C4CB)),
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.calendar_month_outlined)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffDFE1E4))),
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Age",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w600,
                            color: Color(0xff39404A)),
                      ),
                      SizedBox(height: 4),
                      SizedBox(
                        width: 163,
                        height: 48,
                        child: TextField(
                          cursorHeight: 15,
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400,
                              color: Color(0xff39404A)),
                          decoration: InputDecoration(
                            hintText: 'e.g 34 Year',
                            hintStyle: TextStyle(color: Color(0xffC0C4CB)),
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffDFE1E4))),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 16),
              Text(
                "Email Id",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w600,
                    color: Color(0xff39404A)),
              ),
              SizedBox(height: 4),
              SizedBox(
                width: 342,
                height: 48,
                child: TextField(
                  cursorHeight: 15,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400,
                      color: Color(0xff39404A)),
                  decoration: InputDecoration(
                    hintText: 'e.g riyazmohammed9@gmail.com',
                    hintStyle: TextStyle(color: Color(0xffC0C4CB)),
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffDFE1E4))),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Joined On",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w600,
                            color: Color(0xff39404A)),
                      ),
                      SizedBox(height: 4),
                      SizedBox(
                        width: 163,
                        height: 48,
                        child: TextField(
                          readOnly: true,
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400,
                              color: Color(0xff39404A)),
                          decoration: InputDecoration(
                            hintText: '20 March 2023',
                            hintStyle: TextStyle(color: Color(0xffC0C4CB)),
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.calendar_month_outlined)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffDFE1E4))),
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Salary",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w600,
                            color: Color(0xff39404A)),
                      ),
                      SizedBox(height: 4),
                      SizedBox(
                        width: 163,
                        height: 48,
                        child: TextField(
                          cursorHeight: 15,
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400,
                              color: Color(0xff39404A)),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: '10,000',
                            hintStyle: TextStyle(color: Color(0xffC0C4CB)),
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffDFE1E4))),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 16),
              Text(
                "Service",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w600,
                    color: Color(0xff39404A)),
              ),
              SizedBox(height: 4),

              //Multi-Select DropDown Button;
           SizedBox(height: 16),
              Text(
                "Address",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w600,
                    color: Color(0xff39404A)),
              ),
              SizedBox(height: 4),
              Container(
                width: 342,
                height: 123,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffDFE1E4)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  cursorHeight: 15,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400,
                      color: Color(0xff39404A)),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(),
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                    hintText: 'Type Here',
                    hintStyle: TextStyle(color: Color(0xffC0C4CB)),
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "City",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w600,
                            color: Color(0xff39404A)),
                      ),
                      SizedBox(height: 4),
                      SizedBox(
                        width: 163,
                        height: 48,
                        child: TextField(
                          readOnly: true,
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400,
                              color: Color(0xff39404A)),
                          decoration: InputDecoration(
                            hintText: 'Chandigarh',
                            hintStyle: TextStyle(color: Color(0xffC0C4CB)),
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 15,
                                )),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffDFE1E4))),
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pincode",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w600,
                            color: Color(0xff39404A)),
                      ),
                      SizedBox(height: 4),
                      SizedBox(
                        width: 163,
                        height: 48,
                        child: TextField(
                          cursorHeight: 15,
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w400,
                              color: Color(0xff39404A)),
                          decoration: InputDecoration(
                            hintText: '160102',
                            hintStyle: TextStyle(color: Color(0xffC0C4CB)),
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffDFE1E4))),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 16),
              SizedBox(
                width: 342,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        backgroundColor: Color(0xff2A62B8)),
                    onPressed: () {
                      //Invitation Dialog Box;
                      showDialog(
                          context: context,
                          builder: (context) {
                            return SizedBox(
                              width: 342,
                              height: 266,
                              child: AlertDialog(
                                icon: SizedBox(
                                  width: 44,
                                  height: 44,
                                  child: CircleAvatar(
                                    backgroundColor: Color(0xff47C088),
                                    child: Icon(
                                      Icons.check_sharp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  "Send Invite",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w600),
                                ),
                                alignment: Alignment.center,
                                content: SizedBox(
                                  width: 209,
                                  height: 48,
                                  child: Text(
                                    "Send Invitation To Riyaz Mohammed!",
                                    style: TextStyle(
                                        color: Color(0xff626D7E),
                                        fontSize: 16,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w600),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                // contentPadding: EdgeInsets.all(24),
                                actions: [
                                  SizedBox(
                                    width: 139,
                                    height: 48,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xffDFE1E4),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)))),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(
                                              color: Color(0xff23282E),
                                              fontSize: 15,
                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.w600),
                                        )),
                                  ),
                                  Container(
                                    width: 139,
                                    height: 48,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8)),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xff2A62B8),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)))),
                                        onPressed: () {},
                                        child: Text(
                                          "Confirm",
                                          style: TextStyle(
                                              color: Color(0xffFBFBFC),
                                              fontSize: 15,
                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.w600),
                                        )),
                                  )
                                ],
                              ),
                            );
                          });
                    },
                    child: const Text(
                      "Submit",
                      style: TextStyle(fontSize: 15, fontFamily: 'Lato'),
                    )),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
