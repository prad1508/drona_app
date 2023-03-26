import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../res/language/language.dart';
import '../../res/widget/customTextField.dart';
import '../../res/widget/customradio.dart';
import '../../res/widget/progressPills.dart';
import '../../res/widget/round_button.dart';
import '../../utils/routes/routes_name.dart';
import '../../utils/color.dart' as AppColor;

class DetailFilled extends StatefulWidget {
  const DetailFilled({super.key});

  @override
  State<DetailFilled> createState() => _TellusAcadmicState();
}

class _TellusAcadmicState extends State<DetailFilled> {
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;

  final TextEditingController acadmicName = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController state = TextEditingController();
  final TextEditingController city = TextEditingController();

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
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Row(
            children: [
              progressPills(
                  number: 7,
                  active: 6,
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
                    child: Text(AppLocale.title13.getString(context),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 110,
                    child: MyHomePage(),
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

                        Navigator.pushNamed(context, RoutesName.WelcomeScreen);
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
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            MultiSelectDialogField(
              items: _items,
              title: Text("Select Category"),
              selectedColor: Colors.blue,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(
                  color: Color.fromARGB(255, 156, 156, 156),
                  width: 1,)),
        child: Container(
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
              ),])),
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
