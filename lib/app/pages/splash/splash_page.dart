import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_hub/app/core/constants/app_images.dart';
import 'package:news_hub/app/pages/splash/splash_controller.dart';
import 'package:news_hub/app/pages/splash/splash_state.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late SplashController controller;

  @override
  void initState() {
    controller = context.read<SplashController>();

    controller.addListener(_handleNavigation);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.checkFirstAccess();
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(_handleNavigation);
    super.dispose();
  }

  void _handleNavigation() {
    final state = controller.value;

    if (state is SplashLoadedState) {
      if (state.isFirstAccess == false) {
        context.replace('/onboarding');
      } else {
        context.replace('/home');
      }
    }
  }

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
