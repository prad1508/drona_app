
import 'package:drona/view/batch_details.dart';
import 'package:drona/view/batch_listing/ViewBatchDetails1.dart';
import 'package:drona/view/batch_listing/ViewBatchDetails2.dart';
import 'package:drona/view/batch_listing/add_batch.dart';
import 'package:drona/view/batch_listing/add_coach_profile.dart';
import 'package:drona/view/batch_listing/add_trainee_list.dart';
import 'package:drona/view/batch_listing/batch_list.dart';
import 'package:drona/view/batch_listing/coach_add_profile.dart';
import 'package:drona/view/batch_listing/coach_profile_add.dart';
import 'package:drona/view/batch_listing/create_batch_listing.dart';
import 'package:drona/view/batch_listing/trainee_add_options.dart';
import 'package:drona/view/batch_listing/trainee_list.dart';
import 'package:drona/view/batch_listing/view_batch_details.dart';
import 'package:flutter/material.dart';
import '../../res/widget/Academy_Listing/service_offring_page.dart';
import '../../view/coach_listing/coach_listselected.dart';
import '../../view/dashboard/layout.dart';
import '../../view/language.dart';
import '../../view/profile/batch_list.dart';
import '../../view/profile/view_profile.dart';
import '../../view/registeration/choose _service.dart';
import '../../view/registeration/choose_program.dart';
import '../../view/registeration/detail_filled.dart';
import '../../view/registeration/reset_password.dart';
import '../../view/registeration/tellus_acadmic.dart';
import '../../view/welcome_screen.dart';
import '../../view/profile/create_profile.dart';
import '../../view/registeration/acadmic_setup.dart';
import '../../view/registeration/choose_service.dart';
import '../../view/registeration/registration.dart';
import '../../view/registeration/choose_facility.dart';
import '/utils/routes/routes_name.dart';
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

      case RoutesName.AcadmicSetup:
        return MaterialPageRoute(
            builder: (BuildContext context) => const AcadmicSetup());
      case RoutesName.Registration:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Registration());

      case RoutesName.ChooseService:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ChooseService());
      case RoutesName.DetailFilled:
        return MaterialPageRoute(
            builder: (BuildContext context) => const DetailFilled());
      case RoutesName.WelcomeScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const WelcomeScreen());
      case RoutesName.CreateProfile:
        return MaterialPageRoute(
            builder: (BuildContext context) =>  CreateProfile());
      case RoutesName.CoachListSelected:
        return MaterialPageRoute(
            builder: (BuildContext context) =>  CoachListSelected());
      case RoutesName.ViewProfilenew:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ViewProfilenew());
      case RoutesName.CreateBatch:
        return MaterialPageRoute(
            builder: (BuildContext context) => const CreateBatchListing());
      case RoutesName.BatchList:
        return MaterialPageRoute(
            builder: (BuildContext context) => const BatchList());
      case RoutesName.BatchDetail:
        return MaterialPageRoute(
            builder: (BuildContext context) => const BatchDetail());
      case RoutesName.ChooseProgram:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ChooseProgram());
      case RoutesName.CreateBatchListing:
        return MaterialPageRoute(
            builder: (BuildContext context) => const CreateBatchListing());
      case RoutesName.ViewBatchDetails1:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ViewBatchDetails1());
      case RoutesName.ViewBatchDetails2:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ViewBatchDetails2());
      case RoutesName.AddBatch:
        return MaterialPageRoute(
            builder: (BuildContext context) => const AddBatch());
      case RoutesName.AddTraineeList:
        return MaterialPageRoute(
            builder: (BuildContext context) => AddTraineeList());
      case RoutesName.CoachProfileAdd:
        return MaterialPageRoute(
            builder: (BuildContext context) => const CoachProfileAdd());
      case RoutesName.CoachAddProfile:
        return MaterialPageRoute(
            builder: (BuildContext context) => const CoachAddProfile());
      case RoutesName.AddCoachProfile:
        return MaterialPageRoute(
            builder: (BuildContext context) => const AddCoachProfile());
      case RoutesName.BatchLists:
        return MaterialPageRoute(
            builder: (BuildContext context) => const BatchLists());
      case RoutesName.TraineeList:
        return MaterialPageRoute(
            builder: (BuildContext context) => const TraineeList());
      case RoutesName.TraineeAddOptions:
        return MaterialPageRoute(
            builder: (BuildContext context) => const TraineeAddOptions());
      case RoutesName.acadmicSetup:
        return MaterialPageRoute(builder: (BuildContext context) => const AcadmicSetup());
      case RoutesName.registration:
        return MaterialPageRoute(builder: (BuildContext context) => const Registration());
        // case RoutesName.chooseService:
        //   return MaterialPageRoute(builder: (BuildContext context) => const ChooseService());
        // case RoutesName.detailFilled:
        return MaterialPageRoute(builder: (BuildContext context) => const DetailFilled());
      case RoutesName.welcomeScreen:
        return MaterialPageRoute(builder: (BuildContext context) => const WelcomeScreen());
      case RoutesName.createProfile:
        return MaterialPageRoute(builder: (BuildContext context) =>  CreateProfile());
    // case RoutesName.coachListSelected:
    //   return MaterialPageRoute(builder: (BuildContext context) => const CoachListSelected());
      case RoutesName.viewProfilenew:
        return MaterialPageRoute(builder: (BuildContext context) => const ViewProfilenew());
      case RoutesName.batchList:
        return MaterialPageRoute(builder: (BuildContext context) => const BatchList());
      case RoutesName.batchDetail:
        return MaterialPageRoute(builder: (BuildContext context) => const BatchDetail());
      case RoutesName.chooseFacility:
        return MaterialPageRoute(builder: (BuildContext context) => const ChooseFacility());
      case RoutesName.chooseprogram:
        return MaterialPageRoute(builder: (BuildContext context) => const ChooseProgram());
      case RoutesName.resetPassword:
        return MaterialPageRoute(builder: (BuildContext context) => const ResetPassword());

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