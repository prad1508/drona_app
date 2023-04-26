

import 'package:drona/view/registeration/choose%20_service.dart';
import 'package:drona/view_model/user_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../model/savecredential_modal.dart';
import '../respository/user.dart';
import '/model/user_model.dart';
import '/utils/routes/routes_name.dart';
import '/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel with ChangeNotifier {

  final _myRepo = UserRepository();

  
  bool _signUpLoading = false ;
  bool get signUpLoading => _signUpLoading ;
  late int setupProgress = 0;
  late bool setupFinish =false;
  bool _loading = false ;
  bool get loading => _loading ;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value){
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, save, BuildContext context) async {
    setLoading(true);
    _myRepo.academyRegistrationTrack().then((value) async {
      setLoading(false);
      setupProgress  = value['onboarding_completed'];
      setupFinish = value['onboarding_setup_finish'];
    }
    );
    _myRepo.loginApi(data).then((value) async {
      setLoading(false);
      final userPreference = Provider.of<UserViewModel>(context , listen: false);
      if(save == true){
        userPreference.savecredential(SavecredentialModel(userid: data['userid'], password: data['password']));
        final prefsData = await SharedPreferences.getInstance();
      }
       userPreference.saveToken(UserModel(data: value['token'].toString()) );
      userPreference.saveRole(UserModel(data: value['Profiles'][0]['role'].toString()));
      Utils.flushBarErrorMessage('Login Successfully', context);

     if( value['Profiles'][0]['role'] == 0 && setupFinish == false){
        //track registration and redirect
        switch(setupProgress) { 
             case 0: { 
                  Navigator.pushNamed(context, RoutesName.tellusAcadmic);
              } 
              break;  

               case 7: {
                  Navigator.pushNamed(context, RoutesName.chooseService);
              } 
              break;  

              case 4: { 
                 Navigator.pushNamed(context, RoutesName.chooseFacility);
              } 
              break;   
              case 5: { 
                   Navigator.pushNamed(context, RoutesName.ChooseProgram);
              } 
              break;    
              case 6: { 
                   Navigator.pushNamed(context, RoutesName.detailFilled);
              } 
              break; 

            } 
  
     }
     else{
      userPreference.saveToken(
                    UserModel(
                      data: value['token'].toString()
                    )
                  );
        Navigator.pushNamed(context, RoutesName.layout);
     }
    }).onError((error, stackTrace){
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if(kDebugMode){
        print(error.toString());
      }

    });
  }



}