import 'package:flutter/material.dart';

/// Base theme for abstract implementation of themes that might exist in the app
/// New themes in the app will have to inherit theme properties from the base theme for consistency;
sealed class BaseTheme {
  Color get primary;

  Color get text;

  Color get textLight;

  Color get background;

  Color get foreground;

  Color get error;

  Color get light => Colors.white;

  Color get dark => Colors.black;
}

/// Default theme that inherits theme properties from the [BaseTheme] class
class NorrenbergerLight extends BaseTheme {
  @override
  Color get primary => const Color(0xFFF14A26);

  @override
  Color get text => const Color(0xFF414142);

  @override
  Color get textLight => const Color(0xFFA2A2A2);

  @override
  Color get background => const Color(0xFFF0F4F9);

  @override
  Color get foreground => light;

  @override
  Color get error => Colors.red;
}
