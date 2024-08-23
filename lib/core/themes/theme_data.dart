import 'package:flutter/material.dart';
import 'package:panel_cartel/core/constants/assets.dart';
import 'package:panel_cartel/core/constants/colors.dart';

/// LIGHT style
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  //Colors
  primaryColor: primaryColor,
  scaffoldBackgroundColor: backgroundColor,

  appBarTheme: const AppBarTheme(
    backgroundColor: toolbarColor,
    foregroundColor: Colors.white,
  ),

  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: textPrimaryColor,
      fontSize: 16,
      fontFamily: font_regular,
    ),
    bodyMedium: TextStyle(
      color: textPrimaryColor,
      fontSize: 14,
      fontFamily: font_regular,
    ),
    bodySmall: TextStyle(
      color: textPrimaryColor,
      fontSize: 12,
      fontFamily: font_regular,
    ),

    titleLarge: TextStyle(
      color: textPrimaryColor,
      fontSize: 22,
      fontFamily: font_bold,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      color: textPrimaryColor,
      fontSize: 20,
      fontFamily: font_medium,
    ),
    titleSmall: TextStyle(
      color: textPrimaryColor,
      fontSize: 18,
      fontFamily: font_regular,
    ),

    displayLarge: TextStyle(
      color: textPrimaryColor,
      fontSize: 36,
      fontFamily: font_bold,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      color: textPrimaryColor,
      fontSize: 32,
      fontFamily: font_bold,
    ),
    displaySmall: TextStyle(
      color: textPrimaryColor,
      fontSize: 28,
      fontFamily: font_bold,
    ),

    headlineLarge: TextStyle(
      color: textPrimaryColor,
      fontSize: 28,
      fontFamily: font_medium,
    ),
    headlineMedium: TextStyle(
      color: textPrimaryColor,
      fontSize: 24,
      fontFamily: font_medium,
    ),
    headlineSmall: TextStyle(
      color: textPrimaryColor,
      fontSize: 20,
      fontFamily: font_medium,
    ),

    labelLarge: TextStyle(
      color: textPrimaryColor,
      fontSize: 14,
      fontFamily: font_medium,
      fontWeight: FontWeight.w600,
    ),
    labelMedium: TextStyle(
      color: textPrimaryColor,
      fontSize: 12,
      fontFamily: font_regular,
    ),
    labelSmall: TextStyle(
      color: textPrimaryColor,
      fontSize: 10,
      fontFamily: font_regular,
    ),
  ),


);

/// DARK style
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  //Colors
  primaryColor: primaryColor,
  scaffoldBackgroundColor: backgroundColor,

  appBarTheme: const AppBarTheme(
    backgroundColor: toolbarDarkColor,
  ),

  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: textPrimaryColor,
      fontSize: 16,
      fontFamily: font_regular,
    ),
    bodyMedium: TextStyle(
      color: textPrimaryColor,
      fontSize: 14,
      fontFamily: font_regular,
    ),
    bodySmall: TextStyle(
      color: textPrimaryColor,
      fontSize: 12,
      fontFamily: font_regular,
    ),

    titleLarge: TextStyle(
      color: textPrimaryColor,
      fontSize: 22,
      fontFamily: font_bold,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      color: textPrimaryColor,
      fontSize: 20,
      fontFamily: font_medium,
    ),
    titleSmall: TextStyle(
      color: textPrimaryColor,
      fontSize: 18,
      fontFamily: font_regular,
    ),

    displayLarge: TextStyle(
      color: textPrimaryColor,
      fontSize: 36,
      fontFamily: font_bold,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      color: textPrimaryColor,
      fontSize: 32,
      fontFamily: font_bold,
    ),
    displaySmall: TextStyle(
      color: textPrimaryColor,
      fontSize: 28,
      fontFamily: font_bold,
    ),

    headlineLarge: TextStyle(
      color: textPrimaryColor,
      fontSize: 28,
      fontFamily: font_medium,
    ),
    headlineMedium: TextStyle(
      color: textPrimaryColor,
      fontSize: 24,
      fontFamily: font_medium,
    ),
    headlineSmall: TextStyle(
      color: textPrimaryColor,
      fontSize: 20,
      fontFamily: font_medium,
    ),

    labelLarge: TextStyle(
      color: textPrimaryColor,
      fontSize: 14,
      fontFamily: font_medium,
      fontWeight: FontWeight.w600,
    ),
    labelMedium: TextStyle(
      color: textPrimaryColor,
      fontSize: 12,
      fontFamily: font_regular,
    ),
    labelSmall: TextStyle(
      color: textPrimaryColor,
      fontSize: 10,
      fontFamily: font_regular,
    ),
  ),


);
