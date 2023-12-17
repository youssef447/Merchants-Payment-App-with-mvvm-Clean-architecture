import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: backgroundColor,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: defaultColor,
  ), 
  // const Color(0XFF333739),
  
  appBarTheme: const AppBarTheme(
    titleSpacing: 20.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: defaultColor,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: defaultColor,
    ),

    // backgroundColor:  Color.fromARGB(255, 175, 178, 183),
    backgroundColor: backgroundColor,
    elevation: 0.0,
    /*  titleTextStyle: TextStyle(
      fontFamily: 'Jannah',
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ), */
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: defaultColor,
    refreshBackgroundColor: Colors.grey[400],
    linearMinHeight: 5,
    
  ),
  checkboxTheme: const CheckboxThemeData(
    checkColor: MaterialStatePropertyAll<Color>(Colors.white), //icon color
    fillColor: MaterialStatePropertyAll<Color>(Colors.white),
  ),

  drawerTheme: const DrawerThemeData(
    backgroundColor: Color(0Xff1c242f),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor: defaultColor,
  ),
  dividerTheme: const DividerThemeData(thickness: 1.5, color: Colors.white),

  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    titleMedium: TextStyle(
        fontSize: 14.0,
        // fontWeight: FontWeight.w600,
        color: Colors.black,
        fontWeight: FontWeight.normal
        //height: 1.3,
        ),
    titleSmall: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
  ),
);

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      //backgroundColor: defaultColor,

      ),
  dividerTheme: const DividerThemeData(
    thickness: 1.5,
    color: Color(0Xff1c242f),
  ),
  colorScheme: const ColorScheme.light(primary: defaultColor),
  appBarTheme: const AppBarTheme(
    titleSpacing: 20.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      systemNavigationBarColor: defaultColor,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      fontFamily: 'Jannah',
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor: Colors.white,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      //height: .
    ),
    titleMedium: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    titleSmall: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
    color: Colors.white,
  ),
  fontFamily: 'Jannah',
  radioTheme: RadioThemeData(
    fillColor: MaterialStateProperty.all(defaultColor),
  ),
);
