import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import '../../data/response/status.dart';
import '../../res/language/language.dart';
import '../../res/widget/customcheckbox.dart';
import '../../res/widget/progress_pills.dart';
import '../../res/widget/round_button.dart';
import '../../view_model/facility_view_model.dart';
import '../../view_model/registration_view_model.dart';
import '../../view_model/service_view_model.dart';
import '../../../res/app_url.dart';
import 'choose_facility.dart';
import 'detail_filled.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseService extends StatefulWidget {
  const ChooseService({super.key});

  @override
  State<ChooseService> createState() => _ChooseServiceState();
}

class _ChooseServiceState extends State<ChooseService> {
  ServiceViewViewModel serviceViewViewModel = ServiceViewViewModel();
  RegistrationViewModel registrationViewModel = RegistrationViewModel();
  bool shouldCheck = false;
  //Service List
  List serviceList = [];
  List<String> serviceSelected = [];
  late String catUid;
  late String userUid;
  final List<int> _selectedItems = <int>[];


  void initState() {
    super.initState();
    getData();
    //WidgetsBinding.instance.addPostFrameCallback(
    // (_) => serviceViewViewModel.fetchServiceListApi(userUid));
  }
  getData()
  async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userUid = prefs.getString('uid')!;
    serviceViewViewModel.fetchServiceListApi(userUid);
  }

  @override
  Widget build(BuildContext context) {
    print("selected items are $_selectedItems");
    print("services selected  are $serviceSelected");
    print(" services list  are $serviceList");
    final facility = Provider.of<FacilityViewViewModel>(context);
    final registration = Provider.of<RegistrationViewModel>(context);
    userUid = registration.uid;
    print("uid is $userUid");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Row(
            children: [
              ProgressPills(
                  number: 7,
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
                      AppLocale.title12.getString(context),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ChangeNotifierProvider<ServiceViewViewModel>(
                    create: (BuildContext context) => serviceViewViewModel,
                    child: Consumer<ServiceViewViewModel>(
                        builder: (context, value, _) {
                          if (value.dataList.status! == Status.completed) {
                            catUid = value.dataList.data!.data![0].catUid!.toString();
                            return SizedBox(
                              height: MediaQuery.of(context).size.height * .6,
                              child: GridView.count(
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 4.0,
                                  mainAxisSpacing: 8.0,
                                  children: List.generate(
                                      value.dataList.data!.data!.length, (index) {
                                    return Center(
                                      child: CustomCheckBox(
                                        value: _selectedItems.contains(index),
                                        checkedFillColor:
                                        const Color.fromRGBO(42, 98, 184, 1),
                                        imageUrl: AppUrl.imageListendPoint + value.dataList.data!.data![index].iconname!.toString(),
                                        name: value.dataList.data!.data![index].serviceName!.toString(),
                                        onChanged: (val) {
                                          //do your stuff here
                                          final Map<String, String> services = {
                                            "service_uid": value.dataList.data!.data![index].uid!.toString(),
                                            "service_name": value.dataList.data!.data![index].serviceName!.toString(),
                                          };
                                          if (!_selectedItems.contains(index)) {
                                            setState(() {
                                              _selectedItems.add(index);
                                               serviceList.add(services);
                                              serviceSelected.add(value.dataList.data!.data![index].uid!.toString(),
                                              );
                                            });
                                          } else {
                                            setState(() {
                                               // serviceList.clear();
                                              print("service which i want to remove is $services");
                                              // serviceList.remove(services);
                                              serviceList.removeWhere((item) =>
                                              item['service_uid'] == services['service_uid'] && item['service_name'] == services['service_name']);
                                               serviceSelected.remove(value.dataList.data!.data![index].uid!.toString(),
                                               );
                                              _selectedItems.removeWhere((val) => val == index);
                                            });
                                          }
                                        },
                                      ),
                                    );
                                  })),
                            );
                          }
                          return Container(
                            height: MediaQuery.of(context).size.height * .6,
                          );
                        }),
                  ),
                  RoundButton(
                      loading: false,
                      title: AppLocale.conts.getString(context),
                      textColor: Colors.white,
                      rounded: true,
                      color: serviceList.isEmpty
                          ? Theme.of(context).primaryColor.withOpacity(0.2)
                          : Theme.of(context).primaryColor,
                      onPress: () async {
                        if (serviceList.isEmpty) {
                        } else {
                          print("serviceList--${serviceList.length}");
                          Map<String, dynamic> data = {
                            "cat_uid": catUid,
                            "services": serviceList,
                          };
                          final prefsData =
                          await SharedPreferences.getInstance();
                          prefsData.setStringList(
                              'SelectedServices', serviceSelected);
                          facility.resetcounter();
                          registration.servicePost(data, context);
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({required this.imageUrl});
  final String imageUrl;
}
