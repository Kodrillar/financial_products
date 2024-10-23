import 'package:financial_products/src/app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

void main() {
  // This prevents logging sensitive or unecessary app info in release mode.
  if (kReleaseMode) {
    Logger.level = Level.info;
  } else {
    Logger.level = Level.debug;
  }

  runApp(
    const ProviderScope(child: AppIntializer()),
  );
}
