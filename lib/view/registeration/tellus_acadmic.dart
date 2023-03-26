import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/response/status.dart';
import '../../res/language/language.dart';
import '../../res/widget/customTextField.dart';
import '../../res/widget/customradio.dart';
import '../../res/widget/progressPills.dart';
import '../../res/widget/round_button.dart';
import '../../res/widget/synctextform.dart';
import '../../utils/routes/routes_name.dart';
import '../../utils/color.dart' as AppColor;
import '../../utils/validation.dart';
import '../../view_model/postoffice_view_model.dart';

class TellusAcadmic extends StatefulWidget {
  const TellusAcadmic({super.key});

  @override
  State<TellusAcadmic> createState() => _TellusAcadmicState();
}

class _TellusAcadmicState extends State<TellusAcadmic> {
  PostofficeViewViewModel postofficeViewViewModel = PostofficeViewViewModel();
  //multi language support

  final FlutterLocalization _localization = FlutterLocalization.instance;
  bool payDate = false;
  final TextEditingController acadmicName = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController state = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController pincode = TextEditingController();

  dynamic _foundUsers = [];
  List<int> _selectedItems = <int>[];
  late int selectPin;
  @override
  initState() {
    mobileNumber();
  }

  
  mobileNumber() async {
    final prefsData = await SharedPreferences.getInstance();
    List<String>? items = prefsData.getStringList('registerResponse');
    String? token = prefsData.getString('token');
    print(token);
    setState(() {
      token = token!;
    });
  }
  void pinFilter(String enteredKeyword) {
        postofficeViewViewModel.fetchPostofficeListApi(enteredKeyword);
  
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: _localization.supportedLocales,
      localizationsDelegates: _localization.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Row(
            children: [
              progressPills(
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
              padding: EdgeInsets.all(20),
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
                  AsyncTextFormField(
                    controller: acadmicName,
                    validationDebounce: const Duration(milliseconds: 500),
                    validator: Validation().istextField,
                    keyboardType: TextInputType.name,
                    hintText: 'eg. Sun Academy',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      AppLocale.location.getString(context),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                 
                  Container(
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: ListTile(
                      contentPadding:EdgeInsets.zero,
                      title:  TextField(
                        
                        keyboardType: TextInputType.number,
                        onChanged: (value) => pinFilter(value),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                            hintText: 'Pin Search', border: InputBorder.none),
                      ),
                      trailing: const Icon(Icons.search)
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ChangeNotifierProvider<PostofficeViewViewModel>(
                    create: (BuildContext context) => postofficeViewViewModel,
                    child: Consumer<PostofficeViewViewModel>(
                        builder: (context, value, _) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: value.DataList.data != null ? ListView.builder(
                          itemCount: value.DataList.data!.postOffice!.length,
                          itemBuilder: (context, index) => Card(
                              key: ValueKey(value
                                    .DataList.data!.postOffice![index].name!),
                              color: Color.fromARGB(255, 238, 238, 236),
                              elevation: 0,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Name: ${value
                                          .DataList.data!.postOffice![index].name!}',
                                            style: const TextStyle(fontSize: 14),
                                          ),
                                          Text(
                                            ', Block: ${value
                                          .DataList.data!.postOffice![index].block!},',
                                            style: const TextStyle(fontSize: 14),
                                          ),
                                          
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'State: ${value
                                          .DataList.data!.postOffice![index].state!}',
                                            style: const TextStyle(fontSize: 14),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  onTap: () {
                                    print(_selectedItems);
                                    if (!_selectedItems.contains(index)) {
                                      setState(() {
                                        _selectedItems.add(index);
                                      });
                                    } else {
                                      setState(() {
                                        _selectedItems
                                            .removeWhere((val) => val == index);
                                      });
                                    }
                                  },
                                ),
                              )),
                        ) : Container(),
                      );
                    }),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AsyncTextFormField(
                    controller: address,
                    validationDebounce: const Duration(milliseconds: 500),
                    validator: Validation().istextField,
                    keyboardType: TextInputType.name,
                    hintText: AppLocale.address.getString(context),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  AsyncTextFormField(
                    controller: city,
                    validationDebounce: const Duration(milliseconds: 500),
                    validator: Validation().istextField,
                    keyboardType: TextInputType.name,
                    hintText: AppLocale.city.getString(context),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  AsyncTextFormField(
                    controller: state,
                    validationDebounce: const Duration(milliseconds: 500),
                    validator: Validation().istextField,
                    keyboardType: TextInputType.name,
                    hintText: AppLocale.state.getString(context),
                  ),
                  SizedBox(
                    height: 15,
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
                  AsyncTextFormField(
                    enable: payDate,
                    controller: acadmicName,
                    validationDebounce: const Duration(milliseconds: 500),
                    validator: Validation().istextField,
                    keyboardType: TextInputType.name,
                    hintText: AppLocale.title30.getString(context),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  RoundButton(
                      loading: false,
                      title: AppLocale.Continue.getString(context),
                      textColor: Colors.white,
                      rounded: true,
                      color: Theme.of(context).primaryColor,
                      onPress: () {
                        print(acadmicName.text);
                        print(address.text);
                        print(city.text);
                        print(state.text);

                        Navigator.pushNamed(context, RoutesName.ChooseService);
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static List<Animal> _animals = [
    Animal(id: 1, name: "Sports"),
    Animal(id: 2, name: "Golf"),
    Animal(id: 3, name: "Tenis"),
    Animal(id: 4, name: "Football"),
   
  ];
  final _items = _animals
      .map((animal) => MultiSelectItem<Animal>(animal, animal.name))
      .toList();
  List<Animal> _selectedAnimals5 = [];
  final _multiSelectKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    _selectedAnimals5 = _animals;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
          width: 700,
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
                MultiSelectDialogField(
                dialogWidth:MediaQuery.of(context).size.width * 2,
                dialogHeight: MediaQuery.of(context).size.width * 0.7,
                items: _items,
                title: Text("Choose Your Business Category", style: TextStyle(fontSize: 15),),
                selectedColor: Colors.blue,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  border: Border.all(
                    color: Color.fromARGB(255, 156, 156, 156),
                    width: 1,
                  ),
                ),
                buttonIcon: Icon(
                  Icons.pets,
                  color: Colors.blue,
                ),
                buttonText: Text(
                  "Choose your Business Category",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                onConfirm: (results) {
                   print(results);
                },
              ),
             
            ],
          ),
        ),
    );
  }
}
class Animal {
  final int id;
  final String name;

  Animal({
    required this.id,
    required this.name,
  });
}
