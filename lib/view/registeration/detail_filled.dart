import 'package:flutter/material.dart';

import 'package:flutter_localization/flutter_localization.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

import '../../res/language/language.dart';
import '../../res/widget/datefield.dart';
import '../../res/widget/progress_pills.dart';
import '../../res/widget/round_button.dart';
import '../../view_model/myservices_view_model.dart';
import '../../view_model/registration_view_model.dart';
import 'package:intl/intl.dart';

class DetailFilled extends StatefulWidget {
  const DetailFilled({super.key});

  @override
  State<DetailFilled> createState() => _TellusAcadmicState();
}

class _TellusAcadmicState extends State<DetailFilled> {
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;
  MyservicesViewViewModel myservicesViewViewModel = MyservicesViewViewModel();
  final TextEditingController dob = TextEditingController();
 List<Myservices> _selectedAnimals2 = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myservicesViewViewModel.fetchMyservicesListApi();
    _selectedAnimals2.clear();
  }

  @override
  Widget build(BuildContext context) {
   final registration = Provider.of<RegistrationViewModel>(context);
    return MaterialApp(
      supportedLocales: _localization.supportedLocales,
      localizationsDelegates: _localization.localizationsDelegates,
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
                  active: 6,
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
                      AppLocale.title13.getString(context),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      AppLocale.services.getString(context),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ChangeNotifierProvider<MyservicesViewViewModel>(
                      create: (context) => myservicesViewViewModel,
                      child: Consumer<MyservicesViewViewModel>(
                        builder: (context, value, child) {
                          
                          final List<Myservices> myservices = List.generate(
                              value.dataList.data?.services?.length ?? 0,
                              (index) => Myservices(
                                  serviceuid: value.dataList.data
                                          ?.services?[index].uid
                                          ?.toString() ??
                                      '',
                                  servicename: value.dataList.data
                                          ?.services?[index].serviceName
                                          ?.toString() ??
                                      ''));
                          final items = myservices
                              .map((myservices) => MultiSelectItem<Myservices>(
                                  myservices, myservices.servicename))
                              .toList();
                          // providerCreate.updateServicesList(items);
                          return MultiSelectDialogField(
                            dialogWidth: MediaQuery.of(context).size.width * 2,
                            dialogHeight:
                                MediaQuery.of(context).size.width * 0.7,
                            items: items,
                            title: Text(
                              AppLocale.title15.getString(context),
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
                              Icons.pets,
                              color: Colors.blue,
                            ),
                            buttonText: Text(
                              AppLocale.title15.getString(context),
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
                        width: MediaQuery.of(context).size.width *1,
                        height: 60,
                        child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: _selectedAnimals2.length,
                                itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right:10),
                                  child: Chip(label: Text(_selectedAnimals2[index].servicename.toString())),
                                );
                            }
                             ),
                      ),
                           
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      AppLocale.dob.getString(context),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                
                  DatePicker(controller: dob, hintText: AppLocale.dob.getString(context)),

                  const SizedBox(
                    height: 15,
                  ),
                  RoundButton(
                      loading: false,
                      title: AppLocale.conts.getString(context),
                      textColor: Colors.white,
                      rounded: true,
                      color: Theme.of(context).primaryColor,
                      onPress: () {
                       
                          List servicesUid = List.generate(
                                    _selectedAnimals2.length,
                                    (index) {
                                  return {
                                      'service_uid':
                                          _selectedAnimals2[index].serviceuid.toString(),
                                    };
                                });
                       Map data =  {
                                 "dob": dob.text,
                                 "services":servicesUid
                                 };   
                                 registration.detailsOwner(data, context);           
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

class Myservices {
  final String serviceuid;
  final String servicename;

  Myservices({
    required this.serviceuid,
    required this.servicename,
  });
}
