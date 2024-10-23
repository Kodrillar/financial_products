import 'package:financial_products/src/core/extensions/build_context_ex.dart';
import 'package:financial_products/src/routing/app_route.dart';
import 'package:flutter/material.dart';
import 'package:screendapt/screendapt.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          overlayColor:
              WidgetStatePropertyAll(context.appTheme.primary.withOpacity(.08)),
          onTap: () => AppRouter.navigator.pop(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: SIcon(
              Icons.arrow_back,
              color: context.appTheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
