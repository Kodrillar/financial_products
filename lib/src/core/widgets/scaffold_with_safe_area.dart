import 'package:flutter/material.dart';

class ScaffoldWithSafeArea extends StatelessWidget {
  const ScaffoldWithSafeArea({
    super.key,
    required this.body,
    this.appBar,
    this.drawer,
    this.backgroundColor,
  });

  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? drawer;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      drawer: drawer,
      appBar: appBar,
      body: SafeArea(child: body),
    );
  }
}
