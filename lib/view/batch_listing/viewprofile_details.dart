import 'package:drona/data/response/status.dart';
import 'package:drona/res/app_url.dart';
import 'package:drona/res/language/language.dart';
import 'package:drona/utils/no_data.dart';
import 'package:drona/view/batch_listing/editprofile_details.dart';
import 'package:drona/view_model/trainee_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ViewProfileDetails extends StatefulWidget {
  const ViewProfileDetails({super.key, required this.index});

  final int index;

  @override
  State<ViewProfileDetails> createState() => _ViewProfileDetailsState();
}

class _ViewProfileDetailsState extends State<ViewProfileDetails> {
  TraineeViewModel traineeViewModel = TraineeViewModel();
  late Map<String, dynamic> data;

  @override
  void initState() {
    print("widget.index${widget.index}");
    data = {"filter_batch_uid": "", "search": ""};

    traineeViewModel.fetchTraineeListSearchApi(data);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          AppLocale.title27.getString(context),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                  Container(
                                    height: 20,
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        color: const Color(0xff47C088),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text(
                                      value.dataList.data!.data[widget.index]
                                          .status == 'active'?AppLocale.active.getString(context):AppLocale.inActive.getString(context),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 11),
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(padding: EdgeInsets.only(left: 10)),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    value.dataList.data!.data[widget.index]
                                        .traineeName,
                                    style: const TextStyle(fontSize: 12),
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
                                            ? AppLocale.male.getString(context)
                                            : AppLocale.female.getString(context),
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const Text(" | "),
                                     Text(value.dataList.data!.data[widget.index]
                                         .dob,
                                       style: const TextStyle(
                                           fontSize: 12,
                                           fontWeight: FontWeight.w400),
                                     )
                                     /* Text(
                                        '${DateTime.now().year - int.parse(value.dataList.data!.data[widget.index]
                                            .dob.split('/')[2])} Years',
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),*/
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    value.dataList.data!.data[widget.index]
                                        .batchname,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(top: 5)),
                                  Row(children: [
                                     Text(
                                      "${AppLocale.fee.getString(context)} : ",
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    Text(
                                        '₹${value.dataList.data!.data[widget.index].fees.toString()}',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400))
                                  ]),
                                ],
                              ),
                              const Padding(padding: EdgeInsets.only(left: 10)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 20,
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
                                              ? AppLocale.notOnboarded.getString(context)
                                              : AppLocale.onboarded.getString(context),
                                          style: TextStyle(
                                              color: value
                                                  .dataList
                                                  .data!
                                                  .data[widget.index]
                                                  .join_status ==
                                                  'not_onboarded'
                                                  ? const Color.fromRGBO(253, 29, 13, 1)
                                                  : Colors.green,
                                              fontSize: 12),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 28),
                                  Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Text(
                                          "${value.dataList.data!.data[widget.index].batch_timing_from} to ${value.dataList.data!.data[widget.index].batch_timing_to}",
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                          textAlign: TextAlign.end)),
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                widthFactor: .5,
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
                               Text(
                                 AppLocale.phoneNumber.getString(context),
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
                                  child: TextField(
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                    keyboardType: TextInputType.number,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      hintText: '+${value.dataList.data!
                                          .data[widget.index].traineeUserid}',
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
                              const SizedBox(height: 15),
                               Text(
                                AppLocale.fullName.getString(context),
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
                                  child: TextField(
                                    style: const TextStyle(fontSize: 14),
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      filled: true,
                                      hintText: value.dataList.data!
                                          .data[widget.index].traineeName,
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
                                      // Add this line
                                      fillColor: Colors.grey[200],),
                                  )),
                              const SizedBox(height: 15),
                               Text(
                                AppLocale.dob.getString(context),
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
                                  child: TextField(
                                    style: const TextStyle(fontSize: 14),
                                    readOnly: true,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      hintText: value.dataList.data!
                                          .data[widget.index].dob,
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
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 10),
                                       Text(
                                        AppLocale.doj.getString(context),
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff39404A)),
                                      ),
                                      const SizedBox(height: 4),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              .4,
                                          height: 48,
                                          child: TextField(
                                            style:
                                            const TextStyle(fontSize: 14),
                                            readOnly: true,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              hintText: value
                                                  .dataList
                                                  .data!
                                                  .data[widget.index]
                                                  .dateOfJoining,
                                              hintStyle: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff626D7E),
                                              ),
                                              contentPadding:
                                              const EdgeInsets.all(10),
                                              border: const OutlineInputBorder(),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(8),
                                                borderSide: const BorderSide(
                                                    color: Color(0xffD0D3D8)),
                                              ),
                                              filled: true,
                                              // Add this line
                                              fillColor: Colors.grey[200],
                                            ),
                                          )),
                                    ],
                                  ),
                                  const SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 10),
                                       Text(
                                         AppLocale.moB.getString(context),
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff39404A)),
                                      ),
                                      const SizedBox(height: 4),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width *
                                              .4,
                                          height: 48,
                                          child: TextField(
                                            style:
                                            const TextStyle(fontSize: 14),
                                            readOnly: true,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                                hintText: value
                                                    .dataList
                                                    .data!
                                                    .data[widget.index]
                                                    .monthOfBilling,
                                                hintStyle: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff626D7E),
                                                ),
                                                contentPadding:
                                                const EdgeInsets.all(10),
                                                border: const OutlineInputBorder(),
                                                enabledBorder:
                                                OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(8),
                                                  borderSide: const BorderSide(
                                                      color: Color(0xffD0D3D8)),
                                                ),
                                                filled: true,
                                                // Add this line
                                                fillColor: Colors.grey[200]),
                                          )),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(height: 15),
                               Text(
                                 AppLocale.fee.getString(context),
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
                                  child: TextField(
                                      style: const TextStyle(fontSize: 14),
                                      readOnly: true,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        hintText:
                                        '₹${value.dataList.data!.data[widget.index].fees}',
                                        hintStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff626D7E),
                                        ),
                                        contentPadding: const EdgeInsets.all(10),
                                        border: const OutlineInputBorder(),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(8),
                                          borderSide: const BorderSide(
                                              color: Color(0xffD0D3D8)),
                                        ),
                                        filled: true,
                                        // Add this line
                                        fillColor: Colors.grey[200],
                                      ))),
                            ],
                          ),
                        )
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
