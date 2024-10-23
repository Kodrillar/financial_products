import 'package:financial_products/src/core/widgets/app_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension AsyncValueDialog on AsyncValue {
  showErrorAlertDialog(BuildContext context) {
    if (hasError && !isRefreshing && (this is AsyncError)) {
      if (context.mounted) {
        AppDialogs.showErrorDialog(context, message: error.toString());
      }
    }
  }
}
