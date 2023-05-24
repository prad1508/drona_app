// ignore_for_file: prefer_const_constructors

import 'package:drona/res/widget/Academy_Listing/academy_details_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Academy_Detail_Page extends StatefulWidget {
  const Academy_Detail_Page({super.key});

  @override
  State<Academy_Detail_Page> createState() => _Academy_Detail_PageState();
}

class _Academy_Detail_PageState extends State<Academy_Detail_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Academy Details',
            style: TextStyle(color: Colors.black, fontSize: 18)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Edit_Academy_Detail()),
                  );
                },
                icon: Icon(Icons.edit)),
          )
        ],
        elevation: 0,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 24.0, right: 24.0, top: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Academy Name",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Loto',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    height: 2),
              ),
              SizedBox(height: 4),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 48,
                child: TextFormField(
                  readOnly: true,
                  style: TextStyle(
                      color: Color(0xff23282E),
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      height: 2),
                  decoration: InputDecoration(
                    hintText: 'Abc Academy',
                    hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff626D7E)),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xffD0D3D8))),
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Register Number",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Loto',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    height: 2),
              ),
              SizedBox(height: 4),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 48,
                child: TextFormField(
                  readOnly: true,
                  style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      height: 2),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircleAvatar(
                          backgroundColor: Color(0xff25D366),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child:
                                SvgPicture.asset('assets/images/whatsapp.svg'),
                          )),
                    ),
                    hintText: '987654253',
                    hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff626D7E)),
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xffD0D3D8))),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Alternate Number",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Loto',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    height: 2),
              ),
              SizedBox(height: 4),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 48,
                child: TextFormField(
                  readOnly: true,
                  style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      height: 2),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '987654253',
                    hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff626D7E)),
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xffD0D3D8))),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Email Id",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Loto',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    height: 2),
              ),
              SizedBox(height: 4),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 48,
                child: TextFormField(
                  readOnly: true,
                  style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      height: 2),
                  decoration: InputDecoration(
                    hintText: 'abc@gmail.com',
                    hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff626D7E)),
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xffD0D3D8))),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Website",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Loto',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    height: 2),
              ),
              SizedBox(height: 4),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 48,
                child: TextFormField(
                  readOnly: true,
                  style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      height: 2),
                  decoration: InputDecoration(
                    hintText: 'www.abc.com',
                    hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff626D7E)),
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xffD0D3D8))),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Location",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Loto',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    height: 2),
              ),
              SizedBox(height: 4),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 48,
                child: TextFormField(
                  readOnly: true,
                  style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      height: 2),
                  decoration: InputDecoration(
                    hintText: 'House no. 745, sector 13',
                    hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff626D7E)),
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xffD0D3D8))),
                  ),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 48,
                child: TextFormField(
                  style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      height: 2),
                  decoration: InputDecoration(
                    hintText: 'DropDown State',
                    hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff626D7E)),
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xffD0D3D8))),
                  ),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 48,
                child: TextFormField(
                  style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      height: 2),
                  decoration: InputDecoration(
                    hintText: 'DropDown State',
                    hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff626D7E)),
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xffD0D3D8))),
                  ),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 48,
                child: TextFormField(
                  readOnly: true,
                  style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      height: 2),
                  decoration: InputDecoration(
                    hintText: '160102',
                    hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff626D7E)),
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xffD0D3D8))),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Choose Your Business Category",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Loto',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    height: 2),
              ),
              SizedBox(height: 4),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 48,
                child: TextFormField(
                  readOnly: true,
                  style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      height: 2),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xffD0D3D8))),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Academy Time",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Loto',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    height: 2),
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.42,
                    height: 48,
                    child: TextFormField(
                      readOnly: true,
                      style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          height: 2),
                      decoration: InputDecoration(
                        hintText: '10:00 AM',
                        hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff626D7E)),
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Color(0xffD0D3D8))),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.42,
                    height: 48,
                    child: TextFormField(
                      readOnly: true,
                      style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          height: 2),
                      decoration: InputDecoration(
                        hintText: '05:00 PM',
                        hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff626D7E)),
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Color(0xffD0D3D8))),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                "Working Days",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Loto',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    height: 2),
              ),
              SizedBox(height: 4),
              //Custom Radio Button asing here;

              SizedBox(height: 16),
              Text(
                "Academy Joining Date",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Loto',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    height: 2),
              ),
              SizedBox(height: 4),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 48,
                child: TextFormField(
                  readOnly: true,
                  style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      height: 2),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    suffixIcon: InkWell(
                      child: Icon(Icons.calendar_month_outlined),
                      onTap: () {},
                    ),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xffD0D3D8))),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
