// ignore_for_file: prefer_const_constructors

import 'package:drona/res/widget/Academy_Listing/academy_details_edit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../data/response/status.dart';
import '../../res/widget/customradio.dart';
import '../../view_model/academy_view_model.dart';

class Academy_Detail_Page extends StatefulWidget {
  const Academy_Detail_Page({super.key});

  @override
  State<Academy_Detail_Page> createState() => _Academy_Detail_PageState();
}

class _Academy_Detail_PageState extends State<Academy_Detail_Page> {
  AcademyViewViewModel academyListViewViewModel = AcademyViewViewModel();
  Map<String, bool> values = {
    'MO': false,
    'TU': false,
    'WE': false,
    'TH': false,
    'FR': false,
    'ST': false,
    'SU': false,
  };

  initState() {
    super.initState();
    academyListViewViewModel.fetchAcademyListApi();
  }

  ValueChanged<String?> Working_Days(String key) {
    return (value) => setState(() {
      value == 'false'? 'true': 'false';

      if(value == 'true'){
        values[key] = false;
        // print(values);
      }else{
        values[key] = true;
        // print(values);
      }
    });
  }

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
                    Get.to(()=> const Edit_Academy_Detail(),transition: Transition.leftToRight);
                  },
                  icon: Icon(Icons.edit)),
            )
          ],
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child :  ChangeNotifierProvider<AcademyViewViewModel>(
                  create: (BuildContext context) => academyListViewViewModel,
                  child: Consumer<AcademyViewViewModel>(builder: (context, value, _) {
                    switch (value.dataList.status!) {
                      case Status.loading:
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.teal,
                          ),
                        );

                      case Status.completed:
                        return Padding(
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
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.9,
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
                                    hintText: '${value.dataList.data?.academyname}',
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff626D7E)),
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Color(0xffD0D3D8))),
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
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.9,
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
                                          child: SvgPicture.asset(
                                            'assets/images/whatsapp.svg',
                                            width: 24,
                                            // Specify the desired width for the icon
                                            height: 24, // Specify the desired height for the icon
                                          ),
                                        ),
                                      ),
                                    ),
                                    hintText: '${value.dataList.data!.registeredNumber}',
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff626D7E)),
                                    contentPadding: EdgeInsets.all(10),
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Color(0xffD0D3D8))),
                                  ),),),
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
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.9,
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
                                    hintText: '${value.dataList.data
                                        ?.altMobno}' == 'undefined'
                                        ? '___'
                                        : '${value.dataList.data?.altMobno}',
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff626D7E)),
                                    contentPadding: EdgeInsets.all(10),
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Color(0xffD0D3D8))),
                                  ),),),
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
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.9,
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
                                      hintText: '${value.dataList.data?.email}' ==
                                          "undefined" ? '___' : '${value.dataList
                                          .data?.email}',
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff626D7E)),
                                      contentPadding: EdgeInsets.all(10),
                                      border: OutlineInputBorder(),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                              color: Color(0xffD0D3D8))),
                                    )
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
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.9,
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
                                    hintText: '${value.dataList.data?.website}' ==
                                        "undefined" ? '___' : '${value.dataList.data
                                        ?.website}',
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff626D7E)),
                                    contentPadding: EdgeInsets.all(10),
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Color(0xffD0D3D8))),
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
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.9,
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
                                    hintText: '${value.dataList.data?.address}',
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff626D7E)),
                                    contentPadding: EdgeInsets.all(10),
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Color(0xffD0D3D8))),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              SizedBox(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.9,
                                height: 48, child: TextFormField(
                                style: TextStyle(
                                    color: Colors.black,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    height: 2),
                                decoration: InputDecoration(
                                  hintText: '${value.dataList.data?.state}',
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff626D7E)),
                                  contentPadding: EdgeInsets.all(10),
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                          color: Color(0xffD0D3D8))),
                                ),
                              ),
                              ),
                              SizedBox(height: 16),
                              SizedBox(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.9,
                                height: 48,
                                child: TextFormField(
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      height: 2),
                                  decoration: InputDecoration(
                                    hintText: '${value.dataList.data?.city}',
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff626D7E)),
                                    contentPadding: EdgeInsets.all(10),
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Color(0xffD0D3D8))),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              SizedBox(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.9,
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
                                    hintText: '${value.dataList.data?.pincode}',
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff626D7E)),
                                    contentPadding: EdgeInsets.all(10),
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Color(0xffD0D3D8))),
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
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.9,
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
                                    hintText: '${value.dataList.data?.bcatname}',
                                    contentPadding: EdgeInsets.all(10),
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Color(0xffD0D3D8))),
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
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.42,
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
                                        hintText: '${value.dataList.data
                                            ?.academyOpenTime}' == 'undefined'
                                            ? '___'
                                            : '${value.dataList.data
                                            ?.academyOpenTime}',
                                        hintStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff626D7E)),
                                        contentPadding: EdgeInsets.all(10),
                                        border: OutlineInputBorder(),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8),
                                            borderSide: BorderSide(
                                                color: Color(0xffD0D3D8))),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width * 0.42,
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
                                        hintText: '${value.dataList.data
                                            ?.academyCloseTime}' == 'undefined'
                                            ? '___'
                                            : '${value.dataList.data
                                            ?.academyCloseTime}',
                                        hintStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff626D7E)),
                                        contentPadding: EdgeInsets.all(10),
                                        border: OutlineInputBorder(),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8),
                                            borderSide: BorderSide(
                                                color: Color(0xffD0D3D8))),
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
                              SizedBox(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.92,
                                height: 50,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    //CheckButton for Months selection;
                                    Expanded(
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: values.keys.map((String key) {
                                          return Row(
                                            children: [
                                              CustomRadio(
                                                  value: values[key].toString(),
                                                  groupValue: 'false',
                                                  label: key,
                                                  onChanged: Working_Days(key),
                                                  btnColor: Colors.black),
                                              SizedBox(width: 10)
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.9,
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
                                    hintText: '---',
                                    contentPadding: EdgeInsets.all(10),
                                    suffixIcon: InkWell(
                                      child: Icon(Icons.calendar_month_outlined),
                                      onTap: () {},
                                    ),
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Color(0xffD0D3D8))),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              )
                            ],
                          ),

                        );
                      case Status.error:
                        return Center(
                            child: Text(''));
                    }
                  })
              )),
        )
    );
  }
}
