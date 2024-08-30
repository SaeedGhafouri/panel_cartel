import 'package:flutter/material.dart';
import 'package:panel_cartel/core/constants/assets.dart';
import 'package:panel_cartel/core/constants/colors.dart';

/// LIGHT style
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.light,
  //Colors
  primaryColor: primaryColor,
  scaffoldBackgroundColor: backgroundColor,
  cardColor: cardColor,
  dividerColor: dividerColor,
  hintColor: textHintColor,

  appBarTheme: const AppBarTheme(
    backgroundColor: toolbarColor,
  ),

  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: textPrimaryColor,
      fontSize: 14,
      fontFamily: font_regular,
    ),
    bodyMedium: TextStyle(
      color: textPrimaryColor,
      fontSize: 12,
      fontFamily: font_regular,
    ),
    bodySmall: TextStyle(
      color: textPrimaryColor,
      fontSize: 10,
      fontFamily: font_regular,
    ),

    //Title
    titleLarge: TextStyle(
      color: textPrimaryColor,
      fontSize: 18,
      fontFamily: font_bold,
    ),
    titleMedium: TextStyle(
      color: textPrimaryColor,
      fontSize: 14,
      fontFamily: font_medium,
    ),
    titleSmall: TextStyle(
      color: textPrimaryColor,
      fontSize: 12,
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

    //Gray Text
    headlineLarge: TextStyle(
      color: textSecondaryColor,
      fontSize: 14,
      fontFamily: font_regular,
    ),
    headlineMedium: TextStyle(
      color: textSecondaryColor,
      fontSize: 12,
      fontFamily: font_regular,
    ),
    headlineSmall: TextStyle(
      color: textSecondaryColor,
      fontSize: 8,
      fontFamily: font_regular,
    ),


    labelLarge: TextStyle(
      color: textPrimaryColor,
      fontSize: 16,
      fontFamily: font_medium,
      fontWeight: FontWeight.w600,
    ),
    labelMedium: TextStyle(
      color: textPrimaryColor,
      fontSize: 14,
      fontFamily: font_regular,
    ),
    labelSmall: TextStyle(
      color: textPrimaryColor,
      fontSize: 12,
      fontFamily: font_regular,
    ),
  ),


);

/// DARK style
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.dark,
  //Colors
  primaryColor: primaryColor,
  scaffoldBackgroundColor: backgroundDarkColor,

  cardColor: cardDarkColor,
  dividerColor: dividerDarkColor,
  hintColor: textHintDarkColor,

  appBarTheme: const AppBarTheme(
    backgroundColor: toolbarDarkColor,
  ),

  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: textPrimaryDarkColor,
      fontSize: 16,
      fontFamily: font_regular,
    ),
    bodyMedium: TextStyle(
      color: textPrimaryDarkColor,
      fontSize: 14,
      fontFamily: font_regular,
    ),
    bodySmall: TextStyle(
      color: textPrimaryDarkColor,
      fontSize: 12,
      fontFamily: font_regular,
    ),

    //Title
    titleLarge: TextStyle(
      color: textPrimaryDarkColor,
      fontSize: 18,
      fontFamily: font_bold,
    ),
    titleMedium: TextStyle(
      color: textPrimaryDarkColor,
      fontSize: 14,
      fontFamily: font_medium,
    ),
    titleSmall: TextStyle(
      color: textPrimaryDarkColor,
      fontSize: 12,
      fontFamily: font_regular,
    ),

    displayLarge: TextStyle(
      color: textPrimaryDarkColor,
      fontSize: 36,
      fontFamily: font_bold,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      color: textPrimaryDarkColor,
      fontSize: 32,
      fontFamily: font_bold,
    ),
    displaySmall: TextStyle(
      color: textPrimaryDarkColor,
      fontSize: 28,
      fontFamily: font_bold,
    ),

    //Gray Text
    headlineLarge: TextStyle(
      color: textSecondaryDarkColor,
      fontSize: 14,
      fontFamily: font_regular,
    ),
    headlineMedium: TextStyle(
      color: textSecondaryDarkColor,
      fontSize: 12,
      fontFamily: font_regular,
    ),
    headlineSmall: TextStyle(
      color: textSecondaryDarkColor,
      fontSize: 10,
      fontFamily: font_regular,
    ),

    labelLarge: TextStyle(
      color: textPrimaryDarkColor,
      fontSize: 14,
      fontFamily: font_medium,
      fontWeight: FontWeight.w600,
    ),
    labelMedium: TextStyle(
      color: textPrimaryDarkColor,
      fontSize: 12,
      fontFamily: font_regular,
    ),
    labelSmall: TextStyle(
      color: textPrimaryDarkColor,
      fontSize: 10,
      fontFamily: font_regular,
    ),
  ),


);
