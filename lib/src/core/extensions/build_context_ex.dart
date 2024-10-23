import 'package:financial_products/src/theme/app_theme.dart';
import 'package:financial_products/src/theme/app_themes.dart';
import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  double get getMediaQueryWidth => MediaQuery.sizeOf(this).width;

  double get getMediaQueryHeight => MediaQuery.sizeOf(this).height;

  BaseTheme get appTheme => AppTheme.of(this);
}
