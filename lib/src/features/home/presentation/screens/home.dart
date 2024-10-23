import 'package:financial_products/src/res/images.dart';
import 'package:financial_products/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:screendapt/screendapt.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SText(
              'User Introduction (Dummy)',
              style: TextStyle(
                color: AppTheme.of(context).text,
              ),
            ),
            SText(
              'Hello, my name is David Ipadeola',
              style: TextStyle(
                color: AppTheme.of(context).textLight,
              ),
            ),
            //Test Image Display
            Image.asset(AppImages.companyLogo)
          ],
        ),
      ),
    );
  }
}
