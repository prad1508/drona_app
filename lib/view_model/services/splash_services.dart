
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '/model/user_model.dart';
import '/utils/routes/routes_name.dart';
import '/view_model/user_view_model.dart';

class SplashServices {


  Future<UserModel> getUserDate() => UserViewModel().getUser();


  void checkAuthentication(BuildContext context)async{

    getUserDate().then((value)async{

      print(value.data.toString());

      if(value.data.toString() == 'null' || value.data.toString() == ''){
        await Future.delayed(const Duration(seconds: 1));
        Navigator.pushNamed(context, RoutesName.language);
      }else {
        await  Future.delayed(Duration(seconds: 1));
        Navigator.pushNamed(context, RoutesName.language);
      }

    }).onError((error, stackTrace){
      if(kDebugMode){
        print(error.toString());
      }
    });

  }



}