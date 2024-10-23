import 'package:financial_products/src/core/extensions/build_context_ex.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.labelText,
    this.validator,
    this.enabled,
    this.controller,
    this.suffix,
    this.keyboardType,
    this.textInputAction,
    this.onFieldSubmitted,
    this.obscureText = false,
    this.inputFormatters,
  });

  final String labelText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool? enabled;
  final TextInputType? keyboardType;
  final Widget? suffix;
  final bool obscureText;
  final void Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;

  void _unfocusOnTextField() => FocusManager.instance.primaryFocus?.unfocus();

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.circular(5);
    final InputBorder border = OutlineInputBorder(
      borderSide: BorderSide(color: context.appTheme.text),
      borderRadius: borderRadius,
    );

    final InputBorder focusedBorder = OutlineInputBorder(
        borderSide: BorderSide(color: context.appTheme.primary, width: 1.5),
        borderRadius: borderRadius);

    final InputBorder focusedErrorBorder = OutlineInputBorder(
      borderSide: BorderSide(color: context.appTheme.error, width: 1.5),
      borderRadius: borderRadius,
    );

    final TextStyle lableTextStyle =
        TextStyle(color: context.appTheme.textLight, fontSize: 15);

    final TextStyle textStyle =
        TextStyle(color: context.appTheme.text, fontSize: 15);

    final TextStyle errorTextStyle = TextStyle(
      color: context.appTheme.error,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    );

    return TextFormField(
      style: textStyle,
      enabled: enabled,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      controller: controller,
      onTapOutside: (_) => _unfocusOnTextField(),
      cursorColor: context.appTheme.primary,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        errorStyle: errorTextStyle,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        labelText: labelText,
        labelStyle: lableTextStyle,
        enabledBorder: border,
        border: border,
        focusedBorder: focusedBorder,
        focusedErrorBorder: focusedErrorBorder,
        suffixIcon: suffix,
      ),
    );
  }
}
