import 'package:financial_products/src/core/extensions/build_context_ex.dart';
import 'package:financial_products/src/core/utils/app_spacer.dart';
import 'package:financial_products/src/routing/app_route.dart';
import 'package:flutter/material.dart';
import 'package:screendapt/screendapt.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.hardEdge,
      color: context.appTheme.foreground,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: () => AppRouter.navigator.pushNamed(AppRoutes.productDetail),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Product Name
                  Expanded(
                    child: SText(
                      'Discretionary Money Market Investment',
                      maxLines: 2,
                      maxFontSize: 16,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 14,
                        color: context.appTheme.text,
                      ),
                    ),
                  ),
                  Spacers.w10,
                  //Product Minimum Value
                  Align(
                    alignment: Alignment.topRight,
                    child: SText(
                      'N405,000',
                      maxFontSize: 17,
                      style: TextStyle(
                        color: context.appTheme.primary,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              Spacers.customH(8),
              //Product Minimum Description
              SText(
                'Easy entry and exit. Withdrawal within 24-48 hours. Diversified portfolio.Online access to monitor the investment. Minimum investment amount is N50,000. Investment is fixed and reviewed periodically. Investment is subject to 10% withholding tax. Interest rate is currently 9.00%. Investors can liquidate their investment at any time without penalty',
                maxLines: 3,
                maxFontSize: 15,
                style: TextStyle(
                    fontSize: 13,
                    overflow: TextOverflow.ellipsis,
                    color: context.appTheme.textLight),
              )
            ],
          ),
        ),
      ),
    );
  }
}
