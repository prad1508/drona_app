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

    // _myRepo.academyRegistrationTrack().then((value) async {
    //   print(value);
    //   setLoading(false);
    //   setupProgress = value['onboarding_completed'] != null ? value['onboarding_completed'] : 0 ;
    //   print("setupprogess is $setupProgress");
    //
    //   setupFinish = value['onboarding_setup_finish'] != null ?  value['onboarding_setup_finish'] : false ;
    //   print("setupfrinish is $setupFinish");
    // });
    _myRepo.loginApi(data).then((value) async {
      setLoading(false);
      final userPreference = Provider.of<UserViewModel>(context, listen: false);
      if (save == true) {
        userPreference.savecredential(SavecredentialModel(
            userid: data['userid'], password: data['password']));
      }
        final prefsData = await SharedPreferences.getInstance();
        prefsData.setStringList("registerResponse", <String>[

          // value['data']['name'],
          // value['data']['email'],
          // value['data']['ccode'],
          // value['data']['mobno'],
          // value['data']['role'],
          // value['data']['gender']

          value['Profiles'][0]['name'].toString(),
          value['Profiles'][0]['email'].toString(),
          value['Profiles'][0]['ccdoe'].toString(),
          value['Profiles'][0]['mobno'].toString(),
          value['Profiles'][0]['role'].toString(),
          value['Profiles'][0]['gender'].toString(),
          value['Profiles'][0]['academy_name'].toString(),
        ]);

      prefsData.setString('acadmicName', value['Profiles'][0]['academy_name']);

      userPreference.saveToken(UserModel(data: value['token'].toString()));
      userPreference
          .saveRole(UserModel(data: value['Profiles'][0]['role'].toString()));
      Utils.flushBarErrorMessage('Login Successfully', context);

      print("value for academy is");
      print(value['Profiles'][0]['role']);
      if (value['Profiles'][0]['role'] == 1 && setupFinish == false) {
        print("coming");
        // if( value['Profiles'][0]['role'] == 0 && setupFinish == false){
        //track registration and redirect
        switch (setupProgress) {

          case 0: {
            /*Navigator.pushNamed(context, RoutesName.tellusAcadmic);*/
            Get.to(() => const TellusAcadmic(),transition: Transition.leftToRight);
               break;
           }

          case 3:
            {
              //Navigator.pushNamed(context, RoutesName.chooseService);
              Get.to(() => const ChooseService(),transition: Transition.leftToRight);

              break;
            }

          case 4:
            {
              /*Navigator.pushNamed(context, RoutesName.chooseFacility);*/
              Get.to(() => const ChooseFacility(),transition: Transition.leftToRight);


              break;
            }

          case 5:
            {
              /*Navigator.pushNamed(context, RoutesName.ChooseProgram);*/
              Get.to(() => const ChooseProgram(),transition: Transition.leftToRight);

              break;
            }

          case 6:
            {
             /* Navigator.pushNamed(context, RoutesName.detailFilled);*/
              Get.to(() => const DetailFilled(),transition: Transition.leftToRight);

              break;
            }
        }
      } else if(value['Profiles'][0]['role'] == 0 && setupFinish == false)
        {
          print("2nd part");
           switch(setupProgress)
           {
             case 0: {
              /* Navigator.pushNamed(context, RoutesName.tellusAcadmic);*/
               Get.to(() => const TellusAcadmic(),transition: Transition.leftToRight);
               break;
             }
             case 3:
               {
                 //Navigator.pushNamed(context, RoutesName.chooseService);
                 Get.to(() => const ChooseService(),transition: Transition.leftToRight);

                 break;
               }

             case 4:
               {
                 //Navigator.pushNamed(context, RoutesName.chooseFacility);
                 Get.to(() => const ChooseFacility(),transition: Transition.leftToRight);
                 break;
               }

             case 5:
               {
                 //Navigator.pushNamed(context, RoutesName.ChooseProgram);
                 Get.to(() => const ChooseProgram(),transition: Transition.leftToRight);

                 break;
               }

             // case 6:
             //   {
             //     Navigator.pushNamed(context, RoutesName.detailFilled);
             //     break;
             //   }

           }
        }



      else {
        print("coming hereee");
        if (setupProgress == 0 && setupFinish==false) {
          userPreference.saveToken(UserModel(data: value['token'].toString()));
         // Navigator.pushNamed(context, RoutesName.tellusAcadmic);
          Get.to(() => const TellusAcadmic(),transition: Transition.leftToRight);

        }
        else
          {
            userPreference.saveToken(UserModel(data: value['token'].toString()));
           // Navigator.pushNamed(context, RoutesName.layout);
            Get.to(() => const Layout(selectedIndex: 0),transition: Transition.leftToRight);

          }

      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
