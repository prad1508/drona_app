
import 'package:flutter/cupertino.dart';
import '/model/user_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier{

  Future<bool> saveToken(UserModel user)async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.data.toString());
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

  Future<bool> remove()async{

    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    return true;

  }
}