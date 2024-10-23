import 'package:financial_products/src/core/extensions/build_context_ex.dart';
import 'package:financial_products/src/core/utils/app_spacer.dart';
import 'package:financial_products/src/core/utils/text_field_input_formatters.dart';
import 'package:financial_products/src/core/utils/text_field_validators.dart';
import 'package:financial_products/src/core/widgets/app_primary_action_button.dart';
import 'package:financial_products/src/core/widgets/app_text_field.dart';
import 'package:financial_products/src/features/auth/data/repository/auth.dart';
import 'package:financial_products/src/features/auth/domain/model/app_user.dart';
import 'package:financial_products/src/features/auth/presentation/auth_controller.dart';
import 'package:financial_products/src/features/auth/presentation/auth_flow_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmailVerificationScreen extends ConsumerStatefulWidget {
  const EmailVerificationScreen({super.key, required this.appUser});

  final AppUser appUser;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState
    extends ConsumerState<EmailVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _verifyOTP() {
    if (_formKey.currentState?.validate() ?? false) {
      const int invalidCode = 1000;
      ref.read(authControllerProvider.notifier).verifyEmail(
            appUser: widget.appUser,
            otp: int.tryParse(_otpController.text.trim()) ?? invalidCode,
          );
    }
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    return PopScope(
      canPop: !authState.isLoading,
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: AuthFlowView(
          title: 'Verify email',
          subTitle: 'To proceed, enter the OTP that was sent to your email',
          children: [
            AppTextField(
              controller: _otpController,
              enabled: !authState.isLoading,
              autofocus: true,
              labelText: 'Enter OTP',
              validator: TextFieldValidators.validateOTP,
              keyboardType: TextInputType.number,
              inputFormatters: TextFieldInputFormatters.numberInputFormatter,
              obscureText: ref.watch(loginObscureOtpProvider),
              suffix: Builder(builder: (context) {
                final obscureText =
                    ref.read(loginObscureOtpProvider.notifier).state;
                return GestureDetector(
                  onTap: () => ref
                      .read(loginObscureOtpProvider.notifier)
                      .state = !obscureText,
                  child: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                    color: context.appTheme.text,
                  ),
                );
              }),
              onFieldSubmitted: (_) => _verifyOTP(),
            ),
            Spacers.h45,
            AppPrimaryActionButton(
              onPressed: authState.isLoading ? null : _verifyOTP,
              child: authState.isLoading
                  ? const ButtonLoader()
                  : const ButtonText(text: 'Log In'),
            )
          ],
        ),
      ),
    );
  }
}
