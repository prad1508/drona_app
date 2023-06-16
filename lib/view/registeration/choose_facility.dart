import 'package:drona/view/registeration/detail_filled.dart';
import 'package:drona/view/trainne_addmanual.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
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
import 'choose_program.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseFacility extends StatefulWidget {
  const ChooseFacility({super.key});

  @override
  State<ChooseFacility> createState() => _ChooseFacilityState();
}

class _ChooseFacilityState extends State<ChooseFacility> {
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;
  bool synthetic = false;
  bool grass = false;
  bool clay = false;
  bool hard = false;
  bool _customTileExpanded = false;
  final TextEditingController nofacility = TextEditingController();
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

  //load fasility with service id
  serviceId() async {
    final prefsData = await SharedPreferences.getInstance();
    List<String>? serviceId = prefsData.getStringList('SelectedServices');
    facilityViewViewModel.fetchFacilityListApi(serviceId?[0].toString());
  }

  @override
  Widget build(BuildContext context) {
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
          title: Row(
            children: [
              ProgressPills(
                  number: 7,
                  active: 4,
                  color: Theme.of(context).primaryColorLight),
            ],
          ),
          centerTitle: true,
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
                      Align(
                        alignment: Alignment.center,
                        child: Consumer<FacilityViewViewModel>(
                            builder: (context, value, _) {
                          facilityname =
                              value.dataList.data?.inputtextname.toString() ??
                                  '';
                          return
                            value.dataList.data !=null ?

                            Row(
                            children: [
                              Text(
                                AppLocale.title31.getString(context),
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Text(
                                value.dataList.data?.serviceName.toString() ??
                                    '',
                                style: Theme.of(context).textTheme.titleLarge,
                              )
                            ],
                          )
                          :
                            const NoData();

                        }),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Consumer<FacilityViewViewModel>(builder: (
                        context,
                        value,
                        _,
                      ) {
                        facilityname =
                            value.dataList.data?.inputtextname.toString() ?? '';
                        return

                          value.dataList.data !=null ?

                          Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width:
                                    MediaQuery.of(context).size.width * 0.4,
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
                                          maxLength: 2,
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
                                  itemCount: value.dataList.data
                                      ?.checkboxwithselectoption?.length ??
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
                                            MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Row(
                                                children: [
                                                  Checkbox(
                                                    checkColor: Colors.white,
                                                    activeColor: Theme.of(context)
                                                        .primaryColor,
                                                    value:
                                                    _surfaceisChecked[index],
                                                    onChanged: (value) {
                                                      if (value == true) {
                                                        surfaceselectedlist[
                                                        index] = checkboxNmae;
                                                      } else {
                                                        surfaceselectedlist[
                                                        index] = false;
                                                      }
                                                      setState(() {
                                                        _surfaceisChecked[index] =
                                                            value;
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
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: const Color
                                                          .fromARGB(255,
                                                          218, 216, 216)),
                                                  borderRadius:
                                                  const BorderRadius
                                                      .all(
                                                      Radius.circular(
                                                          5)),
                                                ),
                                                padding: const EdgeInsets
                                                    .fromLTRB(10, 0, 10, 0),
                                                child:
                                                DropdownButtonHideUnderline(
                                                  child: DropdownButton(
                                                      isExpanded: false,
                                                      value: selectedValue[
                                                      index],
                                                      onChanged: (value) {
                                                        setState(() {
                                                          selectedValue[
                                                          index] =
                                                              value ?? true;
                                                        });
                                                      },
                                                      items: dropdownItems),
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
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
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
                                        itemCount:
                                        value.dataList.data?.other?.length ??
                                            0,
                                        itemBuilder: (context, index) {
                                          var checkboxotherNmae =
                                          value.dataList.data?.other?[index];
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
                                                          activeColor:
                                                          Theme.of(context)
                                                              .primaryColor,
                                                          value: _otherChecked[
                                                          index],
                                                          onChanged: (value) {
                                                            if (value == true) {
                                                              otherselectedlist[
                                                              index] =
                                                                  checkboxotherNmae;
                                                            } else {
                                                              otherselectedlist[
                                                              index] = false;
                                                            }
                                                            setState(() {
                                                              _otherChecked[
                                                              index] = value;
                                                            });
                                                          },
                                                        ),
                                                        Text(
                                                          value.dataList.data
                                                              ?.other?[index]
                                                              .toString() ??
                                                              '',
                                                          style: Theme.of(context)
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
                                      if (surfaceselectedlist[index] != false) {
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
                                    checkboxOption
                                        .removeWhere((value) => value == null);
                                    //nomber of others checked with quantity
                                    List checkboxOptionOther = List.generate(
                                        value.dataList.data?.other?.length ?? 0,
                                            (index) {
                                          if (otherselectedlist[index] != false) {
                                            return {
                                              'name':
                                              otherselectedlist[index].toString(),
                                            };
                                          }
                                        });
                                    checkboxOptionOther
                                        .removeWhere((value) => value == null);
                                    List.filled(_otherLength ?? 0, false);
                                    data = {
                                      'cat_name':
                                      value.dataList.data?.catName.toString(),
                                      'cat_uid':
                                      value.dataList.data?.catUid.toString(),
                                      'service_name': value
                                          .dataList.data?.serviceName
                                          .toString(),
                                      'service_id': value.dataList.data?.serviceId
                                          .toString(),
                                      'facility_uid':
                                      value.dataList.data?.uid.toString(),
                                      'inputtextname': value
                                          .dataList.data?.inputtextname
                                          .toString(),
                                      'inputtextdata': '1',
                                      'checkboxwithselectoption': checkboxOption,
                                      'checkboxwithselectoptionname': value
                                          .dataList
                                          .data
                                          ?.checkboxwithselectoptionname
                                          .toString(),
                                      'other': checkboxOptionOther
                                    };
                                  }),
                            ],
                          )
                              :
                          const NoData();


                      }),
                      RoundButton(
                        loading: false,
                        title: AppLocale.conts.getString(context),
                        textColor: Colors.white,
                        rounded: true,
                        color: Theme.of(context).primaryColor,
                        onPress: () {
                          if (nofacility.text.isEmpty) {
                            registration.facilityePost(data, context);
                          } else {
                            if (CountSurfaces == int.parse(nofacility.text)) {
                              registration.facilityePost(data, context);
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
}
