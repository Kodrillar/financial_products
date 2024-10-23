import 'package:financial_products/src/core/extensions/build_context_ex.dart';
import 'package:financial_products/src/core/utils/app_spacer.dart';
import 'package:financial_products/src/core/utils/contants.dart';
import 'package:financial_products/src/features/home/presentation/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:screendapt/screendapt.dart';

class HomeScreenDrawer extends StatelessWidget {
  const HomeScreenDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                  const SText(
                    'David',
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 18, overflow: TextOverflow.ellipsis),
                  ),
                  Spacers.h2,
                  SText(
                    'davidipadeola@kodrillar.com',
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
                      onTap: () {},
                      title: 'Log out',
                      icon: Icons.logout_outlined,
                    ),
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
        onTap: () {},
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
