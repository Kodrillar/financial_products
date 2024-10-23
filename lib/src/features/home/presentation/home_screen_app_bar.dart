import 'package:financial_products/src/core/extensions/build_context_ex.dart';
import 'package:financial_products/src/core/utils/app_spacer.dart';
import 'package:financial_products/src/features/home/presentation/user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:screendapt/screendapt.dart';

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({
    super.key,
    required this.onTapOfUserAvatar,
    required this.userName,
  });

  final VoidCallback onTapOfUserAvatar;
  final String? userName;

  @override
  Widget build(BuildContext context) {
    return SContainer(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // User Greeting
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SText('Welcome,'),
                Spacers.h2,
                SText(
                  userName ?? '--',
                  maxLines: 1,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: context.appTheme.primary,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Spacers.w20,
          UserAvatar(onTapOfUserAvatar: onTapOfUserAvatar)
        ],
      ),
    ));
  }
}
