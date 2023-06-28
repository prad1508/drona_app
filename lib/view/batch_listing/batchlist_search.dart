import 'package:drona/view/dashboard/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../data/response/status.dart';
import '../../res/app_url.dart';
import '../../res/language/language.dart';
import '../../res/widget/round_button.dart';
import '../../utils/no_data.dart';
import '../../view_model/academy_view_model.dart';
import '../../view_model/batchList_view_model.dart';
import '../../view_model/myprogram_view_model.dart';
import '../academy/academy_details.dart';
import 'create_batch_listing.dart';
import 'view_batch_details.dart';

// ignore: must_be_immutable
class SearchBatchList extends StatefulWidget {
  String pathPage;

  SearchBatchList({super.key, required this.pathPage});

  @override
  State<SearchBatchList> createState() => _SearchBatchListState();
}

class _SearchBatchListState extends State<SearchBatchList> {
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;
  BatchListViewViewModel batchListViewViewModel = BatchListViewViewModel();
  AcademyViewViewModel academyViewViewModel = AcademyViewViewModel();
  MyProgramViewViewModel myProgramViewViewModel = MyProgramViewViewModel();
  List<int> _selectedItems = <int>[];
  bool notFound = false;
  bool agree = false;
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    super.initState();
    batchListViewViewModel.fetchBatchListListApi();
    academyViewViewModel.fetchAcademyListApi();
  }

  void dataFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      setState(() {
        notFound = false;
      });
    } else {
      results = _foundUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      setState(() {
        notFound = results.isEmpty;
        _foundUsers = results;
      });
    }
  }

  //bottomsheet popup
  showFilter() {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        AcademyViewViewModel academyViewViewModel = AcademyViewViewModel();
        academyViewViewModel.fetchAcademyListApi();
        List<DropdownMenuItem<String>> activeServices = [];
        String? selectedService;
        assignSeviceId(selectedServiceValue) {
          myProgramViewViewModel.fetchMyProgramListApi(selectedService);
          selectedService = selectedServiceValue;
        }

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
                      const Align(
                          alignment: Alignment.topLeft,
                          child: Text('Services')),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: const Color.fromARGB(255, 218, 216, 216)),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                        ),
                        child: ChangeNotifierProvider<AcademyViewViewModel>(
                            create: (context) => academyViewViewModel,
                            child: Consumer<AcademyViewViewModel>(
                                builder: (context, value, child) {
                              assignSeviceId(value
                                      .dataList.data?.services![0].uid
                                      .toString() ??
                                  '');
                              activeServices = List.generate(
                                  value.dataList.data?.services?.length ?? 0,
                                  (index) {
                                return DropdownMenuItem(
                                    value: value
                                        .dataList.data!.services![index].uid
                                        .toString(),
                                    child: Text(value.dataList.data!
                                        .services![index].serviceName
                                        .toString()));
                              });

                              return DropdownButton(
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.black),
                                  isExpanded: true,
                                  underline: DropdownButtonHideUnderline(
                                      child: Container()),
                                  value: selectedService,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedService = newValue!;
                                    });
                                  },
                                  items: activeServices);
                            })),
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
              Text(
                _selectedItems.length == 0
                    ? ''
                    : _selectedItems.length.toString(),
                style: const TextStyle(color: Colors.black),
              )
            ],
          ),
          title: Text(
            'Batch List',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            widget.pathPage == "onBoarding"
                ? SizedBox()
                : IconButton(
                    onPressed: (() {
                     /* Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const CreateBatchListing(),
                        ),
                      );*/
                      Get.to(()=> const CreateBatchListing(),transition: Transition.leftToRight);

                    }),
                    icon: const Icon(Icons.add),
                    iconSize: 25,
                    color: Colors.black,
                  ),
          ],
        ),
        body: Container(
            // padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
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
                const SizedBox(
                  height: 15,
                ),

                ChangeNotifierProvider<BatchListViewViewModel>(
                    create: (BuildContext context) => batchListViewViewModel,
                    child: Consumer<BatchListViewViewModel>(
                        builder: (context, value, _) {
                      // print(
                      //     "value --${value.dataList.data?.data?[0].}");
                      if (_foundUsers.isEmpty) {
                        _foundUsers = List.generate(
                            value.dataList.data?.data!.length ?? 0, (index) {
                          return {
                            "batchName": value.dataList.data?.data![index].batchName,
                            "name": "${value.dataList.data?.data![index].batchName![0].characters.first.toUpperCase()}${value.dataList.data?.data![index].batchName!.characters.last.toUpperCase()}",
                            "detail": '${value.dataList.data!.data?[index].programName} - ${value.dataList.data?.data![index].batchDaysShort!.join(",").characters} - ${value.dataList.data?.data![index].batchTimingFrom} to ${value.dataList.data?.data![index].batchTimingTo}',
                            "batchImg": value.dataList.data?.data![index].serviceIconname,
                            "coach_name": value.dataList.data?.data![index].coachName,
                            "status": value.dataList.data?.data![index].status,
                            "totalTrainee": value.dataList.data?.data![index].totalTrainee,
                          };
                        });
                      }



                      switch (value.dataList.status!) {
                        case Status.loading:
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.teal,
                            ),
                          );

                        case Status.completed:
                           return Expanded(
                            child: notFound
                                ? const Text(
                              'No results found',
                              style: TextStyle(fontSize: 24),
                            )
                                : ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: _foundUsers.length,
                              itemBuilder: (context, index) => Card(
                                key: ValueKey(_foundUsers[index]["id"]),
                                 elevation: 0,
                                 margin: const EdgeInsets.symmetric(vertical: 0),
                                child:  Column(
                                  children: [
                                    ListTile(

                                      // tileColor:
                                      // (_selectedItems.contains(index))
                                      //     ? const Color.fromARGB(
                                      //     255, 218, 218, 219)
                                      //     .withOpacity(0.5)
                                      //     : Colors.transparent,
                                      // leading: CircleAvatar(
                                      //   radius: 20,
                                      //   backgroundColor:
                                      //   Color.fromRGBO(
                                      //       194, 235, 216, 1),
                                      //   child: _selectedItems.contains(index)
                                      //       ? const Icon(
                                      //     Icons.check,
                                      //     color: Color.fromRGBO(
                                      //         71, 192, 136, 1),
                                      //     size: 30.0,
                                      //   )
                                      //       : Image(
                                      //
                                      //       image: NetworkImage(
                                      //           AppUrl.imageListendPoint +
                                      //               _foundUsers[index]
                                      //               ["batchImg"])),
                                      // ),
                                      // title: Row(
                                      //   children: [
                                      //     Text(
                                      //       _foundUsers[index]['batchName'],
                                      //       style: const TextStyle(
                                      //           color: Color.fromRGBO(
                                      //               57, 64, 74, 1),
                                      //           fontSize: 14,
                                      //           fontWeight: FontWeight.w700,
                                      //           fontFamily: 'Loto-Regular'),
                                      //     ),
                                      //   ],
                                      // ),
                                      // subtitle: Column(
                                      //   mainAxisAlignment:
                                      //   MainAxisAlignment.start,
                                      //   crossAxisAlignment:
                                      //   CrossAxisAlignment.start,
                                      //   children: [
                                      //     Text(
                                      //       _foundUsers[index]["detail"]
                                      //           .toString(),
                                      //       style: const TextStyle(
                                      //           color: Color.fromRGBO(
                                      //               57, 64, 74, 1),
                                      //           fontSize: 12,
                                      //           fontWeight: FontWeight.w400,
                                      //           fontFamily: 'Loto-Regular'),
                                      //     ),
                                      //     Row(
                                      //       children: [
                                      //         const Text("Coach Name:",
                                      //             style: TextStyle(
                                      //                 color: Colors.black)),
                                      //         Text(
                                      //           _foundUsers[index]
                                      //           ["coach_name"],
                                      //         ),
                                      //       ],
                                      //     ),
                                      //   ],
                                      // ),
                                      // trailing: Container(
                                      //   height: 20,
                                      //   width:60,
                                      //   decoration: BoxDecoration(
                                      //       color: Colors.green,
                                      //       borderRadius: BorderRadius.circular(10)
                                      //   ),
                                      //   child: Center(
                                      //     child: Text(_foundUsers[index]["status"]
                                      //         .toString(),
                                      //       maxLines: 2,
                                      //       textAlign: TextAlign.center,
                                      //       style: TextStyle(
                                      //           fontSize: 10
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                      // onTap: () {
                                      //   Navigator.of(context).push(
                                      //       MaterialPageRoute(
                                      //           builder: (context) =>
                                      //               ViewBatchDetails(
                                      //                   ListIndex: index)));
                                      // },
                                      // onLongPress: () {
                                      //   if (!_selectedItems.contains(index)) {
                                      //     setState(() {
                                      //       _selectedItems.add(index);
                                      //     });
                                      //   } else {
                                      //     setState(() {
                                      //       _selectedItems.removeWhere(
                                      //               (val) => val == index);
                                      //     });
                                      //   }
                                      // },

                                      tileColor: Color(0XFFDFE1E4).withOpacity(0.3),
                                      // isThreeLine: true,
                                      leading: Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                          color: Color(0XFFDFE1E4),
                                        ),

                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CircleAvatar(
                                              radius: 10,
                                              // backgroundColor: Color.fromRGBO(194, 235, 216, 1),
                                              child: _selectedItems.contains(index)
                                                  ? Icon(Icons.check, color: Color.fromRGBO(71, 192, 136, 1), size: 30.0)
                                                  : Image(image: NetworkImage(AppUrl.imageListendPoint + _foundUsers[index]["batchImg"])),
                                            ),
                                        ),
                                      ),
                                      title:  Row(
                                          children: [

                                               Expanded(
                                                 child: Text(_foundUsers[index]['batchName'],
                                                  style: const TextStyle(color: Color.fromRGBO(57, 64, 74, 1),
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w700,
                                                      fontFamily: 'Loto-Regular'),
                                              ),
                                               ),

                                            Padding(
                                              padding: const EdgeInsets.only(left: 8),
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                                  color:Color(0XFFDFE1E4),
                                                ),

                                                child:  Padding(
                                                  padding: EdgeInsets.all(3.0),
                                                  child: Text(_foundUsers[index]['totalTrainee'].toString(),style: TextStyle(
                                                    fontSize: 12
                                                  ),),
                                                ) ,
                                              ),
                                            )

                                          ],
                                        ),
                                    trailing:  Container(
                                        height: 20,
                                        width:60,
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Text(_foundUsers[index]["status"].toString(),
                                              maxLines: 2,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  fontSize: 10,
                                                color: Colors.white
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      subtitle:  Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              _foundUsers[index]["detail"].toString(),
                                              style: const TextStyle(
                                                  // color: Color.fromRGBO(57, 64, 74, 1),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Loto-Regular'),
                                            ),
                                            Row(
                                              children: [
                                                const Text("Coach Name : ",
                                                    style: TextStyle(
                                                        color: Color(0xff39404A),
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500)),
                                                Text(_foundUsers[index]["coach_name"],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                          onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ViewBatchDetails(ListIndex: index , batchUid: value.dataList.data!.data![index].uid.toString(),totalTrainee : value.dataList.data!.data![index].totalTrainee.toString())));
                                      },
                                      onLongPress: () {
                                        if (!_selectedItems.contains(index)) {
                                          setState(() {
                                            _selectedItems.add(index);
                                          });
                                        } else {
                                          setState(() {
                                            _selectedItems.removeWhere(
                                                    (val) => val == index);
                                          });
                                        }
                                      },

                                    ),
                                    const Divider(
                                      height: 5,
                                      thickness: 1,
                                    ),
                                  ],
                                ),
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



                    })),
                const SizedBox(
                  height: 15,
                ),
                widget.pathPage == "onBoarding"
                    ? RoundButton(
                        loading: false,
                        title: AppLocale.conts.getString(context),
                        textColor: Colors.white,
                        rounded: true,
                        color: Theme.of(context).primaryColor,
                        onPress: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             Layout(selectedIndex: 0)));
                          Get.to(()=> const  Layout(selectedIndex: 0),transition: Transition.leftToRight);

                        })
                    : SizedBox()
              ],
            )),
      ),
    );
  }
}
