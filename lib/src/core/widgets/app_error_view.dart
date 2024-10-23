import 'package:financial_products/src/core/extensions/build_context_ex.dart';
import 'package:financial_products/src/core/utils/app_spacer.dart';
import 'package:flutter/material.dart';
import 'package:screendapt/screendapt.dart';

class AppErrorView extends StatelessWidget {
  const AppErrorView({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Spacers.h40,
        SText(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: context.appTheme.text.withOpacity(.65),
          ),
        ),
        Spacers.h20,
        IconButton(
          onPressed: onRetry,
          icon: SIcon(
            Icons.replay_outlined,
            color: context.appTheme.primary,
          ),
        )
      ],
    );
  }
}
