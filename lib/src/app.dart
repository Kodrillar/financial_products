import 'package:financial_products/src/routing/app_route.dart';
import 'package:financial_products/src/theme/app_theme.dart';
import 'package:financial_products/src/theme/app_theme_data.dart';
import 'package:financial_products/src/theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screendapt/screendapt.dart';

class FinancialProductsApp extends ConsumerWidget {
  const FinancialProductsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppRouter appRouter = ref.watch(appRouterProvider);
    return AppTheme(
      theme: NorrenbergerLight(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, _) {
          return MaterialApp(
            title: 'Financial Products',
            debugShowCheckedModeBanner: false,
            theme: AppThemeData.getThemeData(context),
            home: appRouter.getHomeScreen(),
            onGenerateRoute: appRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
