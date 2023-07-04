import 'package:drona/view/batch_listing/add_coach_profile.dart';
import 'package:drona/view/profile/batch_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../data/response/status.dart';
import '../../res/app_url.dart';
import '../../res/language/language.dart';
import '../../res/widget/Trainee_Listing_Class/batch_name.dart';
import '../../res/widget/Trainee_Listing_Class/filter_trainee_list.dart';
import '../../res/widget/customTextField.dart';
import '../../res/widget/customradio.dart';
import '../../res/widget/progressPills.dart';
import '../../res/widget/round_button.dart';
import '../../utils/no_data.dart';
import '../../utils/routes/routes_name.dart';
import '../../utils/color.dart' as AppColor;
import '../../view_model/academy_view_model.dart';
import '../../view_model/trainee_view_model.dart';
import '../dashboard/layout.dart';
import '../trainee_listing/add_trainee_in_existingBatch.dart';

class AddTraineeList extends StatefulWidget {
  AddTraineeList({
    super.key,
  });

  @override
  State<AddTraineeList> createState() => _AddTraineeListState();
}

class _AddTraineeListState extends State<AddTraineeList> {
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;
  final TextEditingController FullName = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  TraineeViewModel traineeViewModel = TraineeViewModel();
  List<Map<String, dynamic>> _foundUsers = [];
  List<int> _selectedItems = <int>[];
  int _selectedIndex = -1;
  late Map<String, dynamic> data;

  final List<Map<String, dynamic>> _allUsers = [
    {
      "id": 1,
      "name": "Shivendar Singh",
      "proImg": "assets/images/user_profile.png",
      "categorgyImg": "assets/images/Golf.png"
    },
    {
      "id": 2,
      "name": "Aarush mishra",
      "proImg": "assets/images/user_profile.png",
      "categorgyImg": "assets/images/Golf.png"
    },
    {
      "id": 3,
      "name": "Divya Shah",
      "detail": 'Male, +9189555296811',
      "proImg": "assets/images/user_profile.png",
      "categorgyImg": "assets/images/Golf.png"
    }
  ];
  @override
  initState() {
    data = {"filter_batch_uid": "", "search": ""};
    traineeViewModel.fetchTraineeListSearchApi(data);
    _foundUsers = _allUsers;
    super.initState();
  }

  void dataFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
          user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundUsers = results;
    });
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
              onPressed: () => Get.to(()=> const Layout(selectedIndex: 0),),
            ),
            title: Text(
              'Trainee Listing',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            actions: [
              IconButton(
                onPressed: (() {
                  Get.to(()=> AddTrainneInExisitingBatch(),transition: Transition.leftToRight);
                }),
                icon: const Icon(Icons.add),
                iconSize: 25,
                color: Colors.black,
              ),
            ],
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body:   Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    InkWell(
                      onTap: showFilter,
                      child:Container(
                        alignment: Alignment.center,
                        height: 55,
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey)),
                        child: const Icon( Icons.filter_list, ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          side: BorderSide(
                            color: Color.fromARGB(255, 197, 196, 196),
                          ),
                        ),
                        elevation: 0,
                        child: ListTile(
                          title: TextField(
                            onChanged: (searchData) => dataFilter(searchData),
                            decoration: const InputDecoration(
                                contentPadding:
                                EdgeInsets.symmetric(vertical: 0.0),
                                hintText: 'Search',
                                border: InputBorder.none),
                          ),
                          trailing: const Icon(Icons.search),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ChangeNotifierProvider<TraineeViewModel>(
                create: (BuildContext context) => traineeViewModel,
                child: Consumer<TraineeViewModel>(
                  builder: (context, value, _) {
                    switch (value.dataList.status!) {
                      case Status.loading:
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.teal,
                          ),
                        );
                      case Status.completed:
                        return SingleChildScrollView(
                          child: Container(
                            height: 500,
                            child: ListView.builder(
                              itemCount: value.dataList.data?.data.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Container(
                                      color: const Color(0XFFDFE1E4).withOpacity(0.3),
                                      height: 110,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top:8.0,left: 20),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 41,
                                                  height: 46,
                                                  child: CircleAvatar(
                                                    backgroundImage: NetworkImage(AppUrl.profileimageListendPoint +
                                                        value.dataList.data!.data[index].image,
                                                    ),
                                                    // AssetImage('assets/images/user_profile.png'),
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment.bottomLeft,
                                                  child: Container(
                                                    width: 44,
                                                    height: 20,
                                                    decoration: BoxDecoration(
                                                      color:value.dataList.data!.data[index].status=="active" ? const Color(0xff47C088) : Colors.redAccent,
                                                      borderRadius: BorderRadius.circular(4),
                                                    ),
                                                    child:  Center(
                                                      child: value.dataList.data!.data[index].status == "active" ?
                                                      const Text(
                                                       "Active",
                                                        style: TextStyle(
                                                          color: Color(0xffFBFBFC),
                                                          fontSize: 10,
                                                          fontFamily: 'Lato',
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ) :  const Text(
                                                        "Inactive",
                                                        style: TextStyle(
                                                          color: Color(0xffFBFBFC),
                                                          fontSize: 10,
                                                          fontFamily: 'Lato',
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      )
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding:  const EdgeInsets.only(left: 15.0),
                                                      child: Text(value.dataList.data!.data[index].traineeName,
                                                        style: const TextStyle(
                                                          color: Color(0xff39404A),
                                                          fontSize: 14,
                                                          fontFamily: 'Lato',
                                                          fontWeight: FontWeight.w700,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Container(
                                                      width: 67,
                                                      height: 20,
                                                      decoration: BoxDecoration(
                                                        color:  value.dataList.data!.data[index].join_status=="not_onboarded" ?Colors.redAccent.shade100.withOpacity(0.3) :const Color(0xffEDF9F3),
                                                        borderRadius: BorderRadius.circular(4),
                                                      ),
                                                      child:  Center(
                                                        child:  value.dataList.data!.data[index].join_status=="not_onboarded"?
                                                        const Text(
                                                         "Not Onboarded",
                                                          style:  TextStyle(
                                                            color:  Colors.redAccent,
                                                            fontSize: 10,
                                                            fontFamily: 'Lato',
                                                            fontWeight: FontWeight.w400,
                                                          ),
                                                        ):  const Text(
                                                          "Onboarded",
                                                          style:  TextStyle(
                                                            color:  Color(0xff47C088),
                                                            fontSize: 10,
                                                            fontFamily: 'Lato',
                                                            fontWeight: FontWeight.w400,
                                                          ),
                                                        )

                                                      ),
                                                    ),
                                                    Align(
                                                      alignment: Alignment.centerRight,
                                                      widthFactor: 4.5,
                                                      child: SizedBox(
                                                        width: 24,
                                                        height: 24,
                                                        child: CircleAvatar(
                                                          backgroundImage: NetworkImage(AppUrl.imageListendPoint +
                                                              value.dataList.data!.data[index].serviceicon,
                                                          ),
                                                          // AssetImage('assets/images/tennis.png'),
                                                          //  backgroundColor: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 1),
                                                Row(
                                                  children:  [
                                                    Padding(
                                                        padding:  const EdgeInsets.only(left: 15.0),
                                                        child: value.dataList.data?.data[index].gender =='male' ?
                                                        const Text(
                                                          "Male",
                                                          style: TextStyle(
                                                            color: Color(0xff39404A),
                                                            fontSize: 12,
                                                            fontFamily: 'Lato',
                                                            fontWeight: FontWeight.w400,
                                                          ),
                                                        ) : value.dataList.data?.data[index].gender =='female'?
                                                        const Text(
                                                          "Female",
                                                          style: TextStyle(
                                                            color: Color(0xff39404A),
                                                            fontSize: 12,
                                                            fontFamily: 'Lato',
                                                            fontWeight: FontWeight.w400,
                                                          ),
                                                        ) :  const Text(
                                                          "Others",
                                                          style: TextStyle(
                                                            color: Color(0xff39404A),
                                                            fontSize: 12,
                                                            fontFamily: 'Lato',
                                                            fontWeight: FontWeight.w400,
                                                          ),
                                                        )
                                                    ),
                                                    const Text(
                                                      " | ",
                                                      style: TextStyle(
                                                        color: Color(0xff39404A),
                                                        fontSize: 12,
                                                        fontFamily: 'Lato',
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                    Text(value.dataList.data!.data[index].dob,
                                                      style: const TextStyle(
                                                        color: Color(0xff39404A),
                                                        fontSize: 12,
                                                        fontFamily: 'Lato',
                                                        fontWeight: FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 12),
                                                Row(
                                                  children:  [
                                                    Padding(
                                                      padding:  const EdgeInsets.only(left: 15.0),
                                                      child: Text(
                                                        value.dataList.data!.data[index].batchname,
                                                        style: const TextStyle(
                                                          color: Color(0xff39404A),
                                                          fontSize: 14,
                                                          fontFamily: 'Lato',
                                                          fontWeight: FontWeight.w700,
                                                        ),
                                                      ),
                                                    ),
                                                     Padding(
                                                      padding: EdgeInsets.only(left: 15),
                                                      child: Text(
                                                        '${value.dataList.data!.data[index].batch_timing_from} to ${value.dataList.data!.data[index].batch_timing_to}',
                                                        style: const TextStyle(
                                                          color: Color(0xff39404A),
                                                          fontSize: 12,
                                                          fontFamily: 'Lato',
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 5),
                                                //const SizedBox(height: 5),
                                                Container(
                                                  width: 300,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 15),
                                                    child:Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children:  [
                                                            const Text(
                                                              "Fee : ",
                                                              style: TextStyle(
                                                                color: Color(0xff39404A),
                                                                fontSize: 14,
                                                                fontFamily: 'Lato',
                                                                fontWeight: FontWeight.w700,
                                                              ),
                                                            ),
                                                            Text(
                                                              '₹ ${value.dataList.data?.data[index].fees}',
                                                              style: const TextStyle(
                                                                color: Color(0xff39404A),
                                                                fontSize: 12,
                                                                fontFamily: 'Lato',
                                                                fontWeight: FontWeight.w400,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        // Row(
                                                        //   children: [
                                                        //     const Text(
                                                        //       "Due : ",
                                                        //       style: TextStyle(
                                                        //         color: Color(0xff39404A),
                                                        //         fontSize: 14,
                                                        //         fontFamily: 'Lato',
                                                        //         fontWeight: FontWeight.w700,
                                                        //       ),
                                                        //     ),
                                                        //     Text(
                                                        //       '₹ ${value.dataList.data?.data[index].fees}',
                                                        //       style: const TextStyle(
                                                        //         color: Color(0xff39404A),
                                                        //         fontSize: 12,
                                                        //         fontFamily: 'Lato',
                                                        //         fontWeight: FontWeight.w400,
                                                        //       ),
                                                        //     ),
                                                        //   ],
                                                        // )
                                                      ],
                                                    ),
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Divider(
                                      height: 1,
                                      thickness: 1,
                                    ) ,
                                  ],
                                );

                              },
                            ),
                          ),
                        );
                      case Status.error:
                        return Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.error_outline,
                                  color: Theme.of(context).primaryColorDark,
                                  size: 100.0,
                                ),
                                NoData()
                                // Text(
                                //   value.dataList.message.toString(),
                                //   style: TextStyle(
                                //       color: Theme.of(context).primaryColor,
                                //       fontSize: 20,
                                //       height: 2),
                                // )
                              ],
                            ));
                    }

                  },
                ),
              ),
            ],
          )












      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.all(10),

          backgroundColor: Colors.white,
          title: Text(
            "Confirm Addition Of The Trainee",
            style: TextStyle(fontSize: 14),
          ),

          content: ListView.separated(
            itemCount: 3,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                height: 115,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                              AssetImage("assets/images/user_profile.png"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 2,
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                height: 20,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.green.shade700,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                  "Active",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.only(right: 5, bottom: 10),
                              child: Text(
                                "Shivendra Singh",
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 50),
                              child: Text(
                                "Male | 34 Year",
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Container(
                            padding: EdgeInsets.only(),
                            decoration: BoxDecoration(
                                color: Colors.green.shade100,
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              "Onboarded",
                              style:
                              TextStyle(fontSize: 10, color: Colors.green),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 10,
                            top: 5,
                          ),
                          child: SizedBox(
                            height: 30,
                            width: 40,
                            child: CircleAvatar(
                                backgroundImage:
                                AssetImage("assets/images/Golf.png")),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 55),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Tenni Batch Evening",
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            "03:00 PM to 05:30 PM",
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Row(
                        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                " Joining Date:",
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                "01 Jan,23",
                                style:
                                TextStyle(fontSize: 10, color: Colors.grey),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                " Billing Date:",
                                style: TextStyle(fontSize: 12),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  "10 Jan,23",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.grey,
                height: 1,
              );
            },
          ),

          actions: [
            SizedBox(
              height: 40,
              width: 130,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.grey.shade300,
                    textStyle: TextStyle(
                      // fontSize: 20,
                        fontWeight: FontWeight.bold)),
                child: Text(
                  "Cancle",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
            ),
            SizedBox(
              height: 40,
              width: 130,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    textStyle: TextStyle(
                      // fontSize: 20,
                        fontWeight: FontWeight.bold)),
                child: Text("Confirm",
                    style: TextStyle(
                      //    color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )),
                onPressed: () {
                  // showAlertDialogs(context);
                },
              ),
            ),
          ],
          actionsAlignment: MainAxisAlignment.center,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(20),
          // ),
        );
      },
    );
  }

  //bottomsheet popup
  showFilter() {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        double screenWidth=MediaQuery.of(context).size.width;
        double screenHeight=MediaQuery.of(context).size.height;
        AcademyViewViewModel academyViewViewModel = AcademyViewViewModel();
        academyViewViewModel.fetchAcademyListApi();
        List<DropdownMenuItem<String>> activeServices = [];
        String? selectedService;
        return Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: false,
          body: Container(
            height: screenHeight*.7,
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: screenHeight*.45,
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
                        children: const [
                          Text(
                            'Filters',
                            style: TextStyle(
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
                      Container(
                        width: 342,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffDFE1E4)),
                            borderRadius: BorderRadius.circular(8)),
                        child: const Batch_DropDown(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: screenHeight*.25,
                        padding: const EdgeInsets.only(left: 8.0),
                        // decoration: BoxDecoration(
                        //   border: Border.all(
                        //       width: 1,
                        //       color: const Color.fromARGB(255, 218, 216, 216)),
                        //   borderRadius:
                        //   const BorderRadius.all(Radius.circular(5)),
                        // ),
                        child: ChangeNotifierProvider<AcademyViewViewModel>(
                            create: (context) => academyViewViewModel,
                            child: Consumer<AcademyViewViewModel>(
                                builder: (context, value, child) {
                                  return
                                    //Custom Filter Bar
                                    const Filter();
                                }
                            )),
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
}

