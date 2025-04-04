import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loty_play/configs/carousel_sports.dart';
import 'package:loty_play/presentation/screens.dart';
import 'package:loty_play/widgets/bottom_nav_bar_home.dart';

class Routes {
  static const String home = '/';
  static const String settings = '/settings';
  static const String sport = '/sport';
}

final router = GoRouter(
  initialLocation: Routes.home,
  routes: [
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavBar()
        );
      },
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => _fadePage(
            state: state,
            child: const HomeScreen(),
          ),
          
        ),
        GoRoute(
          path: '/settings',
          pageBuilder: (context, state) => _fadePage(
            state: state,
            child: const SettingsScreen(),
          ),
        ),
      ],
    ),

    GoRoute(
      path: Routes.sport,
      builder: (context, state) {
        final sport = state.extra as Sport; 
        return SportScreen(sport: sport);
      },
    ),
  ],
);

CustomTransitionPage _fadePage({
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 20), // más rápida
    transitionsBuilder: (context, animation, _, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}