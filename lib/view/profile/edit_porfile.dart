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
import '../dashboard/layout.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  EditProfile({super.key });

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController fullName = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController alternatephone = TextEditingController();
  final TextEditingController inviteCode = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController salary = TextEditingController();
  final TextEditingController doj = TextEditingController();
  final TextEditingController dob = TextEditingController();
  final TextEditingController facebook = TextEditingController();
  final TextEditingController linkedin = TextEditingController();
  final TextEditingController youtube = TextEditingController();
  MyservicesViewViewModel myservicesViewViewModel = MyservicesViewViewModel();
  UserViewModel userViewModel = UserViewModel();
  String? _genderValue = 'm';
  String userProfile = '';
  ValueChanged<String?> _genderChangedHandler() {
    return (value) => setState(() => _genderValue = value!);
  }

  List<DropdownMenuItem<String>> dropdownItems = [];

//profille image picke
  File? imgFile;
  final imgPicker = ImagePicker();
  String? selectedService;
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
    myservicesViewViewModel.fetchMyservicesListApi();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserViewModel>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          AppLocale.editProfile.getString(context),
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
                  child: Text("Full Name",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: fullName,
                  decoration: InputDecoration(
                    hintText: '@${AppLocale.eg.getString(context)}. Rakesh Bansal',
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
                  hintText: '@${AppLocale.eg.getString(context)}. 9876521233',
                  isValidatingMessage: AppLocale.valid10digitError.getString(context),
                  valueIsInvalidMessage: AppLocale.valid10digitError.getString(context),
                  valueIsEmptyMessage: '',),
                const SizedBox(
                  height: 15,
                ),

                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                      AppLocale.alternateNumber.getString(context),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                AsyncTextFormField(
                  controller: alternatephone,
                  validationDebounce: const Duration(milliseconds: 100),
                  validator: Validation().isPhoneField,
                  keyboardType: TextInputType.phone,
                  hintText: '${AppLocale.eg.getString(context)}, 9876521233',
                  isValidatingMessage:
                  AppLocale.valid10digitError.getString(context),
                  valueIsInvalidMessage:
                  AppLocale.valid10digitError.getString(context),
                  valueIsEmptyMessage: AppLocale.valueIsEmptyMessage.getString(context),),
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

                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    AppLocale.gender.getString(context),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                    hintText: '${AppLocale.eg.getString(context)}. xyz@email.com',
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
                    AppLocale.socialMediaUrl.getString(context),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: facebook,
                  decoration: InputDecoration(
                    hintText: AppLocale.facebook.getString(context),
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
                TextFormField(
                  controller: youtube,
                  decoration: InputDecoration(
                    hintText: AppLocale.youtube.getString(context),
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
                TextFormField(
                  controller: linkedin,
                  decoration: InputDecoration(
                    hintText: AppLocale.linkedIn.getString(context),
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
                  height: 30,
                ),





                RoundButton(
                    loading: false,
                    title: AppLocale.submit.getString(context),
                    textColor: Colors.white,
                    rounded: true,
                    color: Theme.of(context).primaryColor,
                    onPress: () async {
                      final SharedPreferences sp =
                      await SharedPreferences.getInstance();
                      Map data = {
                        "service_uid": selectedService.toString(),
                        "fullname": fullName.text.toString(),
                        "ccode": "91",
                        "mobno": phone.text.toString(),
                        "gender": _genderValue.toString(),
                        "email": email.text.toString(),
                        "salary": salary.text.toString(),
                        "dateofjoining": doj.text.toString(),
                        "dob": dob.text.toString(),
                        // "img":sp.getString('uprofile'),
                        "img": imgFile.toString(),
                        "relation": "self"
                      };
                      print(data);
                      // user.userProfileAdd(data, context);

                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
