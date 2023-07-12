// ignore_for_file: prefer_const_constructors

import 'package:drona/res/widget/customradio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

import '../../../data/response/status.dart';
import '../../../utils/utils.dart';
import '../../../view_model/academy_view_model.dart';
import '../../../view_model/postoffice_view_model.dart';
import '../../language/language.dart';

class Edit_Academy_Detail extends StatefulWidget {
  const Edit_Academy_Detail({super.key});

  @override
  State<Edit_Academy_Detail> createState() => _Edit_Academy_DetailState();
}

class _Edit_Academy_DetailState extends State<Edit_Academy_Detail> {
  bool hasDataBeenSet = false; // Define the variable here
  AcademyViewViewModel academyListViewViewModel = AcademyViewViewModel();
  final TextEditingController academyName = TextEditingController();
  final TextEditingController registerNumber = TextEditingController();
  final TextEditingController AlternateNumber = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController website = TextEditingController();
  final TextEditingController state = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController address = TextEditingController();
  late  final TextEditingController pincode = TextEditingController();
  late final TextEditingController inTime = TextEditingController();
  final TextEditingController outTime = TextEditingController();
  final TextEditingController joiningDate = TextEditingController();
  final TextEditingController cat = TextEditingController();
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
    return (value) =>
        setState(() {
          value == 'false' ? 'true' : 'false';

          if (value == 'true') {
            values[key] = false;
            // print(values);
          } else {
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
          elevation: 0,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: ChangeNotifierProvider<AcademyViewViewModel>(
                  create: (BuildContext context) => academyListViewViewModel,
                  child: Consumer<AcademyViewViewModel>(
                      builder: (context, value, _) {
                        if (!hasDataBeenSet && value.dataList.data != null) {
                          academyName.text = value.dataList.data!.academyname!;
                          //registerNumber
                          AlternateNumber.text = value.dataList.data!.alternateNumber! == 'undefined' ?'':value.dataList.data!.alternateNumber! ;
                          email.text =
                          value.dataList.data!.email! == 'undefined'
                              ? ''
                              : value.dataList.data!.email!;
                          website.text =
                          value.dataList.data!.website! == 'undefined'
                              ? ''
                              : value.dataList.data!.website!;
                          address.text = value.dataList.data!.address!;
                          state.text = value.dataList.data!.state!;
                          city.text = value.dataList.data!.city!;
                          pincode.text = value.dataList.data!.pincode!;
                          inTime.text =
                          value.dataList.data!.academyinTime! == 'undefined'
                              ? ''
                              : value.dataList.data!.academyinTime!;
                          outTime.text =
                          value.dataList.data!.academyoutTime! == 'undefined'
                              ? ''
                              : value.dataList.data!.academyoutTime!;
                          joiningDate.text = value.dataList.data!.cDate!;
                          cat.text = value.dataList.data!.bcatname!;

                          hasDataBeenSet = true;
                        }

                        switch (value.dataList.status!) {
                          case Status.loading:
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.teal,
                              ),
                            );

                          case Status.completed:
                            return
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 24.0,
                                    right: 24.0,
                                    top: 10,
                                    bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Academy Name", style: TextStyle(
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
                                        controller: academyName,
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
                                              borderRadius: BorderRadius
                                                  .circular(8),
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
                                          controller: registerNumber,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            height: 2,
                                          ),
                                          keyboardType: TextInputType.number,
                                          enabled: false,
                                          decoration: InputDecoration(
                                            suffixIcon: Padding(
                                              padding: const EdgeInsets.all(
                                                  10.0),
                                              child: CircleAvatar(
                                                backgroundColor: Color(
                                                    0xff25D366),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      5.0),
                                                child: Text(''),
                                                //   child: SvgPicture.asset(
                                                //       'assets/images/whatsapp.svg'),
                                                 ),
                                              ),
                                            ),
                                            hintText: '987654253',
                                            hintStyle: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff626D7E),
                                            ),
                                            contentPadding: EdgeInsets.all(10),
                                            border: OutlineInputBorder(),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius
                                                  .circular(8),
                                              borderSide: BorderSide(
                                                  color: Color(0xffD0D3D8)),
                                            ),
                                            filled: true,
                                            // Add this line
                                            fillColor: Colors
                                                .grey[200], // Add this line
                                          ),
                                        )

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
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.9,
                                      height: 48,
                                      child: TextFormField(
                                        controller: AlternateNumber,
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
                                              borderRadius: BorderRadius
                                                  .circular(8),
                                              borderSide: BorderSide(
                                                  color: Color(0xffD0D3D8))),
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
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.9,
                                      height: 48,
                                      child: TextFormField(
                                        controller: email,
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
                                              borderRadius: BorderRadius
                                                  .circular(8),
                                              borderSide: BorderSide(
                                                  color: Color(0xffD0D3D8))),
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
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.9,
                                      height: 48,
                                      child: TextFormField(
                                        controller: website,
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
                                              borderRadius: BorderRadius
                                                  .circular(8),
                                              borderSide: BorderSide(
                                                  color: Color(0xffD0D3D8))),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
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
                                        InkWell(
                                          child: Text(
                                            "Pick Up Location",
                                            style: TextStyle(
                                                color: Color(0xffFD685D),
                                                fontFamily: 'Loto',
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13,
                                                height: 2),
                                          ),
                                          onTap: () {
                                            dialog(context);
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4),
                                    SizedBox(
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.9,
                                      height: 48,
                                      child: TextFormField(
                                        controller: address,
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
                                              borderRadius: BorderRadius
                                                  .circular(8),
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
                                        controller: state,
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
                                              borderRadius: BorderRadius
                                                  .circular(8),
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
                                        controller: city,
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
                                              borderRadius: BorderRadius
                                                  .circular(8),
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
                                        controller: pincode,
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
                                              borderRadius: BorderRadius
                                                  .circular(8),
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
                                          controller: cat,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            height: 2,
                                          ),
                                          enabled: false,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(10),
                                            border: OutlineInputBorder(),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius
                                                  .circular(8),
                                              borderSide: BorderSide(
                                                  color: Color(0xffD0D3D8)),
                                            ),
                                            filled: true,
                                            // Add this line
                                            fillColor: Colors
                                                .grey[200], // Add this line
                                          ),
                                        )

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
                                        Container(
                                          width: MediaQuery.of(context).size.width * 0.4,
                                          child: TextFormField(
                                            controller: inTime,
                                            readOnly: true,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                height: 2),
                                            decoration: InputDecoration(
                                              hintText: 'In Time',
                                              hintStyle: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff626D7E)),
                                              contentPadding: const EdgeInsets.all(10),
                                              border: OutlineInputBorder(),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius
                                                      .circular(8),
                                                  borderSide: BorderSide(
                                                      color: Color(
                                                          0xffD0D3D8))),
                                            ),
                                            onTap: selectTimeFrom,
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width * 0.4,
                                          child: TextFormField(

                                            readOnly: true,
                                            controller: outTime,
                                            style: TextStyle(
                                            color: Colors.black,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            height: 2),
                                             // ..text = batchTodata.toString(),
                                            decoration: InputDecoration(
                                              hintText: 'Out Time',
                                              hintStyle: TextStyle(
                                                              fontSize: 13,
                                                              fontWeight: FontWeight.w400,
                                                              color: Color(0xff626D7E)),

                                              contentPadding: const EdgeInsets.all(10),
                                              border: OutlineInputBorder(),
                                              enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius
                                                      .circular(8),
                                                  borderSide: BorderSide(
                                                      color: Color(
                                                          0xffD0D3D8))),
                                            ),
                                            onTap: selectTimeTo,
                                          ),
                                        ),
                                      ],
                                    ),


                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment
                                    //       .spaceBetween,
                                    //   children: [
                                    //     SizedBox(
                                    //       width: MediaQuery
                                    //           .of(context)
                                    //           .size
                                    //           .width * 0.42,
                                    //       height: 48,
                                    //       child: TextFormField(
                                    //         controller: inTime,
                                    //         style: TextStyle(
                                    //             color: Colors.black,
                                    //             fontStyle: FontStyle.normal,
                                    //             fontWeight: FontWeight.bold,
                                    //             fontSize: 14,
                                    //             height: 2),
                                    //         decoration: InputDecoration(
                                    //           hintText: '10:00 AM',
                                    //           hintStyle: TextStyle(
                                    //               fontSize: 14,
                                    //               fontWeight: FontWeight.w400,
                                    //               color: Color(0xff626D7E)),
                                    //           contentPadding: EdgeInsets.all(
                                    //               10),
                                    //           border: OutlineInputBorder(),
                                    //           enabledBorder: OutlineInputBorder(
                                    //               borderRadius: BorderRadius
                                    //                   .circular(8),
                                    //               borderSide: BorderSide(
                                    //                   color: Color(
                                    //                       0xffD0D3D8))),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //     SizedBox(
                                    //       width: MediaQuery
                                    //           .of(context)
                                    //           .size
                                    //           .width * 0.42,
                                    //       height: 48,
                                    //       child: TextFormField(
                                    //         controller: outTime,
                                    //         style: TextStyle(
                                    //             color: Colors.black,
                                    //             fontStyle: FontStyle.normal,
                                    //             fontWeight: FontWeight.bold,
                                    //             fontSize: 14,
                                    //             height: 2),
                                    //         decoration: InputDecoration(
                                    //           hintText: '05:00 PM',
                                    //           hintStyle: TextStyle(
                                    //               fontSize: 14,
                                    //               fontWeight: FontWeight.w400,
                                    //               color: Color(0xff626D7E)),
                                    //           contentPadding: EdgeInsets.all(
                                    //               10),
                                    //           border: OutlineInputBorder(),
                                    //           enabledBorder: OutlineInputBorder(
                                    //               borderRadius: BorderRadius
                                    //                   .circular(8),
                                    //               borderSide: BorderSide(
                                    //                   color: Color(
                                    //                       0xffD0D3D8))),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
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
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          //CheckButton for Months selection;
                                          Expanded(
                                            child: ListView(
                                              scrollDirection: Axis.horizontal,
                                              children: values.keys.map((
                                                  String key) {
                                                return Row(
                                                  children: [
                                                    CustomRadio(
                                                        value: values[key]
                                                            .toString(),
                                                        groupValue: 'false',
                                                        label: key,
                                                        onChanged: Working_Days(
                                                            key),
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
                                          controller: joiningDate,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            height: 2,
                                          ),
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(10),
                                            suffixIcon: InkWell(
                                              child: Icon(Icons
                                                  .calendar_month_outlined),
                                              onTap: () {},
                                            ),
                                            border: OutlineInputBorder(),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius
                                                  .circular(8),
                                              borderSide: BorderSide(
                                                  color: Color(0xffD0D3D8)),
                                            ),
                                            filled: true,
                                            // Add this line
                                            fillColor: Colors
                                                .grey[200], // Add this line
                                          ),
                                        )

                                    ),
                                    SizedBox(height: 30),
                                    SizedBox(
                                      width: 342,
                                      height: 45,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius
                                                      .circular(8)),
                                              backgroundColor: Color(
                                                  0xff2A62B8)),
                                          onPressed: () {
                                            if(academyName.text.isEmpty)
                                            {
                                              Utils.flushBarErrorMessage("Please enter academy name", context);
                                            }
                                            else if (address.text.isEmpty) {
                                              Utils.flushBarErrorMessage("Please enter address", context);
                                            }
                                            else if (AlternateNumber.text.trim().length !=10) {
                                              Utils.flushBarErrorMessage("Please enter correct number ", context);
                                            }
                                            else if (city.text.isEmpty) {
                                              Utils.flushBarErrorMessage("Please enter city", context);
                                            }
                                            else if (state.text.isEmpty){
                                              Utils.flushBarErrorMessage("Please enter state", context);
                                            }
                                            else if (pincode.text.isEmpty)
                                              {
                                                Utils.flushBarErrorMessage("Please enter pincode", context);
                                              }
                                            else {
                                            Map<String, dynamic> data = {
                                                "academyname": academyName.text,
                                                "address": address.text,
                                                "city": city.text,
                                                "state": state.text,
                                                "pincode": pincode.text,
                                                "alt_mobno": AlternateNumber.text,
                                                "email": email.text,
                                                "website": website.text,
                                                "academy_open_time": inTime.text,
                                                "academy_close_time": outTime.text,
                                                "working_days":[1,2,3],
                                              };
                                              print("data is");
                                              print(data);
                                            academyListViewViewModel.fetchEditAcademy(data);
                                            Get.back();
                                            //  batch.fetchEditebatchListApi(data, context);
                                            }
                                            // address
                                            // city
                                            // state
                                            // pincode
                                            // alt_mobno
                                            // email
                                            // website
                                            // academy_open_time
                                            // academy_close_time
                                            // working_days

                                            },
                                          child: const Text(
                                            "Submit",
                                            style: TextStyle(fontSize: 15,
                                                fontFamily: 'Lato'),
                                          )),
                                    ),
                                  ],
                                ),
                              );
                          case Status.error:
                            return Center(
                                child: Text(''));
                        }
                      }
                  )),
            )
        )
    );
  }


  dialog(BuildContext context) {
    PostofficeViewViewModel postofficeViewViewModel = PostofficeViewViewModel();
    void pinFilter(String enteredKeyword) {
      postofficeViewViewModel.fetchPostofficeListApi(enteredKeyword);
    }

    showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30.0),
          topLeft: Radius.circular(30.0),
        ),
      ),
      backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext context) {
        return Material(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Container(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                        height: 3,
                        width: 50,
                        color: Colors.grey[400],
                      ),
                    ),
                    const Divider(),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(
                          6,
                        ),
                      ],
                      onChanged: (value) => pinFilter(value),
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.search,
                        ),
                        hintText: AppLocale.pincode.getString(context),
                        contentPadding: const EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Theme
                                .of(context)
                                .primaryColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ChangeNotifierProvider<PostofficeViewViewModel>(
                      create: (BuildContext context) => postofficeViewViewModel,
                      child: Consumer<PostofficeViewViewModel>(
                          builder: (context, value, _) {
                            if (value.dataList.status! == Status.completed) {
                              return
                                SizedBox(
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.4,
                                  child: value.dataList.data?.postOffice
                                      ?.isNotEmpty ?? false
                                      ?
                                  ListView.builder(
                                    itemCount: value.dataList.data?.postOffice
                                        ?.length ??
                                        0,
                                    itemBuilder: (context, index) =>
                                        Card(
                                            key: ValueKey(value.dataList.data!
                                                .postOffice?[index].name),
                                            color: const Color.fromARGB(
                                                255, 238, 238, 236),
                                            elevation: 0,
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                  8.0),
                                              child: InkWell(
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Address: ${value
                                                              .dataList.data
                                                              ?.postOffice?[index]
                                                              .name}',
                                                          style: const TextStyle(
                                                              fontSize: 14),
                                                        ),
                                                        Text(
                                                          ', City: ${value
                                                              .dataList.data
                                                              ?.postOffice?[index]
                                                              .block},',
                                                          style: const TextStyle(
                                                              fontSize: 14),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'State: ${value
                                                              .dataList.data
                                                              ?.postOffice?[index]
                                                              .state}',
                                                          style: const TextStyle(
                                                              fontSize: 14),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                onTap: () {
                                                  setState(() {
                                                    pincode.text = value.dataList.data?.postOffice?[index].pincode?.toString() ?? '';
                                                    address.text = value.dataList.data?.postOffice?[index].name?.toString() ?? '';
                                                    city.text = value.dataList.data?.postOffice?[index].district?.toString() ?? '';
                                                    state.text= value.dataList.data?.postOffice?[index].state?.toString() ?? '';
                                                  });
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            )),
                                  )
                                      : Text('Data Not Found'),
                                );
                            }

                            return Container();
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }


  selectTimeFrom() async {
    var timepick = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    setState(() {
      inTime.text = timepick!.format(context);
    });
  }

  selectTimeTo() async {
    var timepick = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    setState(() {
      outTime.text = timepick!.format(context);
    });
  }
}
