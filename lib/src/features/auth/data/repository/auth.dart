import 'package:financial_products/src/core/utils/repository_operator.dart';
import 'package:financial_products/src/features/auth/data/network/auth.dart';
import 'package:financial_products/src/features/auth/data/repository/local_auth.dart';
import 'package:financial_products/src/features/auth/domain/model/app_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth.g.dart';

//High-level API for processing Authentication
class AuthRepository extends RepositoryOperator {
  AuthRepository(this._ref);

  final Ref _ref;

  Future<void> logIn(AppUser appUser) async {
    await processRepoOperation<void>(operation: () async {
      await _ref.read(authNetworkHelperProvider).logIn(appUser);
    });
  }

  Future<void> verifyEmail({required AppUser appUser, required int otp}) async {
    await processRepoOperation<void>(operation: () async {
      await _ref
          .read(authNetworkHelperProvider)
          .verifyEmail(appUser: appUser, otp: otp);

      await _ref
          .read(localAuthRepositoryProvider)
          .requireValue
          .addAppUser(appUser);
    });
  }

  Future<void> logOut() async =>
      await _ref.read(localAuthRepositoryProvider).requireValue.deleteAppUser();
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository(ref);
}

final loginObscureOtpProvider = StateProvider.autoDispose<bool>((ref) => false);
