import 'package:financial_products/src/theme/app_themes.dart';
import 'package:flutter/material.dart';

class AppTheme extends StatelessWidget {
  const AppTheme({super.key, required this.child, required this.theme});
  final Widget child;
  final BaseTheme theme;

  static BaseTheme of(BuildContext context) => context
      .findAncestorWidgetOfExactType<_AppThemeInheritedWidget>()!
      .appTheme
      .theme;

  @override
  Widget build(BuildContext context) {
    return _AppThemeInheritedWidget(appTheme: this, child: child);
  }
}

class _AppThemeInheritedWidget extends InheritedWidget {
  const _AppThemeInheritedWidget({
    required Widget child,
    required this.appTheme,
  }) : super(child: child);

  final AppTheme appTheme;

  @override
  bool updateShouldNotify(_AppThemeInheritedWidget oldWidget) =>
      oldWidget.appTheme.theme != appTheme.theme;
}
