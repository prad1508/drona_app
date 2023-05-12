import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import 'package:drona/view/coach_listing/coach_listing.dart';
import '../utils/routes/routes_name.dart';
import '../view_model/user_view_model.dart';
import 'batch_listing/batchlist_search.dart';
import 'profile/create_profile.dart';
import 'session_listing/session_list.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
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
    final userPrefernece = Provider.of<UserViewModel>(context);
    return MaterialApp(
      supportedLocales: _localization.supportedLocales,
      localizationsDelegates: _localization.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: (() {
                Navigator.pop(context);
              }),
              icon: const Icon(Icons.close),
              color: Colors.black,
              iconSize: 20,
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
                  Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: const Color.fromARGB(255, 244, 247, 245),
                      elevation: 1,
                      child: Padding(
                        padding:
                            const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      const Text(
                                        'abc Academy',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Row(
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.only(left: 12),
                                            child: Text(
                                              'Services',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                  height: 2),
                                            ),
                                          ),
                                          Image(
                                            image: AssetImage(
                                                'assets/images/tennis.png'),
                                            width: 30,
                                          ),
                                          Image(
                                            image: AssetImage(
                                                'assets/images/Golf.png'),
                                            width: 30,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Image(
                                        image: AssetImage(
                                            'assets/images/coachlogo.png'),
                                        width: 80,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            shape: const StadiumBorder(
                                                side: BorderSide(
                                                    color: Colors.green,
                                                    width: 2)),
                                            backgroundColor: Colors.green),
                                        child: Row(
                                          children: const [
                                            Text("60%"),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size: 10,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.all(18),
                    tileColor: Colors.grey.shade100,
                    leading: const Image(
                        image: AssetImage('assets/images/user_profile.png')),
                    title: const Text(
                      'John Smith',
                    ),
                    trailing: IconButton(
                      onPressed: (() {
                        Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const CreateProfile(),
                                  ),
                                );
                      }),
                      icon: const Icon(Icons.arrow_forward_ios),
                      iconSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: const Color.fromARGB(255, 253, 253, 253),
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              'Batch & Session',
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          ListTile(
                            onTap: (){
                              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const SearchBatchList(),
                                      ),
                                    );
                            },
                            leading: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey.shade100,
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/batchlist.png'),
                                          width: 15,),
                                )),
                            title: const Text(
                              'Batch Listing',
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios, size: 20,),
                             
                          ),
                          ListTile(
                            onTap: (){
                              Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const SessionList(),
                                        ),
                                      );
                            },
                            leading: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey.shade100,
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/sessionlist.png'),
                                          width: 15,),
                                )),
                            title: const Text(
                              'Session listing',
                            ),
                            trailing: const Icon(Icons.arrow_forward_ios, size: 20,),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: const Color.fromARGB(255, 253, 253, 253),
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              'Attendance',
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          ListTile(
                            leading: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey.shade100,
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/matchbatch.png'),
                                          width: 15,),
                                )),
                            title: const Text(
                              'Mark by batch',
                            ),
                            trailing: IconButton(
                              onPressed: (() {}),
                              icon: const Icon(Icons.arrow_forward_ios),
                              iconSize: 20,
                            ),
                          ),
                          ListTile(
                            leading: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey.shade100,
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/matchtrinee.png'),
                                          width: 18,),
                                )),
                            title: const Text(
                              'Mark by traniee',
                            ),
                            trailing: IconButton(
                              onPressed: (() {}),
                              icon: const Icon(Icons.arrow_forward_ios),
                              iconSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: const Color.fromARGB(255, 253, 253, 253),
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              'Payments',
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          ListTile(
                            leading: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey.shade100,
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/matchbatch.png'),
                                          width: 15,),
                                )),
                            title: const Text(
                              'Record Payment',
                            ),
                            trailing: IconButton(
                              onPressed: (() {
                                 Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Coach_Listing()),
                                );
                              }),
                              icon: const Icon(Icons.arrow_forward_ios),
                              iconSize: 20,
                            ),
                          ),
                          ListTile(
                            leading: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey.shade100,
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/rupee.png'),
                                          width: 10,),
                                )),
                            title: const Text(
                              'Adjust Fee',
                            ),
                            trailing: IconButton(
                              onPressed: (() {}),
                              icon: const Icon(Icons.arrow_forward_ios),
                              iconSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: const Color.fromARGB(255, 253, 253, 253),
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              'Reports',
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          ListTile(
                            leading: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey.shade100,
                                child: const Padding(
                                  padding: EdgeInsets.only(left:10.0),
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/atten_report.png'),
                                          width: 20,),
                                )),
                            title: const Text(
                              'Attendance reports',
                            ),
                            trailing: IconButton(
                              onPressed: (() {}),
                              icon: const Icon(Icons.arrow_forward_ios),
                              iconSize: 20,
                            ),
                          ),
                          ListTile(
                            leading: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey.shade100,
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/finance.png'),
                                          width: 20,),
                                )),
                            title: const Text(
                              'Finance reports',
                            ),
                            trailing: IconButton(
                              onPressed: (() {}),
                              icon: const Icon(Icons.arrow_forward_ios),
                              iconSize: 20,
                            ),
                          ),
                          ListTile(
                            leading: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey.shade100,
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/academy_report.png')),
                                )),
                            title: const Text(
                              'Academy reports',
                            ),
                            trailing: IconButton(
                              onPressed: (() {}),
                              icon: const Icon(Icons.arrow_forward_ios),
                              iconSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                   const SizedBox(
                    height: 5,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: const Color.fromARGB(255, 253, 253, 253),
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              'More',
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          ListTile(
                            leading: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey.shade100,
                                child: const Padding(
                                  padding: EdgeInsets.only(left:10.0),
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/g_translate.png'),
                                          width: 20,),
                                )),
                            title: const Text(
                              'choose language',
                            ),
                            trailing: IconButton(
                              onPressed: (() {}),
                              icon: const Icon(Icons.arrow_forward_ios),
                              iconSize: 20,
                            ),
                          ),
                          ListTile(
                            leading: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey.shade100,
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/info.png')),
                                )),
                            title: const Text(
                              'About',
                            ),
                            trailing: IconButton(
                              onPressed: (() {}),
                              icon: const Icon(Icons.arrow_forward_ios),
                              iconSize: 20,
                            ),
                          ),
                          ListTile(
                            leading: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey.shade100,
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/support_agent.png')),
                                )),
                            title: const Text(
                              'Support & feedback',
                            ),
                            trailing: IconButton(
                              onPressed: (() {}),
                              icon: const Icon(Icons.arrow_forward_ios),
                              iconSize: 20,
                            ),
                          ),
                          InkWell(
                            onTap: (){
                                userPrefernece.remove(context).then((value) {
                                Navigator.pushNamed(context, RoutesName.login);
                            });
                            },
                            child: ListTile(
                              leading: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.grey.shade100,
                                  child: const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Image(
                                        image: AssetImage(
                                            'assets/images/logout.png')),
                                  )),
                              title: const Text(
                                'Logout',
                              ),
                              
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const Center(
                    child: Image(image: AssetImage('assets/images/logo2.png'),
                    width: 150,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
