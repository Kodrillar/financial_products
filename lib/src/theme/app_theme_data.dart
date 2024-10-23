import 'package:financial_products/src/core/extensions/build_context_ex.dart';
import 'package:financial_products/src/res/fonts.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  AppThemeData._();

  static ThemeData getThemeData(BuildContext context) => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: context.appTheme.primary),
        fontFamily: AppFonts.inter,
        useMaterial3: true,
        scaffoldBackgroundColor: context.appTheme.background,
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: context.appTheme.text),
        ),
      );
}
