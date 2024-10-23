import 'package:financial_products/src/core/extensions/build_context_ex.dart';
import 'package:financial_products/src/core/utils/app_spacer.dart';
import 'package:financial_products/src/core/utils/contants.dart';
import 'package:financial_products/src/core/widgets/scaffold_with_safe_area.dart';
import 'package:financial_products/src/res/images.dart';
import 'package:flutter/material.dart';
import 'package:screendapt/screendapt.dart';

class AuthFlowView extends StatelessWidget {
  const AuthFlowView({
    super.key,
    required this.children,
    required this.title,
    required this.subTitle,
  });

  final List<Widget> children;

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithSafeArea(
      body: SContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: kBodyPadding),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  color: context.appTheme.light,
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 60, horizontal: kBodyPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(AppImages.companyLogo, height: 65),
                        Spacers.h10,
                        SText(
                          title,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacers.h5,
                        SText(
                          subTitle,
                          style: const TextStyle(fontSize: 14),
                        ),
                        Spacers.h35,
                        ...children,
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
