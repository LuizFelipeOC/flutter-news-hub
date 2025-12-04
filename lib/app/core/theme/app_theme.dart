import 'package:flutter/material.dart';
import 'package:news_hub/app/core/theme/app_colors.dart';

final class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.neutral100,
      primaryColor: AppColors.neutral800,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.neutral900,
      primaryColor: AppColors.neutral100,
    );
  }
}
