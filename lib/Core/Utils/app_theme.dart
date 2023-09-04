import 'package:call/Core/Utils/app_colors.dart';
import 'package:call/Core/Utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData appTheme() {
  return ThemeData(
    // primaryColor: AppColorsDark.primary,
    scaffoldBackgroundColor: AppColors.kWhite,
    useMaterial3: true,

    appBarTheme: const AppBarTheme(
      surfaceTintColor: Colors.transparent,

      color: AppColors.kWhite,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.kWhite,
          statusBarIconBrightness: Brightness.dark),
      // backgroundColor: AppColorsDark.mainBg,
      elevation: 0,
      centerTitle: false,
      // iconTheme: IconThemeData(color: AppColorsDark.contentMain),
    ),
    // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    //   backgroundColor: AppColorsDark.mainBg,
    //   type: BottomNavigationBarType.fixed,
    //   selectedItemColor: AppColorsDark.primary,
    //   unselectedItemColor: AppColorsDark.contentLight,
    //   elevation: 10,
    //   selectedLabelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    //   unselectedLabelStyle:
    //       TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    // ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50))),
      backgroundColor: AppColors.kBlack,
      foregroundColor: AppColors.kWhite,
    ),
    fontFamily: AppStrings.fontFamily,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 14,
        color: AppColors.kBlack,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.kBlack, elevation: 5),
    ),
  );
}
