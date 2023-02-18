import 'package:drona/view/profile/view_profile.dart';
import 'package:drona/view/trainee_phonbook_add.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import '../res/widget/round_button.dart';
import '../utils/routes/routes_name.dart';
import 'trainee_Editprofile.dart';

class Traineeprofile extends StatefulWidget {
  const Traineeprofile({super.key});

  @override
  State<Traineeprofile> createState() => _TraineeprofileState();
}

class _TraineeprofileState extends State<Traineeprofile> {
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;
  final TextEditingController fullName = TextEditingController();
  final TextEditingController doj = TextEditingController();
  final TextEditingController dobilling = TextEditingController();
  final TextEditingController phone = TextEditingController();
  


  @override
  initState() {
    super.initState();
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
          leading: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
          
            ],
          ),
          title: Text(
            'Edit Profile',
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
                                      const Editprofile(),
                                ),
                              );
                    }),
                    icon: const Icon(Icons.edit),
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
                    child: Text(
                      'Full Name',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                     enabled: false,     
                    controller: fullName,
                    decoration: InputDecoration(
                      hintText: 'Sidhant Mishra',
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                   SizedBox(
                    height: 15,
                  ),
                  
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Phone Number',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
              
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                     enabled: false,     
                    controller: phone,
                    decoration: InputDecoration(
                      hintText: '+91 7683548734',
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                 
                 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                       child: Column(
                         children: [
                           Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Date of Joining',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                           TextFormField(
                             enabled: false,     
                                             controller: doj,
                                             decoration: InputDecoration(
                          
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                                             ),
                                           ),
                         ],
                       ),
                     ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Date of Joining',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                         SizedBox(
                          height: 10,
                        ),
                        TextFormField(    
                          enabled: false,     
                          controller: dobilling,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ],),
                  SizedBox(
                    height: 15,
                  ),
           
                  SizedBox(
                    height: 15,
                  ),
                  RoundButton(
                    loading: false,
                    title: 'Submit',
                    textColor: Colors.white,
                    rounded: true,
                    color: Theme.of(context).primaryColor,
                       
                    onPress: (){
                     Navigator.push(
                               context,
                               MaterialPageRoute(
                                 builder: (BuildContext context) =>
                                     const Editprofile(),
                               ),
                             );
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