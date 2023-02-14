
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '/model/user_model.dart';
import '/utils/routes/routes_name.dart';
import '/view_model/user_view_model.dart';

class SplashServices {


  Future<UserModel> getUserDate() => UserViewModel().getUser();


  void checkAuthentication(BuildContext context)async{

    getUserDate().then((value)async{

      print(value.token.toString());

      if(value.token.toString() == 'null' || value.token.toString() == ''){
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.AcadmicSetup);
      }else {
        await  Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.AcadmicSetup);
      }

    }).onError((error, stackTrace){
      if(kDebugMode){
        print(error.toString());
      }
    });

  }



}