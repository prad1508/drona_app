
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import '../../respository/user.dart';
import '../../view/dashboard/layout.dart';
import '../../view/language.dart';
import '../../view/registeration/choose_facility.dart';
import '../../view/registeration/choose_program.dart';
import '../../view/registeration/choose_service.dart';
import '../../view/registeration/detail_filled.dart';
import '../../view/registeration/login_view.dart';
import '../../view/registeration/tellus_acadmic.dart';
import '/model/user_model.dart';
import '/utils/routes/routes_name.dart';
import '/view_model/user_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashServices with ChangeNotifier {

  final _myRepo = UserRepository();
  bool setupFinish =false;
  int setupProgress = 0;
  bool _loading = false ;
  bool get loading => _loading ;
  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }
  Future<UserModel> getUserDate() => UserViewModel().getUser();
  void checkAuthentication(BuildContext context)async{
    final userPreference = Provider.of<UserViewModel>(context, listen: false);
    try {
      final value = await _myRepo.academyRegistrationTrack();
      print(value);
      setLoading(false);
      setupProgress = value['onboarding_completed'] != null ? value['onboarding_completed'] : 0;
      print("setupprogress is $setupProgress");

      setupFinish = value['onboarding_setup_finish'] != null ? value['onboarding_setup_finish'] : false;
      print("setupfinish is $setupFinish");

      // Further code that depends on the API response
      // ...
    } catch (error) {
      // Handle any errors that occurred during the API request

      print("Error: $error");
    }
     // try {
     // _myRepo.academyRegistrationTrack().then((value) async {
     //  setLoading(false);
     //  setupFinish = value['onboarding_setup_finish'];
     //  setupProgress = value['onboarding_completed'];
     //  print("set up finish is $setupFinish");
     //  print("set up progress is $setupProgress"); });
     //     }
     //     catch(error){
     //
     //     }

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
        print("role is $role");
        if(role == '1' && setupFinish == true){
           // Navigator.pushNamed(context, RoutesName.layout);
            Get.to(()=> const Layout(selectedIndex: 0,),transition: Transition.rightToLeft);
        }
        else{
         //  Get.to(()=> const  LoginView(),transition: Transition.rightToLeft);

          if (role== '1' && setupFinish == false) {
            print("coming");
            // if( value['Profiles'][0]['role'] == 0 && setupFinish == false){
            //track registration and redirect
            switch (setupProgress) {

              case 0: {
                /*Navigator.pushNamed(context, RoutesName.tellusAcadmic);*/
                Get.to(() => const TellusAcadmic(),transition: Transition.rightToLeft);
                break;
              }

              case 3:
                {
                  //Navigator.pushNamed(context, RoutesName.chooseService);
                  Get.to(() => const ChooseService(),transition: Transition.rightToLeft);

                  break;
                }

              case 4:
                {
                  /*Navigator.pushNamed(context, RoutesName.chooseFacility);*/
                  Get.to(() => const ChooseFacility(),transition: Transition.rightToLeft);


                  break;
                }

              case 5:
                {
                  /*Navigator.pushNamed(context, RoutesName.ChooseProgram);*/
                  Get.to(() => const ChooseProgram(),transition: Transition.rightToLeft);

                  break;
                }

              case 6:
                {
                  /* Navigator.pushNamed(context, RoutesName.detailFilled);*/
                  Get.to(() => const DetailFilled(),transition: Transition.rightToLeft);

                  break;
                }
            }
          }
          else if(role == '0' && setupFinish == false)
          {
            print("2nd part");
            switch(setupProgress)
            {

              case 0: {
                print("coming inside switch");
                /* Navigator.pushNamed(context, RoutesName.tellusAcadmic);*/
                Get.to(() => const TellusAcadmic(),transition: Transition.rightToLeft);
                break;
              }
              case 3:
                {
                  //Navigator.pushNamed(context, RoutesName.chooseService);
                  print("33333");
                  Get.to(() => const ChooseService(),transition: Transition.rightToLeft);

                  break;
                }

              case 4:
                {
                  //Navigator.pushNamed(context, RoutesName.chooseFacility);
                  Get.to(() => const ChooseFacility(),transition: Transition.rightToLeft);
                  break;
                }

              case 5:
                {
                  //Navigator.pushNamed(context, RoutesName.ChooseProgram);
                  Get.to(() => const ChooseProgram(),transition: Transition.rightToLeft);

                  break;
                }
            }
          }
          else {
            print("coming hereee");
            if (setupProgress == 0 && setupFinish==false) {
            //  userPreference.saveToken(UserModel(data: value['token'].toString()));
              // Navigator.pushNamed(context, RoutesName.tellusAcadmic);
              Get.to(() => const TellusAcadmic(),transition: Transition.rightToLeft);

            }
            else
            {
            //  userPreference.saveToken(UserModel(data: value['token'].toString()));
              // Navigator.pushNamed(context, RoutesName.layout);
              Get.to(() => const Layout(selectedIndex: 0),transition: Transition.rightToLeft);

            }

          }

        }
       
      }

    }).onError((error, stackTrace){
      if(kDebugMode){
        print(error.toString());
      }
    });

  }



}