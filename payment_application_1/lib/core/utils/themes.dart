import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'appColors.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.backgroundColor,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.defaultColor,
  ),
  appBarTheme: const AppBarTheme(
    actionsIconTheme: IconThemeData(color: Colors.black),
    titleSpacing: 20.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.defaultColor,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppColors.defaultColor,
    ),
    backgroundColor: AppColors.backgroundColor,
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: AppColors.defaultColor,
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
    backgroundColor: AppColors.defaultColor,
  ),
  dividerTheme: const DividerThemeData(thickness: 1.5, color: Colors.white),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    titleMedium: TextStyle(
        fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.normal),
    titleSmall: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
  ),
);
