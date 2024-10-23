import 'package:financial_products/src/core/extensions/build_context_ex.dart';
import 'package:financial_products/src/core/utils/app_spacer.dart';
import 'package:financial_products/src/res/fonts.dart';
import 'package:financial_products/src/routing/app_route.dart';
import 'package:flutter/material.dart';
import 'package:screendapt/screendapt.dart';

class AppDialogs {
  AppDialogs._();
  static showSuccessDialog(BuildContext context, {required String message}) {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) =>
          const SizedBox.shrink(),
      transitionBuilder: (context, animation, secondaryAnimation, child) =>
          DialogAnimation(
        animation: animation,
        child: DialogSheet(
          message: message,
          isErrorDialog: false,
        ),
      ),
    );
  }

  static showErrorDialog(BuildContext context, {required String message}) {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) =>
          const SizedBox.shrink(),
      transitionBuilder: (context, animation, secondaryAnimation, child) =>
          DialogAnimation(
        animation: animation,
        child: DialogSheet(
          isErrorDialog: true,
          message: message,
        ),
      ),
    );
  }

  static Future<bool?> showLogOutConfirmationDialog(BuildContext context) {
    return showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) =>
          const SizedBox.shrink(),
      transitionBuilder: (context, animation, secondaryAnimation, child) =>
          DialogAnimation(
        animation: animation,
        child: const ConfirmationDialogSheet(
          title: 'Are you sure you want to Log out?',
        ),
      ),
    );
  }
}

class DialogAnimation extends StatelessWidget {
  const DialogAnimation({
    super.key,
    required this.child,
    required this.animation,
  });
  final Animation<double> animation;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: animation,
        curve: Curves.fastOutSlowIn,
      ),
      child: child,
    );
  }
}

class DialogSheet extends StatefulWidget {
  const DialogSheet({
    super.key,
    required this.isErrorDialog,
    required this.message,
  });

  final bool isErrorDialog;

  final String message;

  @override
  State<DialogSheet> createState() => _DialogSheetState();
}

class _DialogSheetState extends State<DialogSheet> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Scrollbar(
          controller: _scrollController,
          thumbVisibility: true,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Dialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: SContainer(
                padding: EdgeInsets.zero,
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: context.appTheme.light,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(
                          top: 20,
                          bottom: 5,
                        ),
                        child: SIcon(
                          iconSize: 40,
                          maxIconSize: 35,
                          widget.isErrorDialog
                              ? Icons.error
                              : Icons.check_circle,
                          color: widget.isErrorDialog
                              ? context.appTheme.error
                              : context.appTheme.primary,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            SText(
                              widget.message,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: context.appTheme.text,
                              ),
                            ),
                            Spacers.h20,
                            ErrorSuccessDialogButton(
                              buttonColor: widget.isErrorDialog
                                  ? context.appTheme.error
                                  : context.appTheme.primary,
                              buttonText:
                                  widget.isErrorDialog ? 'Dismiss' : 'OK',
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ErrorSuccessDialogButton extends StatelessWidget {
  const ErrorSuccessDialogButton({
    super.key,
    required this.buttonColor,
    required this.buttonText,
    this.onPressed,
    this.buttonTextColor,
  });

  final Color buttonColor;
  final String buttonText;
  final VoidCallback? onPressed;
  final Color? buttonTextColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: const BoxConstraints(maxWidth: 300).maxWidth,
      child: ElevatedButton(
        onPressed: onPressed ?? () => AppRouter.navigator.pop(),
        style: ButtonStyle(
          elevation: const WidgetStatePropertyAll(0),
          backgroundColor: WidgetStatePropertyAll(buttonColor),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SText(
            buttonText,
            style: TextStyle(
              fontFamily: AppFonts.inter,
              fontWeight: FontWeight.w500,
              color: buttonTextColor ?? context.appTheme.light,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}

class ConfirmationDialogSheet extends StatelessWidget {
  const ConfirmationDialogSheet({
    super.key,
    this.title = "Are you sure?",
    this.titleColor,
  });

  final String title;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return SContainer(
      child: Material(
        color: context.appTheme.light,
        borderRadius: BorderRadius.circular(6),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SText(
                title,
                style: TextStyle(
                  color: titleColor ?? context.appTheme.text,
                ),
                textAlign: TextAlign.center,
              ),
              Spacers.h25,
              ErrorSuccessDialogButton(
                buttonColor: context.appTheme.primary,
                buttonText: 'No',
                onPressed: () => AppRouter.navigator.pop(false),
              ),
              Spacers.h5,
              ErrorSuccessDialogButton(
                buttonColor: Colors.transparent,
                buttonText: 'Yes',
                buttonTextColor: context.appTheme.primary,
                onPressed: () => AppRouter.navigator.pop(true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
