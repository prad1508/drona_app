
import 'package:drona/view/registeration/detail_filled.dart';
import 'package:drona/view/registeration/otp.dart';
import 'package:drona/view/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../view/coach_listselected.dart';
import '../../view/profile/edit_proile.dart';
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

      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginView());
      case RoutesName.signUp:
        return MaterialPageRoute(builder: (BuildContext context) => const SignUpView());
      case RoutesName.AcadmicSetup:
        return MaterialPageRoute(builder: (BuildContext context) => const AcadmicSetup());
      case RoutesName.Registration:
        return MaterialPageRoute(builder: (BuildContext context) => const Registration());
      case RoutesName.OtpPage:
        return MaterialPageRoute(builder: (BuildContext context) => const OtpPage());
      case RoutesName.ChooseService:
        return MaterialPageRoute(builder: (BuildContext context) => const ChooseService());
      case RoutesName.DetailFilled:
        return MaterialPageRoute(builder: (BuildContext context) => const DetailFilled());
      case RoutesName.WelcomeScreen:
        return MaterialPageRoute(builder: (BuildContext context) => const WelcomeScreen());
      case RoutesName.EditProfile:
        return MaterialPageRoute(builder: (BuildContext context) => const EditProfile());
      case RoutesName.CoachListSelected:
        return MaterialPageRoute(builder: (BuildContext context) => const CoachListSelected());

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