import 'package:drona/view/batch_listing/edit_batch_listing.dart';
import 'package:drona/view/profile/view_profile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../res/app_url.dart';
import '../../res/language/language.dart';
import '../../res/widget/round_button.dart';
import '../../view_model/batchList_view_model.dart';
import '../../view_model/coachlist_view_model.dart';
import '../batch_listing/create_batch_listing.dart';

class CoachListSelected extends StatefulWidget {
  int Listindex ;
   CoachListSelected({super.key , this.Listindex=-1});

  @override
  State<CoachListSelected> createState() => _CoachListSelectedState();
}

class _CoachListSelectedState extends State<CoachListSelected> {
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;
  CoachlistViewViewModel coachlistViewViewModel = CoachlistViewViewModel();
  List<int> _selectedItems = <int>[];
  bool notFound = false;
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    super.initState();
    coachlistViewViewModel.fetchCoachlistListApi();
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
            'Coach List',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            _selectedItems.isEmpty
                ? IconButton(
                    onPressed: (() {
                      if (kDebugMode) {
                        print('add coach list');
                      }
                    }),
                    icon: const Icon(Icons.group_add),
                    iconSize: 25,
                    color: Colors.black,
                  )
                : IconButton(
                    onPressed: (() {
                      if (kDebugMode) {
                        print('add coach list');
                      }
                    }),
                    icon: const Icon(Icons.delete_outline),
                    iconSize: 25,
                    color: Colors.black,
                  ),
          ],
        ),
        body: Material(
          color: Colors.white,
          child: 
          Container(
              // height: MediaQuery.of(context).size.height,
              // width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
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
                  const SizedBox(
                    height: 15,
                  ),
                  ChangeNotifierProvider<CoachlistViewViewModel>(
                      create: (BuildContext context) => coachlistViewViewModel,
                      child: Consumer<CoachlistViewViewModel>(
                          builder: (context, value, _) {
                        // if (_foundUsers.isEmpty) {
                        //   _foundUsers = List.generate(
                        //       value.dataList.data!.coachlist.length, (index) {
                        //     return {
                        //       "name":
                        //           value.dataList.data?.coachlist[index].name,
                        //       // "img": value.dataList.data?.coachlist[index].img,
                        //       "iconImg": value.dataList.data?.coachlist[index]
                        //           .services[index].serviceIconname,
                        //       "gender":
                        //           value.dataList.data?.coachlist[index].gender,
                        //       "userid":
                        //           value.dataList.data?.coachlist[index].userid,
                        //     };
                        //   });
                        // }

                        // return Expanded(
                        //   child: notFound
                        //       ? const Text(
                        //           'No results found',
                        //           style: TextStyle(fontSize: 24),
                        //         )
                        //       :

                        return value.dataList.data!.coachlist.isEmpty
                            ? Center(
                                child: Text("data not found"),
                              )
                            : Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.58,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView.builder(
                                      itemCount:
                                          value.dataList.data!.coachlist.length,
                                      itemBuilder: (context, index) {
                                        print(
                                            "img==${value.dataList.data!.coachlist.length}");

                                        return Card(
                                          //key: ValueKey(value.dataList.data!.coachlist[index].),
                                          elevation: 0,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 0),
                                          child: Column(
                                            children: [
                                              ListTile(
                                                tileColor: (_selectedItems
                                                        .contains(index))
                                                    ? const Color.fromARGB(
                                                            255, 218, 218, 219)
                                                        .withOpacity(0.5)
                                                    : Colors.transparent,
                                                leading: CircleAvatar(
                                                  radius: 20.5,
                                                  backgroundColor:
                                                      const Color.fromRGBO(
                                                          194, 235, 216, 1),
                                                  child: _selectedItems
                                                          .contains(index)
                                                      ? const Icon(
                                                          Icons.check,
                                                          color: Color.fromRGBO(
                                                              71, 192, 136, 1),
                                                          size: 30.0,
                                                        )
                                                      : value
                                                                  .dataList
                                                                  .data!
                                                                  .coachlist[
                                                                      index]
                                                                  .img !=
                                                              ""
                                                          ? Image(
                                                              image: NetworkImage(
                                                                AppUrl.profileimageListendPoint +
                                                                    value
                                                                        .dataList
                                                                        .data!
                                                                        .coachlist[
                                                                            index]
                                                                        .img,
                                                              ),
                                                            )
                                                          : Icon(Icons.person),
                                                ),
                                                title: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        value
                                                            .dataList
                                                            .data!
                                                            .coachlist[index]
                                                            .name,
                                                        style: const TextStyle(
                                                            color: Color.fromRGBO(
                                                                57, 64, 74, 1),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontFamily:
                                                                'Loto-Regular'),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                subtitle: Padding(
                                                  padding: const EdgeInsets.only(
                                                      right: 25),
                                                  child: Text(
                                                    value
                                                            .dataList
                                                            .data!
                                                            .coachlist[index]
                                                            .gender +
                                                        ", +" +
                                                        value
                                                            .dataList
                                                            .data!
                                                            .coachlist[index]
                                                            .userid,
                                                    style: const TextStyle(
                                                        color: Color.fromRGBO(
                                                            57, 64, 74, 1),
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily:
                                                            'Loto-Regular'),
                                                  ),
                                                ),
                                                trailing: CircleAvatar(
                                                  radius: 12,
                                                  child: Image(
                                                      image: NetworkImage(
                                                          "${AppUrl.imageListendPoint}${value.dataList.data!.coachlist[index].services[0].serviceIconname}")),
                                                ),
                                                onTap: () {},
                                                onLongPress: () {
                                                  if (!_selectedItems
                                                      .contains(index)) {
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
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                );

                      })),
                  const SizedBox(
                    height: 15,
                  ),
                  widget.Listindex!=-1?
                  RoundButton(
                      loading: false,
                      title: AppLocale.conts.getString(context),
                      textColor: Colors.white,
                      rounded: true,
                      color: Theme.of(context).primaryColor,
                      onPress: () {
                        print("pressssss edit");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                 EditBatchListing(Listindex : widget.Listindex )));
                      }):
                  RoundButton(
                      loading: false,
                      title: AppLocale.conts.getString(context),
                      textColor: Colors.white,
                      rounded: true,
                      color: Theme.of(context).primaryColor,
                      onPress: () {
                        print("normal case");
                        Get.to(()=>  CreateBatchListing(),transition: Transition.leftToRight);
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             const CreateBatchListing()));
                      }),
                ],
              )),
        ),
      ),
    );
  }
}
