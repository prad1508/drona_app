import 'dart:convert';

import 'package:drona/view/Academy_Listing/select_multiCoach.dart';
import 'package:drona/view/registeration/choose_facility.dart';
import 'package:drona/view/registeration/choose_service.dart';
import 'package:drona/view/registeration/login_view.dart';
import 'package:drona/view_model/user_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';
import '../model/user_model.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';
import '../view/Academy_Listing/chooose_program2.dart';
import '../view/Academy_Listing/choose_facility2.dart';
import '../view/Academy_Listing/facility_program.dart';
import '../view/academy/service_program.dart';
import '../view/dashboard/layout.dart';
import '../view/registeration/choose_program.dart';
import '../view/registeration/detail_filled.dart';
import '../view/registeration/forget_otp.dart';
import '../view/registeration/new_password.dart';
import '../view/registeration/otp.dart';
import '../view/registeration/tellus_acadmic.dart';
import '../view/welcome_screen.dart';
import '/respository/registration_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationViewModel with ChangeNotifier {
  final _myRepo = RegistrationRepository();

  bool _loading = false;
  bool get loading => _loading;

  final bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  //setUid
  String _uid = '';
  String get uid => _uid;
  setUid(String value) {
    _uid = value;
    notifyListeners();
  }

  //setMobile
  String _mobno = '';
  String get mobno => _mobno;
  setMobno(String value) {
    _mobno = value;
    notifyListeners();
  }

  //setforgettoken
  String _prToken = '';
  String get prToken => _prToken;
  setPrToken(String value) {
    _prToken = value;
    notifyListeners();
  }

  Future<void> register(dynamic data, BuildContext context) async {
    setLoading(true);

    _myRepo.fetchRegistrationListApi(data).then((value) async {
      setLoading(false);
      final prefs = await SharedPreferences.getInstance();
      prefs.setString(value['data']['role'],'role');
      print( value['data']['name']);
      print( value['data']['email']);
      print( value['data']['ccode']);
      print(  value['data']['mobno']);
      print( value['data']['role']);
      print(  value['data']['gender']);
      prefs.setStringList('registerResponse', <String>[
        value['data']['name'],
        value['data']['email'],
        value['data']['ccode'],
        value['data']['mobno'],
        value['data']['role'],
        value['data']['gender'],
        // value['data']['academy_name']
      ]);

      prefs.setString('role',value['data']['role']);
      // ignore: use_build_context_synchronously
     // Utils.flushBarErrorMessage('Register Successfully', context);
      // ignore: use_build_context_synchronously
     /* Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => OtpPage(registration: data),
        ),
      );*/
      Get.to(() => OtpPage(registration: data),transition: Transition.rightToLeft);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  //////////////otp verify ////////////////////////////////////
  Future<void> otpVerify(dynamic otp, BuildContext context) async {
    final prefsData = await SharedPreferences.getInstance();
    List<String>? items = prefsData.getStringList('registerResponse');
    Map data = {
      'ccode': items![2].toString(),
      'mobno': items[3].toString(),
      'otp': otp.toString()
    };
    _myRepo.fetchOtpListApi(data).then((value) async {
      prefsData.setString('token', value['token']);
      if (kDebugMode) {
        print("token ${value['token']}");
      }
      setLoading(false);
      Utils.flushBarErrorMessage('Otp Verify Successfully', context);
      //Navigator.pushNamed(context, RoutesName.tellusAcadmic);
      Get.to(() => const TellusAcadmic(),transition: Transition.rightToLeft);

    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  //////////////Basic Details ////////////////////////////////////
  Future<void> basicDetails(
      dynamic data, BuildContext context, uid, acadmicName) async {
    setLoading(true);
    /// use hsared prefrences

    print("uid is coming is $uid");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('uid',uid);



    setUid(uid);
    _myRepo.basicDetailsListApi(data).then((value) async {
      setLoading(false);
      final prefsData = await SharedPreferences.getInstance();
      print(value);
      prefsData.setString('acadmicName', acadmicName);
      // prefsData.setStringList("registerResponse", <String>[
      //   value['name'].toString(),
      //   value['email'].toString(),
      //   value['ccdoe'].toString(),
      //   value['mobno'].toString(),
      //   value['role'].toString(),
      //   value['gender'].toString(),
      //   //!check ? value['Profiles'][0]['academy_name'].toString() :''
      // ]);

      if(value['academy_name']!=null)
      {
        prefsData.setString('acadmicName', value['academy_name']);
      }
      Utils.flushBarErrorMessage('Basic Details update Successfully', context);
      //Navigator.pushNamed(context, RoutesName.chooseService);
      Get.to(() => const ChooseService(),transition: Transition.rightToLeft);

    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  //////////////Service Post ////////////////////////////////////
  Future<void> servicePost(dynamic data, BuildContext context) async {
    setLoading(true);
    setUid(uid);

    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('service_name', data['services'][0]['service_name']);

    _myRepo.servicePostListApi(data).then((value) async {
      setLoading(false);
      Utils.flushBarErrorMessage('Services update Successfully', context);
      //Navigator.pushNamed(context, RoutesName.chooseFacility);
      Get.to(() => const ChooseFacility(),transition: Transition.rightToLeft);

    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }
  /// service post from dashboard
  Future<void> servicePostFromDashBoard(dynamic data, BuildContext context, {required String serviceUid, required String serviceName}) async {
    setLoading(true);
   //setUid(uid);

  print("serviceUid==$serviceUid");
  print("serviceName==$serviceName");

    _myRepo.servicePostSingleApi(data).then((value) async {
      setLoading(false);
      Utils.flushBarErrorMessage('Services update Successfully', context);
      //Navigator.pushNamed(context, RoutesName.chooseFacility);
      Get.to(() =>  ChooseFacility2(serviceUid: serviceUid, serviceName: serviceName),transition: Transition.rightToLeft);

    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }


  //////////////add facility ////////////////////////////////////
  Future<void> facilityePost(dynamic data, BuildContext context, {required String path, required String serviceUid,required String serviceName}) async {
    setLoading(true);
    _myRepo.facilityePostListApi(data).then((value) async {
      setLoading(false);
      Utils.flushBarErrorMessage('Facility Saved Successfully', context);
      //Navigator.pushNamed(context, RoutesName.chooseprogram);
      print("serviceuid==$serviceUid");
      print("path==$path");
      path.isNotEmpty ? Get.to(() =>  ChooseProgram2(serviceUid: serviceUid, serviceName: serviceName),transition: Transition.rightToLeft):
      Get.to(() => const ChooseProgram(),transition: Transition.rightToLeft);

    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }
  // edit facility

  Future<void> facilityeEditApiPost(dynamic data, BuildContext context, String serviceUid) async {
    setLoading(true);
    _myRepo.facilityEditListApi(data).then((value) async {
      setLoading(false);
      Utils.flushBarErrorMessage('Facility Saved Successfully', context);

      //Navigator.pushNamed(context, RoutesName.chooseprogram);
      Get.to(() =>  ServiceListPage(path: 'program&facility'),transition: Transition.rightToLeft);

    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }





//////////////program Save ////////////////////////////////////
  Future<void> programPost(dynamic data, BuildContext context) async {

    setLoading(true);
    setUid(uid);
    _myRepo.programPostListApi(data).then((value) async {
      String role ='';
      setLoading(false);
    //  Utils.flushBarErrorMessage('Program update Successfully', context);
      //Navigator.pushNamed(context, RoutesName.detailFilled);
      /// check role 1st
      final prefsData = await SharedPreferences.getInstance();
      List<String>? items = prefsData.getStringList('registerResponse');
      role = items![4];

      print("checking role , $role");
      // if(role == '0')
      //   {
      //   /*  Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (BuildContext context) =>  WelcomeScreen(),
      //       ),
      //     );*/
      //    // Navigator.pushNamed(context, RoutesName.WelcomeScreen);
      //     Get.to(() => const WelcomeScreen(),transition: Transition.rightToLeft);
      //
      //   }
      // else
      //   {
      //    /* Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (BuildContext context) => const DetailFilled(),
      //       ),
      //     );*/
      //     //Navigator.pushNamed(context, RoutesName.DetailFilled);
      //     Get.to(() => const DetailFilled(),transition: Transition.rightToLeft);
      //
      //
      //   }

    }).onError((error, stackTrace) {
      setLoading(false);

      //    var newerror = jsonDecode(error.toString()) ;

      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  /// program post from onboarding
  Future<void> programPostFromDashboard(dynamic data, BuildContext context, {required String serviceUid, required String serviceName}) async {

    setLoading(true);
    _myRepo.programPostListApi(data).then((value) async {
      setLoading(false);
      print("serviceName==$serviceName");
      Get.to(() =>  MultiCoachScreen(serviceUid: serviceUid, serviceName: serviceName,));


    }).onError((error, stackTrace) {
      setLoading(false);

      //    var newerror = jsonDecode(error.toString()) ;

      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }



  //////////////////////Details for owner /////////////////////////////////////
  Future<void> detailsOwner(dynamic data, BuildContext context) async {
    setLoading(true);
    setUid(uid);
    _myRepo.detailsOwnerPostListApi(data).then((value) async {
      setLoading(false);
      // Navigator.pushNamed(context, RoutesName.welcomeScreen);
     /* Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) =>  WelcomeScreen(),
        ),
      );*/
      Get.to(() => const WelcomeScreen(),transition: Transition.rightToLeft);

      Utils.flushBarErrorMessage(value['msg'], context);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  //////////////////////forget password /////////////////////////////////////
  Future<void> forgetPassword(dynamic data, BuildContext context) async {
    setLoading(true);
    setUid(uid);
    _myRepo.forgetPasswordListApi(data).then((value) async {
      setLoading(false);
      print("forget password api success");
      Utils.flushBarErrorMessage(value['msg'], context);
      setMobno(value['data']['mobno']);
      /*Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const ForgetOtp(),
        ),
      );*/
      Get.to(()=> const ForgetOtp(),transition: Transition.rightToLeft);

    }).onError((error, stackTrace) {
      print("forget password api not success");
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  //////////////////////forget password /////////////////////////////////////
  Future<void> resetotpVerify(dynamic Otpdata,String mobile , BuildContext context) async {
    setLoading(true);
    setUid(uid);
    Map data = {'mobno': mobile, 'otp': Otpdata.toString()};
    _myRepo.resetotpVerifyListApi(data).then((value) async {
      setLoading(false);
      setPrToken(value['prtoken']);
      final userPreference = Provider.of<UserViewModel>(context, listen: false);
      userPreference.saveToken(UserModel(data: value['prtoken'].toString()));
      Utils.flushBarErrorMessage(value['msg'], context);

      /*Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const NewPassword(),
        ),
      );*/
      Get.to(()=> const NewPassword(),transition: Transition.rightToLeft);

    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

//////////////////////Set New password /////////////////////////////////////
  Future<void> verifynewPassword(dynamic newPass, BuildContext context) async {
    setLoading(true);
    setUid(uid);
    Map data = {
      'newpassword': newPass.toString(),
      'prtoken': _prToken.toString()
    };
    _myRepo.verifynewPasswordListApi(data).then((value) async {
      setLoading(false);
      Utils.flushBarErrorMessage(value['msg'], context);
      //Navigator.pushNamed(context, RoutesName.login);
      Get.to(() => const LoginView(),transition: Transition.rightToLeft);

    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  //////////////////////add trainee onboarding /////////////////////////////////////
  Future<void> addTrainee(dynamic newPass, BuildContext context) async {
    setLoading(true);
    setUid(uid);
    Map data = {
      'newpassword': newPass.toString(),
      'prtoken': _prToken.toString()
    };
    _myRepo.verifynewPasswordListApi(data).then((value) async {
      setLoading(false);
      Utils.flushBarErrorMessage(value['msg'], context);
      //Navigator.pushNamed(context, RoutesName.login);
      Get.to(() => const LoginView(),transition: Transition.rightToLeft);

    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  //////////////////////Set New password /////////////////////////////////////
  Future<void> confirmnewPassword(String newPass,String oldPass, BuildContext context) async {
    setLoading(true);
   /* setUid(uid);
    final prefsToken = await SharedPreferences.getInstance();
    String token = prefsToken.getString('token')!;
    print("token==$token");*/
    Map<String, dynamic> data = {
      "newpassword": newPass,
      "oldpassword": oldPass,
    };
    _myRepo.changePasswordListApi(data).then((value) async {
      setLoading(false);
      Utils.flushBarErrorMessage(value['msg'], context);
      //Navigator.pushNamed(context, RoutesName.login);
      Get.to(() => const LoginView(),transition: Transition.rightToLeft);

    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }



}
