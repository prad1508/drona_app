import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  late bool isDarkTheme = false;
  ThemeProvider(){
    previousThemeload();
  }
   previousThemeload() async {
     SharedPreferences prefs = await SharedPreferences.getInstance(); 
    // isDarkTheme = prefs.getBool('isDark')!;
     notifyListeners();
     
  }
  
  Future<void> changeTheme() async {
    isDarkTheme = !isDarkTheme;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDark', isDarkTheme);
    notifyListeners();
  }
}
