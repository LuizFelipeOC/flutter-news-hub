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
        error: AppColors.red600,
        onError: AppColors.red500,
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
        bodyMedium: TextStyle(fontSize: 16, color: AppColors.neutral800),
      ),
      iconTheme: IconThemeData(color: AppColors.neutral300, size: 18),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColors.neutral800,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.neutral200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.neutral50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 2,
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
        onSurface: AppColors.neutral800,
        error: AppColors.red600,
        onError: AppColors.red500,
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
        bodyMedium: TextStyle(fontSize: 16, color: AppColors.neutral200),
        bodySmall: TextStyle(fontSize: 12, color: AppColors.neutral200),
      ),
      iconTheme: IconThemeData(color: AppColors.neutral300, size: 18),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColors.neutral800,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.neutral800,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        iconColor: AppColors.neutral100,
      ),
      cardTheme: CardThemeData(
        color: AppColors.neutral800,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 2,
      ),
    );
  }
}
