
import 'package:drona/view/trainne_addmanual.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import '../../res/language/language.dart';
import '../../res/widget/customradio.dart';
import '../../res/widget/round_button.dart';
import 'trainee_phonbook_add.dart';

class BatchDetail extends StatefulWidget {
  const BatchDetail({super.key});

  @override
  State<BatchDetail> createState() => _BatchDetailState();
}

class _BatchDetailState extends State<BatchDetail> {
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;
  //custom radio
  // custum radio call in seprate page
  String? _groupLevel = 'beginner';
  ValueChanged<String?> _valueChangedHandler() {
    return (value) => setState(() => _groupLevel = value!);
  }

  String? _groupBatch = 'group';
  ValueChanged<String?> _valueChangedBatch() {
    return (value) => setState(() => _groupBatch = value!);
  }


  String? _groupDays = 'mon';
  ValueChanged<String?> _valueChangedDays() {
    return (value) => setState(() => _groupDays = value!);
  }

  bool value = true;
  bool agree = true;
  final TextEditingController fullName = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();

  Future<bool> isValidPasscode(String value) async {
    return await Future.delayed(const Duration(seconds: 1),
        () => value.isNotEmpty && value.toLowerCase() == 'batman');
  }


   List<DropdownMenuItem<String>> get dropdownCategory {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "Tennis", child: Text("Tennis")),
      const DropdownMenuItem(value: "golf", child: Text("Golf")),
      const DropdownMenuItem(value: "cricket", child: Text("Cricket")),
    ];
    return menuItems;
  }
   List<DropdownMenuItem<String>> get dropdownAssignCoach {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "john", child: Text("John")),
      const DropdownMenuItem(value: "anil", child: Text("Anil")),
      const DropdownMenuItem(value: "ravi", child: Text("Ravi")),
    ];
    return menuItems;
  }
   String selectedCategory = 'Tennis';
   String selectedAssignCoach = 'john';



//Add Trainee In Hockey Batch popup
  addTrainee() {
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
                          Text(AppLocale.title23.getString(context),
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Loto-Regular'),
                          ),
                         
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
                          onPressed: (){
                            // Navigator.push(
                            //           context,
                            //           MaterialPageRoute(
                            //             builder: (BuildContext context) =>
                            //                 const TrainAddManualy(),
                            //           ),
                            //         );
                          },
                          child: Text(AppLocale.enterManually.getString(context),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          onPressed: (){
                            Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const AddPhonebook(),
                                      ),
                                    );
                          },
                          child: Text(AppLocale.title24.getString(context),
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: _localization.supportedLocales,
      localizationsDelegates: _localization.localizationsDelegates,
      home: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(AppLocale.batchDetails.getString(context),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {},
              child: Text(AppLocale.skip.getString(context),
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
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
                    alignment: Alignment.topLeft,
                    child: Text(AppLocale.batchName.getString(context),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    enabled: false,
                    controller: fullName,
                    decoration: InputDecoration(
                      hintText: 'eg. Cricket',
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
                      Text(AppLocale.sendInvite.getString(context), style: Theme.of(context).textTheme.bodyMedium,)  
                    ],
                   ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color:const Color.fromARGB(255, 188, 185, 185)),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: DropdownButton(
                          enableFeedback: false,
                          isExpanded: true,
                          elevation: 1,
                          dropdownColor: const Color.fromARGB(255, 255, 255, 255),
                          iconEnabledColor: Colors.black,
                          style:
                              const TextStyle(color: Colors.black),
                          value: selectedCategory,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCategory = newValue!;
                              
                              _localization.translate(selectedCategory);
                            });
                          },
                          items: dropdownCategory),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(AppLocale.assignCoach.getString(context),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
           
                 Container(
                    decoration: BoxDecoration(
                      border: Border.all(color:const Color.fromARGB(255, 188, 185, 185)),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: DropdownButton(
                          isExpanded: true,
                          elevation: 1,
                          dropdownColor: const Color.fromARGB(255, 255, 255, 255),
                          iconEnabledColor: Colors.black,
                          style:
                              const TextStyle(color: Colors.black),
                          value: selectedAssignCoach,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedAssignCoach = newValue!;
                              
                              _localization.translate(selectedAssignCoach);
                            });
                          },
                          items: dropdownAssignCoach),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        CustomRadio<String>(
                          btnColor: Colors.black.withOpacity(0.5),
                          value: 'beginner',
                          groupValue: _groupLevel,
                          onChanged: _valueChangedHandler(),
                          label: AppLocale.beginner.getString(context),
                        ),
                        const SizedBox(width: 20,),
                        
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(AppLocale.fee.getString(context),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    enabled: false,
                    controller: fullName,
                    decoration: InputDecoration(
                      hintText: 'e.g. 200',
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
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(AppLocale.tYOB.getString(context),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomRadio<String>(
                        btnColor: Colors.black.withOpacity(0.5),
                        value: 'group',
                        groupValue: _groupBatch,
                        onChanged: _valueChangedBatch(),
                        label: AppLocale.coachingGroup.getString(context),
                      ),
                     
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(children: <Widget>[
                    Checkbox(
                      checkColor: Colors.white,
                      activeColor: Theme.of(context).primaryColor,
                      value: value,
                      onChanged: (value) {
                        setState(() {
                          this.value = value!;
                          agree = value;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(AppLocale.title21.getString(context),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    )
                  ]),
                  const SizedBox(
                    width: 15,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(AppLocale.title22.getString(context),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    enabled: false,
                    controller: fullName,
                    decoration: InputDecoration(
                      hintText: 'e.g. ww.xyz.com',
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
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(AppLocale.batchDays.getString(context),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                   SizedBox(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        CustomRadio<String>(
                          btnColor: Colors.black.withOpacity(0.5),
                          value: 'mon',
                          groupValue: _groupDays,
                          onChanged: _valueChangedDays(),
                          label: 'Mon',
                        ),
                        const SizedBox(width: 20,),
                       
                      ],
                    ),
                  ),
                  
                   const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(AppLocale.batchTiming.getString(context),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                       child: TextFormField(
                        enabled: false,
                                         controller: fullName,
                                         decoration: InputDecoration(
                        hintText: AppLocale.from.getString(context),
                        contentPadding: const EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                                         ),
                                       ),
                     ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: TextFormField(     
                      enabled: false,              
                      controller: fullName,
                      decoration: InputDecoration(
                        hintText: AppLocale.to.getString(context),
                        contentPadding: const EdgeInsets.all(10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ],),
                  const SizedBox(
                    height: 15,
                  ),
           
                  const SizedBox(
                    height: 15,
                  ),
                  RoundButton(
                    loading: false,
                    title: AppLocale.addTrainee.getString(context),
                    textColor: Colors.white,
                    rounded: true,
                    color: Theme.of(context).primaryColor,
                       
                    onPress: (){
                      addTrainee();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
