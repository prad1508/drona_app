import 'package:drona/data/response/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';

import '../../res/widget/round_button.dart';
import '../../view_model/batchList_view_model.dart';
import '../trainne_addmanual.dart';
import 'edit_batch_listing.dart';

class ViewBatchDetails extends StatefulWidget {
  final int ListIndex;
  const ViewBatchDetails({super.key, required this.ListIndex});

  @override
  State<ViewBatchDetails> createState() => _ViewBatchDetailsState();
}

class _ViewBatchDetailsState extends State<ViewBatchDetails> {
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;
  BatchListViewViewModel batchListViewViewModel = BatchListViewViewModel();
  @override
  initState() {
    super.initState();
    batchListViewViewModel.fetchBatchListListApi();
  }

  bool value = true;
  bool agree = true;
  final TextEditingController BatchName = TextEditingController();
  final TextEditingController service = TextEditingController();
  final TextEditingController assignCoach = TextEditingController();
  final TextEditingController BatchTime = TextEditingController();
  final TextEditingController fee = TextEditingController();
  final TextEditingController onlineUrl = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();

  Future<bool> isValidPasscode(String value) async {
    return await Future.delayed(const Duration(seconds: 1),
            () => value.isNotEmpty && value.toLowerCase() == 'batman');
  }

  String selectedCategory = 'Tennis';
  String selectedAssignCoach = 'john';
  String batchUid = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: _localization.supportedLocales,
      localizationsDelegates: _localization.localizationsDelegates,
      home: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            ' View Batch Details',
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
                          EditBatchListing(Listindex : widget.ListIndex),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.edit,
                  size: 20,
                  color: Colors.black,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Material(
            color: Colors.white,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: ChangeNotifierProvider<BatchListViewViewModel>(
                create: (BuildContext context) => batchListViewViewModel,
                child: Consumer<BatchListViewViewModel>(
                    builder: (context, value, _) {
                      // batchUid = value.dataList.data!.data![0].uid.toString();
                      //   print("object==$batchUid");
                      switch (value.dataList.status!) {
                        case Status.loading:
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.teal,
                            ),
                          );

                        case Status.completed:
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Batch Name',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                enabled: false,
                                controller: BatchName
                                  ..text = value.dataList.data
                                      ?.data![widget.ListIndex].batchName
                                      .toString() ??
                                      '',
                                decoration: InputDecoration(
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
                              const Align(
                                  alignment: Alignment.topLeft,
                                  child: Text('Services')),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                enabled: false,
                                controller: service
                                  ..text = value.dataList.data
                                      ?.data![widget.ListIndex].serviceName
                                      .toString() ??
                                      '',
                                decoration: InputDecoration(
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
                                child: Text(
                                  'Assign Coach',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                enabled: false,
                                controller: assignCoach
                                  ..text = value.dataList.data
                                      ?.data![widget.ListIndex].coachName
                                      .toString() ??
                                      '',
                                decoration: InputDecoration(
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
                                child: Text(
                                  'What Level?',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                      Colors.black.withOpacity(0.5),
                                      padding: const EdgeInsets.fromLTRB(
                                          25, 15, 25, 15)),
                                  child: Text(value.dataList.data
                                      ?.data![widget.ListIndex].programName
                                      .toString() ??
                                      ''),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Fee',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                enabled: false,
                                controller: fee
                                  ..text = value.dataList.data
                                      ?.data![widget.ListIndex].fees
                                      .toString() ??
                                      '',
                                decoration: InputDecoration(
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
                                child: Text(
                                  'Type of Batch',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                      Colors.black.withOpacity(0.5),
                                      padding: const EdgeInsets.fromLTRB(
                                          25, 15, 25, 15)),
                                  child: Text(value.dataList.data
                                      ?.data![widget.ListIndex].programName
                                      .toString() ??
                                      ''),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Online session Url',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                enabled: false,
                                controller: onlineUrl
                                  ..text = value.dataList.data
                                      ?.data![widget.ListIndex].onlineSessionUrl
                                      .toString() ??
                                      '',
                                decoration: InputDecoration(
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
                                child: Text(
                                  'Batch Days',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 50,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: value
                                        .dataList
                                        .data
                                        ?.data![widget.ListIndex]
                                        .batchDaysShort
                                        ?.length ??
                                        0,
                                    itemBuilder: (context, index) {
                                      return Row(
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                Colors.black.withOpacity(0.5),
                                                padding: const EdgeInsets.fromLTRB(
                                                    25, 15, 25, 15)),
                                            child: Text(value
                                                .dataList
                                                .data
                                                ?.data![widget.ListIndex]
                                                .batchDaysShort![index] ??
                                                ''),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          )
                                        ],
                                      );
                                    }),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Batch Timing',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                enabled: false,
                                controller: BatchTime
                                  ..text = value.dataList.data!
                                      .data![widget.ListIndex].batchTimingFrom
                                      .toString() +
                                      ' to ' +
                                      value.dataList.data!.data![widget.ListIndex]
                                          .batchTimingTo
                                          .toString(),
                                decoration: InputDecoration(
                                  suffixIcon: const Icon(Icons.access_time),
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
                                  title: 'Add Trainee',
                                  textColor: Colors.white,
                                  rounded: true,
                                  color: Theme.of(context).primaryColor,
                                  onPress: () {
                                    // Map<String, dynamic> data = {
                                    //   "batch_uid": "$batchUid",
                                    //   "fullname":
                                    //       "${value.dataList.data?.data![widget.ListIndex].coachName}",
                                    //   "ccode":
                                    //       "${value.dataList.data?.data![widget.ListIndex].cdd}",
                                    //   "mobno":
                                    //       "${value.dataList.data?.data![widget.ListIndex].cmm}",
                                    //   "gender": "male",
                                    //   "fees": 20000,
                                    //   "dateofjoining": "12-04-2023",
                                    //   "monthofbilling": "1",
                                    //   "img": "izf5azt0sy2iurz.jpeg",
                                    //   "relation": "self"
                                    // };
                                    // print("object$data");
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (BuildContext context) =>
                                    //         TrainAddManualy(batchId: batchUid),
                                    //   ),
                                    // );
                                    showModalBottomSheet<void>(
                                      context: context,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(25.0),
                                        ),
                                      ),
                                      builder: (BuildContext context) {
                                        return SizedBox(
                                          height: 250,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 20),
                                                    child: Text(
                                                        'Add Trainee In ${value.dataList.data?.data![widget.ListIndex].batchName.toString().toUpperCase()}'),
                                                  )),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Divider(
                                                thickness: 2,
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Padding(
                                                      padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                      child: TextButton(
                                                          onPressed: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder: (BuildContext
                                                                context) =>
                                                                    TrainAddManualy(
                                                                      batchId: value
                                                                          .dataList
                                                                          .data!
                                                                          .data![0]
                                                                          .uid
                                                                          .toString(),
                                                                      batchName:
                                                                      "${value.dataList.data?.data![widget.ListIndex].batchName.toString().toUpperCase()}",
                                                                    ),
                                                              ),
                                                            );
                                                          },
                                                          child: Text(
                                                            'Enter Manually',
                                                            style: Theme.of(context)
                                                                .textTheme
                                                                .bodyMedium,
                                                          )))),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Padding(
                                                      padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                      child: TextButton(
                                                        onPressed: () {},
                                                        child: Text(
                                                          'Select From Existing Trainees',
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .bodyMedium,
                                                        ),
                                                      ))),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  }),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
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
                                  Text(
                                    value.dataList.message.toString(),
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 20,
                                        height: 2),
                                  )
                                ],
                              ));
                      }
                    }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
