import 'package:flutter/material.dart';
import 'package:ollang_recipe/theme/app_colors.dart';

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.backgroundDark,
  primaryIconTheme: const IconThemeData(color: Colors.white),
  iconTheme: const IconThemeData(color: Colors.black),
  cardColor: AppColors.primaryContainerDark,
  dividerColor: AppColors.dividerDark,
  shadowColor: Colors.black26,
  primaryColor: Colors.greenAccent,
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primary,
    onPrimary: AppColors.textDarkTheme,
    primaryContainer: AppColors.primaryContainerDark,
    onPrimaryContainer: AppColors.primaryContainerDark,
    secondary: AppColors.secondary,
    onSecondary: Colors.white,
    secondaryContainer: AppColors.secondaryContainer,
    onSecondaryContainer: AppColors.secondaryContainer,
    surface: Colors.white,
    onSurface: AppColors.textDarkTheme,
    background: AppColors.backgroundDark,
    onBackground: AppColors.textDarkTheme,
    error: AppColors.secondary,
    onError: Colors.white,
  ),
  cardTheme: CardTheme(
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    color: AppColors.backgroundDark,
    margin: EdgeInsets.zero,
  ),
  textTheme: const TextTheme(
    /// Label TextTheme
    labelSmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: AppColors.textDarkTheme),
    labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.textDarkTheme),
    labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.textDarkTheme),

    /// Body TextTheme
    bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.textDarkTheme),
    bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.textDarkTheme),
    bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.textDarkTheme),

    /// Title TextTheme
    titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.textDarkTheme),
    titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.textDarkTheme),
    titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: AppColors.textDarkTheme),

    /// Headline TextTheme
    headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: AppColors.textDarkTheme),
    headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        color: AppColors.textDarkTheme),
    headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        color: AppColors.textDarkTheme),

    /// Display TextTheme
    displaySmall: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        color: AppColors.textDarkTheme),
    displayMedium: TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        color: AppColors.textDarkTheme),
    displayLarge: TextStyle(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        color: AppColors.textDarkTheme),
  ),
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
    fillColor: AppColors.inputDecorationDark,
    filled: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
    labelStyle: const TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: AppColors.textDarkTheme,
    ),
    hintStyle: const TextStyle(
      fontWeight: FontWeight.w400,
      color: AppColors.paleTextDarkTheme,
      fontSize: 15,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: AppColors.primary,
    selectionColor: AppColors.primaryContainerLight,
    selectionHandleColor: AppColors.primaryContainerLight.withOpacity(0.2),
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
      side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(color: AppColors.primary)),
      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(
          color: AppColors.textDarkTheme,
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
      fillColor: MaterialStateProperty.all<Color>(AppColors.primary)),
  dividerTheme: const DividerThemeData(
      color: AppColors.dividerDark, thickness: 1, space: 0),
  appBarTheme: const AppBarTheme(
    titleSpacing: 0,
    elevation: 0,
    color: AppColors.backgroundDark,
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    centerTitle: true,
    actionsIconTheme: IconThemeData(color: Colors.white),
    iconTheme: IconThemeData(color: Colors.white),
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: AppColors.textDarkTheme,
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
  indicatorColor: AppColors.indicatorDarkColor,
  bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white, elevation: 0),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(),
);
