import 'package:drona/view/trainee_phonbook_add.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import '../res/language/language.dart';
import '../res/widget/datefield.dart';
import '../res/widget/round_button.dart';
import '../res/widget/synctextform.dart';
import '../utils/validation.dart';
import '../view_model/registration_view_model.dart';

class TrainAddManualy extends StatefulWidget {
  final String batchId;
  const TrainAddManualy({super.key, required this.batchId});

  @override
  State<TrainAddManualy> createState() => _TrainAddManualyState();
}

class _TrainAddManualyState extends State<TrainAddManualy> {
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;
  final TextEditingController fullName = TextEditingController();
  final TextEditingController doj = TextEditingController();
  final TextEditingController dobilling = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController fee = TextEditingController();
  


  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     final registration = Provider.of<RegistrationViewModel>(context);
    return MaterialApp(
      supportedLocales: _localization.supportedLocales,
      localizationsDelegates: _localization.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          leading: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
          
            ],
          ),
          title: Text(AppLocale.title27.getString(context),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
                    onPressed: (() {
                      Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const AddPhonebook(),
                                ),
                              );
                    }),
                    icon: const Icon(Icons.contact_page),
                    iconSize: 25,
                    color: Colors.black,
                  )
                
          ],
        ),
        body: Material(
          color: Colors.white,
          child: Container(
            padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(AppLocale.fullName.getString(context),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: fullName,
                    decoration: InputDecoration(
                      hintText: 'Sidhant Mishra',
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
                    child: Text(AppLocale.phoneNumber.getString(context),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
              
                  const SizedBox(
                    height: 10,
                  ),
                  AsyncTextFormField(
                      controller: phone,
                      validationDebounce: const Duration(milliseconds: 500),
                      validator: Validation().isPhoneField,
                      keyboardType: TextInputType.phone,
                      hintText: 'eg. 9876521233',
                      isValidatingMessage:
                          'Enter a valid 10 digit mobile number',
                      valueIsInvalidMessage:
                          'Enter a valid 10 digit mobile number'),
                  const SizedBox(
                    height: 15,
                  ),
                 
                 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                       child: Column(
                         children: [
                           Align(
                          alignment: Alignment.topLeft,
                          child: Text(AppLocale.doj.getString(context),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                           DateOfjoining(
                      controller: doj,
                      hintText: 'Doj'),
                         ],
                       ),
                     ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(AppLocale.dobilling.getString(context),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                         const SizedBox(
                          height: 10,
                        ),
                        DateOfjoining(
                      controller: dobilling,
                      hintText: 'Date of Billing'),
                      ],
                    ),
                  ),
                  ],),
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
                          controller: fee,
                          decoration: InputDecoration(
                            hintText: '₹ 1000',
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
                  RoundButton(
                    loading: false,
                    title: AppLocale.submit.getString(context),
                    textColor: Colors.white,
                    rounded: true,
                    color: Theme.of(context).primaryColor,
                       
                    onPress: (){
                      print(widget.batchId);
                      print(fullName.text);
                      print(phone.text);
                      print(doj.text);
                      print(dobilling.text);
                      print(fee.text);
                    },
                  ),
                ],
              ),
            
            ),
        ),
      ),
    );
  }
}