// ignore_for_file: unused_field, prefer_final_fields, depend_on_referenced_packages, unnecessary_import

import 'package:drona/utils/no_data.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:provider/provider.dart';
import '../../data/response/status.dart';
import '../../res/widget/progress_pills.dart';
import '../../res/language/language.dart';
import '../../res/widget/round_button.dart';
import '../../view_model/program_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../view_model/registration_view_model.dart';
import '../welcome_screen.dart';
import 'detail_filled.dart';

bool sendData = false;
class ChooseProgram extends StatefulWidget {
  const ChooseProgram({super.key});

  @override
  State<ChooseProgram> createState() => _ChooseProgramState();
}

class _ChooseProgramState extends State<ChooseProgram>with SingleTickerProviderStateMixin  {
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;
  ProgramViewViewModel programViewViewModel = ProgramViewViewModel();
  late Map<String, dynamic> data;
  late TabController _tabController;
  String serviceName='';

  getData()
  async {
    final prefs = await SharedPreferences.getInstance();
    serviceName = prefs.getString('service_name')!;
  }

  @override
  void initState() {
    getData();
    for (var node in programViewViewModel.focusNodes) {
      node.addListener(() {
        setState(() {});
      });
    }
    for (var node in programViewViewModel.focusNodesByage) {
      node.addListener(() {
        setState(() {});
      });
    } for (var node in programViewViewModel.customfocusNodes) {
      node.addListener(() {
        setState(() {});
      });
    }
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabChange);
    super.initState();
    serviceId();
  }

  void _handleTabChange() {
    int currentIndex = _tabController.index;
    programViewViewModel.activeTabIndex = currentIndex;
    programViewViewModel.updateContinueButtonEnabled();
  }

  //load program with service id
  serviceId() async {
    final prefsData = await SharedPreferences.getInstance();
    List<String>? serviceId = prefsData.getStringList('SelectedServices');
    print("11111");
    print(serviceId);
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
                child: GestureDetector(
                  onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ChangeNotifierProvider<ProgramViewViewModel>(
                          create: (BuildContext context) =>
                          programViewViewModel,
                          child: Consumer<ProgramViewViewModel>(builder: (context, value, _,) {
                            switch (value.dataList.status!) {
                              case Status.loading:
                                return const Center(
                                    child: CircularProgressIndicator(
                                        color: Colors.teal));

                              case Status.completed:
                                return
                                  DefaultTabController(

                                      length: 3,
                                      initialIndex: 0,
                                      child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: <Widget>[
                                            Align(
                                                alignment: Alignment.center,
                                                child:Row(
                                                  children: [
                                                    Text(
                                                      AppLocale.title31.getString(context),
                                                      style: Theme.of(context).textTheme.titleLarge,
                                                    ),
                                                    Text(" "),
                                                    Text("For $serviceName" , style: Theme.of(context).textTheme.titleLarge,),
                                                  ],
                                                )

                                            ),
                                            const SizedBox(height: 20,),
                                            TabBar(
                                              controller: _tabController,
                                              // onTap: (index){
                                              //   programViewViewModel.activeTabIndex = index;
                                              //   programViewViewModel.updateContinueButtonEnabled();
                                              //  },
                                              indicator: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius: BorderRadius.circular(5.0)),
                                              labelColor: Colors.white,
                                              unselectedLabelColor: Colors.black,
                                              labelPadding: const EdgeInsets.all(0),
                                              dividerColor: Colors.transparent,
                                              indicatorColor: Colors.transparent,
                                              tabs: [
                                                Tab(
                                                  child: Container(
                                                    padding: const EdgeInsets.fromLTRB(15, 13, 15, 13),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: 1,
                                                          color: Colors.black),
                                                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                                                    ),
                                                    child: const Text("By Level"),
                                                  ),
                                                ),
                                                Tab(
                                                  child: Container(
                                                    padding: const EdgeInsets.fromLTRB(15, 13, 15, 13),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(width: 1,
                                                          color: Colors.black),
                                                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                                                    ),
                                                    child: const Text("By Age"),
                                                  ),
                                                ),
                                                Tab(
                                                  child: Container(
                                                    padding: const EdgeInsets.fromLTRB(15, 13, 15, 13),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(width: 1, color: Colors.black),
                                                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                                                    ),
                                                    child: const Text("Custom"),
                                                  ),
                                                ),
                                              ],

                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context).size.height * .6,
                                              child: TabBarView(
                                                controller: _tabController,
                                                children: <Widget>[
                                                  //by level
                                                  SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        const SizedBox(height: 10,),
                                                        Row(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: <Widget>[
                                                              Row(
                                                                children: [
                                                                  Checkbox(
                                                                      checkColor: Colors.white,
                                                                      activeColor: Theme.of(context).primaryColor,
                                                                      value: programViewViewModel.bylevelBeginner,
                                                                      onChanged: (_) { programViewViewModel.togglebylevelBeginner();
                                                                      programViewViewModel.handleTextFieldChange('');}

                                                                  ),
                                                                  Text(
                                                                    'Beginner', style: Theme.of(context).textTheme.bodyMedium,
                                                                  ),
                                                                ],
                                                              ),
                                                              programViewViewModel.bylevelBeginner
                                                                  ? SizedBox(
                                                                width: 150,
                                                                child:
                                                                TextFormField(

                                                                  focusNode: programViewViewModel.focusNodes[0],
                                                                  controller: programViewViewModel.txtBylevelBeginner,
                                                                  onTap: () {},
                                                                  onChanged: (newValue) {
                                                                    programViewViewModel.handleTextFieldChange(newValue);
                                                                  },
                                                                  keyboardType: TextInputType.number,
                                                                  decoration: InputDecoration(
                                                                    hintText: '  Fees',
                                                                    contentPadding: const EdgeInsets.all(15),
                                                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                                                                    focusedBorder: OutlineInputBorder(borderSide: const BorderSide(
                                                                        color: Colors.blue, width: 1.0),
                                                                      borderRadius: BorderRadius.circular(10),
                                                                    ),
                                                                    prefixIcon: Container(
                                                                        decoration: BoxDecoration(color: programViewViewModel.focusNodes[0].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193), borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                        child: Padding(
                                                                          padding: const EdgeInsets.all(15),
                                                                          child: Text('₹/M', style: TextStyle(color: programViewViewModel.focusNodes[0].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
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
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: <Widget>[
                                                              Row(
                                                                children: [
                                                                  Checkbox(
                                                                      checkColor: Colors.white,
                                                                      activeColor: Theme.of(context).primaryColor,
                                                                      value: programViewViewModel.bylevelIntermediate,
                                                                      onChanged: (_) { programViewViewModel.togglebylevelIntermediate();
                                                                      programViewViewModel.handleTextFieldChange('');}

                                                                  ),
                                                                  Text(
                                                                    'Intermediate', style: Theme.of(context).textTheme.bodyMedium,
                                                                  ),
                                                                ],
                                                              ),
                                                              programViewViewModel.bylevelIntermediate ? SizedBox(
                                                                width: 150,
                                                                child:
                                                                TextFormField(focusNode: programViewViewModel.focusNodes[1],
                                                                  controller: programViewViewModel.txtBylevelIntermediate,
                                                                  onChanged: (newValue) {
                                                                    programViewViewModel.handleTextFieldChange(newValue);
                                                                  },
                                                                  onTap: () {},
                                                                  keyboardType: TextInputType.number,
                                                                  decoration: InputDecoration(hintText: '  Fees',
                                                                    contentPadding: const EdgeInsets.all(15),
                                                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                                                                    ),
                                                                    focusedBorder: OutlineInputBorder(borderSide: const BorderSide(
                                                                        color: Colors.blue, width: 1.0),
                                                                      borderRadius: BorderRadius.circular(10),
                                                                    ),
                                                                    prefixIcon: Container(
                                                                        decoration: BoxDecoration(color: programViewViewModel.focusNodes[1].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193), borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                        child: Padding(
                                                                          padding: const EdgeInsets.all(15),
                                                                          child: Text('₹/M',
                                                                            style: TextStyle(color: programViewViewModel.focusNodes[1].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
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
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: <Widget>[
                                                              Row(
                                                                children: [
                                                                  Checkbox(
                                                                      checkColor: Colors.white,
                                                                      activeColor: Theme.of(context).primaryColor,
                                                                      value: programViewViewModel.bylevelAdvance,
                                                                      onChanged: (_) {
                                                                        programViewViewModel.togglebylevelAdvance();
                                                                        programViewViewModel.handleTextFieldChange('');
                                                                      }
                                                                  ),
                                                                  Text(
                                                                    'Advance', style: Theme.of(context).textTheme.bodyMedium,
                                                                  ),
                                                                ],
                                                              ),
                                                              programViewViewModel.bylevelAdvance
                                                                  ? SizedBox(width: 150,child:
                                                              TextFormField(focusNode: programViewViewModel.focusNodes[2],
                                                                controller: programViewViewModel.txtBylevelAdvance,
                                                                onTap:
                                                                    () {},
                                                                onChanged: (newValue) {
                                                                  programViewViewModel.handleTextFieldChange(newValue);
                                                                },
                                                                keyboardType: TextInputType.number,
                                                                decoration: InputDecoration(
                                                                  hintText: '  Fees',
                                                                  contentPadding: const EdgeInsets.all(15),
                                                                  border: OutlineInputBorder(
                                                                    borderRadius: BorderRadius.circular(10),),
                                                                  focusedBorder: OutlineInputBorder(
                                                                    borderSide: const BorderSide(
                                                                        color:
                                                                        Colors.blue,
                                                                        width: 1.0),
                                                                    borderRadius:
                                                                    BorderRadius.circular(10),
                                                                  ),
                                                                  prefixIcon: Container(
                                                                      decoration: BoxDecoration(color: programViewViewModel.focusNodes[2].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193), borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                      child: Padding(
                                                                        padding: const EdgeInsets.all(15),
                                                                        child: Text('₹/M', style: TextStyle(color: programViewViewModel.focusNodes[2].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
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
                                                                      activeColor: Theme.of(context).primaryColor,
                                                                      value: programViewViewModel.bylevelprof,
                                                                      onChanged: (newValue) {
                                                                        programViewViewModel.togglebylevelprof();
                                                                        programViewViewModel.handleTextFieldChange('');
                                                                      }

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
                                                              programViewViewModel.bylevelprof
                                                                  ? SizedBox(width: 150, child:
                                                              TextFormField(focusNode: programViewViewModel.focusNodes[3],
                                                                controller: programViewViewModel.txtBylevelprof,
                                                                onTap:
                                                                    () {},
                                                                onChanged: (newValue) {
                                                                  programViewViewModel.handleTextFieldChange(newValue);
                                                                },
                                                                keyboardType: TextInputType.number,
                                                                decoration: InputDecoration(
                                                                  hintText: '  Fees',
                                                                  contentPadding: const EdgeInsets.all(15),
                                                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                                                  focusedBorder:
                                                                  OutlineInputBorder(
                                                                    borderSide: const BorderSide(color: Colors.blue, width: 1.0),
                                                                    borderRadius:
                                                                    BorderRadius.circular(10),
                                                                  ),
                                                                  prefixIcon: Container(
                                                                      decoration: BoxDecoration(color: programViewViewModel.focusNodes[3].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193), borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                      child: Padding(
                                                                        padding:
                                                                        const EdgeInsets.all(15),
                                                                        child:
                                                                        Text(
                                                                          '₹/M',
                                                                          style: TextStyle(color: programViewViewModel.focusNodes[3].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
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
                                                            border: Border.all(width: 1, color: const Color.fromARGB(255, 224, 223, 223)),
                                                            borderRadius:
                                                            const BorderRadius.all(Radius.circular(5)),
                                                          ),
                                                          child: ExpansionTile(
                                                            title: const Text('Registration Fee',
                                                              style: TextStyle(fontStyle: FontStyle.normal,
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
                                                              //Beginner
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              programViewViewModel.bylevelBeginner
                                                                  ? Row(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: <Widget>[
                                                                    Row(
                                                                      children: [
                                                                        Checkbox(
                                                                          checkColor: Colors.white,
                                                                          activeColor: Theme.of(context).primaryColor,
                                                                          value: programViewViewModel.bylevelBeginner2,
                                                                          onChanged: (_) => programViewViewModel.togglebylevelBeginner2(),
                                                                        ),
                                                                        Text(
                                                                          'Beginner', style: Theme.of(context).textTheme.bodyMedium,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    programViewViewModel.bylevelBeginner2
                                                                        ? SizedBox(
                                                                      width: 150,
                                                                      child: TextFormField(
                                                                        focusNode: programViewViewModel.focusNodes[4],
                                                                        controller: programViewViewModel.txtBylevelBeginner2,
                                                                        onTap: () {},
                                                                        onChanged:
                                                                            (value) {
                                                                          programViewViewModel.handleTextFieldChange(value);
                                                                        },
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
                                                                              decoration: BoxDecoration(color: programViewViewModel.focusNodes[4].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193), borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(15),
                                                                                child: Text(
                                                                                  '₹/M',
                                                                                  style: TextStyle(color: programViewViewModel.focusNodes[4].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
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
                                                              programViewViewModel.bylevelIntermediate
                                                                  ? Row(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: <Widget>[
                                                                    Row(
                                                                      children: [
                                                                        Checkbox(checkColor: Colors.white,
                                                                          activeColor: Theme.of(context).primaryColor,
                                                                          value: programViewViewModel.bylevelIntermediate2,
                                                                          onChanged: (_) => programViewViewModel.togglebylevelIntermediate2(),
                                                                        ),
                                                                        Text(
                                                                          'Intermediate',
                                                                          style:
                                                                          Theme.of(context).textTheme.bodyMedium,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    programViewViewModel.bylevelIntermediate2
                                                                        ? SizedBox(
                                                                      width: 150,
                                                                      child: TextFormField(
                                                                        focusNode: programViewViewModel.focusNodes[5],
                                                                        controller: programViewViewModel.txtBylevelIntermediate2,
                                                                        onTap: () {},
                                                                        onChanged:
                                                                            (value) {
                                                                          programViewViewModel.handleTextFieldChange(value);
                                                                        },
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
                                                                              decoration: BoxDecoration(color: programViewViewModel.focusNodes[5].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193), borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(15),
                                                                                child: Text(
                                                                                  '₹/M',
                                                                                  style: TextStyle(color: programViewViewModel.focusNodes[5].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
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
                                                              programViewViewModel.bylevelAdvance
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
                                                                          value: programViewViewModel.bylevelAdvance2,
                                                                          onChanged: (_) => programViewViewModel.togglebylevelAdvance2(),
                                                                        ),
                                                                        Text(
                                                                          'Advance',
                                                                          style:
                                                                          Theme.of(context).textTheme.bodyMedium,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    programViewViewModel.bylevelAdvance2
                                                                        ? SizedBox(
                                                                      width: 150,
                                                                      child: TextFormField(
                                                                        focusNode: programViewViewModel.focusNodes[6],
                                                                        controller: programViewViewModel.txtBylevelAdvance2,
                                                                        onTap: () {},
                                                                        onChanged:
                                                                            (value) {
                                                                          programViewViewModel.handleTextFieldChange(value);
                                                                        },
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
                                                                              decoration: BoxDecoration(color: programViewViewModel.focusNodes[6].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193), borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(15),
                                                                                child: Text(
                                                                                  '₹/M',
                                                                                  style: TextStyle(color: programViewViewModel.focusNodes[6].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
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
                                                              //Professional

                                                              programViewViewModel.bylevelprof
                                                                  ? Row(crossAxisAlignment: CrossAxisAlignment.start,
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: <Widget>[
                                                                    Row(
                                                                      children: [
                                                                        Checkbox(
                                                                          checkColor:
                                                                          Colors.white,
                                                                          activeColor:
                                                                          Theme.of(context).primaryColor,
                                                                          value: programViewViewModel.bylevelProf2,
                                                                          onChanged: (_) => programViewViewModel.togglebylevelprof2(),

                                                                        ),
                                                                        Text(
                                                                          'Professional',
                                                                          style:
                                                                          Theme.of(context).textTheme.bodyMedium,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    programViewViewModel.bylevelProf2
                                                                        ? SizedBox(
                                                                      width: 150,
                                                                      child: TextFormField(
                                                                        focusNode: programViewViewModel.focusNodes[7],
                                                                        controller: programViewViewModel.txtBylevelProf2,
                                                                        onTap: () {},
                                                                        onChanged:
                                                                            (value) {
                                                                          programViewViewModel.handleTextFieldChange(value);
                                                                        },
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
                                                                              decoration: BoxDecoration(color: programViewViewModel.focusNodes[7].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193), borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(15),
                                                                                child: Text(
                                                                                  '₹/M',
                                                                                  style: TextStyle(color: programViewViewModel.focusNodes[7].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
                                                                                ),
                                                                              )),
                                                                        ),
                                                                      ),
                                                                    )
                                                                        : Container(),
                                                                  ])
                                                                  : Container(),
                                                            ],
                                                            onExpansionChanged:
                                                                (bool expanded) {
                                                              programViewViewModel.customTileExpanded;

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
                                                              data = {"service_uid": value.dataList.data!.data![0].serviceUid.toString(),
                                                                "name": "By Level",
                                                                "custom": false,
                                                                "programs": [
                                                                  {
                                                                    "program_name": "beginner",
                                                                    "amount": programViewViewModel.txtBylevelBeginner.text.isEmpty ? '0' : programViewViewModel.txtBylevelBeginner.text,
                                                                    "registrationfee": programViewViewModel.txtBylevelBeginner2.text.isEmpty ? '0' : programViewViewModel.txtBylevelBeginner2.text
                                                                  },
                                                                  {
                                                                    "program_name": "intermediate",
                                                                    "amount": programViewViewModel.txtBylevelIntermediate.text.isEmpty ? '0' : programViewViewModel.txtBylevelIntermediate.text,
                                                                    "registrationfee": programViewViewModel.txtBylevelIntermediate2.text.isEmpty ? '0' : programViewViewModel.txtBylevelIntermediate2.text
                                                                  },
                                                                  {
                                                                    "program_name": "advance",
                                                                    "amount": programViewViewModel.txtBylevelAdvance.text.isEmpty ? '0' : programViewViewModel.txtBylevelAdvance.text,
                                                                    "registrationfee": programViewViewModel.txtBylevelAdvance2.text.isEmpty ? '0' : programViewViewModel.txtBylevelAdvance2.text
                                                                  },
                                                                  {
                                                                    "program_name": "professional",
                                                                    "amount": programViewViewModel.txtBylevelprof.text.isEmpty ? '0' : programViewViewModel.txtBylevelprof.text,
                                                                    "registrationfee": programViewViewModel.txtBylevelProf2.text.isEmpty ? '0' : programViewViewModel.txtBylevelProf2.text
                                                                  }
                                                                ]
                                                              };
                                                            }),



                                                      ],
                                                    ),
                                                  ),
                                                  //by age
                                                  SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: <Widget>[
                                                              Row(
                                                                children: [
                                                                  Checkbox(
                                                                    checkColor: Colors.white,
                                                                    activeColor: Theme.of(context).primaryColor,
                                                                    value: programViewViewModel.bylevelUnder12,
                                                                    onChanged: (value) {
                                                                      programViewViewModel.togglebylevelUnder12();
                                                                      programViewViewModel.handleTextFieldChange('');
                                                                    },
                                                                  ),
                                                                  Text(
                                                                    'Under 12',
                                                                    style: Theme.of(context).textTheme.bodyMedium,
                                                                  ),
                                                                ],
                                                              ),
                                                              programViewViewModel.bylevelUnder12
                                                                  ? SizedBox(
                                                                width: 150,
                                                                child:
                                                                TextFormField(focusNode: programViewViewModel.focusNodesByage[0],
                                                                  controller: programViewViewModel.txtBylevelUnder12,
                                                                  onTap: () {},
                                                                  onChanged: (value){
                                                                    programViewViewModel.handleTextFieldChange(value);
                                                                  },
                                                                  keyboardType: TextInputType.number,
                                                                  decoration:
                                                                  InputDecoration(
                                                                    hintText: '  Fees',
                                                                    contentPadding: const EdgeInsets.all(15),
                                                                    border:
                                                                    OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                                                                    focusedBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide: const BorderSide(
                                                                          color: Colors.blue,
                                                                          width: 1.0),
                                                                      borderRadius: BorderRadius.circular(10),
                                                                    ),
                                                                    prefixIcon: Container(
                                                                        decoration: BoxDecoration(color: programViewViewModel.focusNodesByage[0].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193), borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                        child: Padding(
                                                                          padding: const EdgeInsets.all(15),
                                                                          child:
                                                                          Text('₹/M',
                                                                            style: TextStyle(color: programViewViewModel.focusNodesByage[0].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
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
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: <Widget>[
                                                              Row(
                                                                children: [
                                                                  Checkbox(
                                                                    checkColor:
                                                                    Colors.white,
                                                                    activeColor: Theme.of(context).primaryColor,
                                                                    value: programViewViewModel.bylevelUnder14,
                                                                    onChanged: (value) {
                                                                      programViewViewModel.togglebylevelUnder14();
                                                                      programViewViewModel.handleTextFieldChange('');
                                                                    },
                                                                  ),
                                                                  Text(
                                                                    'Under 14',
                                                                    style: Theme.of(context).textTheme.bodyMedium,
                                                                  ),
                                                                ],
                                                              ),
                                                              programViewViewModel.bylevelUnder14
                                                                  ? SizedBox(
                                                                width: 150,
                                                                child:
                                                                TextFormField(
                                                                  focusNode: programViewViewModel.focusNodesByage[1],
                                                                  controller: programViewViewModel.txtBylevelUnder14,
                                                                  onTap: () {},
                                                                  onChanged: (value){
                                                                    programViewViewModel.handleTextFieldChange(value);
                                                                  },
                                                                  keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                                  decoration:
                                                                  InputDecoration(
                                                                    hintText: '  Fees',
                                                                    contentPadding: const EdgeInsets.all(15),
                                                                    border: OutlineInputBorder(
                                                                      borderRadius: BorderRadius.circular(10),),
                                                                    focusedBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide: const BorderSide(
                                                                          color: Colors.blue,
                                                                          width: 1.0),
                                                                      borderRadius:
                                                                      BorderRadius.circular(10),
                                                                    ),
                                                                    prefixIcon: Container(
                                                                        decoration: BoxDecoration(color: programViewViewModel.focusNodesByage[1].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193), borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                        child: Padding(
                                                                          padding:
                                                                          const EdgeInsets.all(15),
                                                                          child:
                                                                          Text(
                                                                            '₹/M',
                                                                            style: TextStyle(color: programViewViewModel.focusNodesByage[1].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
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
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: <Widget>[
                                                              Row(
                                                                children: [
                                                                  Checkbox(
                                                                    checkColor:
                                                                    Colors.white,
                                                                    activeColor: Theme.of(context).primaryColor,
                                                                    value:programViewViewModel.bylevelUnder16,
                                                                    onChanged:
                                                                        (value) {
                                                                      programViewViewModel.togglebylevelUnder16();
                                                                      programViewViewModel.handleTextFieldChange('');
                                                                    },
                                                                  ),
                                                                  Text(
                                                                    'Under 16',
                                                                    style: Theme.of(context).textTheme.bodyMedium,
                                                                  ),
                                                                ],
                                                              ),
                                                              programViewViewModel.bylevelUnder16
                                                                  ? SizedBox(
                                                                width: 150,
                                                                child:
                                                                TextFormField(
                                                                  focusNode: programViewViewModel.focusNodesByage[2],
                                                                  controller: programViewViewModel.txtBylevelUnder16,
                                                                  onTap: () {},
                                                                  onChanged: (value){
                                                                    programViewViewModel.handleTextFieldChange('');
                                                                  },
                                                                  keyboardType: TextInputType.number,
                                                                  decoration:
                                                                  InputDecoration(hintText: '  Fees',
                                                                    contentPadding: const EdgeInsets.all(15),
                                                                    border:
                                                                    OutlineInputBorder(
                                                                      borderRadius: BorderRadius.circular(10),
                                                                    ),
                                                                    focusedBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide: const BorderSide(
                                                                          color: Colors.blue,
                                                                          width: 1.0),
                                                                      borderRadius:
                                                                      BorderRadius.circular(10),
                                                                    ),
                                                                    prefixIcon: Container(
                                                                        decoration: BoxDecoration(color: programViewViewModel.focusNodesByage[2].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193), borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                        child: Padding(
                                                                          padding: const EdgeInsets.all(15),
                                                                          child: Text(
                                                                            '₹/M',
                                                                            style: TextStyle(color: programViewViewModel.focusNodesByage[2].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
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
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: <Widget>[
                                                              Row(
                                                                children: [
                                                                  Checkbox(
                                                                    checkColor: Colors.white,
                                                                    activeColor: Theme.of(context).primaryColor,
                                                                    value: programViewViewModel.bylevelAdult,
                                                                    onChanged:
                                                                        (value) {
                                                                      programViewViewModel.togglebylevelAdult();
                                                                      programViewViewModel.handleTextFieldChange('');
                                                                    },
                                                                  ),
                                                                  Text(
                                                                    'Adult',
                                                                    style: Theme.of(context).textTheme.bodyMedium,
                                                                  ),
                                                                ],
                                                              ),
                                                              programViewViewModel.bylevelAdult
                                                                  ? SizedBox(
                                                                width: 150,
                                                                child:
                                                                TextFormField(focusNode: programViewViewModel.focusNodesByage[3],
                                                                  controller: programViewViewModel.txtBylevelAdult,
                                                                  onTap:
                                                                      () {},
                                                                  onChanged: (value){
                                                                    programViewViewModel.handleTextFieldChange('');
                                                                  },
                                                                  keyboardType:
                                                                  TextInputType
                                                                      .number,
                                                                  decoration:
                                                                  InputDecoration(
                                                                    hintText: '  Fees',
                                                                    contentPadding: const EdgeInsets.all(15),
                                                                    border:
                                                                    OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                                                                    ),
                                                                    focusedBorder:
                                                                    OutlineInputBorder(
                                                                      borderSide: const BorderSide(
                                                                          color: Colors.blue,
                                                                          width: 1.0),
                                                                      borderRadius:
                                                                      BorderRadius.circular(10),
                                                                    ),
                                                                    prefixIcon: Container(
                                                                        decoration: BoxDecoration(color: programViewViewModel.focusNodesByage[3].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193), borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                        child: Padding(padding: const EdgeInsets.all(15),
                                                                          child:
                                                                          Text('₹/M',
                                                                            style: TextStyle(color: programViewViewModel.focusNodesByage[3].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
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
                                                          const EdgeInsets.all(
                                                              0),
                                                          decoration: BoxDecoration(
                                                            border: Border.all(
                                                                width: 1,
                                                                color: const Color.fromARGB(255, 224, 223, 223)),
                                                            borderRadius:
                                                            const BorderRadius.all(Radius.circular(5)),
                                                          ),
                                                          child: ExpansionTile(
                                                            title: const Text(
                                                              'Registration Fee',
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
                                                              //Under 12
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              programViewViewModel.bylevelUnder12
                                                                  ? Row(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: <Widget>[
                                                                    Row(
                                                                      children: [
                                                                        Checkbox(
                                                                          checkColor: Colors.white,
                                                                          activeColor: Theme.of(context).primaryColor,
                                                                          value: programViewViewModel.bylevelUnder12Second,
                                                                          onChanged:
                                                                              (value) {
                                                                            programViewViewModel.togglebylevelUnder12Second();
                                                                          },
                                                                        ),
                                                                        Text('Under 12', style:
                                                                        Theme.of(context).textTheme.bodyMedium,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    programViewViewModel.bylevelUnder12Second
                                                                        ? SizedBox(
                                                                      width: 150,
                                                                      child: TextFormField(
                                                                        focusNode: programViewViewModel.focusNodesByage[4],
                                                                        controller: programViewViewModel.txtBylevelUnder12Second,
                                                                        onTap: () {},
                                                                        onChanged:
                                                                            (value) {
                                                                          programViewViewModel.handleTextFieldChange(value);
                                                                        },
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
                                                                              decoration: BoxDecoration(color: programViewViewModel.focusNodesByage[4].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193), borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(15),
                                                                                child: Text(
                                                                                  '₹/M',
                                                                                  style: TextStyle(color: programViewViewModel.focusNodesByage[4].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
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
                                                              programViewViewModel.bylevelUnder14
                                                                  ? Row(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: <Widget>[
                                                                    Row(
                                                                      children: [
                                                                        Checkbox(
                                                                          checkColor:
                                                                          Colors.white,
                                                                          activeColor: Theme.of(context).primaryColor,
                                                                          value: programViewViewModel.bylevelUnder14Second,
                                                                          onChanged:
                                                                              (value) {
                                                                            programViewViewModel.togglebylevelUnder14Second();
                                                                          },
                                                                        ),
                                                                        Text('Under 14',
                                                                          style:
                                                                          Theme.of(context).textTheme.bodyMedium,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    programViewViewModel.bylevelUnder14Second
                                                                        ? SizedBox(
                                                                      width: 150,
                                                                      child: TextFormField(
                                                                        focusNode: programViewViewModel.focusNodesByage[5],
                                                                        controller: programViewViewModel.txtBylevelUnder14Second,
                                                                        onTap: () {},
                                                                        onChanged:
                                                                            (value) {
                                                                          programViewViewModel.handleTextFieldChange(value);
                                                                        },
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
                                                                              decoration: BoxDecoration(color: programViewViewModel.focusNodesByage[5].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193), borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(15),
                                                                                child: Text(
                                                                                  '₹/M',
                                                                                  style: TextStyle(color: programViewViewModel.focusNodesByage[5].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
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
                                                              programViewViewModel.bylevelUnder16
                                                                  ? Row(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: <Widget>[
                                                                    Row(
                                                                      children: [
                                                                        Checkbox(
                                                                          checkColor: Colors.white,
                                                                          activeColor: Theme.of(context).primaryColor,
                                                                          value: programViewViewModel.bylevelUnder16Second,
                                                                          onChanged:
                                                                              (value) {
                                                                            programViewViewModel.togglebylevelUnder16Second();
                                                                          },
                                                                        ),
                                                                        Text('Under 16',
                                                                          style:
                                                                          Theme.of(context).textTheme.bodyMedium,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    programViewViewModel.bylevelUnder16Second
                                                                        ? SizedBox(
                                                                      width: 150,
                                                                      child: TextFormField(
                                                                        focusNode: programViewViewModel.focusNodesByage[6],
                                                                        controller: programViewViewModel.txtBylevelUnder16Second,
                                                                        onTap: () {},
                                                                        onChanged:
                                                                            (value) {
                                                                          programViewViewModel.handleTextFieldChange(value);
                                                                        },
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
                                                                              decoration: BoxDecoration(color: programViewViewModel.focusNodesByage[6].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193), borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(15),
                                                                                child: Text(
                                                                                  '₹/M',
                                                                                  style: TextStyle(color: programViewViewModel.focusNodesByage[6].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
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
                                                              programViewViewModel.bylevelAdult
                                                                  ? Row(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: <Widget>[
                                                                    Row(
                                                                      children: [
                                                                        Checkbox(
                                                                          checkColor: Colors.white,
                                                                          activeColor: Theme.of(context).primaryColor,
                                                                          value: programViewViewModel.bylevelAdultSecond,
                                                                          onChanged:
                                                                              (value) {
                                                                            programViewViewModel.togglebylevelAdultSecond();
                                                                          },
                                                                        ),
                                                                        Text('Adult', style:
                                                                        Theme.of(context).textTheme.bodyMedium,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    programViewViewModel.bylevelAdultSecond
                                                                        ? SizedBox(
                                                                      width: 150,
                                                                      child: TextFormField(
                                                                        focusNode: programViewViewModel.focusNodesByage[7],
                                                                        controller: programViewViewModel.txtBylevelAdultSecond,
                                                                        onTap: () {},
                                                                        onChanged:
                                                                            (value) {
                                                                          programViewViewModel.handleTextFieldChange(value);
                                                                        },
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
                                                                              decoration: BoxDecoration(color: programViewViewModel.focusNodesByage[7].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193), borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(15),
                                                                                child: Text(
                                                                                  '₹/M',
                                                                                  style: TextStyle(color: programViewViewModel.focusNodesByage[7].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
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
                                                              programViewViewModel.customTileExpanded;
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
                                                                "service_uid": value.dataList.data!.data![0].serviceUid.toString(),
                                                                "name": "By Age",
                                                                "custom": false,
                                                                "programs": [
                                                                  {
                                                                    "program_name": "Under 12",
                                                                    "amount": programViewViewModel.txtBylevelUnder12.text.isEmpty ? '0' : programViewViewModel.txtBylevelUnder12.text,
                                                                    "registrationfee": programViewViewModel.txtBylevelUnder12Second.text.isEmpty ? '0' : programViewViewModel.txtBylevelUnder12Second.text
                                                                  },
                                                                  {
                                                                    "program_name": "Under 14",
                                                                    "amount": programViewViewModel.txtBylevelUnder14.text.isEmpty ? '0' : programViewViewModel.txtBylevelUnder14.text,
                                                                    "registrationfee": programViewViewModel.txtBylevelUnder14Second.text.isEmpty ? '0' : programViewViewModel.txtBylevelUnder14Second.text
                                                                  },
                                                                  {
                                                                    "program_name": "Under 16",
                                                                    "amount": programViewViewModel.txtBylevelUnder16.text.isEmpty ? '0' : programViewViewModel.txtBylevelUnder16.text,
                                                                    "registrationfee": programViewViewModel.txtBylevelUnder16Second.text.isEmpty ? '0' : programViewViewModel.txtBylevelUnder16Second.text
                                                                  },
                                                                  {
                                                                    "program_name": "Adult",
                                                                    "amount": programViewViewModel.txtBylevelAdult.text.isEmpty ? '0' : programViewViewModel.txtBylevelAdult.text,
                                                                    "registrationfee": programViewViewModel.txtBylevelAdultSecond.text.isEmpty ? '0' : programViewViewModel.txtBylevelAdultSecond.text
                                                                  }
                                                                ]
                                                              };
                                                            }),
                                                      ],
                                                    ),
                                                  ),
                                                  //Custom
                                                  SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        const SizedBox(
                                                          height: 20,
                                                        ),
                                                        ListView.builder(
                                                            shrinkWrap: true,
                                                            itemCount:
                                                            programViewViewModel.groupControllers.length,
                                                            itemBuilder:
                                                                (context, index) {
                                                              String checkboxNmae =
                                                              programViewViewModel.groupControllers[index].name.text.toString();
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
                                                                            Colors.white,
                                                                            activeColor:
                                                                            Theme.of(context).primaryColor,
                                                                            value: programViewViewModel.customChecked[index],
                                                                            onChanged:
                                                                                (value) {

                                                                              programViewViewModel.togglebycustom(index);
                                                                              programViewViewModel.handleTextFieldChange('');
                                                                              // setState(
                                                                              //     () {
                                                                              //       programViewViewModel.customChecked[index] =
                                                                              //       value!;
                                                                              // });
                                                                            },
                                                                          ),
                                                                          Text(
                                                                            programViewViewModel.groupControllers[index]
                                                                                .name
                                                                                .text
                                                                                .toString(),
                                                                            style: Theme.of(context)
                                                                                .textTheme
                                                                                .bodyMedium,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      programViewViewModel.customChecked[
                                                                      index]
                                                                          ? SizedBox(
                                                                        width:
                                                                        150,
                                                                        child:
                                                                        TextFormField(
                                                                          //focusNode: _focusNodes[0],
                                                                          controller:
                                                                          programViewViewModel.groupControllers[index].tel,
                                                                          onTap:
                                                                              () {},
                                                                          onChanged: (value){
                                                                            programViewViewModel.handleTextFieldChange(value);
                                                                          },
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
                                                                                decoration: BoxDecoration(color: programViewViewModel.focusNodes[0].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193), borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(15),
                                                                                  child: Text(
                                                                                    '₹/M',
                                                                                    style: TextStyle(color: programViewViewModel.focusNodes[0].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
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
                                                        programViewViewModel.groupControllers.length ==
                                                            0
                                                            ? Container()
                                                            : Container(
                                                          padding: const EdgeInsets.all(0),
                                                          decoration:
                                                          BoxDecoration(border: Border.all(width: 1,
                                                              color: const Color.fromARGB(255, 224, 223, 223)),
                                                            borderRadius: const BorderRadius.all(Radius.circular(5)),
                                                          ),
                                                          child:
                                                          ExpansionTile(
                                                            title: const Text('Registration Fee',
                                                              style: TextStyle(fontStyle: FontStyle.normal,
                                                                fontWeight: FontWeight.w500,
                                                                fontSize: 17,
                                                                color: Colors.black,
                                                              ),
                                                            ),
                                                            trailing:
                                                            const Icon(Icons.arrow_drop_down,
                                                              color: Colors.black,
                                                            ),
                                                            children: <Widget>[
                                                              ListView.builder(
                                                                  shrinkWrap: true,
                                                                  itemCount: programViewViewModel.groupControllers.length,
                                                                  itemBuilder: (context, index) {
                                                                    String checkboxNmae = programViewViewModel.groupControllers[index].name.text.toString();
                                                                    return programViewViewModel.customChecked[index]
                                                                        ? Padding(padding: const EdgeInsets.only(bottom: 10),
                                                                      child: Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                                                                        Row(
                                                                          children: [
                                                                            Checkbox(
                                                                              checkColor: Colors.white,
                                                                              activeColor: Theme.of(context).primaryColor,
                                                                              value: programViewViewModel.customChecked2[index],
                                                                              onChanged: (value) {
                                                                                print(value);
                                                                                programViewViewModel.togglebycustom2(index);
                                                                                programViewViewModel.handleTextFieldChange('');

                                                                              },
                                                                            ),
                                                                            Text(
                                                                              programViewViewModel.groupControllers[index].name.text.toString(),
                                                                              style: Theme.of(context).textTheme.bodyMedium,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        programViewViewModel.customChecked2[index]
                                                                            ? SizedBox(
                                                                          width: 150,
                                                                          child: TextFormField(
                                                                            //  focusNode: _focusNodes[4],
                                                                            controller: programViewViewModel.groupControllers2[index].name,
                                                                            onTap: () {},
                                                                            onChanged:(value){
                                                                              programViewViewModel.handleTextFieldChange(value);
                                                                            },
                                                                            // programViewViewModel.handleTextFieldChange(value);
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
                                                                                  decoration: BoxDecoration(color: programViewViewModel.focusNodes[4].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193), borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.all(15),
                                                                                    child: Text(
                                                                                      '₹/M',
                                                                                      style: TextStyle(color: programViewViewModel.focusNodes[4].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
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
                                                                (bool
                                                            expanded) {
                                                              programViewViewModel.customTileExpanded;
                                                            },
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 20,
                                                        ),
                                                        RoundButton(
                                                          loading: false,
                                                          title: 'Create Your Custom Program',
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
                                                              List.generate(programViewViewModel.groupControllers.length, (index) {
                                                                return {
                                                                  "program_name": programViewViewModel.groupControllers[index].name.text,
                                                                  "amount": programViewViewModel.groupControllers[index].tel.text.isEmpty ? '0' : programViewViewModel.groupControllers[index].tel.text,
                                                                  "registrationfee": programViewViewModel.groupControllers2[index].name.text.isEmpty ? '0' : programViewViewModel.groupControllers2[index].name.text
                                                                };
                                                              });
                                                              data = {
                                                                "service_uid": value.dataList.data!.data![0].serviceUid.toString(),
                                                                "name": "By Custom",
                                                                "custom": true,
                                                                "programs": customProgramList
                                                              };
                                                            }),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ]));
                              case Status.error:
                                return const Center(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [

                                        NoData()
                                      ],
                                    ));
                            }
                          }),
                        ),
                        ValueListenableBuilder<bool>(
                          valueListenable: programViewViewModel.isContinueButtonEnabled,
                          builder: (context, isContinueButtonEnabled, _) {
                            return RoundButton(
                              loading: false,
                              title: AppLocale.conts.getString(context),
                              textColor: Colors.white,
                              rounded: true,
                              color: isContinueButtonEnabled ? Theme.of(context).primaryColor : Theme.of(context).disabledColor,
                              onPress: () async {
                                print(data);
                                // programViewViewModel.isContinueButtonEnabled ?
                                FocusManager.instance.primaryFocus?.unfocus();
                                /// open modal
                                registration.programPost(data, context);
                                openModal(context , serviceName);

                                //     :null;
                              },
                            );
                          },
                        )


                        // RoundButton(
                        //   loading: false,
                        //   title: AppLocale.conts.getString(context),
                        //   textColor: Colors.white,
                        //   rounded: true,
                        //   color: Theme.of(context).primaryColor,
                        //   onPress: () async {
                        //     print("data is");
                        //     print(data);
                        //     registration.programPost(data, context);
                        //   },
                        // ),
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
                                //focusNode: _customfocusNodes[7],
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
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  prefixIcon: Container(
                                      decoration: BoxDecoration(
                                          color: programViewViewModel.customfocusNodes[7].hasFocus ? const Color.fromARGB(255, 4, 112, 201)
                                              : const Color.fromARGB(255, 193, 193, 193),
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Text(
                                          '₹/M',
                                          style: TextStyle(
                                              color: programViewViewModel.customfocusNodes[7].hasFocus
                                                  ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
                                        ),
                                      )),
                                ),
                              )
                                  : TextField(
                                controller: controller,
                                decoration: InputDecoration(
                                  labelText: hint,
                                  contentPadding: const EdgeInsets.only(left: 5),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide(color: Theme.of(context).primaryColor,),
                                  ),
                                ),
                              );
                            }

                            final group = GroupControllers();
                            final nameField =
                            _generateTextField(group.name, "Program Name");
                            final amountField =
                            _generateTextField(group.tel, "Fee");
                            //registration fee
                            final group2 = GroupControllers();
                            final nameField2 =
                            _generateTextField(group2.name, "Program Name");
                            final amountField2 =
                            _generateTextField(group2.tel, "Fee");

                            setState(() {

                              programViewViewModel.groupControllers.add(group);
                              programViewViewModel.nameFields.add(nameField);
                              programViewViewModel.amountFields.add(amountField);

                              programViewViewModel.groupControllers2.add(group2);
                              programViewViewModel.nameFields2.add(nameField2);
                              programViewViewModel.amountFields2.add(amountField2);
                            });
                            //checkbox state create
                            programViewViewModel.customChecked2 =
                                List.filled(programViewViewModel.groupControllers.length, false);
                            programViewViewModel.customChecked =
                                List.filled(programViewViewModel.groupControllers.length, false);
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
                              programViewViewModel.groupControllers.clear();
                              programViewViewModel.nameFields.clear();
                              programViewViewModel.amountFields.clear();
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
                              for(var i=0 ;i <programViewViewModel.groupControllers.length;i++)
                              {
                                if (programViewViewModel.nameFields[i].controller!.text.isEmpty ||
                                    programViewViewModel.amountFields[i].controller!.text.isEmpty) {
                                  programViewViewModel.groupControllers.removeAt(i);
                                  programViewViewModel.nameFields.removeAt(i);
                                  programViewViewModel.amountFields.removeAt(i);
                                  programViewViewModel.notifyListeners();
                                  // Adjust the loop index after removing an item
                                }
                              }
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
      for (var i = 0; i < programViewViewModel.groupControllers.length; i++)

        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .3,
                  child: programViewViewModel.nameFields[i],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .3,
                  child: programViewViewModel.amountFields[i],
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

  }

}

void openModal(BuildContext context , String service_name) {
  String role = '';
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: AlertDialog(
          title: Center(child: Text('Confirmation')),
          content:  Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Program Setup Completed For $service_name',style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey
              ),),
              SizedBox(height: 5),
              Text('To complete setup for additional services, visit',style: TextStyle(
                  fontSize: 12
              ),),
              SizedBox(height: 5),
              Text('"Academy Management"',style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500
              ),)
            ],
          ),
          contentPadding: EdgeInsets.all(20),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  width: double.infinity,
                  child: RoundButton(
                    title: 'Continue',
                    onPress: () async {
                      Navigator.pop(context);
                      try {
                        final prefsData = await SharedPreferences.getInstance();
                        List<String>? items = prefsData.getStringList('registerResponse');
                        role = items![4];
                        if(role == '0')
                        {

                          Get.to(() => const WelcomeScreen(),transition: Transition.rightToLeft);
                        }
                        else
                        {
                          Get.to(() => const DetailFilled(),transition: Transition.rightToLeft);
                        }
                      } catch (error){

                      }

                    },
                    rounded: true,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,

                  )
              ),
            ),
          ],
        ),
      );
    },
  );
}


class GroupControllers {
  TextEditingController name = TextEditingController();
  TextEditingController tel = TextEditingController();
  void dispose() {
    name.dispose();
    tel.dispose();
  }
}