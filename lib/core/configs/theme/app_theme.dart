import 'package:flutter/material.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
      primaryColor: appColors.primary,
      scaffoldBackgroundColor: appColors.lightBackground,
      brightness: Brightness.light,
      fontFamily: "shabnam",
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: appColors.primary,
              textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ))));

  static final darkTheme = ThemeData(
      primaryColor: appColors.primary,
      scaffoldBackgroundColor: appColors.darkBackground,
      brightness: Brightness.dark,
      fontFamily: "shabnam",
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: appColors.primary,
              textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ))));
}
