import 'package:financial_products/src/core/extensions/build_context_ex.dart';
import 'package:financial_products/src/core/utils/app_spacer.dart';
import 'package:financial_products/src/core/utils/number_formatter.dart';
import 'package:financial_products/src/features/home/domain/model/product.dart';
import 'package:financial_products/src/routing/app_route.dart';
import 'package:flutter/material.dart';
import 'package:screendapt/screendapt.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.hardEdge,
      color: context.appTheme.foreground,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: () => AppRouter.navigator
            .pushNamed(AppRoutes.productDetail, arguments: product),
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
                      product.name,
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
                  if (product.minFund != null)
                    Align(
                      alignment: Alignment.topRight,
                      child: SText(
                        NumberFormatter.formatAmount(
                          amount: product.minFund!,
                          currency: product.currency,
                        ),
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
                product.description,
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
