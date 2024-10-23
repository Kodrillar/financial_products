import 'package:financial_products/src/core/extensions/build_context_ex.dart';
import 'package:financial_products/src/core/utils/app_spacer.dart';
import 'package:financial_products/src/core/utils/contants.dart';
import 'package:financial_products/src/core/widgets/app_dialogs.dart';
import 'package:financial_products/src/features/auth/data/repository/auth.dart';
import 'package:financial_products/src/features/auth/data/repository/local_auth.dart';
import 'package:financial_products/src/features/auth/domain/model/app_user.dart';
import 'package:financial_products/src/features/home/presentation/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screendapt/screendapt.dart';

class HomeScreenDrawer extends ConsumerWidget {
  const HomeScreenDrawer({
    super.key,
  });

  Future<void> _logOut({
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    final bool canLogout =
        await AppDialogs.showLogOutConfirmationDialog(context) ?? false;

    if (canLogout) ref.read(authRepositoryProvider).logOut();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppUser? appUser = ref.watch(localAuthStateChangesProvider).value;
    return Drawer(
      backgroundColor: context.appTheme.foreground,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacers.h30,
            Padding(
              padding: const EdgeInsets.all(kBodyPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const UserAvatar(),
                  Spacers.h20,
                  SText(
                    appUser != null ? appUser.firstName : '--',
                    maxLines: 2,
                    style: const TextStyle(
                        fontSize: 18, overflow: TextOverflow.ellipsis),
                  ),
                  Spacers.h2,
                  SText(
                    appUser != null ? appUser.email : '--',
                    maxLines: 2,
                    maxFontSize: 16,
                    style: TextStyle(
                        fontSize: 13,
                        overflow: TextOverflow.ellipsis,
                        color: context.appTheme.textLight),
                  )
                ],
              ),
            ),
            Spacers.h30,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DrawerTile(
                      onTap: () => _logOut(context: context, ref: ref),
                      title: 'Log out',
                      icon: Icons.logout_outlined,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });
  final IconData icon;

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        overlayColor:
            WidgetStatePropertyAll(context.appTheme.primary.withOpacity(.08)),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kBodyPadding,
            vertical: 15,
          ),
          child: Row(
            children: [
              SIcon(
                Icons.logout_outlined,
                iconSize: 20,
                color: context.appTheme.primary,
              ),
              Spacers.w20,
              SText(
                title,
                maxFontSize: 16,
                style: TextStyle(color: context.appTheme.primary),
              )
            ],
          ),
        ),
      ),
    );
  }
}
