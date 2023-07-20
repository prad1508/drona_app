
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../respository/user.dart';
import '../../view/dashboard/layout.dart';
import '../../view/language.dart';
import '../../view/registeration/login_view.dart';
import '/model/user_model.dart';
import '/utils/routes/routes_name.dart';
import '/view_model/user_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashServices with ChangeNotifier {

  final _myRepo = UserRepository();
  bool setupFinish =false;
  bool _loading = false ;
  bool get loading => _loading ;
  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }
  Future<UserModel> getUserDate() => UserViewModel().getUser();
  void checkAuthentication(BuildContext context)async{
     _myRepo.academyRegistrationTrack().then((value) async {
      setLoading(false);
      setupFinish = value['onboarding_setup_finish'];
    }
    );
    getUserDate().then((value)async{
      if(value.data.toString() == 'null' || value.data.toString() == ''){
        await Future.delayed(const Duration(seconds: 1));
        // ignore: use_build_context_synchronously
        //Navigator.pushNamed(context, RoutesName.language);
        Get.to(()=> const Language(),transition: Transition.rightToLeft);
        
      }else {
        await  Future.delayed(const Duration(seconds: 1));
        // ignore: use_build_context_synchronously
         final prefsData = await SharedPreferences.getInstance();
        String? role = prefsData.getString('role');
        if(role == '1' || setupFinish == true){
           // Navigator.pushNamed(context, RoutesName.layout);
            Get.to(()=> const Layout(selectedIndex: 0,),transition: Transition.rightToLeft);

        }
        else{
          // Navigator.pushNamed(context, RoutesName.login);
           Get.to(()=> const  LoginView(),transition: Transition.rightToLeft);

        }
       
      }

    }).onError((error, stackTrace){
      if(kDebugMode){
        print(error.toString());
      }
    });

  }



}