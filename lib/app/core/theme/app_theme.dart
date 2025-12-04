import 'package:flutter/material.dart';
import 'package:news_hub/app/core/theme/app_colors.dart';

final class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.neutral100,
      primaryColor: AppColors.neutral800,
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.light,
        seedColor: AppColors.neutral800,
        primary: AppColors.neutral900,
        onPrimary: AppColors.neutral100,
        secondary: AppColors.neutral800,
        onSecondary: AppColors.neutral100,
        surface: AppColors.neutral100,
        onSurface: AppColors.neutral900,
        error: AppColors.neutral900,
        onError: AppColors.neutral100,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.green400,
          foregroundColor: AppColors.neutral100,
        ),
      ),
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
        onSurface: AppColors.neutral100,
        error: AppColors.neutral100,
        onError: AppColors.neutral900,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.green400,
          foregroundColor: AppColors.neutral100,
        ),
      ),
    );
  }
}
