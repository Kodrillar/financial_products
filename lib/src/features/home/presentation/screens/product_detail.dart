import 'package:financial_products/src/core/extensions/build_context_ex.dart';
import 'package:financial_products/src/core/utils/app_spacer.dart';
import 'package:financial_products/src/core/utils/date_formatter.dart';
import 'package:financial_products/src/core/utils/number_formatter.dart';
import 'package:financial_products/src/features/home/domain/model/product.dart';
import 'package:financial_products/src/features/home/domain/model/sub_product.dart';
import 'package:financial_products/src/features/home/presentation/product_card.dart';
import 'package:financial_products/src/features/home/presentation/product_detail_screen_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:screendapt/screendapt.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.product});

  final Product product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final DraggableScrollableController _draggableScrollableController =
      DraggableScrollableController();

  final Duration _duration = const Duration(milliseconds: 300);
  final double _minDraggableSheetSize = .0;
  final double _maxDraggableSheetSize = .9;

  _showDraggableSheet() =>
      _draggableScrollableController.animateTo(_maxDraggableSheetSize,
          duration: _duration, curve: Curves.ease);

  _hideDraggableSheet() =>
      _draggableScrollableController.animateTo(_minDraggableSheetSize,
          duration: _duration, curve: Curves.easeInOut);

  @override
  void dispose() {
    _draggableScrollableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Product product = widget.product;
    return Scaffold(
      backgroundColor: context.appTheme.foreground,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Column(
              children: [
                ProductDetailScreenAppBar(title: widget.product.name),
                Spacers.h5,
                Expanded(
                  child: SingleChildScrollView(
                    child: SContainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SText(
                            product.description,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              // color: context.appTheme.text,
                            ),
                          ),
                          if (widget.product.minFund != null)
                            ProductDetailSection(
                              title: 'Minimum Fund',
                              content: NumberFormatter.formatAmount(
                                amount: product.minFund!,
                                currency: product.currency,
                              ),
                            ),
                          if (widget.product.minWithdrawal != null)
                            ProductDetailSection(
                              title: 'Minimum Withdrawal',
                              content: NumberFormatter.formatAmount(
                                amount: product.minWithdrawal!,
                                currency: product.currency,
                              ),
                            ),
                          if (widget.product.features != null)
                            ProductDetailSection(
                              title: 'Features',
                              content: product.features!,
                            ),
                          LastUpdatedDate(dateTime: product.lastUpdated),
                          Spacers.h20,
                        ],
                      ),
                    ),
                  ),
                ),
                if (product.subProducts.isNotEmpty)
                  ViewSubProductButton(onTap: _showDraggableSheet)
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: DraggableScrollableSheet(
                controller: _draggableScrollableController,
                minChildSize: _minDraggableSheetSize,
                maxChildSize: _maxDraggableSheetSize,
                initialChildSize: _minDraggableSheetSize,
                builder: (_, controller) => SubProductCardsView(
                  products: product.subProducts,
                  scrollController: controller,
                  onClose: _hideDraggableSheet,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SubProductCardsView extends StatelessWidget {
  const SubProductCardsView({
    super.key,
    required this.scrollController,
    required this.onClose,
    required this.products,
  });

  final ScrollController scrollController;
  final VoidCallback onClose;

  final List<SubProduct> products;

  @override
  Widget build(BuildContext context) {
    const Radius radius = Radius.circular(15);
    return Material(
      borderRadius: const BorderRadius.only(
        topLeft: radius,
        topRight: radius,
      ),
      color: context.appTheme.background,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: SingleChildScrollView(
                controller: scrollController,
                child: SContainer(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: onClose,
                          child: SText(
                            'Dismiss',
                            maxFontSize: 16,
                            style: TextStyle(
                              color: context.appTheme.primary,
                            ),
                          ),
                        ),
                      ),
                      Spacers.h15,
                      for (SubProduct product in products) ...[
                        ProductCard(
                          product: Product(
                            id: product.id,
                            name: product.title,
                            currency: product.currency,
                            description: product.description,
                            lastUpdated: product.lastUpdated,
                            features: product.features,
                            minFund: (product.minFund != null)
                                ? int.tryParse(product.minFund!)
                                : null,
                            minWithdrawal: (product.minWithdrawal != null)
                                ? int.tryParse(product.minWithdrawal!)
                                : null,
                            subProducts: [],
                          ),
                        ),
                        Spacers.h15,
                      ]
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ViewSubProductButton extends StatelessWidget {
  const ViewSubProductButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    const Radius radius = Radius.circular(15);
    return GestureDetector(
      onTap: onTap,
      child: Material(
        borderRadius: const BorderRadius.only(
          topRight: radius,
          topLeft: radius,
        ),
        color: context.appTheme.primary,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: SContainer(
            child: SText(
              'See Sub-products',
              style: TextStyle(color: context.appTheme.light),
            ),
          ),
        ),
      ),
    );
  }
}

class LastUpdatedDate extends StatelessWidget {
  const LastUpdatedDate({super.key, required this.dateTime});

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    //Formate date
    return Column(
      children: [
        Spacers.h20,
        SText(
          'Last updated: ${DateFormatter.formatDate(dateTime)}',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 12,
            color: context.appTheme.textLight,
          ),
        ),
      ],
    );
  }
}

class ProductDetailSection extends StatelessWidget {
  const ProductDetailSection({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Spacers.h25,
        SizedBox(
          width: double.infinity,
          child: Divider(color: context.appTheme.textLight.withOpacity(.2)),
        ),
        Spacers.h5,
        SText(
          title,
          maxLines: 2,
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
            color: context.appTheme.primary,
            fontSize: 16,
          ),
        ),
        Spacers.h2,
        SText(
          content,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
