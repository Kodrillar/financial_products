import 'package:financial_products/src/core/extensions/build_context_ex.dart';
import 'package:financial_products/src/core/utils/app_spacer.dart';
import 'package:financial_products/src/core/widgets/app_back_button.dart';
import 'package:flutter/material.dart';
import 'package:screendapt/screendapt.dart';

class ProductDetailScreenAppBar extends StatelessWidget {
  const ProductDetailScreenAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return SContainer(
      padding: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 15, right: 20),
        child: Row(
          children: [
            const AppBackButton(),
            Spacers.w5,
            Expanded(
              child: SText(
                title,
                maxLines: 1,
                style: TextStyle(
                  color: context.appTheme.primary,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
