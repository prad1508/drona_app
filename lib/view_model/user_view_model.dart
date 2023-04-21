import 'dart:convert';

import 'package:flutter/cupertino.dart';
import '../model/savecredential_modal.dart';
import '../respository/user.dart';
import '../utils/utils.dart';
import '/model/user_model.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier{
   final _myRepo = UserRepository();  
  Future<bool> saveToken(UserModel user)async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.data.toString());
    notifyListeners();
    return true ;
  }
  //save user role
  Future<bool> saveRole(UserModel role)async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('role', role.data.toString());
    notifyListeners();
    return true ;
  }
  //save credential
   Future<bool> savecredential(SavecredentialModel user)async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setStringList('saveCredential', <String>[
        user.userid.toString(),
        user.password.toString()
      ]);
    notifyListeners();
    return true ;
  }

  //user data
  Future<bool> saveData(UserModel user)async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('data', user.data.toString());
    notifyListeners();
    return true ;
  }


  Future<UserModel> getUser()async{

    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');
    return UserModel(
      data: token.toString()
    );
  }

  Future<bool> remove(context)async{
     //remove token to server and local
    final SharedPreferences sp = await SharedPreferences.getInstance();
        _myRepo.fetchUserListApi().then((value){ 
       Utils.flushBarErrorMessage('Login Successfully', context);
         sp.remove('token');
   
    });
    return true;

  }

  //ouser profile
   Future<bool> fetchouserProfileimg(data, context)async{
       _myRepo.fetchouserProfileimg(data).then((value) async {
        print(value['path_url']);
        print(value['imgname']);
       Utils.flushBarErrorMessage(value['msg'], context);
    }
    );
    return true;

  }
}