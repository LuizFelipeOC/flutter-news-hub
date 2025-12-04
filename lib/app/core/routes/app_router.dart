import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_hub/app/pages/onboarding/onboarding_page.dart';

final GoRouter routerConfiguration = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return OnboardingPage(key: ValueKey('Onboarding'));
      },
    ),
  ],
);
