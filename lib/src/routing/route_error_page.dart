import 'package:flutter/material.dart';
import 'package:screendapt/screendapt.dart';

class RouteErrorPage extends StatelessWidget {
  const RouteErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SText(
              'Route Error',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
