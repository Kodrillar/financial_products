import 'package:financial_products/src/core/extensions/build_context_ex.dart';
import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: context.appTheme.background,
        body: Center(
          child: SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(
              color: context.appTheme.primary,
              strokeWidth: 8,
            ),
          ),
        ),
      ),
    );
  }
}
