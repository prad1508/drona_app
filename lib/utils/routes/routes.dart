
import 'package:drona/view/batch_details.dart';
import 'package:flutter/material.dart';
import '../../view/language.dart';
import '../../view/profile/batch_list.dart';
import '../../view/profile/view_profile.dart';
import '../../view/registeration/choose_program.dart';
import '../../view/registeration/choose_program.dart';
import '../../view/registeration/choose_program.dart';
import '../../view/registeration/detail_filled.dart';
import '../../view/registeration/otp.dart';
import '../../view/registeration/tellus_acadmic.dart';
import '../../view/welcome_screen.dart';
import '../../view/coach_listselected.dart';
import '../../view/create_batch.dart';
import '../../view/profile/create_profile.dart';
import '../../view/registeration/acadmic_setup.dart';
import '../../view/registeration/choose _service.dart';
import '../../view/registeration/registration.dart';
import '../../view/signp_view.dart';
import '/utils/routes/routes_name.dart';
import '/view/home_screen.dart';
import '/view/layout.dart';
import '../../view/registeration/login_view.dart';
import '/view/splash_view.dart';

class Routes {

  static Route<dynamic>  generateRoute(RouteSettings settings){

    switch(settings.name){
      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context) => const SplashView());

      case RoutesName.layout:
        return MaterialPageRoute(builder: (BuildContext context) => const Layout(selectedIndex: 0,));
      case RoutesName.tellusAcadmic:
        return MaterialPageRoute(builder: (BuildContext context) => const TellusAcadmic());
        
      case RoutesName.language:
        return MaterialPageRoute(builder: (BuildContext context) => const Language());
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginView());
      case RoutesName.signUp:
        return MaterialPageRoute(builder: (BuildContext context) => const SignUpView());
      case RoutesName.AcadmicSetup:
        return MaterialPageRoute(builder: (BuildContext context) => const AcadmicSetup());
      case RoutesName.Registration:
        return MaterialPageRoute(builder: (BuildContext context) => const Registration());
      case RoutesName.ChooseService:
        return MaterialPageRoute(builder: (BuildContext context) => const ChooseService());
      case RoutesName.DetailFilled:
        return MaterialPageRoute(builder: (BuildContext context) => const DetailFilled());
      case RoutesName.WelcomeScreen:
        return MaterialPageRoute(builder: (BuildContext context) => const WelcomeScreen());
      case RoutesName.CreateProfile:
        return MaterialPageRoute(builder: (BuildContext context) => const CreateProfile());
      case RoutesName.CoachListSelected:
        return MaterialPageRoute(builder: (BuildContext context) => const CoachListSelected());
      case RoutesName.ViewProfilenew:
        return MaterialPageRoute(builder: (BuildContext context) => const ViewProfilenew());
      case RoutesName.CreateBatch:
        return MaterialPageRoute(builder: (BuildContext context) => const CreateBatch());
      case RoutesName.BatchList:
        return MaterialPageRoute(builder: (BuildContext context) => const BatchList());
      case RoutesName.BatchDetail:
        return MaterialPageRoute(builder: (BuildContext context) => const BatchDetail());
      case RoutesName.ChooseProgram:
              return MaterialPageRoute(builder: (BuildContext context) => const ChooseProgram());


      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });

    }
  }
}