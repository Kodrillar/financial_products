import 'package:financial_products/src/core/extensions/build_context_ex.dart';
import 'package:financial_products/src/res/fonts.dart';
import 'package:flutter/material.dart';
import 'package:screendapt/screendapt.dart';

class AppPrimaryActionButton extends StatelessWidget {
  const AppPrimaryActionButton({
    super.key,
    this.style,
    this.onPressed,
    required this.child,
  });

  final ButtonStyle? style;
  final Widget child;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    const buttonPadding = WidgetStatePropertyAll(
      EdgeInsets.symmetric(vertical: 10),
    );

    final buttonSize = WidgetStatePropertyAll(
      Size(context.getMediaQueryWidth, 48),
    );

    const elevation = WidgetStatePropertyAll(0.0);

    return ElevatedButton(
      onPressed: onPressed,
      style: (style?.copyWith(
            padding: buttonPadding,
            fixedSize: buttonSize,
            elevation: elevation,
          )) ??
          ButtonStyle(
            padding: buttonPadding,
            fixedSize: buttonSize,
            elevation: elevation,
            overlayColor:
                WidgetStatePropertyAll(context.appTheme.light.withOpacity(.1)),
            backgroundColor: WidgetStatePropertyAll(
              onPressed == null
                  ? context.appTheme.dark.withOpacity(.15)
                  : context.appTheme.primary,
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
      child: child,
    );
  }
}

class ButtonText extends StatelessWidget {
  const ButtonText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return SText(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: AppFonts.inter,
        color: context.appTheme.light,
      ),
    );
  }
}

class ButtonLoader extends StatelessWidget {
  const ButtonLoader({super.key});

  @override
  Widget build(BuildContext context) {
    const double size = 16;
    return SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(context.appTheme.primary),
      ),
    );
  }
}
