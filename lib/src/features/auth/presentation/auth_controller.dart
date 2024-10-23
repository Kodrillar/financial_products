import 'package:financial_products/src/features/auth/data/repository/auth.dart';
import 'package:financial_products/src/features/auth/domain/model/app_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() {}

  Future<bool> logIn(AppUser appUser) async {
    state = const AsyncLoading();

    AsyncValue asyncValue = await AsyncValue.guard(
        () => ref.read(authRepositoryProvider).logIn(appUser));

    state = asyncValue;

    return !state.hasError;
  }

  Future<void> verifyEmail({required AppUser appUser, required int otp}) async {
    state = const AsyncLoading();

    AsyncValue asyncValue = await AsyncValue.guard(() => ref
        .read(authRepositoryProvider)
        .verifyEmail(appUser: appUser, otp: otp));

    state = asyncValue;
  }
}
