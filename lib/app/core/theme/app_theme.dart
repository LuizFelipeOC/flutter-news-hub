import 'package:flutter/material.dart';
import 'package:news_hub/app/core/theme/app_colors.dart';

final class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.neutral50,
      primaryColor: AppColors.neutral800,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light,
        seedColor: AppColors.neutral800,
        primary: AppColors.neutral900,
        onPrimary: AppColors.neutral100,
        secondary: AppColors.neutral800,
        onSecondary: AppColors.neutral400,
        surface: AppColors.neutral200,
        onSurface: AppColors.neutral900,
        error: AppColors.neutral900,
        onError: AppColors.neutral100,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.green400,
          foregroundColor: AppColors.neutral100,
          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      textTheme: TextTheme(
        headlineMedium: TextStyle(fontSize: 24, color: AppColors.neutral900),
        headlineLarge: TextStyle(fontSize: 32, color: AppColors.neutral900),
      ),
      iconTheme: IconThemeData(color: AppColors.neutral300, size: 18),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.neutral900,
      primaryColor: AppColors.neutral100,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: AppColors.neutral800,
        primary: AppColors.neutral100,
        onPrimary: AppColors.neutral900,
        secondary: AppColors.neutral800,
        onSecondary: AppColors.neutral100,
        surface: AppColors.neutral800,
        onSurface: AppColors.neutral800,
        error: AppColors.neutral100,
        onError: AppColors.neutral900,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.green400,
          foregroundColor: AppColors.neutral100,
          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      textTheme: TextTheme(
        headlineMedium: TextStyle(fontSize: 24, color: AppColors.neutral100),
        headlineLarge: TextStyle(fontSize: 32, color: AppColors.neutral100),
        bodyLarge: TextStyle(fontSize: 14, color: AppColors.neutral200),
        bodyMedium: TextStyle(fontSize: 12, color: AppColors.neutral200),
      ),
      iconTheme: IconThemeData(color: AppColors.neutral300, size: 18),
    );
  }
}
