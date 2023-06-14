import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../res/language/language.dart';

import 'create_profile.dart';

class ViewProfileDetails extends StatefulWidget {
  const ViewProfileDetails({super.key});

  @override
  State<ViewProfileDetails> createState() => _ViewProfileDetailsState();
}

class _ViewProfileDetailsState extends State<ViewProfileDetails> {
  final TextEditingController coachName = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController inviteCode = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController salary = TextEditingController();
  final TextEditingController doj = TextEditingController();
  String name = '';
  String number ='';
  String emailid ='';
  String Alternatenumber = '';
  String gender ='';
  List details = [];
  String? _genderValue = 'm';
  ValueChanged<String?> _genderChangedHandler() {
    return (value) => setState(() => _genderValue = 'm');
  }
  @override
  void initState() {
    super.initState();
  }
  getData() async {
    final prefs = await SharedPreferences.getInstance();
    details = prefs.getStringList('registerResponse')!;
    name = details[0];
    number = details[3];
    gender = details[5];
    emailid = details[1];





    print(details);
    // print("full name is ${details[0]}");
    // print("full name is ${details[1]}");
    // print("full name is ${details[2]}");
    // print("full name is ${details[3]}");
    // print("number is ${details[4]}");
    // print("number is ${details[5]}");
  }
  @override
  Widget build(BuildContext context) {
    setState(() {
      getData();
    });

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
                        CreateProfile(),
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
              margin: EdgeInsets.zero,
              // padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: SizedBox(
                          height: 120,
                          width: 120,
                          child:  CircleAvatar(
                                backgroundColor: Colors.grey[500],
                                radius: 70,
                                child: const CircleAvatar(
                                  radius: 65,
                                  backgroundColor: Colors.white,
                                  backgroundImage: AssetImage(
                                      'assets/images/user_profile.png'),
                                ),
                              ),



                        ),
                      ),
                  SizedBox(
                    height: 10,
                  ),
                      const Text("John Smith" ,style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins'

                      ),),
                  const SizedBox(
                    height: 5,
                  ),
                      Text("0wner" ,style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff39404A)
                      ),),

                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         IconButton(onPressed: (){}, icon: Icon(Icons.facebook,size: 40,color: Colors.blue)),
                         IconButton(onPressed: (){}, icon: Icon(Icons.facebook,size: 40,color: Colors.blue)),
                         IconButton(onPressed: (){}, icon: Icon(Icons.facebook,size: 40,color: Colors.blue)),

                        ],
                      ),

                  const SizedBox(
                    height: 15,
                  ),

                      Container(
                        margin: EdgeInsets.zero,
                        color: Color(0xffDFE1E4),
                        child:
                        const Column(
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text("Phone Number" ,style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff39404A)
                                  ),),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 15),
                                  child: Text("1234567890" ,style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Color(0xff626D7E)
                                  ),),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Divider(
                              height: 1,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 15,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text("Alternate Phone Number",style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff39404A)
                                  ),),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 15),
                                  child: Text("1234567890" ,style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Color(0xff626D7E)
                                  ),),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Divider(
                              height: 1,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 15,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text("Date Of Birth",style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff39404A)
                                  ),),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 15),
                                  child: Text("1234567890" , style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Color(0xff626D7E)
                                  ),),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Divider(
                              height: 1,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 15,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text("Gender",style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff39404A)
                                  ),),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 15),
                                  child: Text("1234567890",style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Color(0xff626D7E)
                                  ),),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Divider(
                              height: 1,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 15,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text("Email Id",style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff39404A)
                                  ),),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 15),
                                  child: Text("1234567890",style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Color(0xff626D7E)
                                  ),),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Divider(
                              height: 1,
                              color: Colors.grey,
                            ),

                          ],
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
