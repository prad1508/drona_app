import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';

import '../../data/response/status.dart';
import '../../res/language/language.dart';
import '../../res/widget/progress_pills.dart';
import '../../res/widget/round_button.dart';
import '../../res/widget/synctextform.dart';
import '../../utils/utils.dart';
import '../../utils/validation.dart';
import '../../view_model/category_view_model.dart';
import '../../view_model/postoffice_view_model.dart';
import '../../view_model/registration_view_model.dart';

class TellusAcadmic extends StatefulWidget {
  const TellusAcadmic({super.key});

  @override
  State<TellusAcadmic> createState() => _TellusAcadmicState();
}

class _TellusAcadmicState extends State<TellusAcadmic> {
  //multi language support

  final FlutterLocalization _localization = FlutterLocalization.instance;
  bool payDate = false;
  String addressAsign = '';
  String stateAssign = '';
  String cityAssign = '';
  String pinAsign = '';
  final TextEditingController acadmicName = TextEditingController();
  final TextEditingController address = TextEditingController();

  final TextEditingController state = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController pincode = TextEditingController();
  final TextEditingController pincodedata = TextEditingController();
  late int selectPin;

  CategoryViewViewModel categoryViewViewModel = CategoryViewViewModel();

  @override
  void initState() {
    categoryViewViewModel.fetchCategoryListApi();
    super.initState();
  }
  Future<bool> showExitPopup(context) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SizedBox(
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.close_rounded,
                      color: Colors.redAccent,
                      size: 50.0,
                    ),

                  ),
                  const Text("Do you want to exit?"),
                  const SizedBox(height: 20),
                  Row(
                    children: [


                      Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            child:const Text("No",
                                style: TextStyle(color: Colors.black)
                            ),
                          )),
                      const SizedBox(width: 15),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            exit(0);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent),
                          child: const Text(
                            "Yes", style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  Future<bool> _onWillPop() async {
    Navigator.pop(context);
    return false;
  }

//billig date dropdown
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
       DropdownMenuItem(
        value: "1",
        child: selectedValue =="1"?
            const Text("1 of every month" ,style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500
            ),) : Text("1 of every month")
           // Add a check icon if selected

      ),
       DropdownMenuItem(
           value: "5",
           child: selectedValue == "5" ?
            Text("5 of every month",style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500
            ),) :Text("5 of every month")


      ),
       DropdownMenuItem(
        value: "7",
        child: selectedValue == "7" ?
            Text("7 of every month" ,style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500
            ),) :Text("7 of every month")
      ),
       DropdownMenuItem(
        value: "10",
        child: selectedValue =="10" ?
        Text("10 of every month" ,style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500
        ),):Text("10 of every month")
      ),
       DropdownMenuItem(
        value: "15",
        child: selectedValue == "15" ?
        Text("15 of every month" ,style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500
        ),) :Text("15 of every month")
      ),
    ];
    return menuItems;
  }

  String selectedValue = "5";

//category select dropdown
  String selectedValue2 = "euu6ogdz3h6lzinf29jk";

  @override
  Widget build(BuildContext context) {
    final registration = Provider.of<RegistrationViewModel>(context);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: MaterialApp(
        supportedLocales: _localization.supportedLocales,
        localizationsDelegates: _localization.localizationsDelegates,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                showExitPopup(context);
              },
            ),
            title: Row(
              children: [
                ProgressPills(
                    number: 7,
                    active: 2,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        AppLocale.title10.getString(context),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        AppLocale.academyName.getString(context),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),


                    TextFormField(
                      controller: acadmicName,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: 'eg. Sun Academy',
                        contentPadding: const EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocale.location.getString(context),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            dialog(context);
                          },
                          child: Text(
                            AppLocale.pickupLoctaion.getString(context),
                            style: const TextStyle(
                                color: Color.fromRGBO(253, 104, 93, 1),
                                fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: pincodedata
                        ..text = pinAsign.toString()
                        ..selection = TextSelection(
                            baseOffset: pinAsign.length,
                            extentOffset: pinAsign.length),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(
                          6,
                        ),
                      ],
                      decoration: InputDecoration(
                        hintText: AppLocale.pincode.getString(context),
                        contentPadding: const EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          pinAsign = '';
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          pinAsign = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: address
                        ..text = addressAsign.toString()
                        ..selection = TextSelection(
                            baseOffset: addressAsign.length,
                            extentOffset: addressAsign.length),
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: AppLocale.address.getString(context),
                        contentPadding: const EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          addressAsign = '';
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          addressAsign = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: city
                        ..text = cityAssign.toString()
                        ..selection = TextSelection(
                            baseOffset: cityAssign.length,
                            extentOffset: cityAssign.length),
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: AppLocale.city.getString(context),
                        contentPadding: const EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          cityAssign = '';
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          cityAssign = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: state
                        ..text = stateAssign.toString()
                        ..selection = TextSelection(
                            baseOffset: stateAssign.length,
                            extentOffset: stateAssign.length),
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: AppLocale.state.getString(context),
                        contentPadding: const EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          stateAssign = '';
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          stateAssign = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Text(
                            AppLocale.title32.getString(context),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const Icon(
                            Icons.info_outline_rounded,
                            color: Colors.grey,
                            size: 15.0,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ChangeNotifierProvider<CategoryViewViewModel>(
                      create: (BuildContext context) => categoryViewViewModel,
                      child: Consumer<CategoryViewViewModel>(
                          builder: (context, value, _) {
                        try {
                          List<DropdownMenuItem<String>> categoryList =
                              List.generate(
                                  value.dataList.data?.data?.length ?? 0,
                                  (index) {
                            return DropdownMenuItem(
                                value: value.dataList.data?.data?[index].uid
                                    .toString(),
                                child:
                                Text(value
                                        .dataList.data?.data?[index].name
                                        .toString() ??
                                    ''));
                          });
                          return Container(
                            padding: const EdgeInsets.only(left: 10.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color:
                                      const Color.fromARGB(255, 218, 216, 216)),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                            ),
                            child: DropdownButton(
                                isExpanded: true,
                                underline: DropdownButtonHideUnderline(
                                    child: Container()),
                                value: selectedValue2,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedValue2 = newValue!;
                                  });
                                },
                                items: categoryList),
                          );
                        } on SocketException catch (_) {
                          rethrow;
                        }
                      }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocale.billingDate.getString(context),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            setState(() {
                              payDate = !payDate;
                            });
                          },
                          child: Text(
                            AppLocale.editDate.getString(context),
                            style: const TextStyle(
                                color: Color.fromRGBO(253, 104, 93, 1),
                                fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: const Color.fromARGB(255, 218, 216, 216)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                      ),
                      child:


                      DropdownButton(
                          isExpanded: true,
                          underline:
                              DropdownButtonHideUnderline(child: Container()),
                          value: selectedValue,
                          onChanged: payDate == true
                              ? (String? newValue) {
                                  setState(() {
                                    selectedValue = newValue!;
                                  });
                                }
                              : null,
                          items: dropdownItems),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    RoundButton(
                        loading: false,
                        title: AppLocale.conts.getString(context),
                        textColor: Colors.white,
                        rounded: true,
                        color: Theme.of(context).primaryColor,
                        onPress: () {
                          if (acadmicName.text.isEmpty) {
                            Utils.flushBarErrorMessage(
                                'Fill Academy Name', context);
                          }
                          if (pincodedata.text.isEmpty) {
                            Utils.flushBarErrorMessage(
                                'Fill Pin Code', context);
                          }
                          if (address.text.isEmpty) {
                            Utils.flushBarErrorMessage('Fill Address', context);
                          }
                          if (city.text.isEmpty) {
                            Utils.flushBarErrorMessage('Fill City', context);
                          }
                          if (state.text.isEmpty) {
                            Utils.flushBarErrorMessage('Fill State', context);
                          } else {
                            Map<String, String> data = {
                              "academyname": acadmicName.text.toString(),
                              "busscategoryid": selectedValue2.toString(),
                              "address": address.text.toString(),
                              "city": city.text.toString(),
                              "state": state.text.toString(),
                              "pincode": pincodedata.text.toString(),
                              "billing_date": selectedValue.toString(),
                            };
                            print(data);
                            registration.basicDetails(
                                data, context, selectedValue2, acadmicName.text.toString());
                          }
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

//bottom sheet
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
                            color: Theme.of(context).primaryColor,
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
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: value.dataList.data?.postOffice?.isNotEmpty ?? false
                                ?
                            ListView.builder(
                                    itemCount: value.dataList.data?.postOffice
                                            ?.length ??
                                        0,
                                    itemBuilder: (context, index) => Card(
                                        key: ValueKey(value.dataList.data!
                                            .postOffice?[index].name),
                                        color: const Color.fromARGB(
                                            255, 238, 238, 236),
                                        elevation: 0,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: InkWell(
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Address: ${value.dataList.data?.postOffice?[index].name}',
                                                      style: const TextStyle(
                                                          fontSize: 14),
                                                    ),
                                                    Text(
                                                      ', City: ${value.dataList.data?.postOffice?[index].block},',
                                                      style: const TextStyle(
                                                          fontSize: 14),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'State: ${value.dataList.data?.postOffice?[index].state}',
                                                      style: const TextStyle(
                                                          fontSize: 14),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            onTap: () {
                                              setState(() {
                                                pinAsign = value
                                                        .dataList
                                                        .data
                                                        ?.postOffice?[index]
                                                        .pincode
                                                        ?.toString() ??
                                                    '';
                                                addressAsign = value
                                                        .dataList
                                                        .data
                                                        ?.postOffice?[index]
                                                        .name
                                                        ?.toString() ??
                                                    '';
                                                cityAssign = value
                                                        .dataList
                                                        .data
                                                        ?.postOffice?[index]
                                                        .district
                                                        ?.toString() ??
                                                    '';
                                                stateAssign = value
                                                        .dataList
                                                        .data
                                                        ?.postOffice?[index]
                                                        .state
                                                        ?.toString() ??
                                                    '';
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
}
