import 'package:financial_products/src/core/extensions/build_context_ex.dart';
import 'package:flutter/material.dart';
import 'package:screendapt/screendapt.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({super.key, required this.text, this.fontSize = 17});

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return SText(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: context.appTheme.primary,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
