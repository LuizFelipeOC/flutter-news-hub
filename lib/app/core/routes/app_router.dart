import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_hub/app/data/models/users_contents/user_contents_paramerters.dart';
import 'package:news_hub/app/pages/home/home_page.dart';
import 'package:news_hub/app/pages/new_content/news_content_page.dart';
import 'package:news_hub/app/pages/onboarding/onboarding_page.dart';
import 'package:news_hub/app/pages/user_contents/user_contents_page.dart';

final GoRouter routerConfiguration = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return OnboardingPage(key: ValueKey('Onboarding'));
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return HomePage(key: ValueKey('Home'));
      },
    ),
    GoRoute(
      path: '/news-page',
      builder: (BuildContext context, GoRouterState state) {
        final id = (state.extra as Map)['id'] as String? ?? '';
        final userId = (state.extra as Map)['userId'] as String? ?? '';

        return NewsPage(key: ValueKey('NewsPage'), id: id, userId: userId);
      },
    ),
    GoRoute(
      path: '/users-content',
      builder: (context, state) {
        final userContentsParamerters =
            (state.extra as Map)['userContentsParamerters'] as UserContentsParamerters?;

        return UserContentsPage(
          key: ValueKey('UserContents'),
          userContentsParamerters: userContentsParamerters!,
        );
      },
    ),
  ],
);
