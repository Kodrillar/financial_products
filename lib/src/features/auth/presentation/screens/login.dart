import 'package:financial_products/src/core/utils/app_spacer.dart';
import 'package:financial_products/src/core/widgets/app_primary_action_button.dart';
import 'package:financial_products/src/core/widgets/app_text_field.dart';
import 'package:financial_products/src/features/auth/presentation/auth_flow_view.dart';
import 'package:financial_products/src/routing/app_route.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _firstNameController = TextEditingController(),
      _emailController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthFlowView(
      title: 'Log In',
      subTitle: 'Access your Norrenberger account',
      children: [
        const AppTextField(labelText: 'First name'),
        Spacers.h15,
        const AppTextField(labelText: 'Email'),
        Spacers.h45,
        AppPrimaryActionButton(
          child: const ButtonText(text: 'Next'),
          onPressed: () =>
              AppRouter.navigator.pushNamed(AppRoutes.emailVerification),
        )
      ],
    );
  }
}
