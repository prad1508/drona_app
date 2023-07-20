import 'package:drona/data/response/status.dart';
import 'package:drona/res/app_url.dart';
import 'package:drona/res/widget/round_button.dart';
import 'package:drona/utils/no_data.dart';
import 'package:drona/view/batch_listing/editprofile_details.dart';
import 'package:drona/view_model/trainee_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../utils/color.dart';
import '../../view_model/myservices_view_model.dart';
import '../../view_model/program_view_model.dart';

class CoachDeactivateProfile extends StatefulWidget {
  const CoachDeactivateProfile({super.key, required this.index});

  final int index;

  @override
  State<CoachDeactivateProfile> createState() => _CoachDeactivateProfileState();
}

class _CoachDeactivateProfileState extends State<CoachDeactivateProfile> {
  TraineeViewModel traineeViewModel = TraineeViewModel();
  MyservicesViewViewModel myServicesViewViewModel = MyservicesViewViewModel();
  ProgramViewViewModel programViewViewModel = ProgramViewViewModel();
  TextEditingController dob = TextEditingController();
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
    }
    for (var node in programViewViewModel.customfocusNodes) {
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
  final List<int> _selectedItems = <int>[];

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
          'Deactivate',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: const Icon(Icons.edit, color: Colors.black),
                onPressed: () {
                  Get.to(
                      () => EditProfileDetails(
                            index: widget.index,
                          ),
                      transition: Transition.leftToRight);
                },
              ))
        ],
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
                                            color: value
                                                        .dataList
                                                        .data!
                                                        .data[widget.index]
                                                        .join_status ==
                                                    'not_onboarded'
                                                ? const Color.fromRGBO(
                                                    255, 232, 231, 1)
                                                : const Color(0xffEDF9F3),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Text(
                                          value
                                                      .dataList
                                                      .data!
                                                      .data[widget.index]
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
                        const SizedBox(height: 35),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                            width: 342,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        '₹1800',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                            fontFamily: 'Loto-Bold'),
                                      ),
                                      Text(
                                        'Due on 06 July, 2023',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: Colors.grey[500],
                                            fontFamily: 'Loto-Bold'),
                                      )
                                    ],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 2),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black),
                                    height: 24,
                                    width: 24,
                                    child: const Icon(
                                      Icons.currency_rupee,
                                      size: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Text(
                            "Deactivation Date",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w600,
                                color: Color(0xff39404A)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                          child: SizedBox(
                            width: 342,
                            height: 48,
                            child: TextFormField(
                              readOnly: true,
                              controller: dob,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                suffixIcon: const Icon(
                                  Icons.calendar_month,
                                  size: 30.0,
                                ),
                                hintText: '10-01-2022',
                                contentPadding: const EdgeInsets.all(10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                              onTap: () async {
                                var lastDate =
                                DateFormat('yyyy').format(DateTime.now().add(const Duration(
                                  days: 356,
                                )));
                                var date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2022),
                                    lastDate: DateTime(int.parse(lastDate)));
                                if (date != null) {
                                  dob.text = DateFormat('dd/MM/yyyy').format(date);
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * .4,
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
                                onPress: () {}),
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
