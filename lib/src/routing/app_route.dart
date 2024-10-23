import 'package:financial_products/src/core/utils/logging/app_logger.dart';
import 'package:financial_products/src/features/auth/data/repository/local_auth.dart';
import 'package:financial_products/src/features/auth/domain/model/app_user.dart';
import 'package:financial_products/src/features/auth/presentation/screens/email_verification.dart';
import 'package:financial_products/src/features/auth/presentation/screens/login.dart';
import 'package:financial_products/src/features/home/presentation/screens/home.dart';
import 'package:financial_products/src/features/home/presentation/screens/product_detail.dart';
import 'package:financial_products/src/routing/route_error_page.dart';
import 'package:flutter/material.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_route.g.dart';

class AppRoutes {
  AppRoutes._();

  //Home
  static const String home = 'home_page';
  static const String productDetail = 'product_detail_page';

  //Auth
  static const String login = 'login_page';
  static const String emailVerification = 'otp_page';
}

class AppRouter {
  AppRouter(this._appUser);

  final AppUser? _appUser;
  static GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  static NavigatorState get navigator => key.currentState!;

  Widget getHomeScreen() {
    AppLogger.logD('AppUser From Router: $_appUser');
    if (_appUser != null) return const HomeScreen();
    return const LoginScreen();
  }

  static void resetNavigatorKey() {
    AppLogger.logI('Resetting Navigator Key...');
    key = GlobalKey<NavigatorState>();
  }

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    return switch (settings.name) {
      AppRoutes.home => MaterialPageRoute(builder: (_) => const HomeScreen()),
      AppRoutes.login => MaterialPageRoute(builder: (_) => const LoginScreen()),
      AppRoutes.emailVerification => MaterialPageRoute(
          builder: (_) =>
              EmailVerificationScreen(appUser: settings.arguments as AppUser),
        ),
      AppRoutes.productDetail =>
        MaterialPageRoute(builder: (_) => const ProductDetailScreen()),

      //Fallback screen if route settings name is unknown
      _ => MaterialPageRoute(builder: (_) => const RouteErrorPage())
    };
  }
}

@riverpod
AppRouter appRouter(AppRouterRef ref) {
  final AppUser? appUser = ref.watch(localAuthStateChangesProvider).value;
  AppRouter.resetNavigatorKey();
  return AppRouter(appUser);
}
