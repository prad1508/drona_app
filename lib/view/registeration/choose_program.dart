// ignore_for_file: unused_field, prefer_final_fields, depend_on_referenced_packages, unnecessary_import

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import '../../res/widget/progress_pills.dart';
import '../../res/language/language.dart';
import '../../res/widget/round_button.dart';
import '../../view_model/program_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../view_model/registration_view_model.dart';

class ChooseProgram extends StatefulWidget {
  const ChooseProgram({super.key});

  @override
  State<ChooseProgram> createState() => _ChooseProgramState();
}

class _ChooseProgramState extends State<ChooseProgram> {
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;
  ProgramViewViewModel programViewViewModel = ProgramViewViewModel();
  late Map<String, dynamic> data;
  //bylevel
  bool bylevelBeginner = false;
  bool bylevelIntermediate = false;
  bool bylevelAdvance = false;
  bool bylevelprof = false;
  bool bylevelBeginner2 = false;
  bool bylevelIntermediate2 = false;
  bool bylevelProf2 = false;
  bool bylevelAdvance2 = false;
  TextEditingController txtBylevelBeginner = TextEditingController();
  TextEditingController txtBylevelIntermediate = TextEditingController();
  TextEditingController txtBylevelAdvance = TextEditingController();
  TextEditingController txtBylevelprof = TextEditingController();
  TextEditingController txtBylevelBeginner2 = TextEditingController();
  TextEditingController txtBylevelIntermediate2 = TextEditingController();
  TextEditingController txtBylevelAdvance2 = TextEditingController();
  TextEditingController txtBylevelProf2 = TextEditingController();
  final List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  //bye age
  bool bylevelUnder12 = false;
  bool bylevelUnder14 = false;
  bool bylevelUnder16 = false;
  bool bylevelAdult = false;
  bool bylevelUnder12Second = false;
  bool bylevelUnder14Second = false;
  bool bylevelUnder16Second = false;
  bool bylevelAdultSecond = false;
  TextEditingController txtBylevelUnder12 = TextEditingController();
  TextEditingController txtBylevelUnder14 = TextEditingController();
  TextEditingController txtBylevelUnder16 = TextEditingController();
  TextEditingController txtBylevelAdult = TextEditingController();
  TextEditingController txtBylevelUnder12Second = TextEditingController();
  TextEditingController txtBylevelUnder14Second = TextEditingController();
  TextEditingController txtBylevelUnder16Second = TextEditingController();
  TextEditingController txtBylevelAdultSecond = TextEditingController();
  final List<FocusNode> _focusNodesByage = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  bool _customTileExpanded = false;
  //custom program name
  List<_GroupControllers> _groupControllers = [];
  List<TextField> _nameFields = [];
  List<TextField> _amountFields = [];
  late List _customChecked;

  //custom program registration fee
  late List _customChecked2;
  List<_GroupControllers> _groupControllers2 = [];
  List<TextField> _nameFields2 = [];
  List<TextField> _amountFields2 = [];
  final List<FocusNode> _customfocusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    _focusNodes.forEach((node) {
      node.addListener(() {
        setState(() {});
      });
    });
    // TODO: implement initState
    super.initState();
    serviceId();
  }

  //load program with service id
  serviceId() async {
    final prefsData = await SharedPreferences.getInstance();
    List<String>? serviceId = prefsData.getStringList('SelectedServices');
    programViewViewModel.fetchProgramListApi(serviceId![0].toString());
  }

  @override
  Widget build(BuildContext context) {
    final registration = Provider.of<RegistrationViewModel>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        supportedLocales: _localization.supportedLocales,
        localizationsDelegates: _localization.localizationsDelegates,
        home: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
              toolbarHeight: 100,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: Row(
                children: [
                  ProgressPills(
                      number: 7,
                      active: 5,
                      color: Theme.of(context).primaryColorLight),
                ],
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ChangeNotifierProvider<ProgramViewViewModel>(
                          create: (BuildContext context) =>
                              programViewViewModel,
                          child: Consumer<ProgramViewViewModel>(builder: (
                            context,
                            value,
                            _,
                          ) {
                            return DefaultTabController(
                                length: 3,
                                initialIndex: 0,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          AppLocale.title31.getString(context) +
                                              value.dataList.data!.data![0]
                                                  .serviceName!
                                                  .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TabBar(
                                        indicator: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                        labelColor: Colors.white,
                                        unselectedLabelColor: Colors.black,
                                        labelPadding: const EdgeInsets.all(0),
                                        dividerColor: Colors.transparent,
                                        indicatorColor: Colors.transparent,
                                        tabs: [
                                          Tab(
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      15, 13, 15, 13),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.black),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(5)),
                                              ),
                                              child: const Text("By Level"),
                                            ),
                                          ),
                                          Tab(
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      15, 13, 15, 13),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.black),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(5)),
                                              ),
                                              child: const Text("By Age"),
                                            ),
                                          ),
                                          Tab(
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      15, 13, 15, 13),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.black),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(5)),
                                              ),
                                              child: const Text("Custom"),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .6,
                                        child: TabBarView(
                                          children: <Widget>[
                                            //by level
                                            Column(
                                              children: [
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
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
                                                                bylevelBeginner,
                                                            onChanged: (value) {
                                                              print("by level beginner value------+${value}----------");
                                                              setState(() {
                                                                bylevelBeginner =
                                                                    value!;
                                                              });
                                                            },
                                                          ),
                                                          Text(
                                                            'Beginner',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyMedium,
                                                          ),
                                                        ],
                                                      ),
                                                      bylevelBeginner
                                                          ? SizedBox(
                                                              width: 150,
                                                              child:
                                                                  TextFormField(
                                                                focusNode:
                                                                    _focusNodes[
                                                                        0],
                                                                controller:
                                                                    txtBylevelBeginner,
                                                                onTap: () {},
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintText:
                                                                      '  Fees',
                                                                  contentPadding:
                                                                      const EdgeInsets
                                                                          .all(15),
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide: const BorderSide(
                                                                        color: Colors
                                                                            .blue,
                                                                        width:
                                                                            1.0),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  prefixIcon:
                                                                      Container(
                                                                          decoration: BoxDecoration(
                                                                              color: _focusNodes[0].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193),
                                                                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                          child: Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(15),
                                                                            child:
                                                                                Text(
                                                                              '₹/M',
                                                                              style: TextStyle(color: _focusNodes[0].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
                                                                            ),
                                                                          )),
                                                                ),
                                                              ),
                                                            )
                                                          : Container(),
                                                    ]),
                                                //intermediate
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
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
                                                                bylevelIntermediate,
                                                            onChanged: (value) {
                                                              print("bylevelIntermediate value------+${value}----------");
                                                              setState(() {
                                                                bylevelIntermediate =
                                                                    value!;
                                                              });
                                                            },
                                                          ),
                                                          Text(
                                                            'Intermediate',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyMedium,
                                                          ),
                                                        ],
                                                      ),
                                                      bylevelIntermediate
                                                          ? SizedBox(
                                                              width: 150,
                                                              child:
                                                                  TextFormField(
                                                                focusNode:
                                                                    _focusNodes[
                                                                        1],
                                                                controller:
                                                                    txtBylevelIntermediate,
                                                                onTap: () {},
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintText:
                                                                      '  Fees',
                                                                  contentPadding:
                                                                      const EdgeInsets
                                                                          .all(15),
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide: const BorderSide(
                                                                        color: Colors
                                                                            .blue,
                                                                        width:
                                                                            1.0),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  prefixIcon:
                                                                      Container(
                                                                          decoration: BoxDecoration(
                                                                              color: _focusNodes[1].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193),
                                                                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                          child: Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(15),
                                                                            child:
                                                                                Text(
                                                                              '₹/M',
                                                                              style: TextStyle(color: _focusNodes[1].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
                                                                            ),
                                                                          )),
                                                                ),
                                                              ),
                                                            )
                                                          : Container(),
                                                    ]),
                                                //Advance
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
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
                                                                bylevelAdvance,
                                                            onChanged: (value) {
                                                              print(value);
                                                              setState(() {
                                                                print("bylevelAdvance value------+${value}----------");
                                                                bylevelAdvance =
                                                                    value!;
                                                              });
                                                            },
                                                          ),
                                                          Text(
                                                            'Advance',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyMedium,
                                                          ),
                                                        ],
                                                      ),
                                                      bylevelAdvance
                                                          ? SizedBox(
                                                              width: 150,
                                                              child:
                                                                  TextFormField(
                                                                focusNode:
                                                                    _focusNodes[
                                                                        2],
                                                                controller:
                                                                    txtBylevelAdvance,
                                                                onTap: () {},
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintText:
                                                                      '  Fees',
                                                                  contentPadding:
                                                                      const EdgeInsets
                                                                          .all(15),
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide: const BorderSide(
                                                                        color: Colors
                                                                            .blue,
                                                                        width:
                                                                            1.0),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  prefixIcon:
                                                                      Container(
                                                                          decoration: BoxDecoration(
                                                                              color: _focusNodes[2].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193),
                                                                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                          child: Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(15),
                                                                            child:
                                                                                Text(
                                                                              '₹/M',
                                                                              style: TextStyle(color: _focusNodes[2].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
                                                                            ),
                                                                          )),
                                                                ),
                                                              ),
                                                            )
                                                          : Container(),
                                                    ]),
                                                //Professional
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
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
                                                            value: bylevelprof,
                                                            onChanged: (value) {
                                                              print(value);
                                                              setState(() {
                                                                print("bylevelprof value------+${value}----------");
                                                                bylevelprof =
                                                                    value!;
                                                              });
                                                            },
                                                          ),
                                                          Text(
                                                            'Professional',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyMedium,
                                                          ),
                                                        ],
                                                      ),
                                                      bylevelprof
                                                          ? SizedBox(
                                                              width: 150,
                                                              child:
                                                                  TextFormField(
                                                                focusNode:
                                                                    _focusNodes[
                                                                        3],
                                                                controller:
                                                                    txtBylevelprof,
                                                                onTap: () {},
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintText:
                                                                      '  Fees',
                                                                  contentPadding:
                                                                      const EdgeInsets
                                                                          .all(15),
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide: const BorderSide(
                                                                        color: Colors
                                                                            .blue,
                                                                        width:
                                                                            1.0),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  prefixIcon:
                                                                      Container(
                                                                          decoration: BoxDecoration(
                                                                              color: _focusNodes[3].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193),
                                                                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                          child: Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(15),
                                                                            child:
                                                                                Text(
                                                                              '₹/M',
                                                                              style: TextStyle(color: _focusNodes[3].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
                                                                            ),
                                                                          )),
                                                                ),
                                                              ),
                                                            )
                                                          : Container(),
                                                    ]),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                //Registration
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 1,
                                                        color: const Color
                                                                .fromARGB(255,
                                                            224, 223, 223)),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(5)),
                                                  ),
                                                  child: ExpansionTile(
                                                    title: const Text(
                                                      'Registration Fee',
                                                      style: TextStyle(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 17,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    trailing: const Icon(
                                                      Icons.arrow_drop_down,
                                                      color: Colors.black,
                                                    ),
                                                    children: <Widget>[
                                                      //Beginner
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      bylevelBeginner
                                                          ? Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
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
                                                                            Theme.of(context).primaryColor,
                                                                        value:
                                                                            bylevelBeginner2,
                                                                        onChanged:
                                                                            (value) {
                                                                          print(
                                                                              value);
                                                                          setState(
                                                                              () {
                                                                                print("bylevelBeginner2 value------+${value}----------");
                                                                            bylevelBeginner2 =
                                                                                value!;
                                                                          });
                                                                        },
                                                                      ),
                                                                      Text(
                                                                        'Beginner',
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyMedium,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  bylevelBeginner2
                                                                      ? SizedBox(
                                                                          width:
                                                                              150,
                                                                          child:
                                                                              TextFormField(
                                                                            focusNode:
                                                                                _focusNodes[4],
                                                                            controller:
                                                                                txtBylevelBeginner2,
                                                                            onTap:
                                                                                () {},
                                                                            keyboardType:
                                                                                TextInputType.number,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              hintText: '  Fees',
                                                                              contentPadding: const EdgeInsets.all(15),
                                                                              border: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(10),
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderSide: const BorderSide(color: Colors.blue, width: 1.0),
                                                                                borderRadius: BorderRadius.circular(10),
                                                                              ),
                                                                              prefixIcon: Container(
                                                                                  decoration: BoxDecoration(color: _focusNodes[4].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193), borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.all(15),
                                                                                    child: Text(
                                                                                      '₹/M',
                                                                                      style: TextStyle(color: _focusNodes[4].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
                                                                                    ),
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      : Container(),
                                                                ])
                                                          : Container(),

                                                      //Intermediate
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      bylevelIntermediate
                                                          ? Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
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
                                                                            Theme.of(context).primaryColor,
                                                                        value:
                                                                            bylevelIntermediate2,
                                                                        onChanged:
                                                                            (value) {
                                                                          print(
                                                                              value);
                                                                          setState(
                                                                              () {
                                                                            bylevelIntermediate2 =
                                                                                value!;
                                                                          });
                                                                        },
                                                                      ),
                                                                      Text(
                                                                        'Intermediate',
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyMedium,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  bylevelIntermediate2
                                                                      ? SizedBox(
                                                                          width:
                                                                              150,
                                                                          child:
                                                                              TextFormField(
                                                                            focusNode:
                                                                                _focusNodes[5],
                                                                            controller:
                                                                                txtBylevelIntermediate2,
                                                                            onTap:
                                                                                () {},
                                                                            keyboardType:
                                                                                TextInputType.number,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              hintText: '  Fees',
                                                                              contentPadding: const EdgeInsets.all(15),
                                                                              border: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(10),
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderSide: const BorderSide(color: Colors.blue, width: 1.0),
                                                                                borderRadius: BorderRadius.circular(10),
                                                                              ),
                                                                              prefixIcon: Container(
                                                                                  decoration: BoxDecoration(color: _focusNodes[5].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193), borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.all(15),
                                                                                    child: Text(
                                                                                      '₹/M',
                                                                                      style: TextStyle(color: _focusNodes[5].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
                                                                                    ),
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      : Container(),
                                                                ])
                                                          : Container(),
                                                      //Professional
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      bylevelprof
                                                          ? Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
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
                                                                            Theme.of(context).primaryColor,
                                                                        value:
                                                                            bylevelProf2,
                                                                        onChanged:
                                                                            (value) {
                                                                          print(
                                                                              value);
                                                                          setState(
                                                                              () {
                                                                            bylevelProf2 =
                                                                                value!;
                                                                          });
                                                                        },
                                                                      ),
                                                                      Text(
                                                                        'Professional',
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyMedium,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  bylevelProf2
                                                                      ? SizedBox(
                                                                          width:
                                                                              150,
                                                                          child:
                                                                              TextFormField(
                                                                            focusNode:
                                                                                _focusNodes[6],
                                                                            controller:
                                                                                txtBylevelProf2,
                                                                            onTap:
                                                                                () {},
                                                                            keyboardType:
                                                                                TextInputType.number,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              hintText: '  Fees',
                                                                              contentPadding: const EdgeInsets.all(15),
                                                                              border: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(10),
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderSide: const BorderSide(color: Colors.blue, width: 1.0),
                                                                                borderRadius: BorderRadius.circular(10),
                                                                              ),
                                                                              prefixIcon: Container(
                                                                                  decoration: BoxDecoration(color: _focusNodes[6].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193), borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.all(15),
                                                                                    child: Text(
                                                                                      '₹/M',
                                                                                      style: TextStyle(color: _focusNodes[6].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
                                                                                    ),
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      : Container(),
                                                                ])
                                                          : Container(),
                                                      //Advance
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      bylevelAdvance
                                                          ? Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
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
                                                                            Theme.of(context).primaryColor,
                                                                        value:
                                                                            bylevelAdvance2,
                                                                        onChanged:
                                                                            (value) {
                                                                          print(
                                                                              value);
                                                                          setState(
                                                                              () {
                                                                            bylevelAdvance2 =
                                                                                value!;
                                                                          });
                                                                        },
                                                                      ),
                                                                      Text(
                                                                        'Advance',
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyMedium,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  bylevelAdvance2
                                                                      ? SizedBox(
                                                                          width:
                                                                              150,
                                                                          child:
                                                                              TextFormField(
                                                                            focusNode:
                                                                                _focusNodes[7],
                                                                            controller:
                                                                                txtBylevelAdvance2,
                                                                            onTap:
                                                                                () {},
                                                                            keyboardType:
                                                                                TextInputType.number,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              hintText: '  Fees',
                                                                              contentPadding: const EdgeInsets.all(15),
                                                                              border: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(10),
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderSide: const BorderSide(color: Colors.blue, width: 1.0),
                                                                                borderRadius: BorderRadius.circular(10),
                                                                              ),
                                                                              prefixIcon: Container(
                                                                                  decoration: BoxDecoration(color: _focusNodes[7].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193), borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.all(15),
                                                                                    child: Text(
                                                                                      '₹/M',
                                                                                      style: TextStyle(color: _focusNodes[7].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
                                                                                    ),
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      : Container(),
                                                                ])
                                                          : Container(),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                    ],
                                                    onExpansionChanged:
                                                        (bool expanded) {
                                                      setState(() =>
                                                          _customTileExpanded =
                                                              expanded);
                                                    },
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                ListView.builder(
                                                    shrinkWrap: true,
                                                    itemCount: 1,
                                                    itemBuilder:
                                                        (context, index) {
                                                      //by label
                                                      data = {
                                                        "service_uid": value
                                                            .dataList
                                                            .data!
                                                            .data![0]
                                                            .serviceUid
                                                            .toString(),
                                                        "name": "By Level",
                                                        "custom": false,
                                                        "programs": [
                                                          {
                                                            "program_name":
                                                                "beginner",
                                                            "amount":
                                                                txtBylevelBeginner
                                                                        .text
                                                                        .isEmpty
                                                                    ? '0'
                                                                    : txtBylevelBeginner
                                                                        .text,
                                                            "registrationfee":
                                                                txtBylevelBeginner2
                                                                        .text
                                                                        .isEmpty
                                                                    ? '0'
                                                                    : txtBylevelBeginner2
                                                                        .text
                                                          },
                                                          {
                                                            "program_name":
                                                                "intermediant",
                                                            "amount":
                                                                txtBylevelIntermediate
                                                                        .text
                                                                        .isEmpty
                                                                    ? '0'
                                                                    : txtBylevelIntermediate
                                                                        .text,
                                                            "registrationfee":
                                                                txtBylevelIntermediate2
                                                                        .text
                                                                        .isEmpty
                                                                    ? '0'
                                                                    : txtBylevelIntermediate2
                                                                        .text
                                                          },
                                                          {
                                                            "program_name":
                                                                "advance",
                                                            "amount":
                                                                txtBylevelAdvance
                                                                        .text
                                                                        .isEmpty
                                                                    ? '0'
                                                                    : txtBylevelAdvance
                                                                        .text,
                                                            "registrationfee":
                                                                txtBylevelAdvance2
                                                                        .text
                                                                        .isEmpty
                                                                    ? '0'
                                                                    : txtBylevelAdvance2
                                                                        .text
                                                          },
                                                          {
                                                            "program_name":
                                                                "professional",
                                                            "amount": txtBylevelprof
                                                                    .text
                                                                    .isEmpty
                                                                ? '0'
                                                                : txtBylevelprof
                                                                    .text,
                                                            "registrationfee":
                                                                txtBylevelProf2
                                                                        .text
                                                                        .isEmpty
                                                                    ? '0'
                                                                    : txtBylevelProf2
                                                                        .text
                                                          }
                                                        ]
                                                      };
                                                    }),
                                              ],
                                            ),
                                            //by age
                                            Column(
                                              children: [
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
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
                                                                bylevelUnder12,
                                                            onChanged: (value) {
                                                              print(value);
                                                              setState(() {
                                                                bylevelUnder12 =
                                                                    value!;
                                                              });
                                                            },
                                                          ),
                                                          Text(
                                                            'Under 12',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyMedium,
                                                          ),
                                                        ],
                                                      ),
                                                      bylevelUnder12
                                                          ? SizedBox(
                                                              width: 150,
                                                              child:
                                                                  TextFormField(
                                                                focusNode:
                                                                    _focusNodesByage[
                                                                        0],
                                                                controller:
                                                                    txtBylevelUnder12,
                                                                onTap: () {},
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintText:
                                                                      '  Fees',
                                                                  contentPadding:
                                                                      const EdgeInsets
                                                                          .all(15),
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide: const BorderSide(
                                                                        color: Colors
                                                                            .blue,
                                                                        width:
                                                                            1.0),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  prefixIcon:
                                                                      Container(
                                                                          decoration: BoxDecoration(
                                                                              color: _focusNodesByage[0].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193),
                                                                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                          child: Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(15),
                                                                            child:
                                                                                Text(
                                                                              '₹/M',
                                                                              style: TextStyle(color: _focusNodesByage[0].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
                                                                            ),
                                                                          )),
                                                                ),
                                                              ),
                                                            )
                                                          : Container(),
                                                    ]),
                                                //under 14
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
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
                                                                bylevelUnder14,
                                                            onChanged: (value) {
                                                              print(value);
                                                              setState(() {
                                                                bylevelUnder14 =
                                                                    value!;
                                                              });
                                                            },
                                                          ),
                                                          Text(
                                                            'Under 14',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyMedium,
                                                          ),
                                                        ],
                                                      ),
                                                      bylevelUnder14
                                                          ? SizedBox(
                                                              width: 150,
                                                              child:
                                                                  TextFormField(
                                                                focusNode:
                                                                    _focusNodesByage[
                                                                        1],
                                                                controller:
                                                                    txtBylevelUnder14,
                                                                onTap: () {},
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintText:
                                                                      '  Fees',
                                                                  contentPadding:
                                                                      const EdgeInsets
                                                                          .all(15),
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide: const BorderSide(
                                                                        color: Colors
                                                                            .blue,
                                                                        width:
                                                                            1.0),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  prefixIcon:
                                                                      Container(
                                                                          decoration: BoxDecoration(
                                                                              color: _focusNodesByage[1].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193),
                                                                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                          child: Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(15),
                                                                            child:
                                                                                Text(
                                                                              '₹/M',
                                                                              style: TextStyle(color: _focusNodesByage[1].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
                                                                            ),
                                                                          )),
                                                                ),
                                                              ),
                                                            )
                                                          : Container(),
                                                    ]),
                                                //Under 16
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
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
                                                                bylevelUnder16,
                                                            onChanged: (value) {
                                                              print(value);
                                                              setState(() {
                                                                bylevelUnder16 =
                                                                    value!;
                                                              });
                                                            },
                                                          ),
                                                          Text(
                                                            'Under 16',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyMedium,
                                                          ),
                                                        ],
                                                      ),
                                                      bylevelUnder16
                                                          ? SizedBox(
                                                              width: 150,
                                                              child:
                                                                  TextFormField(
                                                                focusNode:
                                                                    _focusNodesByage[
                                                                        2],
                                                                controller:
                                                                    txtBylevelUnder16,
                                                                onTap: () {},
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintText:
                                                                      '  Fees',
                                                                  contentPadding:
                                                                      const EdgeInsets
                                                                          .all(15),
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide: const BorderSide(
                                                                        color: Colors
                                                                            .blue,
                                                                        width:
                                                                            1.0),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  prefixIcon:
                                                                      Container(
                                                                          decoration: BoxDecoration(
                                                                              color: _focusNodesByage[2].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193),
                                                                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                          child: Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(15),
                                                                            child:
                                                                                Text(
                                                                              '₹/M',
                                                                              style: TextStyle(color: _focusNodesByage[2].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
                                                                            ),
                                                                          )),
                                                                ),
                                                              ),
                                                            )
                                                          : Container(),
                                                    ]),
                                                //Adult
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
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
                                                            value: bylevelAdult,
                                                            onChanged: (value) {
                                                              print(value);
                                                              setState(() {
                                                                bylevelAdult =
                                                                    value!;
                                                              });
                                                            },
                                                          ),
                                                          Text(
                                                            'Adult',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyMedium,
                                                          ),
                                                        ],
                                                      ),
                                                      bylevelAdult
                                                          ? SizedBox(
                                                              width: 150,
                                                              child:
                                                                  TextFormField(
                                                                focusNode:
                                                                    _focusNodesByage[
                                                                        3],
                                                                controller:
                                                                    txtBylevelAdult,
                                                                onTap: () {},
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                decoration:
                                                                    InputDecoration(
                                                                  hintText:
                                                                      '  Fees',
                                                                  contentPadding:
                                                                      const EdgeInsets
                                                                          .all(15),
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide: const BorderSide(
                                                                        color: Colors
                                                                            .blue,
                                                                        width:
                                                                            1.0),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  prefixIcon:
                                                                      Container(
                                                                          decoration: BoxDecoration(
                                                                              color: _focusNodesByage[3].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193),
                                                                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                          child: Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(15),
                                                                            child:
                                                                                Text(
                                                                              '₹/M',
                                                                              style: TextStyle(color: _focusNodesByage[3].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
                                                                            ),
                                                                          )),
                                                                ),
                                                              ),
                                                            )
                                                          : Container(),
                                                    ]),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                //by age Registration
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 1,
                                                        color: const Color
                                                                .fromARGB(255,
                                                            224, 223, 223)),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(5)),
                                                  ),
                                                  child: ExpansionTile(
                                                    title: const Text(
                                                      'Registration Fee',
                                                      style: TextStyle(
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 17,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    trailing: const Icon(
                                                      Icons.arrow_drop_down,
                                                      color: Colors.black,
                                                    ),
                                                    children: <Widget>[
                                                      //Under 12
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      bylevelUnder12
                                                          ? Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
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
                                                                            Theme.of(context).primaryColor,
                                                                        value:
                                                                            bylevelUnder12Second,
                                                                        onChanged:
                                                                            (value) {
                                                                          print(
                                                                              value);
                                                                          setState(
                                                                              () {
                                                                            bylevelUnder12Second =
                                                                                value!;
                                                                          });
                                                                        },
                                                                      ),
                                                                      Text(
                                                                        'Under 12',
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyMedium,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  bylevelUnder12Second
                                                                      ? SizedBox(
                                                                          width:
                                                                              150,
                                                                          child:
                                                                              TextFormField(
                                                                            focusNode:
                                                                                _focusNodesByage[4],
                                                                            controller:
                                                                                txtBylevelUnder12Second,
                                                                            onTap:
                                                                                () {},
                                                                            keyboardType:
                                                                                TextInputType.number,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              hintText: '  Fees',
                                                                              contentPadding: const EdgeInsets.all(15),
                                                                              border: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(10),
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderSide: const BorderSide(color: Colors.blue, width: 1.0),
                                                                                borderRadius: BorderRadius.circular(10),
                                                                              ),
                                                                              prefixIcon: Container(
                                                                                  decoration: BoxDecoration(color: _focusNodesByage[4].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193), borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.all(15),
                                                                                    child: Text(
                                                                                      '₹/M',
                                                                                      style: TextStyle(color: _focusNodesByage[4].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
                                                                                    ),
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      : Container(),
                                                                ])
                                                          : Container(),

                                                      //Under 14
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      bylevelUnder14
                                                          ? Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
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
                                                                            Theme.of(context).primaryColor,
                                                                        value:
                                                                            bylevelUnder14Second,
                                                                        onChanged:
                                                                            (value) {
                                                                          print(
                                                                              value);
                                                                          setState(
                                                                              () {
                                                                            bylevelUnder14Second =
                                                                                value!;
                                                                          });
                                                                        },
                                                                      ),
                                                                      Text(
                                                                        'Under 14',
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyMedium,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  bylevelUnder14Second
                                                                      ? SizedBox(
                                                                          width:
                                                                              150,
                                                                          child:
                                                                              TextFormField(
                                                                            focusNode:
                                                                                _focusNodesByage[5],
                                                                            controller:
                                                                                txtBylevelUnder14,
                                                                            onTap:
                                                                                () {},
                                                                            keyboardType:
                                                                                TextInputType.number,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              hintText: '  Fees',
                                                                              contentPadding: const EdgeInsets.all(15),
                                                                              border: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(10),
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderSide: const BorderSide(color: Colors.blue, width: 1.0),
                                                                                borderRadius: BorderRadius.circular(10),
                                                                              ),
                                                                              prefixIcon: Container(
                                                                                  decoration: BoxDecoration(color: _focusNodesByage[5].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193), borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.all(15),
                                                                                    child: Text(
                                                                                      '₹/M',
                                                                                      style: TextStyle(color: _focusNodesByage[5].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
                                                                                    ),
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      : Container(),
                                                                ])
                                                          : Container(),
                                                      //Under 16
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      bylevelUnder16
                                                          ? Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
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
                                                                            Theme.of(context).primaryColor,
                                                                        value:
                                                                            bylevelUnder16Second,
                                                                        onChanged:
                                                                            (value) {
                                                                          print(
                                                                              value);
                                                                          setState(
                                                                              () {
                                                                            bylevelUnder16Second =
                                                                                value!;
                                                                          });
                                                                        },
                                                                      ),
                                                                      Text(
                                                                        'Under 16',
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyMedium,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  bylevelUnder16Second
                                                                      ? SizedBox(
                                                                          width:
                                                                              150,
                                                                          child:
                                                                              TextFormField(
                                                                            focusNode:
                                                                                _focusNodesByage[6],
                                                                            controller:
                                                                                txtBylevelUnder16,
                                                                            onTap:
                                                                                () {},
                                                                            keyboardType:
                                                                                TextInputType.number,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              hintText: '  Fees',
                                                                              contentPadding: const EdgeInsets.all(15),
                                                                              border: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(10),
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderSide: const BorderSide(color: Colors.blue, width: 1.0),
                                                                                borderRadius: BorderRadius.circular(10),
                                                                              ),
                                                                              prefixIcon: Container(
                                                                                  decoration: BoxDecoration(color: _focusNodesByage[6].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193), borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.all(15),
                                                                                    child: Text(
                                                                                      '₹/M',
                                                                                      style: TextStyle(color: _focusNodesByage[6].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
                                                                                    ),
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      : Container(),
                                                                ])
                                                          : Container(),
                                                      //Adult
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      bylevelAdult
                                                          ? Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
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
                                                                            Theme.of(context).primaryColor,
                                                                        value:
                                                                            bylevelAdultSecond,
                                                                        onChanged:
                                                                            (value) {
                                                                          print(
                                                                              value);
                                                                          setState(
                                                                              () {
                                                                            bylevelAdultSecond =
                                                                                value!;
                                                                          });
                                                                        },
                                                                      ),
                                                                      Text(
                                                                        'Adult',
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyMedium,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  bylevelAdultSecond
                                                                      ? SizedBox(
                                                                          width:
                                                                              150,
                                                                          child:
                                                                              TextFormField(
                                                                            focusNode:
                                                                                _focusNodesByage[7],
                                                                            controller:
                                                                                txtBylevelAdultSecond,
                                                                            onTap:
                                                                                () {},
                                                                            keyboardType:
                                                                                TextInputType.number,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              hintText: '  Fees',
                                                                              contentPadding: const EdgeInsets.all(15),
                                                                              border: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.circular(10),
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderSide: const BorderSide(color: Colors.blue, width: 1.0),
                                                                                borderRadius: BorderRadius.circular(10),
                                                                              ),
                                                                              prefixIcon: Container(
                                                                                  decoration: BoxDecoration(color: _focusNodesByage[7].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193), borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.all(15),
                                                                                    child: Text(
                                                                                      '₹/M',
                                                                                      style: TextStyle(color: _focusNodesByage[7].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
                                                                                    ),
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      : Container(),
                                                                ])
                                                          : Container(),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                    ],
                                                    onExpansionChanged:
                                                        (bool expanded) {
                                                      setState(() =>
                                                          _customTileExpanded =
                                                              expanded);
                                                    },
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                ListView.builder(
                                                    shrinkWrap: true,
                                                    itemCount: 1,
                                                    itemBuilder:
                                                        (context, index) {
                                                      //by label
                                                      data = {
                                                        "service_uid": value
                                                            .dataList
                                                            .data!
                                                            .data![0]
                                                            .serviceUid
                                                            .toString(),
                                                        "name": "By Age",
                                                        "custom": false,
                                                        "programs": [
                                                          {
                                                            "program_name":
                                                                "Under 12",
                                                            "amount":
                                                                txtBylevelBeginner
                                                                        .text
                                                                        .isEmpty
                                                                    ? '0'
                                                                    : txtBylevelBeginner
                                                                        .text,
                                                            "registrationfee":
                                                                txtBylevelBeginner2
                                                                        .text
                                                                        .isEmpty
                                                                    ? '0'
                                                                    : txtBylevelBeginner2
                                                                        .text
                                                          },
                                                          {
                                                            "program_name":
                                                                "Under 14",
                                                            "amount":
                                                                txtBylevelIntermediate
                                                                        .text
                                                                        .isEmpty
                                                                    ? '0'
                                                                    : txtBylevelIntermediate
                                                                        .text,
                                                            "registrationfee":
                                                                txtBylevelIntermediate2
                                                                        .text
                                                                        .isEmpty
                                                                    ? '0'
                                                                    : txtBylevelIntermediate2
                                                                        .text
                                                          },
                                                          {
                                                            "program_name":
                                                                "Under 16",
                                                            "amount":
                                                                txtBylevelAdvance
                                                                        .text
                                                                        .isEmpty
                                                                    ? '0'
                                                                    : txtBylevelAdvance
                                                                        .text,
                                                            "registrationfee":
                                                                txtBylevelAdvance2
                                                                        .text
                                                                        .isEmpty
                                                                    ? '0'
                                                                    : txtBylevelAdvance2
                                                                        .text
                                                          },
                                                          {
                                                            "program_name":
                                                                "Adult",
                                                            "amount": txtBylevelprof
                                                                    .text
                                                                    .isEmpty
                                                                ? '0'
                                                                : txtBylevelprof
                                                                    .text,
                                                            "registrationfee":
                                                                txtBylevelProf2
                                                                        .text
                                                                        .isEmpty
                                                                    ? '0'
                                                                    : txtBylevelProf2
                                                                        .text
                                                          }
                                                        ]
                                                      };
                                                    }),
                                              ],
                                            ),
                                            //Custom
                                            Column(
                                              children: [
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                ListView.builder(
                                                    shrinkWrap: true,
                                                    itemCount: _groupControllers
                                                        .length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      String checkboxNmae =
                                                          _groupControllers[index].name.text.toString();
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                bottom: 10),
                                                        child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: <Widget>[
                                                              Row(
                                                                children: [
                                                                  Checkbox(
                                                                    checkColor:
                                                                        Colors
                                                                            .white,
                                                                    activeColor:
                                                                        Theme.of(context)
                                                                            .primaryColor,
                                                                    value: _customChecked[
                                                                        index],
                                                                    onChanged:
                                                                        (value) {
                                                                      print(
                                                                          value);
                                                                      setState(
                                                                          () {
                                                                        _customChecked[index] =
                                                                            value!;
                                                                      });
                                                                    },
                                                                  ),
                                                                  Text(
                                                                    _groupControllers[
                                                                            index]
                                                                        .name
                                                                        .text
                                                                        .toString(),
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .bodyMedium,
                                                                  ),
                                                                ],
                                                              ),
                                                              _customChecked[
                                                                      index]
                                                                  ? SizedBox(
                                                                      width:
                                                                          150,
                                                                      child:
                                                                          TextFormField(
                                                                        //focusNode: _focusNodes[0],
                                                                        controller:
                                                                            _groupControllers[index].tel,
                                                                        onTap:
                                                                            () {},
                                                                        keyboardType:
                                                                            TextInputType.number,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          hintText:
                                                                              '  Fees',
                                                                          contentPadding:
                                                                              const EdgeInsets.all(15),
                                                                          border:
                                                                              OutlineInputBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                const BorderSide(color: Colors.blue, width: 1.0),
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                          ),
                                                                          prefixIcon: Container(
                                                                              decoration: BoxDecoration(color: _focusNodes[0].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193), borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(15),
                                                                                child: Text(
                                                                                  '₹/M',
                                                                                  style: TextStyle(color: _focusNodes[0].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
                                                                                ),
                                                                              )),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  : Container(),
                                                            ]),
                                                      );
                                                    }),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                _groupControllers.length == 0
                                                    ? Container()
                                                    : Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0),
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              width: 1,
                                                              color: const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  224,
                                                                  223,
                                                                  223)),
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .all(
                                                                  Radius
                                                                      .circular(
                                                                          5)),
                                                        ),
                                                        child: ExpansionTile(
                                                          title: const Text(
                                                            'Registration Fee',
                                                            style: TextStyle(
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 17,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          trailing: const Icon(
                                                            Icons
                                                                .arrow_drop_down,
                                                            color: Colors.black,
                                                          ),
                                                          children: <Widget>[
                                                            ListView.builder(
                                                                shrinkWrap:
                                                                    true,
                                                                itemCount:
                                                                    _groupControllers
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        index) {
                                                                  String
                                                                      checkboxNmae =
                                                                      _groupControllers[
                                                                              index]
                                                                          .name
                                                                          .text
                                                                          .toString();
                                                                  return _customChecked[
                                                                          index]
                                                                      ? Padding(
                                                                          padding:
                                                                              const EdgeInsets.only(bottom: 10),
                                                                          child: Row(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: <Widget>[
                                                                                Row(
                                                                                  children: [
                                                                                    Checkbox(
                                                                                      checkColor: Colors.white,
                                                                                      activeColor: Theme.of(context).primaryColor,
                                                                                      value: _customChecked2[index],
                                                                                      onChanged: (value) {
                                                                                        print(value);
                                                                                        setState(() {
                                                                                          _customChecked2[index] = value!;
                                                                                        });
                                                                                      },
                                                                                    ),
                                                                                    Text(
                                                                                      _groupControllers[index].name.text.toString(),
                                                                                      style: Theme.of(context).textTheme.bodyMedium,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                _customChecked2[index]
                                                                                    ? SizedBox(
                                                                                        width: 150,
                                                                                        child: TextFormField(
                                                                                          //  focusNode: _focusNodes[4],
                                                                                          controller: _groupControllers2[index].name,
                                                                                          onTap: () {},
                                                                                          keyboardType: TextInputType.number,
                                                                                          decoration: InputDecoration(
                                                                                            hintText: '  Fees',
                                                                                            contentPadding: const EdgeInsets.all(15),
                                                                                            border: OutlineInputBorder(
                                                                                              borderRadius: BorderRadius.circular(10),
                                                                                            ),
                                                                                            focusedBorder: OutlineInputBorder(
                                                                                              borderSide: const BorderSide(color: Colors.blue, width: 1.0),
                                                                                              borderRadius: BorderRadius.circular(10),
                                                                                            ),
                                                                                            prefixIcon: Container(
                                                                                                decoration: BoxDecoration(color: _focusNodes[4].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193), borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                                                child: Padding(
                                                                                                  padding: const EdgeInsets.all(15),
                                                                                                  child: Text(
                                                                                                    '₹/M',
                                                                                                    style: TextStyle(color: _focusNodes[4].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
                                                                                                  ),
                                                                                                )),
                                                                                          ),
                                                                                        ),
                                                                                      )
                                                                                    : Container(),
                                                                              ]),
                                                                        )
                                                                      : Container();
                                                                }),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                          ],
                                                          onExpansionChanged:
                                                              (bool expanded) {
                                                            setState(() =>
                                                                _customTileExpanded =
                                                                    expanded);
                                                          },
                                                        ),
                                                      ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                RoundButton(
                                                  loading: false,
                                                  title:
                                                      'Create Your Custom Program',
                                                  textColor: Colors.black,
                                                  rounded: true,
                                                  color: Theme.of(context)
                                                      .primaryColor
                                                      .withOpacity(0.2),
                                                  onPress: () {
                                                    customProgram(context);
                                                  },
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                ListView.builder(
                                                    shrinkWrap: true,
                                                    itemCount: 1,
                                                    itemBuilder:
                                                        (context, index) {
                                                      //by custom
                                                      final customProgramList =
                                                          List.generate(
                                                              _groupControllers.length, (index) {

                                                                    return {
                                                                      "program_name": _groupControllers[index].name.text,
                                                                      "amount": _groupControllers[index].tel.text.isEmpty ? '0' : _groupControllers[index].tel.text,
                                                                      "registrationfee": _groupControllers2[0].name.text.isEmpty ? '0' : _groupControllers2[0].name.text
                                                                    };



                                                      });
                                                      data = {
                                                        "service_uid": value
                                                            .dataList
                                                            .data!
                                                            .data![0]
                                                            .serviceUid
                                                            .toString(),
                                                        "name": "By Custom",
                                                        "custom": true,
                                                        "programs":
                                                            customProgramList
                                                      };
                                                    }),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ]));
                          }),
                        ),
                        RoundButton(
                          loading: false,
                          title: AppLocale.conts.getString(context),
                          textColor: Colors.white,
                          rounded: true,
                          color: Theme.of(context).primaryColor,
                          onPress: () async {
                            registration.programPost(data, context);
                          },
                        ),
                      ]),
                ),
              ),
            )));
  }

  //add custom program
  Future<bool> customProgram(context) async {
    return await showDialog(
        barrierColor: Color.fromARGB(86, 0, 0, 0),
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              height: 400,
              width: MediaQuery.of(context).size.width * 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Create Custom Program',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Expanded(child: _listView()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton.icon(
                          icon: Icon(Icons.add),
                          label: Text("Add More"),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent),
                          onPressed: () {
                            //textfield generate
                            TextField _generateTextField(
                                TextEditingController controller, String hint) {
                              return hint == 'Fee'
                                  ? TextField(
                                      //  focusNode: _customfocusNodes[7],
                                      controller: controller,
                                      onTap: () {},
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        hintText: hint,
                                        contentPadding:
                                            const EdgeInsets.all(15),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.blue, width: 1.0),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        prefixIcon: Container(
                                            decoration: BoxDecoration(
                                                color: _customfocusNodes[7]
                                                        .hasFocus
                                                    ? const Color.fromARGB(
                                                        255, 4, 112, 201)
                                                    : const Color.fromARGB(
                                                        255, 193, 193, 193),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(10),
                                                        bottomLeft:
                                                            Radius.circular(
                                                                10))),
                                            child: Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: Text(
                                                '₹/M',
                                                style: TextStyle(
                                                    color: _customfocusNodes[7]
                                                            .hasFocus
                                                        ? Colors.white
                                                        : const Color.fromARGB(
                                                            255, 44, 44, 44)),
                                              ),
                                            )),
                                      ),
                                    )
                                  : TextField(
                                      controller: controller,
                                      decoration: InputDecoration(
                                        labelText: hint,
                                        contentPadding:
                                            const EdgeInsets.only(left: 5),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: BorderSide(
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      ),
                                    );
                            }

                            final group = _GroupControllers();
                            final nameField =
                                _generateTextField(group.name, "Program Name");
                            final amountField =
                                _generateTextField(group.tel, "Fee");
                            //registration fee
                            final group2 = _GroupControllers();
                            final nameField2 =
                                _generateTextField(group2.name, "Program Name");
                            final amountField2 =
                                _generateTextField(group2.tel, "Fee");
                            setState(() {
                              _groupControllers.add(group);
                              _nameFields.add(nameField);
                              _amountFields.add(amountField);

                              _groupControllers2.add(group2);
                              _nameFields2.add(nameField2);
                              _amountFields2.add(amountField2);
                            });
                            //checkbox state create
                            _customChecked2 =
                                List.filled(_groupControllers.length, false);
                            _customChecked =
                                List.filled(_groupControllers.length, false);
                            Navigator.pop(context, true);
                            customProgram(context);
                          },
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .3,
                          child: RoundButton(
                            loading: false,
                            title: 'Exit',
                            textColor: Colors.black,
                            rounded: true,
                            color: Color.fromRGBO(223, 225, 228, 1),
                            onPress: () {
                              _groupControllers.clear();
                              _nameFields.clear();
                              _amountFields.clear();
                              Navigator.of(context).pop('Cancel');
                            },
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .3,
                          child: RoundButton(
                            loading: false,
                            title: 'Save',
                            textColor: Colors.white,
                            rounded: true,
                            color: Theme.of(context).primaryColor,
                            onPress: () {

                              Navigator.pop(context, true);
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget _listView() {
    final children = [
      for (var i = 0; i < _groupControllers.length; i++)
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .3,
                  child: _nameFields[i],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .3,
                  child: _amountFields[i],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        )
    ];
    return SingleChildScrollView(
      child: Column(
        children: children,
      ),
    );
    ;
  }
}

class _GroupControllers {
  TextEditingController name = TextEditingController();
  TextEditingController tel = TextEditingController();
  void dispose() {
    name.dispose();
    tel.dispose();
  }
}
