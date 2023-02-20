import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../res/language/language.dart';
import '../../res/widget/customradio.dart';
import '../../res/widget/round_button.dart';
import '../../utils/routes/routes_name.dart';
import '../create_batch.dart';
import 'create_profile.dart';

class ViewProfilenew extends StatefulWidget {
  const ViewProfilenew({super.key});

  @override
  State<ViewProfilenew> createState() => _ViewProfilenewState();
}

class _ViewProfilenewState extends State<ViewProfilenew> {
  final TextEditingController coachName = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController inviteCode = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController salary = TextEditingController();
  final TextEditingController doj = TextEditingController();

  String? _genderValue = 'm';
  ValueChanged<String?> _genderChangedHandler() {
    return (value) => setState(() => _genderValue = 'm');
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            AppLocale.viewProfile.getString(context),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                 Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (BuildContext context) =>
                                 const CreateProfile(),
                           ),
                         );
              },
              icon: const Icon(Icons.edit),
              iconSize: 20,
              color: Colors.black,
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
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: SizedBox(
                          height: 120,
                          width: 120,
                          child: Stack(
                            clipBehavior: Clip.none,
                            fit: StackFit.expand,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey[500],
                                radius: 70,
                                child: const CircleAvatar(
                                  radius: 65,
                                  backgroundColor: Colors.white,
                                  backgroundImage: AssetImage(
                                      'assets/images/user_profile.png'),
                                ),
                              ),
                              Positioned(
                                  top: -5,
                                  right: -10,
                                  height: 182,
                                  width: 40,
                                  child: RawMaterialButton(
                                    onPressed:(){},
                                    elevation: 2.0,
                                    fillColor: Theme.of(context).primaryColor,
                                    padding: const EdgeInsets.all(10),

                                    // padding: EdgeInsets.all(1.0),
                                    shape: const CircleBorder(
                                        side: BorderSide(
                                            color: Colors.white, width: 2)),

                                    child: Image.asset(
                                        'assets/images/add_a_photo.png',
                                        fit: BoxFit.contain),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(AppLocale.title19.getString(context),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    enabled: false, 
                    controller: coachName,
                    decoration: InputDecoration(
                      hintText: 'eg. Rakesh Bansal',
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
                    height: 15,
                  ),
                  TextFormField(
                    enabled: false, 
                    controller: phone,
                    decoration: InputDecoration(
                      hintText: 'e.g. 9876521233',
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
                    child: Text(AppLocale.inviteCode.getString(context),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    enabled: false, 
                    controller: inviteCode,
                    decoration: InputDecoration(
                      hintText: 'TSC35497841',
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
                      CustomRadio<String>(
                        btnColor: Colors.black.withOpacity(0.5),
                        value: 'm',
                        groupValue: _genderValue,
                        onChanged: _genderChangedHandler(),
                        label: AppLocale.male.getString(context),
                      ),
                      CustomRadio<String>(
                        btnColor: Colors.black,
                        value: 'f',
                        groupValue: _genderValue,
                        onChanged: _genderChangedHandler(),
                        label: AppLocale.female.getString(context),
                      ),
                      CustomRadio<String>(
                        btnColor: Colors.black,
                        value: 'o',
                        groupValue: _genderValue,
                        onChanged: _genderChangedHandler(),
                        label: AppLocale.other.getString(context),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(AppLocale.emailId.getString(context),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    enabled: false, 
                    controller: email,
                    decoration: InputDecoration(
                      hintText: 'e.g. xyz@email.com',
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
                    child: Text(AppLocale.salaryMonth.getString(context),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    enabled: false, 
                    controller: salary,
                    decoration: InputDecoration(
                      hintText: 'e.g. ₹200',
                      contentPadding: EdgeInsets.all(10),
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
                    child: Text(AppLocale.doj.getString(context),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    enabled: false, 
                    controller: doj,
                    decoration: InputDecoration(
                      hintText: '28/12/2022',
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
          ),
        ),
      ),
    );
  }
}
