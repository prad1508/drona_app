


import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import '../../res/language/language.dart';
import '../../res/widget/customradio.dart';
import '../../res/widget/datefield.dart';
import '../../res/widget/round_button.dart';
import '../../utils/routes/routes_name.dart';
import 'package:image_picker/image_picker.dart';
import '../../res/widget/synctextform.dart';
import '../../utils/utils.dart';
import '../../utils/validation.dart';
import '../../view_model/batchList_view_model.dart';
import '../../view_model/myservices_view_model.dart';
import '../../view_model/trainee_view_model.dart';
import '../../view_model/user_view_model.dart';
import '../dashboard/layout.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';

class AddTrainneInExisitingBatch extends StatefulWidget {
  int listindex;
  String pathPage;
  AddTrainneInExisitingBatch({super.key , this.listindex=-1, this.pathPage=''});
  @override
  State<AddTrainneInExisitingBatch> createState() => _AddTrainneInExisitingBatchState();
}

class _AddTrainneInExisitingBatchState extends State<AddTrainneInExisitingBatch> {
  final TextEditingController coachName = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController inviteCode = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController salary = TextEditingController();
  final TextEditingController doj = TextEditingController();
  final TextEditingController dob = TextEditingController();
  final TextEditingController monthofBilling = TextEditingController();
  MyservicesViewViewModel myservicesViewViewModel = MyservicesViewViewModel();
  BatchListViewViewModel batchListViewViewModel = BatchListViewViewModel();
  TraineeViewModel programViewViewModel = TraineeViewModel();
  UserViewModel userViewModel = UserViewModel();
  String? _genderValue = 'm';
  String userProfile = '';
  ValueChanged<String?> _genderChangedHandler() {
    return (value) => setState(() => _genderValue = value!);
  }

  List<DropdownMenuItem<String>> dropdownItems = [];
  List<DropdownMenuItem<String>> dropdownItems1 = [];

//profille image picke
  File? imgFile;
  final imgPicker = ImagePicker();
  String? selectedService;
  String? selectedService1;
  void openCamera() async {
    var imgCamera = await imgPicker.pickImage(source: ImageSource.camera);
    userViewModel.fetchouserProfileimg(imgCamera!.path, context);
    // ignore: use_build_context_synchronously

    setState(() {
      imgFile = File(imgCamera.path);
      print("imgFile$imgFile");
    });
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }

  void openGallery() async {
    var imgGallery = await imgPicker.pickImage(source: ImageSource.gallery);

    userViewModel.fetchouserProfileimg(imgGallery!.path, context);
    setState(() {
      imgFile = File(imgGallery.path);
      print("imgFile$imgFile");
    });
    Navigator.of(context).pop();
  }

  //bottomsheet popup
  showcameraoption() {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
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
                        children: [
                          const Text(
                            'Profile Picture',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Loto-Regular'),
                          ),
                          IconButton(
                            onPressed: (() {
                              setState(() {
                                imgFile = null;
                                Navigator.pop(context);
                              });
                            }),
                            icon: const Icon(Icons.delete_outline),
                            color: Colors.black,
                            iconSize: 30,
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
                      Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          onPressed: openCamera,
                          child: Text(
                            'Camera',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: TextButton(
                          onPressed: openGallery,
                          child: Text(
                            'Gallery',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
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
  void initState() {
    // TODO: implement initState
    super.initState();
    batchListViewViewModel.fetchBatchListListApi();
    myservicesViewViewModel.fetchMyservicesListApi();
  }

  @override
  Widget build(BuildContext context) {
    final traineeViewModel = Provider.of<TraineeViewModel>(context);
    final user = Provider.of<UserViewModel>(context);
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child:
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            leading:
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(
              AppLocale.addTrainee.getString(context),
              style: Theme.of(context).textTheme.bodyLarge,
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
                    Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: SizedBox(
                            height: 120,
                            width: 120,
                            child: Stack(
                              clipBehavior: Clip.none,
                              fit: StackFit.expand,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.grey[500],
                                  radius: 70,
                                  child: CircleAvatar(
                                    radius: 65,
                                    backgroundColor: Colors.white,
                                    backgroundImage: imgFile == null
                                        ? const AssetImage(
                                        'assets/images/user_profile.png')
                                        : FileImage(imgFile!) as ImageProvider,
                                  ),
                                ),
                                Positioned(
                                    top: -5,
                                    right: -10,
                                    height: 182,
                                    width: 40,
                                    child: RawMaterialButton(
                                      onPressed: showcameraoption,
                                      elevation: 2.0,
                                      fillColor: Theme.of(context).primaryColor,
                                      padding: const EdgeInsets.all(10),

                                      // padding: EdgeInsets.all(1.0),
                                      shape: const CircleBorder(
                                          side: BorderSide(
                                              color: Colors.white, width: 2)),

                                      child: Image.asset(
                                          'assets/images/add_a_photo.png',
                                          fit: BoxFit.contain),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        AppLocale.phoneNumber.getString(context),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    AsyncTextFormField(
                        controller: phone,
                        validationDebounce: const Duration(milliseconds: 100),
                        validator: Validation().isPhoneField,
                        keyboardType: TextInputType.phone,
                        hintText: 'eg. 9876521233',
                        isValidatingMessage:
                        'Enter a valid 10 digit mobile number',
                        valueIsInvalidMessage:
                        'Enter a valid 10 digit mobile number'),
                    const SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Full Name",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: coachName,
                      decoration: InputDecoration(
                        hintText: 'eg. Rakesh Bansal',
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
                        AppLocale.dob.getString(context),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DateOfBirth(
                        controller: dob,
                        hintText: AppLocale.dob.getString(context)),
                    const SizedBox(
                      height: 15,
                    ),

                    // const SizedBox(
                    //   height: 15,
                    // ),

                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Service",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: const Color.fromARGB(255, 218, 216, 216)),
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                      ),
                      child: ChangeNotifierProvider<MyservicesViewViewModel>(
                          create: (context) => myservicesViewViewModel,
                          child: Consumer<MyservicesViewViewModel>(
                              builder: (context, value, child) {
                                if(value.dataList.data!=null)
                                {
                                  dropdownItems.clear();
                                  for (var i = 0; i < value.dataList.data!.services!.length; i++) {
                                    dropdownItems.add(DropdownMenuItem(
                                        value: value.dataList.data!.services![i].uid.toString(),
                                        child: Text(value.dataList.data!.services![i].serviceName.toString())));
                                  }
                                }
                                return DropdownButton(
                                    isExpanded: true,
                                    hint: const Text("Choose Service"),
                                    underline: DropdownButtonHideUnderline(
                                        child: Container()),
                                    value: selectedService,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedService = newValue!;
                                      });
                                    },
                                    items: dropdownItems);


                              })),
                    ),
                    const SizedBox(
                      height: 15,
                    ),


                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Batch",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: const Color.fromARGB(255, 218, 216, 216)),
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                      ),
                      child: ChangeNotifierProvider<BatchListViewViewModel>(
                          create: (context) => batchListViewViewModel,
                          child: Consumer<BatchListViewViewModel>(
                              builder: (context, value, child) {
                                if(value.dataList.data!=null)
                                {
                                  dropdownItems1.clear();
                                  for (var i = 0; i < value.dataList.data!.data!.length; i++) {
                                    if(selectedService1 == value.dataList.data!.data?[i].uid )
                                      {
                                        salary.text =  value.dataList.data!.data![i].fees.toString();
                                      }
                                    /// check service with batch name
                                    if(value.dataList.data!.data?[i].serviceUid == selectedService) {
                                      dropdownItems1.add(
                                        DropdownMenuItem(
                                        value: value.dataList.data!.data![i].uid.toString(),
                                        child: Text(value.dataList.data!.data![i].batchName.toString()))
                                    );
                                    }
                                  }
                                }
                                return DropdownButton(
                                    isExpanded: true,
                                    hint: const Text("Choose Batch"),
                                    underline: DropdownButtonHideUnderline(
                                        child: Container()),
                                    value: selectedService1,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedService1 = newValue!;
                                      });
                                    },
                                    items: dropdownItems1);


                              })),
                    ),
                    const SizedBox(
                      height: 15,
                    ),


                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        AppLocale.fee.getString(context),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: salary,
                      decoration: InputDecoration(
                        hintText: 'e.g. ₹200',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  AppLocale.doj.getString(context),
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              DateOfjoining(controller: doj, hintText: 'Doj'),

                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Month of Billing",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              YearMonthPicker(
                                  controller: monthofBilling,
                                  hintText: 'Month of Billing'),
                              // DateOfjoining(
                              //     controller: dobilling,
                              //     hintText: 'Month of Billing'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    RoundButton(
                        loading: false,
                        title: AppLocale.sendInvite.getString(context),
                        textColor: Colors.white,
                        rounded: true,
                        color: Theme.of(context).primaryColor,
                        onPress: ()  {
                          // final SharedPreferences sp = await SharedPreferences.getInstance();
                          if (phone.text.isEmpty) {
                            Utils.flushBarErrorMessage(
                                'Fill Phone Number Name', context);
                          } else if (coachName.text.isEmpty) {
                            Utils.flushBarErrorMessage(
                                'Fill Trainee Name', context);
                          } else if (dob.text.isEmpty) {
                            Utils.flushBarErrorMessage(
                                'Please Enter DOB', context);
                          }

                          // else if (salary.text.isEmpty) {
                          //   Utils.flushBarErrorMessage(
                          //       'Please Enter Salary', context);
                          // }
                          else if (doj.text.isEmpty) {
                            Utils.flushBarErrorMessage(
                                'Please Enter Date of Joining', context);
                          }
                          else if (monthofBilling.text.isEmpty) {
                            Utils.flushBarErrorMessage(
                                'Please Enter Month of Billing', context);
                          }
                          else if (selectedService==null && selectedService!=''  ) {
                            Utils.flushBarErrorMessage(
                                'Please Select Service', context);
                          }
                          else
                          {

                              Map<String, dynamic> data = {
                                "batch_uid": selectedService1.toString(),
                                "fullname": coachName.text,
                                "ccode": "91",
                                "mobno": phone.text,
                                "gender": _genderValue,
                                "fees": salary.text,
                                "dateofjoining": doj.text,
                                // "age": age.text,
                                "dob": dob.text,
                                "monthofbilling": monthofBilling.text,
                                "img": "",
                                "relation": "self"
                              };

                              traineeViewModel.fetchTraineeAddListApi(data, context ,"onboarding");

                            //  traineeViewModel.fetchTraineeAddListApi(data, context ,"onboarding");

                            // Map data = {
                            //   "service_uid": selectedService.toString(),
                            //   "fullname": coachName.text.toString(),
                            //   "ccode": "91",
                            //   "mobno": phone.text.toString(),
                            //   "gender": _genderValue.toString(),
                            //   "email": email.text.toString(),
                            //   "salary": salary.text,
                            //   "dateofjoining": doj.text.toString(),
                            //   "dob": dob.text.toString(),
                            //   // "img":sp.getString('uprofile'),
                            //   "img": imgFile.toString(),
                            //   "relation": "self"
                            // };
                            // print(data);
                            // showDialog(
                            //   barrierDismissible: false,
                            //   context: context,
                            //   builder: (BuildContext context) {
                            //     return Center(
                            //       child: AlertDialog(
                            //         //  title: const Center(child: Text('')),
                            //         content:   Column(
                            //           mainAxisSize: MainAxisSize.min,
                            //           children: [
                            //             Container(
                            //               width: 50,
                            //               height: 50,
                            //               decoration: const BoxDecoration(
                            //                 color: Colors.green,
                            //                 shape: BoxShape.circle,
                            //               ),
                            //               child: const Icon(
                            //                 Icons.check,
                            //                 color: Colors.white,
                            //               ),
                            //             ),
                            //             const SizedBox(height: 5),
                            //             const Text("Send Invite",style: TextStyle(
                            //                 fontSize: 14
                            //             ),),
                            //             const SizedBox(height: 5),
                            //
                            //             Text('Invite "${coachName.text}" To Your Academy',style: const TextStyle(
                            //                 fontSize: 14,
                            //                 fontWeight: FontWeight.w200
                            //             ),),
                            //             SizedBox(height: 5),
                            //
                            //           ],
                            //         ),
                            //         contentPadding: EdgeInsets.all(15),
                            //         actions: [
                            //           Padding(
                            //             padding: const EdgeInsets.all(10.0),
                            //             child: Container(
                            //                 width: double.infinity,
                            //                 child: RoundButton(
                            //                   title: 'Send Invitation',
                            //                   onPress: () async {
                            //                     Navigator.pop(context);
                            //                     print(data);
                            //                     if(widget.listindex!=-1)
                            //                     {
                            //                       user.userProfileAdd(data, context , widget.pathPage,widget.listindex);
                            //                     }
                            //                     else
                            //                     {
                            //                       user.userProfileAdd(data, context , widget.pathPage);
                            //                     }
                            //                   },
                            //                   rounded: true,
                            //                   color: Theme.of(context).primaryColor,
                            //                   textColor: Colors.white,
                            //
                            //                 )
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //     );
                            //   },
                            // );
                          }


                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> showExitPopup(context) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SizedBox(
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.close_rounded,
                      color: Colors.redAccent,
                      size: 50.0,
                    ),
                  ),
                  const Text("Do you want to exit?"),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            child: const Text("No",
                                style: TextStyle(color: Colors.black)),
                          )),
                      const SizedBox(width: 15),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            exit(0);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent),
                          child: const Text(
                            "Yes",
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }


}