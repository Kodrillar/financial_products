import 'package:financial_products/src/core/utils/logging/app_logger.dart';
import 'package:financial_products/src/core/widgets/loading_view.dart';
import 'package:financial_products/src/features/auth/data/repository/local_auth.dart';
import 'package:financial_products/src/routing/app_route.dart';
import 'package:financial_products/src/theme/app_theme.dart';
import 'package:financial_products/src/theme/app_theme_data.dart';
import 'package:financial_products/src/theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screendapt/screendapt.dart';

final localRepoInitializationProvider = FutureProvider(
    (ref) async => await ref.watch(localAuthRepositoryProvider.future));

class AppIntializer extends ConsumerWidget {
  const AppIntializer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppTheme(
      theme: NorrenbergerLight(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, _) =>
            ref.watch(localRepoInitializationProvider).when(
                  data: (_) => const FinancialProductsApp(),
                  error: (e, st) {
                    AppLogger.logE(e);
                    return const FinancialProductsApp(); //Replace with error view
                  },
                  loading: () => const LoadingView(),
                ),
      ),
    );
  }
}

class FinancialProductsApp extends ConsumerWidget {
  const FinancialProductsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppRouter appRouter = ref.watch(appRouterProvider);
    return MaterialApp(
      navigatorKey: AppRouter.key,
      title: 'Financial Products',
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.getThemeData(context),
      home: appRouter.getHomeScreen(),
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}
