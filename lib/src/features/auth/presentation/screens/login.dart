import 'package:financial_products/src/core/extensions/async_value_ex.dart';
import 'package:financial_products/src/core/utils/app_spacer.dart';
import 'package:financial_products/src/core/utils/text_field_validators.dart';
import 'package:financial_products/src/core/widgets/app_primary_action_button.dart';
import 'package:financial_products/src/core/widgets/app_text_field.dart';
import 'package:financial_products/src/features/auth/domain/model/app_user.dart';
import 'package:financial_products/src/features/auth/presentation/auth_controller.dart';
import 'package:financial_products/src/features/auth/presentation/auth_flow_view.dart';
import 'package:financial_products/src/routing/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _firstNameController = TextEditingController(),
      _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  _logIn() async {
    final AppUser appUser = AppUser(
      email: _emailController.text.trim(),
      firstName: _firstNameController.text.trim(),
    );

    if (_formKey.currentState?.validate() ?? false) {
      final bool isSuccessful =
          await ref.read(authControllerProvider.notifier).logIn(appUser);

      if (isSuccessful) {
        AppRouter.navigator
            .pushNamed(AppRoutes.emailVerification, arguments: appUser);
      }
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authControllerProvider,
        (_, next) => next.showErrorAlertDialog(context));

    final authState = ref.watch(authControllerProvider);
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _formKey,
      child: AuthFlowView(
        title: 'Log In',
        subTitle: 'Access your Norrenberger account',
        children: [
          AppTextField(
            controller: _firstNameController,
            labelText: 'First name',
            validator: TextFieldValidators.validateGenericField,
            textInputAction: TextInputAction.next,
            enabled: !authState.isLoading,
          ),
          Spacers.h15,
          AppTextField(
            controller: _emailController,
            labelText: 'Email',
            validator: TextFieldValidators.validateEmail,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            enabled: !authState.isLoading,
            onFieldSubmitted: (_) => _logIn(),
          ),
          Spacers.h45,
          AppPrimaryActionButton(
            onPressed: authState.isLoading ? null : _logIn,
            child: authState.isLoading
                ? const ButtonLoader()
                : const ButtonText(text: 'Next'),
          )
        ],
      ),
    );
  }
}
