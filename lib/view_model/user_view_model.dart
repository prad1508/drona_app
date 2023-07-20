import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../model/savecredential_modal.dart';
import '../respository/user.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';
import '../view/batch_listing/add_batch.dart';
import '../view/batch_listing/create_batch_listing.dart';
import '../view/coach_listing/coach_listselected.dart';
import '/model/user_model.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  final _myRepo = UserRepository();
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<bool> saveToken(UserModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.data.toString());
    notifyListeners();
    return true;
  }

  //save user role
  Future<bool> saveRole(UserModel role) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('role', role.data.toString());
    notifyListeners();
    return true;
  }

  //save credential
  Future<bool> savecredential(SavecredentialModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setStringList('saveCredential',
        <String>[user.userid.toString(), user.password.toString()]);
    notifyListeners();
    return true;
  }

  //user data
  Future<bool> saveData(UserModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('data', user.data.toString());
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');
    return UserModel(data: token.toString());
  }

  Future<bool> remove(context) async {
    //remove token to server and local
    final SharedPreferences sp = await SharedPreferences.getInstance();
      // Clears all the data in SharedPreferences
    // value['Profiles'][0]['role'].toString(),
    // value['Profiles'][0]['name'].toString(),
    // value['Profiles'][0]['email'].toString(),
    // value['Profiles'][0]['academy_name'].toString(),
    sp.remove('role');
    sp.remove('name');
    sp.remove('email');
    sp.remove('academy_name');
    _myRepo.fetchUserListApi().then((value) {
      Utils.flushBarErrorMessage('Login Successfully', context);
      Utils.flushBarErrorMessage('Logout Successfully', context);
      sp.remove('token');
    });
    return true;
  }

  //ouser profile
  Future<bool> fetchouserProfileimg(data, context) async {
    _myRepo.fetchouserProfileimg(data).then((value) async {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString('uprofile', value['imgname']);
      // Utils.flushBarErrorMessage(value['msg'], context);
    }).onError((error, stackTrace) {
      setLoading(false);

      print("api  not success for image ");
    });
    return true;
  }

  //user profile add
  Future<void> userProfileAdd(dynamic data, BuildContext context, String pathPage , [int listindex = -1]) async {
    setLoading(true);
    _myRepo.fetchUserprofileAddListApi(data).then((value) async {
      setLoading(false);
      print(value);
      Utils.flushBarErrorMessage(value['msg'], context);
      print("api success of adding coach");
   //if(listindex!=-1)
     //{
       /// create batch
    //  pathPage == "dashBoard"?
      Get.to(()=>  CreateBatchListing(pathPage: pathPage,),transition: Transition.rightToLeft);
    //  Get.to(()=>  CreateBatchListing(pathPage: pathPage),transition: Transition.rightToLeft);
     //  Get.to(()=>  CoachListSelected(Listindex : listindex),transition: Transition.rightToLeft);
   //  }
   // else
   //   {
   //     Get.to(()=>  CoachListSelected(),transition: Transition.rightToLeft);
   //   }

    }).onError((error, stackTrace) {
      setLoading(false);
      print("api  not success");
      print("error is $error");

      Utils.flushBarErrorMessage(error.toString(), context);
    });
  }



}


