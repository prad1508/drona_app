import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import '../res/language/language.dart';
import '../res/widget/dashboard_card.dart';
import '../res/widget/drawer_widget.dart';
import 'main_menu.dart';
import 'trainee_listing/trainee_listing.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  
  static const kExpandedHeight = 100.0;
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;
  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {});
      });
  }

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > kExpandedHeight - kToolbarHeight;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: const DrawerWidget(),
      body: MaterialApp(
          supportedLocales: _localization.supportedLocales,
          localizationsDelegates: _localization.localizationsDelegates,
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              appBar: AppBar(
                centerTitle: false,
                toolbarHeight: 90,
                backgroundColor: Colors.white,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Abc Academey',
                      style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Row(
                      children: const [
                        Text(
                          "Power by ",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 121, 121, 121)),
                        ),
                        Image(
                          image: AssetImage('assets/images/drona2.png'),
                          width: 50,
                        )
                      ],
                    )
                  ],
                ),
                elevation: 0,
                actions: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                    child: Stack(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications_outlined,
                            color: Color.fromARGB(255, 121, 121, 121),
                            size: 30,
                          ),
                        ),
                        // const Positioned(
                        //   left: 24,
                        //   child: CircleAvatar(
                        //     radius: 10,
                        //     backgroundColor: Color.fromARGB(255, 243, 33, 33),
                        //     child: Text("1"),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 25, 20, 0),
                        child: SizedBox(
                          height: 45,
                          width: 45,
                          child: Stack(
                            clipBehavior: Clip.none,
                            fit: StackFit.expand,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey[500],
                                radius: 32,
                                child: const CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.white,
                                  backgroundImage: AssetImage(
                                      'assets/images/user_profile.png'),
                                ),
                              ),
                              Positioned(
                                  top: -55,
                                  right: -5,
                                  height: 182,
                                  width: 20,
                                  child: RawMaterialButton(
                                    onPressed: () {
                                      Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (BuildContext context) =>
                                                      const MainMenu(),
                                                ),
                                              );
                                    },
                                    elevation: 2.0,
                                    fillColor: Colors.white,
                                    padding: const EdgeInsets.all(4),
                                    shape: const CircleBorder(
                                        side: BorderSide(
                                            color: Colors.white, width: 2)),
                                    child: Image.asset('assets/images/menu.png',
                                        fit: BoxFit.cover),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                               Navigator.push(
                                         context,
                                         MaterialPageRoute(
                                           builder: (BuildContext context) =>
                                               const Trainee_Listing(),
                                         ),
                                       );
                            },
                          child:const DashboardCard(
                              color: Colors.blueAccent,
                              icon: Icons.group_outlined,
                              title: 'Total Trainee',
                              subtitle: '23 Onboarded',
                              count: '54',
                              line: .54),
                          ),
                          const DashboardCard(
                              color: Color.fromARGB(255, 7, 3, 244),
                              icon: Icons.currency_rupee_outlined,
                              title: 'Free Paid',
                              subtitle: '14 Members Due',
                              count: '36',
                              line: .36),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          DashboardCard(
                              color: Colors.green,
                              icon: Icons.calendar_month_outlined,
                              title: 'Attendance',
                              subtitle: '76% Monthly Avg',
                              count: '80',
                              line: .8),
                          DashboardCard(
                              color: Color.fromARGB(255, 8, 174, 229),
                              icon: Icons.account_balance_wallet_outlined,
                              title: 'Collection (M)',
                              subtitle: '10,000 - Due Amount',
                              count: '50,000',
                              line: .36),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Academy Batches & Sessions",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'poppin'),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'poppin',
                                  height: 1),
                            ),
                            onPressed: null,
                            child: const Text(
                              'Add +',
                              style: TextStyle(
                                  color: Color.fromRGBO(42, 98, 184, 1),
                                  height: 1),
                            ),
                          ),
                        ],
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "4 Batches - 6 Sessions",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Loto-Regular',
                              height: 1),
                        ),
                      ),
                      _batchSession(context, width),
                      const SizedBox(
                        height: 20,
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Academy Sports",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Loto-Regular',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      _academySport(context, width),
                    ],
                  ),
                ),
              ))),
    );
  }

  //batch sessions
  Widget _batchSession(BuildContext, width) {
    return SizedBox(
      height: 202,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          InkWell(
              onTap: () {},
              child: Center(
                  child: Container(
                width: width * .9,
                height: 200,
                padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: const Color.fromARGB(255, 253, 253, 253),
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Tennis Batch',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 18, 1, 58),
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Loto-Regular',
                                    height: 1)),
                            CircleAvatar(
                              radius: 20,
                              backgroundColor:
                                  Color.fromARGB(255, 217, 217, 217),
                              child: Image(
                                  image:
                                      AssetImage('assets/images/tennis.png')),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Chip(
                            label: const Text(
                              'Beginner',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                            backgroundColor: Colors.green.withOpacity(0.2),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text('5 Students',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Loto-Regular',
                                  height: 1)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('23 Jan, 2023',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromRGBO(98, 109, 126, 1),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Loto-Regular',
                                    height: 1)),
                            Text('06:00 PM to 07:00 PM',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromRGBO(98, 109, 126, 1),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Loto-Regular',
                                    height: 1))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ))),
          InkWell(
              onTap: () {},
              child: Center(
                  child: Container(
                width: width * .9,
                height: 200,
                padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: const Color.fromARGB(255, 253, 253, 253),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Tennis Batch',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 18, 1, 58),
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Loto-Regular',
                                    height: 1)),
                            CircleAvatar(
                              radius: 20,
                              backgroundColor:
                                  Color.fromARGB(255, 217, 217, 217),
                              child: Image(
                                  image:
                                      AssetImage('assets/images/tennis.png')),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Chip(
                            label: const Text(
                              'Beginner',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                            backgroundColor: Colors.green.withOpacity(0.2),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text('5 Students',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Loto-Regular',
                                  height: 1)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('23 Jan, 2023',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromRGBO(98, 109, 126, 1),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Loto-Regular',
                                    height: 1)),
                            Text('06:00 PM to 07:00 PM',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromRGBO(98, 109, 126, 1),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Loto-Regular',
                                    height: 1))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ))),
          InkWell(
              onTap: () {},
              child: Center(
                  child: Container(
                width: width * .9,
                height: 200,
                padding: const EdgeInsets.only(top: 15.0, bottom: 15),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: const Color.fromARGB(255, 253, 253, 253),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Tennis Batch',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 18, 1, 58),
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Loto-Regular',
                                    height: 1)),
                            CircleAvatar(
                              radius: 20,
                              backgroundColor:
                                  Color.fromARGB(255, 217, 217, 217),
                              child: Image(
                                  image:
                                      AssetImage('assets/images/tennis.png')),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Chip(
                            label: const Text(
                              'Beginner',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                            backgroundColor: Colors.green.withOpacity(0.2),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text('5 Students',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Loto-Regular',
                                  height: 1)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('23 Jan, 2023',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromRGBO(98, 109, 126, 1),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Loto-Regular',
                                    height: 1)),
                            Text('06:00 PM to 07:00 PM',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromRGBO(98, 109, 126, 1),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Loto-Regular',
                                    height: 1))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ))),
        ],
      ),
    );
  }

  //accademy sport
  Widget _academySport(BuildContext, width) {
    return SizedBox(
      height: 100,
      width: width * 1,
      child: ListView(
        
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: width / 4,
            child: Column(
              children:  [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.blue.withOpacity(.1),
                  child: const Icon(
                    Icons.group_outlined,
                    color: Colors.blue,
                    size: 25.0,
                  ),
                ),
                const Text('Game One', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, height: 1.7),)
              ],
            ),
          ),
         Container(
            width: width / 4,
            child: Column(
              children:  [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.blue.withOpacity(.1),
                  child: const Icon(
                    Icons.help_outline,
                    color: Colors.blue,
                    size: 25.0,
                  ),
                ),
                const Text('Game Two', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, height: 1.7),)
              ],
            ),
          ),
         Container(
            width: width / 4,
            child: Column(
              children:  [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.blue.withOpacity(.1),
                  child: const Icon(
                    Icons.image,
                    color: Colors.blue,
                    size: 25.0,
                  ),
                ),
                const Text('Game Three', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, height: 1.7),)
              ],
            ),
          ),
         Container(
            width: width / 4,
            child: Column(
              children:  [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.blue.withOpacity(.1),
                  child: const Icon(
                    Icons.location_on,
                    color: Colors.blue,
                    size: 25.0,
                  ),
                ),
                const Text('Game One', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, height: 1.7),)
              ],
            ),
          ),
         
           ],
      ),
    );
  }
}
