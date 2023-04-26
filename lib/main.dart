import 'package:drona/view_model/facility_view_model.dart';
import 'package:drona/view_model/registration_view_model.dart';
import 'package:drona/view_model/service_view_model.dart';
import 'package:flutter/material.dart';
import 'package:drona/utils/color.dart';
import 'package:flutter_localization/flutter_localization.dart';
import '../res/language/language.dart';
import '/utils/routes/routes.dart';
import '/utils/routes/routes_name.dart';
import '/view_model/auth_view_model.dart';
import '/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import 'utils/theme_provider.dart';
import 'view_model/category_view_model.dart';
import 'view_model/coachlist_view_model.dart';
import 'view_model/myprogram_view_model.dart';
import 'view_model/myservices_view_model.dart';
import 'view_model/postoffice_view_model.dart';
import 'view_model/program_view_model.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: const AppTranslate());
  }
}

class AppTranslate extends StatefulWidget {
  const AppTranslate({super.key});

  @override
  State<AppTranslate> createState() => _AppTranslateState();
}

class _AppTranslateState extends State<AppTranslate> {
  final FlutterLocalization _localization = FlutterLocalization.instance;

  @override
  void initState() {
    _localization.init(
      mapLocales: [
        const MapLocale('en', AppLocale.en),
        const MapLocale('hi', AppLocale.hi),
      ],
      initLanguageCode: 'en',
    );
    _localization.onTranslatedLanguage = _onTranslatedLanguage;
    super.initState();
  }

  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthViewModel()),
          ChangeNotifierProvider(create: (_) => UserViewModel()),
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ChangeNotifierProvider(create: (_) =>RegistrationViewModel()),
          ChangeNotifierProvider(create: (_) =>PostofficeViewViewModel()),
          ChangeNotifierProvider(create: (_) =>CategoryViewViewModel()),
          ChangeNotifierProvider(create: (_) =>ServiceViewViewModel()),
          ChangeNotifierProvider(create: (_) =>FacilityViewViewModel()),
          ChangeNotifierProvider(create: (_) =>ProgramViewViewModel()),
          ChangeNotifierProvider(create: (_) =>MyservicesViewViewModel()),
          ChangeNotifierProvider(create: (_) =>CoachlistViewViewModel()),
          ChangeNotifierProvider(create: (_) =>MyProgramViewViewModel())
        ],
      
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Drona',
             supportedLocales: _localization.supportedLocales,
             localizationsDelegates: _localization.localizationsDelegates,
          theme: themeProvider.isDarkTheme ? themeDataDark : themeDataLight,
          initialRoute: RoutesName.splash,
          onGenerateRoute: Routes.generateRoute,
        ),
      ),


    );
  }
}

