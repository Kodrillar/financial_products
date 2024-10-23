import 'package:financial_products/src/core/utils/app_spacer.dart';
import 'package:financial_products/src/core/widgets/header_text.dart';
import 'package:financial_products/src/core/widgets/scaffold_with_safe_area.dart';
import 'package:financial_products/src/features/auth/data/repository/local_auth.dart';
import 'package:financial_products/src/features/auth/domain/model/app_user.dart';
import 'package:financial_products/src/features/home/presentation/home_screen_app_bar.dart';
import 'package:financial_products/src/features/home/presentation/home_screen_drawer.dart';
import 'package:financial_products/src/features/home/presentation/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screendapt/screendapt.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void _showDrawer(BuildContext context) => Scaffold.of(context).openDrawer();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppUser? appUser = ref.watch(localAuthStateChangesProvider).value;
    return ScaffoldWithSafeArea(
      drawer: const HomeScreenDrawer(),
      body: Column(
        children: [
          Builder(
            builder: (context) => HomeScreenAppBar(
              userName: appUser?.firstName,
              onTapOfUserAvatar: () => _showDrawer(context),
            ),
          ),
          Spacers.h25,
          const SContainer(
            child: Align(
              alignment: Alignment.topLeft,
              child: HeaderText(text: 'Top products'),
            ),
          ),
          Spacers.h15,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SingleChildScrollView(
                child: SContainer(
                  child: Column(
                    children: [
                      //Dummy data
                      for (int i = 0; i < 10; i++) ...[
                        const ProductCard(),
                        Spacers.h15
                      ]
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
