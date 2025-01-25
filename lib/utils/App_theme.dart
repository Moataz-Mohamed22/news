import 'package:flutter/material.dart';
import 'package:news/utils/App_Colors.dart';
import 'package:news/utils/App_styles.dart';

class AppTheme {
  static final lightTheme = ThemeData(
      indicatorColor: AppColors.black,
iconTheme: IconThemeData(
  color: AppColors.white
),
      primaryColor: AppColors.white,
      scaffoldBackgroundColor: AppColors.white,
      textTheme: TextTheme(
          labelLarge: AppStyles.bold16black,
          labelMedium: AppStyles.mediuem14black,
          headlineLarge: AppStyles.mediuem20black),
      appBarTheme:
          AppBarTheme(centerTitle: true, backgroundColor: AppColors.white));
  static final darkTheme = ThemeData(
      iconTheme: IconThemeData(
          color: AppColors.black
      ),
      indicatorColor: AppColors.white,
      primaryColor: AppColors.black,
      scaffoldBackgroundColor: AppColors.black,
      textTheme: TextTheme(
          labelLarge: AppStyles.bold16White,
          labelMedium: AppStyles.mediuem14White,
          headlineLarge: AppStyles.mediuem20White),
      appBarTheme:
          AppBarTheme(centerTitle: true, backgroundColor: AppColors.black));
}
