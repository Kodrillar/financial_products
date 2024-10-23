import 'package:financial_products/src/core/utils/logging/app_logger.dart';
import 'package:financial_products/src/features/home/presentation/screens/home.dart';
import 'package:financial_products/src/routing/route_error_page.dart';
import 'package:flutter/material.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_route.g.dart';

class AppRoutes {
  AppRoutes._();

  //Home
  static const String home = 'home_page';
}

class AppRouter {
  static GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  static NavigatorState get navigator => key.currentState!;

  Widget getHomeScreen() => const HomeScreen();

  static void resetNavigatorKey() {
    AppLogger.i('Resetting Navigator Key...');
    key = GlobalKey<NavigatorState>();
  }

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    return switch (settings.name) {
      AppRoutes.home => MaterialPageRoute(builder: (_) => const HomeScreen()),

      //Fallback screen if route settings name is unknown
      _ => MaterialPageRoute(builder: (_) => const RouteErrorPage())
    };
  }
}

@riverpod
AppRouter appRouter(AppRouterRef ref) {
  return AppRouter();
}
