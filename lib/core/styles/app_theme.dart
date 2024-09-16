import 'package:alquran_app/core/styles/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  // Light Theme Data
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: false,
    brightness: Brightness.light,
    primaryColor: AppColor.lightPrimaryColor,
    scaffoldBackgroundColor: AppColor.lightBgColor,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColor.lightBgColor,
      titleTextStyle: TextStyle(
        fontSize: 20,
        color: AppColor.lightTitleColor,
        fontWeight: FontWeight.w700,
      ),
      iconTheme: IconThemeData(
        color: AppColor.lightHeadlineColor, // Ganti dengan warna ikon yang diinginkan
      ),
    ),
    fontFamily: 'Poppins',
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontSize: 28,
        color: AppColor.lightHeadlineColor,
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        color: Color(0xFF240F4F),
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        color: AppColor.lightTitleMediumColor,
        fontWeight: FontWeight.w400,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        color: AppColor.lightPrimaryColor,
        fontWeight: FontWeight.w700,
        fontFamily: 'Amiri',
      ),
    ),
  );

  // Dark Theme Data
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    brightness: Brightness.dark,
    primaryColor: AppColor.darkPrimaryColor,
    scaffoldBackgroundColor: AppColor.darkBgColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.darkBgColor,
      titleTextStyle: TextStyle(
        fontSize: 20,
        color: AppColor.darkTitleColor,
        fontWeight: FontWeight.w700,
      ),
      iconTheme: IconThemeData(
        color: AppColor.darkHeadlineColor, // Ganti dengan warna ikon yang diinginkan
      ),
    ),
    fontFamily: 'Poppins',
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontSize: 28,
        color: AppColor.darkHeadlineColor,
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        color: Color(0xFFFFFFFF),
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        color: AppColor.darkTitleMediumColor,
        fontWeight: FontWeight.w400,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        color: AppColor.darkPrimaryColor,
        fontWeight: FontWeight.w700,
        fontFamily: 'Amiri',
      ),
    ),
  );
}
