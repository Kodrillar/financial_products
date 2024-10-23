import 'package:financial_products/src/core/extensions/build_context_ex.dart';
import 'package:financial_products/src/core/utils/app_spacer.dart';
import 'package:financial_products/src/core/widgets/app_primary_action_button.dart';
import 'package:financial_products/src/core/widgets/app_text_field.dart';
import 'package:financial_products/src/features/auth/presentation/auth_flow_view.dart';
import 'package:financial_products/src/routing/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmailVerificationScreen extends ConsumerStatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState
    extends ConsumerState<EmailVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthFlowView(
      title: 'Verify email',
      subTitle: 'To proceed, enter the OTP that was sent to your email',
      children: [
        AppTextField(
          labelText: 'Enter OTP',
          suffix: GestureDetector(
            onTap: () {/** Toogle text obscurity */},
            child: Icon(
              Icons.visibility,
              color: context.appTheme.text,
            ),
          ),
        ),
        Spacers.h45,
        AppPrimaryActionButton(
          child: const ButtonText(text: 'Log In'),
          onPressed: () => AppRouter.navigator.pushNamed(AppRoutes.home),
        )
      ],
    );
  }
}
