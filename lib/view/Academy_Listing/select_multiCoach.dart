import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:provider/provider.dart';

import '../../res/language/language.dart';
import '../../res/widget/datefield.dart';
import '../../res/widget/progress_pills.dart';
import '../../res/widget/round_button.dart';
import '../../view_model/coachlist_view_model.dart';
import '../../view_model/myservices_view_model.dart';
import '../../view_model/registration_view_model.dart';
import '../registeration/detail_filled.dart';

class MultiCoachScreen extends StatefulWidget {
  String serviceUid;
  String serviceName;
   MultiCoachScreen({Key? key, required this.serviceUid, required this.serviceName}) : super(key: key);

  @override
  State<MultiCoachScreen> createState() => _MultiCoachScreenState();
}

class _MultiCoachScreenState extends State<MultiCoachScreen> {


  final FlutterLocalization _localization = FlutterLocalization.instance;
  CoachlistViewViewModel coachlistViewViewModel = CoachlistViewViewModel();

  MyservicesViewViewModel myservicesViewViewModel = MyservicesViewViewModel();
  final TextEditingController dob = TextEditingController();
  List<Myservices2> _selectedAnimals2 = [];
  List items = [];
  Map<String, dynamic> data = {"search": ""};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // myservicesViewViewModel.fetchMyservicesListApi();
    coachlistViewViewModel.fetchCoachlistApi(data);

    _selectedAnimals2.clear();
  }

  @override
  Widget build(BuildContext context) {
    final registration = Provider.of<RegistrationViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            ProgressPills(
                number: 4,
                active: 3,
                color: Theme.of(context).primaryColorLight),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
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
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Add Coach For ${widget.serviceName}",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Select Coach Name",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ChangeNotifierProvider<CoachlistViewViewModel>(
                    create: (context) => coachlistViewViewModel,
                    child: Consumer<CoachlistViewViewModel>(
                      builder: (context, value, child) {
                         List<Myservices2> myservices = List.generate(
                            value.dataList1.data!.data.length ?? 0,
                                (index) => Myservices2(
                                serviceuid: value
                                    .dataList1.data!.data[index].uid
                                    .toString() ??
                                    '',
                                servicename: value.dataList1.data
                                    ?.data[index].name
                                    .toString() ??
                                    ''));
                        var item = myservices.map((myservices) => MultiSelectItem<Myservices2>(
                            myservices, myservices.servicename))
                            .toList();
                        // providerCreate.updateServicesList(items);
                        print("item.length==${item.length}");
                        return MultiSelectDialogField(
                          dialogWidth: MediaQuery.of(context).size.width * 2,
                          dialogHeight:
                          MediaQuery.of(context).size.width * 0.7,
                          items: item,
                          title: Text(

                            //AppLocale.title15.getString(context),
                            "choose your Coach",
                            style: const TextStyle(fontSize: 15),
                          ),
                          selectedColor: Colors.blue,
                          decoration: BoxDecoration(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                            border: Border.all(
                              color: const Color.fromARGB(255, 156, 156, 156),
                              width: 1,
                            ),
                          ),
                          buttonIcon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.blue,
                          ),
                          buttonText: Text(
                            //AppLocale.title15.getString(context),
                            "Select Coach For Service",
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          onConfirm: (results) {
                            _selectedAnimals2 = results;
                          },
                        );
                      },
                    )),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 1,
                  height: 60,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: _selectedAnimals2.length,
                      itemBuilder: (context, index) {
                        print(
                            "_selectedAnimals2====${_selectedAnimals2.length}");
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Chip(
                              label: Text(_selectedAnimals2[index]
                                  .servicename
                                  .toString())),
                        );
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),

                RoundButton(
                    loading: false,
                    title: AppLocale.conts.getString(context),
                    textColor: Colors.white,
                    rounded: true,
                    color: Theme.of(context).primaryColor,
                    onPress: () {
                      List servicesUid =
                      List.generate(_selectedAnimals2.length, (index) {
                        return {
                          'service_uid':
                          _selectedAnimals2[index].serviceuid.toString(),
                        };
                      });
                      Map data = {"service_uid": widget.serviceUid, "coach": servicesUid};
                      print("data==$data");
                      //registration.detailsOwner(data, context);
                      coachlistViewViewModel.addMultiCoachApi(data, context);

                     /* final timer = Timer(
                        const Duration(milliseconds: 50),
                            () {
                          _selectedAnimals2.clear();
                        },
                      );*/
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Myservices2 {
  final String serviceuid;
  final String servicename;

  Myservices2({
    required this.serviceuid,
    required this.servicename,
  });
}
