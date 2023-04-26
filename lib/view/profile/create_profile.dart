import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import '../../res/language/language.dart';
import '../../res/widget/customradio.dart';
import '../../res/widget/datefield.dart';
import '../../res/widget/round_button.dart';
import '../../utils/routes/routes_name.dart';
import 'package:image_picker/image_picker.dart';
import '../../res/widget/synctextform.dart';
import '../../utils/validation.dart';
import '../../view_model/myservices_view_model.dart';
import '../../view_model/user_view_model.dart';
import '../layout.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  final TextEditingController coachName = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController inviteCode = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController salary = TextEditingController();
  final TextEditingController doj = TextEditingController();
  final TextEditingController dob = TextEditingController();
  MyservicesViewViewModel myservicesViewViewModel = MyservicesViewViewModel();
  UserViewModel userViewModel = UserViewModel();
  String? _genderValue = 'm';
  String userProfile = '';
  ValueChanged<String?> _genderChangedHandler() {
    return (value) => setState(() => _genderValue = value!);
  }

//profille image picke
  File? imgFile;
  final imgPicker = ImagePicker();
  String selectedService = "fymg3n6d8g69cysc4hhr";
  void openCamera() async {
    var imgCamera = await imgPicker.pickImage(source: ImageSource.camera);
    userViewModel.fetchouserProfileimg(imgCamera!.path, context);
    // ignore: use_build_context_synchronously

    setState(() {
      imgFile = File(imgCamera!.path);
    });
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }

  void openGallery() async {
    var imgGallery = await imgPicker.pickImage(source: ImageSource.gallery);

    userViewModel.fetchouserProfileimg(imgGallery!.path, context);
    setState(() {
      imgFile = File(imgGallery!.path);
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
    myservicesViewViewModel.fetchMyservicesListApi();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserViewModel>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            AppLocale.createProfile.getString(context),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const Layout(
                      selectedIndex: 0,
                    ),
                  ),
                );
              },
              child: Text(
                AppLocale.skip.getString(context),
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
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
                      validationDebounce: const Duration(milliseconds: 500),
                      validator: Validation().isPhoneField,
                      keyboardType: TextInputType.phone,
                      hintText: 'eg. 9876521233',
                      isValidatingMessage:
                          'Enter a valid 10 digit mobile number',
                      valueIsInvalidMessage:
                          'Enter a valid 10 digit mobile number'),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      AppLocale.title19.getString(context),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomRadio<String>(
                        btnColor: Colors.black,
                        value: 'm',
                        groupValue: _genderValue,
                        onChanged: _genderChangedHandler(),
                        label: AppLocale.male.getString(context),
                      ),
                      CustomRadio<String>(
                        btnColor: Colors.black,
                        value: 'f',
                        groupValue: _genderValue,
                        onChanged: _genderChangedHandler(),
                        label: AppLocale.female.getString(context),
                      ),
                      CustomRadio<String>(
                        btnColor: Colors.black,
                        value: 'o',
                        groupValue: _genderValue,
                        onChanged: _genderChangedHandler(),
                        label: AppLocale.other.getString(context),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      AppLocale.emailId.getString(context),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      hintText: 'e.g. xyz@email.com',
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
                      AppLocale.salaryMonth.getString(context),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
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
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      AppLocale.title33.getString(context),
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
                          List<DropdownMenuItem<String>> dropdownItems =
                              List.generate(
                                  value.dataList.data?.services!.length ?? 0,
                                  (index) {
                            return DropdownMenuItem(
                                value: value.dataList.data?.services?[index].uid
                                    .toString(),
                                child: Text(value.dataList.data
                                        ?.services?[index].serviceName
                                        .toString() ??
                                    ''));
                          });
                          return DropdownButton(
                              isExpanded: true,
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
                      AppLocale.doj.getString(context),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  DateOfjoining(
                      controller: doj,
                      hintText: 'Doj'),
                  const SizedBox(
                    height: 15,
                  ),
                 
                  RoundButton(
                      loading: false,
                      title: AppLocale.addCoach.getString(context),
                      textColor: Colors.white,
                      rounded: true,
                      color: Theme.of(context).primaryColor,
                      onPress: () async {
                         final SharedPreferences sp = await SharedPreferences.getInstance();
                        Map data ={
                              "service_uid": selectedService.toString(),
                              "fullname": coachName.text.toString(),
                              "ccode":"91",
                              "mobno":phone.text.toString(),
                              "gender": _genderValue.toString(),
                              "email": email.text.toString(),
                              "salary":salary.text.toString(),
                              "dateofjoining": doj.text.toString(),
                              "dob": dob.text.toString(),
                              "img":sp.getString('uprofile'),
                              "relation":"self"
                          };
                        user.userProfileAdd(data, context);
                    
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
