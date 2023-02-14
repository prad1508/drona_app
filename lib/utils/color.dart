import 'package:flutter/material.dart';
//color themes for light and dark model

const secondryColor = Color.fromRGBO(253, 104, 93, 1);
const successColor = Color.fromRGBO(27, 134, 55, 1);
final ThemeData themeDataLight =  ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.lightBlue[800],
    primaryColorDark:Color.fromARGB(255, 0, 0, 0),
    primaryColorLight: Colors.orangeAccent,
    secondaryHeaderColor: Color.fromARGB(255, 0, 0, 0),
    scaffoldBackgroundColor: Colors.white,  
    textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Color.fromRGBO(13, 30, 57, 1), fontFamily: 'poppin'),
          titleMedium: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold, color: Color.fromRGBO(13, 30, 57, 1), fontFamily: 'poppin'),
          bodyLarge: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Color.fromRGBO(57, 64, 74, 1), fontFamily: 'Loto-Regular'),
          bodyMedium:  TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Color.fromRGBO(57, 64, 74, 1), fontFamily: 'Loto-Regular'),  
          bodySmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: Color.fromRGBO(57, 64, 74, 1), fontFamily: 'Loto-Regular'),
        ),
      iconTheme: const IconThemeData(
      color: Colors.white,
      ),
    );
    

final ThemeData themeDataDark = ThemeData(
    brightness: Brightness.light,
    primaryColor: Color.fromARGB(255, 28, 27, 27),
    primaryColorDark: Colors.teal,
    primaryColorLight: Color.fromARGB(255, 157, 156, 156),
    scaffoldBackgroundColor: Colors.black,  
    secondaryHeaderColor: Color.fromARGB(255, 255, 255, 255),
     textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Color.fromRGBO(255, 255, 255, 1), fontFamily: 'poppin'),
          titleMedium: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold, color: Color.fromRGBO(255, 255, 255, 1), fontFamily: 'poppin'),
          bodyLarge: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Color.fromRGBO(255, 255, 255, 1), fontFamily: 'Loto-Regular'),
          bodyMedium:  TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Color.fromRGBO(255, 255, 255, 1), fontFamily: 'Loto-Regular'),  
          bodySmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: Color.fromRGBO(255, 255, 255, 1), fontFamily: 'Loto-Regular'),
        ),
      iconTheme: IconThemeData(
      color: Colors.white,
      ),
);
