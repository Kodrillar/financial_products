import 'package:financial_products/src/core/extensions/build_context_ex.dart';
import 'package:flutter/material.dart';
import 'package:screendapt/screendapt.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    this.onTapOfUserAvatar,
  });

  final VoidCallback? onTapOfUserAvatar;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapOfUserAvatar,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.appTheme.primary.withOpacity(.1)),
        child: SIcon(
          Icons.person_outline_outlined,
          color: context.appTheme.primary,
        ),
      ),
    );
  }
}
