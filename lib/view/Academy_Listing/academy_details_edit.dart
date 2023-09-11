// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:drona/res/widget/customradio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/response/status.dart';
import '../../../model/academy_model.dart';
import '../../../utils/utils.dart';
import '../../../view_model/academy_view_model.dart';
import '../../../view_model/postoffice_view_model.dart';
import '../../res/app_url.dart';
import '../../res/language/language.dart';

class Edit_Academy_Detail extends StatefulWidget {
  const Edit_Academy_Detail({super.key});

  @override
  State<Edit_Academy_Detail> createState() => _Edit_Academy_DetailState();
}

class _Edit_Academy_DetailState extends State<Edit_Academy_Detail> {

  //academy image picker
  File? imgFile;
  final imgPicker = ImagePicker();
  String? selectedService;
  void openCamera() async {
    var imgCamera = await imgPicker.pickImage(source: ImageSource.camera);

    academyListViewViewModel.fetchouserProfileimg(imgCamera!.path, context);
    // ignore: use_build_context_synchronously

    setState(() {
      imgFile = File(imgCamera!.path);
      print("imgFile$imgFile");
    });
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }

  void openGallery() async {
    var imgGallery = await imgPicker.pickImage(source: ImageSource.gallery);
    academyListViewViewModel.fetchouserProfileimg(imgGallery!.path, context);
    // userViewModel.fetchouserProfileimg(imgGallery!.path, context);
    setState(() {
      imgFile = File(imgGallery!.path);
      print("imgFile$imgFile");
    });
    Navigator.of(context).pop();
  }

  //bottomsheet popup
  showcameraoption() {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 200,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0),
                    ),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          height: 3,
                          width: 50,
                          color: Colors.grey[400],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Text(
                            AppLocale.profilePicture.getString(context),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Loto-Regular'),
                          ),
                          // IconButton(
                          //   onPressed: (() {
                          //     setState(() {
                          //       imgFile = null;
                          //       Navigator.pop(context);
                          //     });
                          //   }),
                          //   icon: const Icon(Icons.delete_outline),
                          //   color: Colors.black,
                          //   iconSize: 30,
                          // ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(color: Colors.grey),
                      const SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          onPressed: openCamera,
                          child: Text(
                          AppLocale.camera.getString(context),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          onPressed: openGallery,
                          child: Text(
                            AppLocale.gallery.getString(context),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

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
  String logo = '';
  bool isLogo = false;
  Map<String, bool> values = {
    'MO': false,
    'TU': false,
    'WE': false,
    'TH': false,
    'FR': false,
    'ST': false,
    'SU': false,
  };
  List batchDays = [];

  initState() {
    super.initState();
    academyListViewViewModel.fetchAcademyListApi();
  }

  ValueChanged<String?> Working_Days(String key) {
    return (value) =>
        setState(() {
          value == 'false' ? 'true' : 'false';
          if(key =='MO')
          {
            if (!batchDays.contains("1")) {batchDays.add("1");} else {batchDays.remove("1");}
          }
          if(key == 'TU')
          {
            if (!batchDays.contains("2")) {batchDays.add("2");} else {batchDays.remove("2");}
          }
          if(key == 'WE')
          {
            if (!batchDays.contains("3")) {batchDays.add("3");} else {batchDays.remove("3");}
          }
          if(key == 'TH')
          {
            if (!batchDays.contains("4")) {batchDays.add("4");} else {batchDays.remove("4");}
          }
          if(key == 'FR')
          {
            if (!batchDays.contains("5")) {batchDays.add("5");} else {batchDays.remove("5");}
          }
          if(key == 'ST')
          {
            if (!batchDays.contains("6")) {batchDays.add("6");} else {batchDays.remove("6");}
          }
          if(key == 'SU')
          {
            if (!batchDays.contains("0")) {batchDays.add("0");} else {batchDays.remove("0");}
          }

          if (value == 'true') {
            values[key] = false;
            // print(values);
          } else {
            values[key] = true;
            // print(values);
          }
          print(key);
          print(values);
          print(batchDays);
        });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          backgroundColor: Colors.white,
          title:  Text(AppLocale.academyDetails.getString(context),
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
                          academyName.text = value.dataList.data!.academyname;
                          //registerNumber
                          AlternateNumber.text = value.dataList.data!.altMobno == 'undefined' ?'':value.dataList.data!.altMobno;
                          email.text =
                          value.dataList.data!.email == 'undefined' ? '' : value.dataList.data!.email;
                          website.text = value.dataList.data!.website == 'undefined' ? '' : value.dataList.data!.website;
                          address.text = value.dataList.data!.address;
                          state.text = value.dataList.data!.state;
                          city.text = value.dataList.data!.city;
                          pincode.text = value.dataList.data!.pincode;
                          inTime.text =
                          value.dataList.data!.academyOpenTime == 'undefined'
                              ? ''
                              : value.dataList.data!.academyOpenTime;
                          outTime.text =
                          value.dataList.data!.academyCloseTime == 'undefined'
                              ? ''
                              : value.dataList.data!.academyCloseTime;
                          joiningDate.text = value.dataList.data!.cDate;
                          cat.text = value.dataList.data!.bcatname;
                          logo = value.dataList.data!.logo;
                          isLogo = value.dataList.data!.islogo;
                          for (WorkingDay day in value.dataList.data!.workingDays) {
                            var dayCode = day.dayNameShort;

                            switch (dayCode) {
                              case 'Mon':
                                values['MO'] = true;
                                batchDays.add("1");
                                break;
                              case 'Tue':
                                values['TU'] = true;
                                batchDays.add("2");
                                break;
                              case 'Wed':
                                values['WE'] = true;
                                batchDays.add("3");
                                break;
                              case 'Thu':
                                values['TH'] = true;
                                batchDays.add("4");
                                break;
                              case 'Fri':
                                values['FR'] = true;
                                batchDays.add("5");
                                break;
                              case 'Sat':
                                values['ST'] = true;
                                batchDays.add("6");
                                break;
                              case 'Sun':
                                values['SU'] = true;
                                batchDays.add("0");
                                break;
                              default:
                              // Handle any other cases if needed
                                break;
                            }
                          }

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
                                    Center(
                                      child: Stack(
                                        alignment: AlignmentDirectional.bottomCenter,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            child: SizedBox(
                                              height: 120,
                                              width: 120,
                                              child: Stack(
                                                clipBehavior: Clip.none,
                                                fit: StackFit.expand,
                                                children: [
                                                  CircleAvatar(
                                                    backgroundColor: Colors.grey[500],
                                                    radius: 70,
                                                    child: CircleAvatar(
                                                      radius: 65,
                                                      backgroundColor: Colors.grey.shade300,
                                                      backgroundImage: imgFile == null
                                                          ?
                                                      NetworkImage(
                                                        AppUrl.academylogo +
                                                            value.dataList.data!.logo,
                                                      )
                                                          :FileImage(imgFile!) as ImageProvider,
                                                    ),
                                                  ),
                                                  Positioned(
                                                      top: -5,
                                                      right: -10,
                                                      height: 182,
                                                      width: 40,
                                                      child: RawMaterialButton(
                                                        onPressed: showcameraoption,
                                                        elevation: 2.0,
                                                        fillColor: Theme.of(context).primaryColor,
                                                        padding: const EdgeInsets.all(10),

                                                        // padding: EdgeInsets.all(1.0),
                                                        shape: const CircleBorder(
                                                            side: BorderSide(
                                                                color: Colors.white, width: 2)),

                                                        child: Image.asset(
                                                            'assets/images/add_a_photo.png',
                                                            fit: BoxFit.contain),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      AppLocale.academyName.getString(context), style: TextStyle(
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
                                          hintText: '${AppLocale.eg.getString(context)}. Abc Academy',
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
                                                  child: Image.asset(
                                                      'assets/images/WhatsApp.png'),
                                                ),
                                              ),
                                            ),
                                            hintText: '${value.dataList.data!.registeredNumber}',
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
                                        controller: AlternateNumber,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            height: 2),
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          hintText: '${AppLocale.eg.getString(context)}. 987654253',
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
                                          AppLocale.location.getString(context),
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
                                          hintText: '${AppLocale.eg.getString(context)} House no. 745, sector 13',
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
                                          hintText:  AppLocale.state.getString(context),
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
                                          hintText:  AppLocale.city.getString(context),
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
                                          hintText: '${AppLocale.eg.getString(context)} 160102',
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
                                                        groupValue: 'true',
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
                                          onPressed: () async {
                                            if(academyName.text.isEmpty)
                                            {
                                              Utils.flushBarErrorMessage(AppLocale.fillAcademyName.getString(context), context);
                                            }
                                            else if (address.text.isEmpty) {
                                              Utils.flushBarErrorMessage(AppLocale.fillAddressError.getString(context), context);
                                            }
                                            else if (AlternateNumber.text.isEmpty && AlternateNumber.text.trim().length !=10) {
                                              Utils.flushBarErrorMessage(AppLocale.enterAlternateNumber.getString(context), context);
                                            }
                                            if (email.text.isEmpty) {
                                              Utils.flushBarErrorMessage(AppLocale.enterEmail.getString(context), context);
                                            } else if (!_isValidEmail(email.text)) {
                                              Utils.flushBarErrorMessage(AppLocale.enterValidEmail.getString(context), context);
                                            }
                                            if (website.text.isEmpty) {
                                              Utils.flushBarErrorMessage(AppLocale.enterWebsite.getString(context), context);
                                            } else if (!_isValidWebsite(website.text)) {
                                              Utils.flushBarErrorMessage(AppLocale.enterValidWebsite.getString(context), context);
                                            }
                                            else if (city.text.isEmpty) {
                                              Utils.flushBarErrorMessage(AppLocale.fillCityError.getString(context), context);
                                            }
                                            else if (state.text.isEmpty){
                                              Utils.flushBarErrorMessage(AppLocale.fillStateError.getString(context), context);
                                            }
                                            else if (pincode.text.isEmpty)
                                            {
                                              Utils.flushBarErrorMessage(AppLocale.fillPinCodeError.getString(context), context);
                                            }
                                            else {
                                              /// change academy name from shared pref
                                              final prefsData = await SharedPreferences.getInstance();
                                              prefsData.setString('acadmicName',academyName.text);
                                              Map<String, dynamic> data = {
                                                "academyname": academyName.text,
                                                "address": address.text,
                                                "city": city.text,
                                                "state": state.text,
                                                "pincode": pincode.text,
                                                "alt_mobno": AlternateNumber.text.isNotEmpty ? AlternateNumber.text : '',
                                                "email": email.text.isNotEmpty ?email.text:'' ,
                                                "website": website.text.isNotEmpty ? website.text : '',
                                                "academy_open_time": inTime.text.isNotEmpty ? inTime.text : '',
                                                "academy_close_time": outTime.text.isNotEmpty ? outTime.text : '',
                                                "working_days":batchDays,
                                              };


                                              academyListViewViewModel.fetchEditAcademy(data,'academyDetails');
                                              // Get.back();

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
                                          child:  Text(
                                            AppLocale.submit.getString(context),
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
  bool _isValidEmail(String email) {
    // Regular expression pattern for basic email validation
    final RegExp emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
      caseSensitive: false,
      multiLine: false,
    );
    return emailRegex.hasMatch(email);
  }

  bool _isValidWebsite(String website) {
    // Regular expression pattern for basic website URL validation
    final RegExp websiteRegex = RegExp(
      r'^(http(s)?:\/\/)?[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}(\S*)?$',
      caseSensitive: false,
      multiLine: false,
    );
    return websiteRegex.hasMatch(website);
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
                                                          '${AppLocale.address.getString(context)}: ${value
                                                              .dataList.data
                                                              ?.postOffice?[index]
                                                              .name}',
                                                          style: const TextStyle(
                                                              fontSize: 14),
                                                        ),
                                                        Text(
                                                          ', ${AppLocale.city.getString(context)}: ${value
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
                                                          '${AppLocale.state.getString(context)}: ${value
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
                                      : Text( AppLocale.noData.getString(context),),
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
