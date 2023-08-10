import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:drona/view/registeration/detail_filled.dart';
import 'package:drona/view/trainne_addmanual.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../data/response/status.dart';
import '../../model/service_program_model.dart';
import '../../res/language/language.dart';
import '../../res/widget/customradio.dart';
import '../../res/widget/progress_pills.dart';
import '../../res/widget/round_button.dart';
import '../../utils/no_data.dart';
import '../../utils/routes/routes_name.dart';
//import '../../view_model/facility_view_model.dart';
import '../../utils/utils.dart';
import '../../view_model/facility_view_model.dart';
import '../../view_model/registration_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditFacility extends StatefulWidget {
  List<Myfacility> myFacility;
  String serviceUid;
  EditFacility({super.key, required this.serviceUid, required this.myFacility});

  @override
  State<EditFacility> createState() => _EditFacilityState();
}

class _EditFacilityState extends State<EditFacility> {
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;
  bool synthetic = false;
  bool grass = false;
  bool clay = false;
  bool hard = false;
  bool _customTileExpanded = false;
  TextEditingController nofacility = TextEditingController();
  int CountSurfaces = 0;
  String facilityname = '';
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "0", child: Text("0")),
      const DropdownMenuItem(value: "1", child: Text("1")),
      const DropdownMenuItem(value: "2", child: Text("2")),
      const DropdownMenuItem(value: "3", child: Text("3")),
      const DropdownMenuItem(value: "4", child: Text("4")),
      const DropdownMenuItem(value: "5", child: Text("5")),
      const DropdownMenuItem(value: "6", child: Text("6")),
      const DropdownMenuItem(value: "7", child: Text("7")),
      const DropdownMenuItem(value: "8", child: Text("8")),
      const DropdownMenuItem(value: "9", child: Text("9")),
      const DropdownMenuItem(value: "10", child: Text("10")),
    ];
    return menuItems;
  }

//allow number of fields
  late int? _surfaceisLength = 20;
  late int? _otherLength = 20;

  late List selectedValue;
  late List selectedValue2;
  late List _surfaceisChecked;
  late List _otherChecked;
  late List otherselectedlist;
  late List surfaceselectedlist;
  String selectedCategory = 'Tennis';
  FacilityViewViewModel facilityViewViewModel = FacilityViewViewModel();
  late Map<String, dynamic> data;
  @override
  void initState() {
    /* setState(() {
    //  nofacility.text = widget.myFacility[0].inputtextdata;

    });*/
    // TODO: implement initState
    super.initState();
    serviceId();
    _surfaceisChecked = List.filled(_surfaceisLength ?? 0, false);
    surfaceselectedlist = List.filled(_surfaceisLength ?? 0, false);
    selectedValue = List.filled(_surfaceisLength ?? 0, '0');
    _otherChecked = List.filled(_otherLength ?? 0, false);
    otherselectedlist = List.filled(_otherLength ?? 0, false);
    selectedValue2 = List.filled(_otherLength ?? 0, '0');
  }

  File? imgFile;
  final imgPicker = ImagePicker();

  void openCamera() async {
    var imgCamera = await imgPicker.pickImage(source: ImageSource.camera);

    //academyListViewViewModel.fetchouserProfileimg(imgCamera!.path, context);
    facilityViewViewModel.uploadGalleryImg(
        imgCamera!.path, context, widget.serviceUid);

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
    //academyListViewViewModel.fetchouserProfileimg(imgGallery!.path, context);
    facilityViewViewModel.uploadGalleryImg(
        imgGallery!.path, context, widget.serviceUid);

    // userViewModel.fetchouserProfileimg(imgGallery!.path, context);
    setState(() {
      imgFile = File(imgGallery!.path);
      print("imgFile$imgFile");
    });
    Navigator.of(context).pop();
  }

  //load fasility with service id
  serviceId() async {
    facilityViewViewModel.fetchFacilityListApi(widget.serviceUid.toString());
    await Future.delayed(const Duration(seconds: 1));
    List data = facilityViewViewModel.setDataForFacillityEdit(widget.myFacility);
    _surfaceisChecked = data[0];
    surfaceselectedlist = data[1];
    selectedValue = data[2];
    _otherChecked = data[3];
    otherselectedlist = data[4];
    selectedValue2 = data[5];
    setState(() {
      nofacility.text = widget.myFacility[0].inputtextdata;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("nkjnkj==${widget.myFacility[0].checkboxwithselectoption[0].name}");

    final registration = Provider.of<RegistrationViewModel>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      supportedLocales: _localization.supportedLocales,
      localizationsDelegates: _localization.localizationsDelegates,
      home: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "Choose Your Facility For ${widget.myFacility[0].serviceName}",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Material(
            color: Colors.white,
            child: Container(
                padding: const EdgeInsets.all(20),
                child: ChangeNotifierProvider<FacilityViewViewModel>(
                  lazy: true,
                  create: (BuildContext context) => facilityViewViewModel,
                  child: Column(
                    children: [
                      Consumer<FacilityViewViewModel>(builder: (
                        context,
                        value,
                        _,
                      ) {
                        facilityname =
                            value.dataList.data?.inputtextname.toString() ?? '';

                        switch (value.dataList.status!) {
                          case Status.loading:
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.teal,
                              ),
                            );

                          case Status.completed:
                            return Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              facilityname,
                                              style: const TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 50,
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            enabled: true,
                                            controller: nofacility,
                                            maxLength: 1,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              fillColor: Colors.grey,
                                              counterText: "",
                                              hintText: '0',
                                              contentPadding:
                                                  const EdgeInsets.all(10),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                borderSide: BorderSide(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: [
                                      Text(
                                        value.dataList.data
                                                ?.checkboxwithselectoptionname
                                                .toString() ??
                                            '',
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const Icon(
                                        Icons.info_outline_rounded,
                                        color: Colors.grey,
                                        size: 15.0,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: value
                                            .dataList
                                            .data
                                            ?.checkboxwithselectoption
                                            ?.length ??
                                        0,
                                    itemBuilder: (context, index) {
                                      String checkboxNmae = value.dataList.data
                                              ?.checkboxwithselectoption?[index]
                                              .toString() ??
                                          '';
                                      return Column(
                                        children: [
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Row(
                                                  children: [
                                                    Checkbox(
                                                      checkColor: Colors.white,
                                                      activeColor:
                                                          Theme.of(context)
                                                              .primaryColor,
                                                      value: _surfaceisChecked[
                                                          index],
                                                      onChanged: (value) {
                                                        if (value == true) {
                                                          surfaceselectedlist[
                                                                  index] =
                                                              checkboxNmae;
                                                        } else {
                                                          surfaceselectedlist[
                                                              index] = false;
                                                        }
                                                        setState(() {
                                                          _surfaceisChecked[
                                                              index] = value;
                                                        });
                                                      },
                                                    ),
                                                    Text(
                                                      value
                                                              .dataList
                                                              .data
                                                              ?.checkboxwithselectoption?[
                                                                  index]
                                                              .toString() ??
                                                          '',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium,
                                                    ),
                                                  ],
                                                ),
                                                _surfaceisChecked[index]
                                                    ? Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              width: 1,
                                                              color: const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  218,
                                                                  216,
                                                                  216)),
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .all(
                                                                  Radius
                                                                      .circular(
                                                                          5)),
                                                        ),
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                10, 0, 10, 0),
                                                        child:
                                                            DropdownButtonHideUnderline(
                                                          child: DropdownButton(
                                                              isExpanded: false,
                                                              value:
                                                                  selectedValue[
                                                                      index],
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  selectedValue[
                                                                          index] =
                                                                      value ??
                                                                          true;
                                                                });
                                                              },
                                                              items:
                                                                  dropdownItems),
                                                        ),
                                                      )
                                                    : Container(),
                                              ]),
                                          const SizedBox(
                                            height: 10,
                                          )
                                        ],
                                      );
                                    }),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color: const Color.fromARGB(
                                            255, 224, 223, 223)),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5)),
                                  ),
                                  child: ExpansionTile(
                                    title: const Text(
                                      'Others',
                                      style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17,
                                        color: Colors.black,
                                      ),
                                    ),
                                    trailing: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black,
                                    ),
                                    children: <Widget>[
                                      ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: value.dataList.data?.other
                                                  ?.length ??
                                              0,
                                          itemBuilder: (context, index) {
                                            var checkboxotherNmae = value
                                                .dataList.data?.other?[index];
                                            return Column(
                                              children: [
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Row(
                                                        children: [
                                                          Checkbox(
                                                            checkColor:
                                                                Colors.white,
                                                            activeColor: Theme
                                                                    .of(context)
                                                                .primaryColor,
                                                            value:
                                                                _otherChecked[
                                                                    index],
                                                            onChanged: (value) {
                                                              if (value ==
                                                                  true) {
                                                                otherselectedlist[
                                                                        index] =
                                                                    checkboxotherNmae;
                                                              } else {
                                                                otherselectedlist[
                                                                        index] =
                                                                    false;
                                                              }
                                                              setState(() {
                                                                _otherChecked[
                                                                        index] =
                                                                    value;
                                                              });
                                                            },
                                                          ),
                                                          Text(
                                                            value
                                                                    .dataList
                                                                    .data
                                                                    ?.other?[
                                                                        index]
                                                                    .toString() ??
                                                                '',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyMedium,
                                                          ),
                                                        ],
                                                      ),
                                                    ]),
                                                const SizedBox(
                                                  height: 10,
                                                )
                                              ],
                                            );
                                          }),
                                    ],
                                    onExpansionChanged: (bool expanded) {
                                      setState(
                                          () => _customTileExpanded = expanded);
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: 1,
                                    itemBuilder: (context, index) {
                                      CountSurfaces = 0;
                                      List checkboxOption = List.generate(
                                          value
                                                  .dataList
                                                  .data
                                                  ?.checkboxwithselectoption
                                                  ?.length ??
                                              0, (index) {
                                        if (surfaceselectedlist[index] !=
                                            false) {
                                          CountSurfaces +=
                                              int.parse(selectedValue[index]);

                                          return {
                                            'name': surfaceselectedlist[index]
                                                .toString(),
                                            'quantity':
                                                selectedValue[index].toString()
                                          };
                                        }
                                      });
                                      checkboxOption.removeWhere(
                                          (value) => value == null);
                                      //nomber of others checked with quantity
                                      List checkboxOptionOther = List.generate(
                                          value.dataList.data?.other?.length ??
                                              0, (index) {
                                        if (otherselectedlist[index] != false) {
                                          return {
                                            'name': otherselectedlist[index]
                                                .toString(),
                                          };
                                        }
                                      });
                                      checkboxOptionOther.removeWhere(
                                          (value) => value == null);
                                      List.filled(_otherLength ?? 0, false);
                                      data = {
                                        'facility_uid': widget
                                            .myFacility[0].facilityUid
                                            .toString(),
                                        'inputtextname': value
                                            .dataList.data?.inputtextname
                                            .toString(),
                                        'inputtextdata':
                                            nofacility.text.toString(),
                                        'checkboxwithselectoption':
                                            checkboxOption,
                                        'checkboxwithselectoptionname': value
                                            .dataList
                                            .data
                                            ?.checkboxwithselectoptionname
                                            .toString(),
                                        'other': checkboxOptionOther
                                      };
                                      print("data==$data");
                                    }),
                              ],
                            );

                          case Status.error:
                            return Center(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.error_outline,
                                  color: Theme.of(context).primaryColorDark,
                                  size: 100.0,
                                ),
                                NoData()
                                // Text(
                                //   value.dataList.message.toString(),
                                //   style: TextStyle(
                                //       color: Theme.of(context).primaryColor,
                                //       fontSize: 20,
                                //       height: 2),
                                // )
                              ],
                            ));
                        }
                      }),
                      Center(
                        child: DottedBorder(
                          color: Color(0xffEAEFF8),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xffEAEFF8),
                                  borderRadius: BorderRadius.circular(8)),
                              child: GestureDetector(
                                onTap: () {
                                  showcameraoption();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: CircleAvatar(
                                        backgroundColor: Color(0xffCCD9EE),
                                        child: Icon(
                                          Icons.file_upload_outlined,
                                          color: Color(0xff2A62B8),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Click To Upload Images",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff2A62B8),
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'Lato'),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RoundButton(
                        loading: false,
                        title: AppLocale.conts.getString(context),
                        textColor: Colors.white,
                        rounded: true,
                        color: Theme.of(context).primaryColor,
                        onPress: () {
                          if (nofacility.text.isEmpty) {
                            print("data$data");
                            //registration.facilityePost(data, context);
                            registration.facilityeEditApiPost(
                                data, context, widget.serviceUid);
                          } else {
                            if (CountSurfaces == int.parse(nofacility.text)) {
                              print("data$data");

                              registration.facilityeEditApiPost(
                                  data, context, widget.serviceUid);
                            } else {
                              Utils.flushBarErrorMessage(
                                  'Total facility should be equal to ${nofacility.text.toString()}',
                                  context);
                            }
                          }
                        },
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    serviceId().dispose();
  }

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
                          const Text(
                            'Profile Picture',
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
                            'Camera',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          onPressed: openGallery,
                          child: Text(
                            'Gallery',
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
}
