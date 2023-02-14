import 'package:flutter/material.dart';
import '/view_model/services/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
 SplashServices splashServices = SplashServices();

  @override
  void initState() {
    super.initState();

    splashServices.checkAuthentication(context);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
       color: Colors.white,
      child: const Image(image: AssetImage('assets/images/drona_logo.png'), fit: BoxFit.cover,),
    );
  }
}
