import 'package:flutter/material.dart';
import 'package:news_hub/app/core/constants/app_images.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: Center(
        child: Image.asset(AppImages.appIcon, width: width * 0.5, height: height * 0.5),
      ),
    );
  }
}
