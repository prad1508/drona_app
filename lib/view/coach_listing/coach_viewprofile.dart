import 'package:drona/data/response/status.dart';
import 'package:drona/res/app_url.dart';
import 'package:drona/utils/no_data.dart';
import 'package:drona/view/batch_listing/editprofile_details.dart';
import 'package:drona/view_model/trainee_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../view_model/myservices_view_model.dart';
import '../../view_model/program_view_model.dart';

class CoachViewProfile extends StatefulWidget {
  const CoachViewProfile({super.key, required this.index});

  final int index;

  @override
  State<CoachViewProfile> createState() => _CoachViewProfileState();
}

class _CoachViewProfileState extends State<CoachViewProfile> {
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
          'View Profile',
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      onTap: (){},
                                      child: SizedBox(
                                          height: 26,
                                          width: 26,
                                          child: Image.asset('assets/images/edit_icon.png')),
                                    ),
                                  ),
                                ),
                                value.dataList.data!.data[widget.index]
                                    .image.isNotEmpty
                                    ? CircleAvatar(
                                  maxRadius: 35,
                                  backgroundImage: NetworkImage(
                                    AppUrl.profileserviceIconEndPoint +
                                        value.dataList.data!
                                            .data[widget.index].image,
                                  ),
                                  // AssetImage('assets/images/user_profile.png'),
                                )
                                    : CircleAvatar(
                                  maxRadius: 35,
                                  backgroundColor: Colors.blue,
                                  child: Text(
                                    getInitials(value.dataList.data!
                                        .data[widget.index].traineeName),
                                    style: const TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                  // backgroundImage: getInitials(value.dataList.data!.data[index].traineeName),
                                ),
                                SizedOverflowBox(
                                  size: const Size(50, 1),
                                  alignment: Alignment.bottomCenter,
                                  child:
                                  Container(
                                    height: 18,
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5, top: 2),
                                    decoration: BoxDecoration(
                                        color: value.dataList.data!.data[widget.index]
                                            .status ==
                                            'active'? const Color.fromRGBO(71, 192, 136, 1):const Color.fromRGBO(241, 94, 83, 1),
                                        borderRadius:
                                        BorderRadius.circular(5)),
                                    child: Text(
                                      value.dataList.data!.data[widget.index]
                                          .status ==
                                          'active'
                                          ? 'Active'
                                          : 'Not Active',
                                      style: TextStyle(
                                          color: value
                                              .dataList
                                              .data!
                                              .data[widget.index]
                                              .status ==
                                              'active'
                                              ? Colors.white
                                              : Colors.white,
                                          fontSize: 10),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const Padding(padding: EdgeInsets.only(top: 5)),
                            Text(
                              value.dataList.data!.data[widget.index]
                                  .traineeName,
                              style: const TextStyle(fontSize: 12),
                            ),
                            const Padding(padding: EdgeInsets.only(top: 2)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                  '${DateTime.now().year - int.parse(value.dataList.data!.data[widget.index].dob.split('/')[2])} Years',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
                          child: SizedBox(
                            width: 342,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Row(
                                      children: [
                                        Text('Tel : '),
                                        Text('+91 99999 99999')
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text('Joined On : '),
                                        Text(value.dataList.data!.data[widget.index].dateOfJoining)
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Row(
                                      children: [
                                        Text('E-mail : '),
                                        Text('johndoe@email.com')
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Text('Salary : '),
                                        Text('₹${value.dataList.data!.data[widget.index].fees.toString()}')
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(),
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                          alignment: Alignment.bottomLeft,
                          decoration: BoxDecoration(
                            color: Colors.grey[100]
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Tennis, Cricket, Golf'),
                              Padding(padding: EdgeInsets.only(top: 6)),
                              Text('Services', style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300
                              ),)
                            ],
                          ),
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(children: [
                            const Text('Batch List', style: TextStyle(
                              fontSize: 15
                            ),),
                            Container(
                              margin: const EdgeInsets.only(left: 8),
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                shape: BoxShape.circle
                              ),
                              child: const Text('03', style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                                color: Colors.blue,
                              ),),
                            )
                          ],),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 20)),
                        Container(
                          padding: const EdgeInsets.only(top: 10,bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey[50]
                          ),
                          child: Padding(
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
                                        backgroundColor: Colors.grey[300],
                                        child: Image.asset('assets/images/tennis.png')
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
                                        const Text(
                                          'Tennis Batch',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(left: 5),
                                          padding: const EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              shape: BoxShape.circle
                                          ),
                                          child: const Text('03', style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black,
                                          ),),
                                        )
                                      ],
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 5)),
                                    const Text(
                                      'Advance - M,W,F - 09:15am to 10:15am',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const Row(
                                      children: [
                                        Text('Fee : '),
                                        Text(
                                          '₹15,000',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Padding(padding: EdgeInsets.only(left: 10)),
                                Align(
                                  alignment: Alignment.topCenter,
                                  widthFactor: 1.5,
                                  child: Container(
                                    height: 18,
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5, top: 2),
                                    decoration: BoxDecoration(
                                        color: value.dataList.data!.data[widget.index]
                                            .status ==
                                            'active'? const Color.fromRGBO(71, 192, 136, 1):const Color.fromRGBO(241, 94, 83, 1),
                                        borderRadius:
                                        BorderRadius.circular(5)),
                                    child: Text(
                                      value.dataList.data!.data[widget.index]
                                          .status ==
                                          'active'
                                          ? 'Active'
                                          : 'Not Active',
                                      style: TextStyle(
                                          color: value
                                              .dataList
                                              .data!
                                              .data[widget.index]
                                              .status ==
                                              'active'
                                              ? Colors.white
                                              : Colors.white,
                                          fontSize: 10),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(),
                        Container(
                          padding: const EdgeInsets.only(top: 10,bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.grey[50]
                          ),
                          child: Padding(
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
                                          backgroundColor: Colors.grey[300],
                                          child: Image.asset('assets/images/Golf.png')
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
                                        const Text(
                                          'Golf Batch',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(left: 5),
                                          padding: const EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              shape: BoxShape.circle
                                          ),
                                          child: const Text('03', style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black,
                                          ),),
                                        )
                                      ],
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 5)),
                                    const Text(
                                      'Advance - M,W,F - 09:15am to 10:15am',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const Row(
                                      children: [
                                        Text('Fee : '),
                                        Text(
                                          '₹15,000',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Padding(padding: EdgeInsets.only(left: 10)),
                                Align(
                                  alignment: Alignment.topCenter,
                                  widthFactor: 1.5,
                                  child: Container(
                                    height: 18,
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5, top: 2),
                                    decoration: BoxDecoration(
                                        color: value.dataList.data!.data[widget.index]
                                            .status ==
                                            'active'? const Color.fromRGBO(71, 192, 136, 1):const Color.fromRGBO(241, 94, 83, 1),
                                        borderRadius:
                                        BorderRadius.circular(5)),
                                    child: Text(
                                      value.dataList.data!.data[widget.index]
                                          .status ==
                                          'active'
                                          ? 'Active'
                                          : 'Not Active',
                                      style: TextStyle(
                                          color: value
                                              .dataList
                                              .data!
                                              .data[widget.index]
                                              .status ==
                                              'active'
                                              ? Colors.white
                                              : Colors.white,
                                          fontSize: 10),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(),
                        Container(
                          padding: const EdgeInsets.only(top: 10,bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.grey[50]
                          ),
                          child: Padding(
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
                                          backgroundColor: Colors.grey[300],
                                          child: Image.asset('assets/images/tennis.png')
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
                                        const Text(
                                          'Cricket Batch',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(left: 5),
                                          padding: const EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              shape: BoxShape.circle
                                          ),
                                          child: const Text('03', style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black,
                                          ),),
                                        )
                                      ],
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 5)),
                                    const Text(
                                      'Advance - M,W,F - 09:15am to 10:15am',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const Row(
                                      children: [
                                        Text('Fee : '),
                                        Text(
                                          '₹15,000',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Padding(padding: EdgeInsets.only(left: 10)),
                                Align(
                                  alignment: Alignment.topCenter,
                                  widthFactor: 1.5,
                                  child: Container(
                                    height: 18,
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5, top: 2),
                                    decoration: BoxDecoration(
                                        color: value.dataList.data!.data[widget.index]
                                            .status ==
                                            'active'? const Color.fromRGBO(71, 192, 136, 1):const Color.fromRGBO(241, 94, 83, 1),
                                        borderRadius:
                                        BorderRadius.circular(5)),
                                    child: Text(
                                      value.dataList.data!.data[widget.index]
                                          .status ==
                                          'active'
                                          ? 'Active'
                                          : 'Not Active',
                                      style: TextStyle(
                                          color: value
                                              .dataList
                                              .data!
                                              .data[widget.index]
                                              .status ==
                                              'active'
                                              ? Colors.white
                                              : Colors.white,
                                          fontSize: 10),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
