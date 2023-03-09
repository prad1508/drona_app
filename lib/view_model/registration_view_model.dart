import 'dart:convert';

import 'package:drona/view_model/user_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/user_model.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';
import '../view/registeration/otp.dart';
import '/data/response/api_response.dart';
import '/model/registration_model.dart';
import '/respository/registration_repository.dart';

class RegistrationViewModel with ChangeNotifier {
  final _myRepo = RegistrationRepository();

  bool _loading = false;
  bool get loading => _loading;

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> Register(dynamic data, BuildContext context) async {
    setLoading(true);

    _myRepo.fetchRegistrationListApi(data).then((value) async {
      setLoading(false);
      final prefs = await SharedPreferences.getInstance();
      final userPreference = Provider.of<UserViewModel>(context, listen: false);

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
  Future<void> OtpVerify(dynamic otp, BuildContext context) async {
    if (kDebugMode) {
      print(otp);
    }
    final prefsData = await SharedPreferences.getInstance();
    List<String>? items = prefsData.getStringList('registerResponse');
     Map data = {'ccode': items![2], 'mobno': items![3], 'otp': otp.toString()};
    _myRepo.fetchOtpListApi(data).then((value) async {
      prefsData.setString('token', value['token']);
      if (kDebugMode) {
        print(value['token']);
      }
      setLoading(false);
      Utils.flushBarErrorMessage('Otp Verify Successfully', context);
      Navigator.pushNamed(context, RoutesName.tellusAcadmic);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }

 
}


