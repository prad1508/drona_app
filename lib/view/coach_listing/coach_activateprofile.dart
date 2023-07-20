import 'package:drona/data/response/status.dart';
import 'package:drona/res/app_url.dart';
import 'package:drona/res/widget/round_button.dart';
import 'package:drona/utils/no_data.dart';
import 'package:drona/view/coach_listing/coach_activateNumber.dart';
import 'package:drona/view_model/trainee_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

import '../../res/language/language.dart';
import '../../utils/color.dart';
import '../../view_model/myservices_view_model.dart';
import '../../view_model/program_view_model.dart';
import '../registeration/detail_filled.dart';

class CoachActivateProfile extends StatefulWidget {
  const CoachActivateProfile({super.key, required this.index});

  final int index;

  @override
  State<CoachActivateProfile> createState() => _CoachActivateProfileState();
}

class _CoachActivateProfileState extends State<CoachActivateProfile> {
  TraineeViewModel traineeViewModel = TraineeViewModel();
  MyservicesViewViewModel myServicesViewViewModel = MyservicesViewViewModel();
  ProgramViewViewModel programViewViewModel = ProgramViewViewModel();
  late Map<String, dynamic> data;

  @override
  void initState() {
    data = {"filter_batch_uid": "", "search": ""};
    myServicesViewViewModel.fetchMyservicesListApi();
    traineeViewModel.fetchTraineeListSearchApi(data);
    for (var node in programViewViewModel.focusNodes) {
      node.addListener(() {
        setState(() {});
      });
    }
    for (var node in programViewViewModel.focusNodesByage) {
      node.addListener(() {
        setState(() {});
      });
    } for (var node in programViewViewModel.customfocusNodes) {
      node.addListener(() {
        setState(() {});
      });
    }
    // TODO: implement initState
    super.initState();
  }


  //Getting initials if no image
  String getInitials(String name) {
    List<String> nameParts = name.split(' ');
    if (nameParts.length > 1) {
      return nameParts[0][0].toUpperCase() + nameParts[1][0].toUpperCase();
    } else if (nameParts.length == 1) {
      String firstName = nameParts[0];
      if (firstName.length >= 2) {
        return firstName.substring(0, 2).toUpperCase();
      } else {
        return firstName[0].toUpperCase();
      }
    } else {
      return '';
    }
  }
  List serviceList = [];
  List<String> serviceSelected = [];
  late String catUid;
  late String userUid;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Activate',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: ChangeNotifierProvider<TraineeViewModel>(
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.only(left: 12, right: 12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    width: 41,
                                    height: 46,
                                    child: value.dataList.data!
                                        .data[widget.index].image.isNotEmpty
                                        ? CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        AppUrl.profileserviceIconEndPoint +
                                            value.dataList.data!
                                                .data[widget.index].image,
                                      ),
                                      // AssetImage('assets/images/user_profile.png'),
                                    )
                                        : CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      child: Text(
                                        getInitials(value
                                            .dataList
                                            .data!
                                            .data[widget.index]
                                            .traineeName),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      // backgroundImage: getInitials(value.dataList.data!.data[index].traineeName),
                                    ),
                                    // AssetImage('assets/images/user_profile.png'),
                                  ),
                                ],
                              ),
                              const Padding(padding: EdgeInsets.only(left: 10)),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        value.dataList.data!.data[widget.index]
                                            .traineeName,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                      Container(
                                        height: 20,
                                        margin: const EdgeInsets.only(left: 10),
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 5, top: 2),
                                        decoration: BoxDecoration(
                                            color: value.dataList.data!.data[widget.index]
                                                .join_status ==
                                                'not_onboarded'? const Color.fromRGBO(255, 232, 231, 1):const Color(0xffEDF9F3),
                                            borderRadius:
                                            BorderRadius.circular(5)),
                                        child: Text(
                                          value.dataList.data!.data[widget.index]
                                              .join_status ==
                                              'not_onboarded'
                                              ? 'Not Onboarded'
                                              : 'Onboarded',
                                          style: TextStyle(
                                              color: value
                                                  .dataList
                                                  .data!
                                                  .data[widget.index]
                                                  .join_status ==
                                                  'not_onboarded'
                                                  ? secondryColor
                                                  : successColor,
                                              fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(top: 5)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        value.dataList.data!.data[widget.index]
                                            .gender ==
                                            'male'
                                            ? 'Male'
                                            : 'Female',
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const Text(" | "),
                                      Text(
                                        '${DateTime.now().year - int.parse(value.dataList.data!.data[widget.index]
                                            .dob.split('/')[2])} Years',
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Padding(padding: EdgeInsets.only(left: 10)),
                              Align(
                                alignment: Alignment.centerRight,
                                widthFactor: 1.5,
                                child: SizedBox(
                                    width: 34,
                                    height: 34,
                                    child: Image.network(
                                      AppUrl.serviceIconEndPoint +
                                          value.dataList.data!
                                              .data[widget.index].serviceicon,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 45),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Phone Number",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff39404A)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: InkWell(
                                      onTap: (){
                                        Get.to(() => CoachActivateNumber(index: widget.index),
                                            transition: Transition.leftToRight);
                                      },
                                      child: const Text(
                                        "Change",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w600,
                                            color: Colors.orange),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              SizedBox(
                                  width: 342,
                                  height: 48,
                                  child: TextField(
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                    keyboardType: TextInputType.number,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      hintText: '+91-999 999 9999',
                                      hintStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff626D7E),
                                      ),
                                      contentPadding: const EdgeInsets.all(10),
                                      border: const OutlineInputBorder(),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                            color: Color(0xffD0D3D8)),
                                      ),
                                      filled: true,
                                      // Add this line
                                      fillColor: Colors.grey[200],
                                    ),
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Services",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff39404A)),
                              ),
                              const SizedBox(height: 4),
                              SizedBox(
                                width: 342,
                                child: ChangeNotifierProvider<MyservicesViewViewModel>(
                                    create: (context) => myServicesViewViewModel,
                                    child: Consumer<MyservicesViewViewModel>(
                                      builder: (context, value, child) {
                                        final List<Myservices> myservices = List.generate(
                                            value.dataList.data?.services?.length ?? 0,
                                                (index) => Myservices(
                                                serviceuid: value
                                                    .dataList.data?.services?[index].uid
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
                                        print("item.length==${items.length}");
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
                                            Icons.arrow_drop_down,
                                            color: Colors.blue,
                                          ),
                                          buttonText: Text(
                                            AppLocale.title15.getString(context),
                                            style: const TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                          onConfirm: (results) {
                                          },
                                        );
                                      },
                                    )),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Salary/Month",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff39404A)),
                              ),
                              const SizedBox(height: 4),
                              SizedBox(
                                width: 342,
                                height: 48,
                                child:
                                TextFormField(
                                  focusNode: programViewViewModel.focusNodes[0],
                                  // controller: programViewViewModel.txtBylevelBeginner,
                                  onTap: () {},
                                  // onChanged: (newValue) {
                                  //   programViewViewModel.handleTextFieldChange(newValue);
                                  // },
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    hintText: '  Fees',
                                    contentPadding: const EdgeInsets.all(15),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                                    focusedBorder: OutlineInputBorder(borderSide: const BorderSide(
                                        color: Colors.blue, width: 1.0),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    prefixIcon: Container(
                                        decoration: BoxDecoration(color: programViewViewModel.focusNodes[0].hasFocus ? const Color.fromARGB(255, 4, 112, 201) : const Color.fromARGB(255, 193, 193, 193), borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                                        child: Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Text('₹/M', style: TextStyle(color: programViewViewModel.focusNodes[0].hasFocus ? Colors.white : const Color.fromARGB(255, 44, 44, 44)),
                                          ),
                                        )),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height*.3,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: SizedBox(
                            width: 342,
                            height: 48,
                            child: RoundButton(
                                loading: false,
                                title: 'Submit',
                                textColor: Colors.white,
                                rounded: true,
                                color: Theme.of(context).primaryColor,
                                onPress: () {
                                }),
                          ),
                        ),
                      ],
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
                          const NoData()
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
      ),
    );
  }
}
