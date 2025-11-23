import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'AppColors.dart';



class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,

    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.primaryColor,
      foregroundColor: AppColor.whiteColor,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColor.whiteColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryColor,
      foregroundColor: AppColor.whiteColor,
    ),

    textTheme:  TextTheme(
      titleLarge: TextStyle(fontWeight: FontWeight.bold, color: AppColor.blackColor87),
      bodyLarge: TextStyle(color: AppColor.blackColor87),
      bodyMedium: TextStyle(color: AppColor.blackColor54),
    ),

    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey.shade400),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColor.primaryColor, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),

    tabBarTheme: TabBarThemeData(
      labelColor: AppColor.whiteColor,
      unselectedLabelColor: Colors.white70,
      labelStyle: GoogleFonts.lato(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
            color: AppColor.whiteColor,
            width: 4,
        ),
      ),
      indicatorSize: TabBarIndicatorSize.tab,
    ),

  );
}