import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';
import '../view/registeration/choose_program.dart';
import '../view/registeration/detail_filled.dart';
import '../view/registeration/otp.dart';
import '../view/welcome_screen.dart';
import '/respository/registration_repository.dart';

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

  Future<void> register(dynamic data, BuildContext context) async {
    setLoading(true);

    _myRepo.fetchRegistrationListApi(data).then((value) async {
      setLoading(false);
      final prefs = await SharedPreferences.getInstance();
      prefs.setStringList('registerResponse', <String>[
        value['data']['name'],
        value['data']['email'],
        value['data']['ccode'],
        value['data']['mobno'],
        value['data']['role'],
        value['data']['gender']
      ]);
      // ignore: use_build_context_synchronously
      Utils.flushBarErrorMessage('Register Successfully', context);
      // ignore: use_build_context_synchronously
      Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      OtpPage(registration: data),
                ),
              );
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }
 
  //////////////otp verify ////////////////////////////////////
  Future<void> otpVerify(dynamic otp, BuildContext context) async {
    final prefsData = await SharedPreferences.getInstance();
    List<String>? items = prefsData.getStringList('registerResponse');
     Map data = {'ccode': items![2].toString(), 'mobno': items[3].toString(), 'otp': otp.toString()};
    _myRepo.fetchOtpListApi(data).then((value) async {
      
      prefsData.setString('token', value['token']);
      if (kDebugMode) {
        print("token ${value['token']}");
      }
      setLoading(false);
      Utils.flushBarErrorMessage('Otp Verify Successfully', context);
      Navigator.pushNamed(context, RoutesName.tellusAcadmic);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  
   //////////////Basic Details ////////////////////////////////////
  Future<void> basicDetails(dynamic data, BuildContext context, uid, acadmicName) async {
    setLoading(true);
     setUid(uid);
    _myRepo.basicDetailsListApi(data).then((value) async {

      setLoading(false);
      final prefsData = await SharedPreferences.getInstance();
    prefsData.setString('acadmicName', acadmicName);
      Utils.flushBarErrorMessage('Basic Details update Successfully', context);
      Navigator.pushNamed(context, RoutesName.chooseService);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  //////////////Service Post ////////////////////////////////////
  Future<void> servicePost(dynamic data, BuildContext context) async {
    setLoading(true);
     setUid(uid);
    _myRepo.servicePostListApi(data).then((value) async {

      setLoading(false);
      Utils.flushBarErrorMessage('Services update Successfully', context);
      Navigator.pushNamed(context, RoutesName.chooseFacility);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

  //////////////add facility ////////////////////////////////////
  Future<void> facilityePost(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.facilityePostListApi(data).then((value) async {

      setLoading(false);
      Utils.flushBarErrorMessage('Facilty Sved Successfully', context);        
      Navigator.pushNamed(context, RoutesName.chooseprogram);     
    
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

      setLoading(false);
      Utils.flushBarErrorMessage('Program update Successfully', context);
      //Navigator.pushNamed(context, RoutesName.detailFilled);
      Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const DetailFilled(),
                ),
              );
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
      Utils.flushBarErrorMessage('Save Successfully', context);
       Navigator.pushNamed(context, RoutesName.welcomeScreen);
     
    }).onError((error, stackTrace) {
      setLoading(false);
    
   //    var newerror = jsonDecode(error.toString()) ;
       
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }
  

}


