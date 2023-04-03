import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../res/language/language.dart';
import '../../res/widget/round_button.dart';
import '../trainee_phonbook_add.dart';

class SessionalDetails extends StatefulWidget {
  const SessionalDetails({super.key});

  @override
  State<SessionalDetails> createState() => _SessionalDetailsState();
}

class _SessionalDetailsState extends State<SessionalDetails> {
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
          title: Text('Create Session Details',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          
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
                    child: Text('Schedule Batch',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: fullName,
                    decoration: InputDecoration(
                      hintText: 'Cricket batch',
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
                    child: Text('Online Session URL',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
              
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    //controller: phone,
                    decoration: InputDecoration(
                      hintText: 'Zoom.com/session/264415201014',
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
                          child: Text('Date',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                         const SizedBox(
                          height: 10,
                        ),
                        TextFormField(         
                          controller: dobilling,
                          decoration: InputDecoration(
                            hintText: '04-02-2023',
                            suffixIcon: Icon(Icons.date_range_outlined),
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
                          child: Text('Time',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                         const SizedBox(
                          height: 10,
                        ),
                        TextFormField(         
                          controller: dobilling,
                          decoration: InputDecoration(
                            hintText: '09:30  AM to 10:30 AM',
                            suffixIcon: Icon(Icons.watch_later,),
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
                    title: 'Create Session',
                    textColor: Colors.white,
                    rounded: true,
                    color: Theme.of(context).primaryColor,
                       
                    onPress: (){
                     
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