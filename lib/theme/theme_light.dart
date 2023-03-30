import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,

  scaffoldBackgroundColor: AppColors.backgroundLight,
  primaryIconTheme: const IconThemeData(color: Colors.white),
  iconTheme: const IconThemeData(color: Colors.black),
  cardColor: AppColors.cardLight,

  dividerColor: AppColors.dividerLight,
  shadowColor: Colors.black26,
  primaryColor: Colors.red,
  colorScheme: const ColorScheme(
    primary: AppColors.primary,
    onPrimary: AppColors.textLightTheme,
    primaryContainer: AppColors.primaryContainerLight,
    secondary: AppColors.secondary,
    onSecondary: Colors.white,
    secondaryContainer: AppColors.secondaryContainer,
    surface: Colors.white,
    onSurface: AppColors.textLightTheme,
    background: AppColors.backgroundLight,
    onBackground: AppColors.textLightTheme,
    error: AppColors.secondary,
    onError: Colors.white,
    brightness: Brightness.light,
  ),
  cardTheme: CardTheme(
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    color: AppColors.backgroundLight,
    margin: EdgeInsets.zero,
  ),

  /// where "light" is FontWeight.w300, "regular" is FontWeight.w400 and "medium" is FontWeight.w500.
  textTheme: const TextTheme(
    /// Label TextTheme
    labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: AppColors.textLightTheme),
    labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.textLightTheme),
    labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.textLightTheme),

    /// Body TextTheme
    bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.textLightTheme),
    bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.textLightTheme),
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.textLightTheme),

    /// Title TextTheme
    titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.textLightTheme),
    titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.textLightTheme),
    titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: AppColors.textLightTheme),

    /// Headline TextTheme
    headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, color: AppColors.textLightTheme),
    headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w400, color: AppColors.textLightTheme),
    headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w400, color: AppColors.textLightTheme),

    /// Display TextTheme
    displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.w400, color: AppColors.textLightTheme),
    displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.w400, color: AppColors.textLightTheme),
    displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.w400, color: AppColors.textLightTheme),
  ),

  /// Button TextTheme
  buttonTheme: const ButtonThemeData(),

  /// Button

  /// ElevatedButton TextTheme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateProperty.all<Color>(AppColors.green),
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: AppColors.primaryContainerLight,
    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
    filled: true,
    labelStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.textLightTheme,
    ),
    hintStyle: const TextStyle(
      fontWeight: FontWeight.w400,
      color: Colors.white,
      fontSize: 14,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: AppColors.primary.withOpacity(0.5), width: 0.5),
    ),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.primary,
    selectionColor: AppColors.primaryContainerDark,
    selectionHandleColor: AppColors.primary,
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
      foregroundColor: MaterialStateProperty.all<Color>(AppColors.primary),
      shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
      overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(
          color: AppColors.primary,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
      side: MaterialStateProperty.all<BorderSide>(const BorderSide(color: AppColors.primary)),
      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(
          color: AppColors.textLightTheme,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStateProperty.all<Color?>(AppColors.primary),
    checkColor: MaterialStateProperty.all<Color?>(Colors.white),
    side: const BorderSide(width: 0.7, color: AppColors.primary),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  radioTheme: RadioThemeData(
    fillColor: MaterialStateProperty.all<Color>(AppColors.primary),
  ),
  dividerTheme: const DividerThemeData(
    color: AppColors.dividerLight,
    thickness: 1,
    space: 0,
  ),
  appBarTheme: const AppBarTheme(
    titleSpacing: 0,
    elevation: 0,
    color: AppColors.backgroundLight,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.darkBoldText,
    ),
    centerTitle: true,
    actionsIconTheme: IconThemeData(color: AppColors.textLightTheme),
    iconTheme: IconThemeData(color: AppColors.textLightTheme),
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: AppColors.textLightTheme,
    labelStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColors.primary,
    ),
    unselectedLabelColor: AppColors.unSelectedColor,
    unselectedLabelStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColors.unSelectedColor,
    ),
  ),
  indicatorColor: AppColors.indicatorLightColor,
  bottomAppBarTheme: const BottomAppBarTheme(
    color: Colors.white,
    elevation: 0,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(),
);
