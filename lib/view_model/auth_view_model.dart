import 'package:drona/view/dashboard/layout.dart';
import 'package:drona/view/registeration/detail_filled.dart';
import 'package:drona/view_model/user_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../model/savecredential_modal.dart';
import '../respository/user.dart';
import '../view/registeration/choose_facility.dart';
import '../view/registeration/choose_program.dart';
import '../view/registeration/choose_service.dart';
import '../view/registeration/tellus_acadmic.dart';
import '/model/user_model.dart';
import '/utils/routes/routes_name.dart';
import '/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = UserRepository();

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;
  late int setupProgress = 0;
  late bool setupFinish = false;
  bool _loading = false;
  bool check = true;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, save, BuildContext context) async {
    setLoading(true);

    _myRepo.loginApi(data).then((value) async {
      print(value);
      // print("coming inside here");
      // print(value['data']['name']);
      // print(value['data']['email']);
      // print(value['data']['ccode']);
      // print( value['data']['mobno']);
      // print(value['data']['role']);
      // print( value['data']['gender']);
      setLoading(false);
      final userPreference = Provider.of<UserViewModel>(context, listen: false);
      if (save == true) {
        userPreference.savecredential(SavecredentialModel(
            userid: data['userid'], password: data['password']));
      }
      final prefsData = await SharedPreferences.getInstance();
      prefsData.setStringList("registerResponse", <String>[
        value['Profiles'][0]['name'].toString(),
        value['Profiles'][0]['email'].toString(),
        value['Profiles'][0]['ccdoe'].toString(),
        value['Profiles'][0]['mobno'].toString(),
        value['Profiles'][0]['role'].toString(),
        value['Profiles'][0]['gender'].toString(),
        //!check ? value['Profiles'][0]['academy_name'].toString() :''
      ]);

      if (value['Profiles'][0]['academy_name'] != null) {
        prefsData.setString(
            'acadmicName', value['Profiles'][0]['academy_name']);
      }

      userPreference.saveToken(UserModel(data: value['token'].toString()));
      userPreference
          .saveRole(UserModel(data: value['Profiles'][0]['role'].toString()));
      Utils.flushBarErrorMessage('Login Successfully', context);

      Get.to(() => const Layout(selectedIndex: 0),
          transition: Transition.rightToLeft);


    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
