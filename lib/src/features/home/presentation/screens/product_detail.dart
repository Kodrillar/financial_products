import 'package:financial_products/src/core/extensions/build_context_ex.dart';
import 'package:financial_products/src/core/utils/app_spacer.dart';
import 'package:financial_products/src/core/widgets/app_back_button.dart';
import 'package:financial_products/src/features/home/presentation/product_card.dart';
import 'package:flutter/material.dart';
import 'package:screendapt/screendapt.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

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
    return Scaffold(
      backgroundColor: context.appTheme.foreground,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Column(
              children: [
                const ProductDetailScreenAppBar(),
                Spacers.h5,
                Expanded(
                  child: SingleChildScrollView(
                    child: SContainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SText(
                            'The Product is a short to medium term shariah-compliant investment based on the principle of Mudaraba (Partnership). It invests in carefully selected Naira and Dollar Shariah compliant instruments for the benefits or investors.',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              // color: context.appTheme.text,
                            ),
                          ),
                          const ProductDetailSection(
                            title: 'Minimum Fund',
                            content: 'N50,000',
                          ),
                          const ProductDetailSection(
                            title: 'Minimum Withdrawal',
                            content: 'N50,000',
                          ),
                          const ProductDetailSection(
                            title: 'Features',
                            content:
                                'Investments are based on Shariah principles. The minimum investments amount is N100,000.00 and \$2000. Competitive Return on Investment. The minimum investment Note is available in 90 days to 5 years tenor. Full or part liquidation is allowed subject to charge of 25% of accrued profit. Returns are distributed based on the profit made at maturity of investment. Available in naira and US Dollar. Expected profit ranges from 9.00% - 12.00% for Naira and 4.00% -7.00% based on amount and tenure of the investment.',
                          ),
                          LastUpdatedDate(dateTime: DateTime.now()),
                          Spacers.h20,
                        ],
                      ),
                    ),
                  ),
                ),
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
  });

  final ScrollController scrollController;
  final VoidCallback onClose;

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
                            'Close',
                            maxFontSize: 16,
                            style: TextStyle(
                              color: context.appTheme.primary,
                            ),
                          ),
                        ),
                      ),
                      Spacers.h15,
                      //Dummy data
                      for (int i = 0; i < 10; i++) ...[
                        const ProductCard(),
                        Spacers.h15
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
              'See related products',
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
          'Last updated: ${dateTime.toString()}',
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
  const ProductDetailSection(
      {super.key, required this.title, required this.content});

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

class ProductDetailScreenAppBar extends StatelessWidget {
  const ProductDetailScreenAppBar({super.key});

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
                'Discretionary Money Market Investment',
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
