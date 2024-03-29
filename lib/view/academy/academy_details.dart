// ignore_for_file: prefer_const_constructors

import 'package:drona/res/language/language.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../data/response/status.dart';
import '../../model/academy_model.dart';
import '../../res/app_url.dart';
import '../../res/widget/customradio.dart';
import '../../view_model/academy_view_model.dart';
import '../Academy_Listing/academy_details_edit.dart';
import 'academy_setting.dart';

class Academy_Detail_Page extends StatefulWidget {
  const Academy_Detail_Page({super.key});

  @override
  State<Academy_Detail_Page> createState() => _Academy_Detail_PageState();
}

class _Academy_Detail_PageState extends State<Academy_Detail_Page> {
  bool isset = false;
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

  @override
  initState() {
    super.initState();

    academyListViewViewModel.fetchAcademyListApi();
  }

  ValueChanged<String?> Working_Days(String key) {
    return (value) => null;

    //   value == 'false'? 'true': 'false';
    //
    //   if(value == 'true'){
    //     values[key] = false;
    //     // print(values);
    //   }else{
    //     values[key] = true;
    //     // print(values);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    // academyListViewViewModel.fetchAcademyListApi();
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {
            Get.back();
          }, icon: Icon(Icons.arrow_back_ios),
            
          ),
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          backgroundColor: Colors.white,
          title:  Text(AppLocale.academyDetails.getString(context),
              style: TextStyle(color: Colors.black, fontSize: 18)),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                  onPressed: () {
                    Get.to(()=> const Edit_Academy_Detail(

                    ),transition: Transition.rightToLeft)!.then((value) {

                      print("value==$value");
                      value == ""
                          ? null : academyListViewViewModel.fetchAcademyListApi();
                    } );
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
                        if(!isset)
                        {
                          for (WorkingDay day in value.dataList.data!.workingDays) {
                            var dayCode = day.dayNameShort;

                            switch (dayCode) {
                              case 'Mon':
                                values['MO'] = true;
                                break;
                              case 'Tue':
                                values['TU'] = true;
                                break;
                              case 'Wed':
                                values['WE'] = true;
                                break;
                              case 'Thu':
                                values['TH'] = true;
                                break;
                              case 'Fri':
                                values['FR'] = true;
                                break;
                              case 'Sat':
                                values['ST'] = true;
                                break;
                              case 'Sun':
                                values['SU'] = true;
                                break;
                              default:
                              // Handle any other cases if needed
                                break;
                            }
                          }



                          isset = true;
                          print("value is $values");
                        }
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 24.0, right: 24.0, top: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Container(
                                  padding:  EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: SizedBox(
                                    height: 120,
                                    width: 120,
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      fit: StackFit.expand,
                                      children: [
                                        value.dataList.data!.islogo ?
                                        CircleAvatar(
                                          backgroundColor: Colors.grey[500],
                                          radius: 70,
                                          child:
                                          CircleAvatar(
                                            radius: 65,
                                            backgroundColor: Colors.white,
                                            backgroundImage:

                                            NetworkImage(
                                              AppUrl.academylogo +
                                                  value.dataList.data!.logo,
                                            )
                                          )
                                        ):Image (
                                          image :
                                          AssetImage(
                                              'assets/images/coachlogo.png'),
                                          width: 80,)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                AppLocale.academyName.getString(context),
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
                                AppLocale.registerNumber.getString(context),
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
                                          child: Image.asset('assets/images/WhatsApp.png',
                                            width: 34,
                                            // Specify the desired width for the icon
                                            height: 34, // Specify the desired height for the icon
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
                                AppLocale.registerAlternateNumber.getString(context),
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
                                AppLocale.emailId.getString(context),
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
                                AppLocale.website.getString(context),
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
                                AppLocale.location.getString(context),
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
                                AppLocale.title11.getString(context),
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
                                "${AppLocale.academy.getString(context)} ${AppLocale.time.getString(context)}",
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
                                AppLocale.workingDays.getString(context),
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
                                        child:
                                        ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: values.keys.map((String key) {
                                            return Row(
                                              children: [
                                                CustomRadio(

                                                    value: values[key].toString(),
                                                    groupValue: 'true',
                                                    label: key,
                                                    onChanged: Working_Days(key),
                                                    btnColor: Colors.black
                                                ),
                                                SizedBox(width: 10)
                                              ],
                                            );
                                          }).toList(),
                                        )

                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                AppLocale.academyJoiningDate.getString(context),
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
                                    hintText: '${value.dataList.data?.cDate}',
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
