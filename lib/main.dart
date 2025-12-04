import 'package:flutter/material.dart';
import 'package:news_hub/app/core/routes/app_router.dart';
import 'package:news_hub/app/core/theme/app_theme.dart';

void main() {
  runApp(const NewsHub());
}

class NewsHub extends StatelessWidget {
  const NewsHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routerConfiguration,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
