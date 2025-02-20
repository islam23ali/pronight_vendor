import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/presentations/components/custom_text/custom_text.dart';
import '../../../../../core/resources/app_translate.dart';
import '../custom_button/custom_button.dart';

class ConfirmDeleteDialog extends StatelessWidget {
  final String? title;
  final String? supTitle;
  final void Function() onTap;
  const ConfirmDeleteDialog({
    super.key, required this.title, required this.supTitle, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: CustomText(title: title??AppTranslate.logout),
      content: CustomText(title:supTitle?? AppTranslate.sureLogout.tr()),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: CustomText(title: AppTranslate.cancel),
        ),
        CustomButton(
          height: 48.h,
          width: 90.w,
          onTap:onTap,
          bg: AppColors.errorColor,
          title: AppTranslate.confirm,
        ),
      ],
    );
  }
}
