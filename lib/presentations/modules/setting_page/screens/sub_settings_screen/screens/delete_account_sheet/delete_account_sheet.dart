import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/presentations/modules/auth/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../../core/dimens/dimens.dart';
import '../../../../../../../core/navigator/navigator.dart';
import '../../../../../../../core/resources/app_translate.dart';
import '../../../../../../components/custom_button/custom_button.dart';
import '../../../../../../components/custom_text/custom_text.dart';

class DeleteAccountSheet extends StatelessWidget {
  const DeleteAccountSheet({super.key,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 16.h,
        left: Dimens.padding_16,
        right: Dimens.padding_16,
        top: Dimens.padding_16,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                width: 80.w,
                height: 8.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.r),
                  color: Theme.of(context).appBarTheme.foregroundColor?.withAlpha((255*.05).round()),
                ),
              ),
            ),
            SizedBox(height: Dimens.padding_24h),
            CustomText(
              fontWeight: FontWeight.w600,
              title: AppTranslate.sureDeleteAccount.tr(),

            ),
            // SizedBox(height: Dimens.padding_8v),
            // CustomText(
            //   title: AppTranslate.afterDeleteAccount.tr(),
            // ),
            SizedBox(height: Dimens.padding_32v),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    borderColor: Theme.of(context).textTheme.displayLarge?.color,
                    bg: Colors.transparent,
                    onTap: () => NavigatorHandler.pop(),
                    title: AppTranslate.cancel.tr(),
                    fontColor: Theme.of(context).textTheme.displayLarge?.color,
                  ),
                ),
                SizedBox(width: Dimens.padding_8v),
                Expanded(
                  child: CustomButton(
                    bg: AppColors.errorColor,
                    onTap: () {context.read<AuthViewModel>().deleteAccount();},
                    title: AppTranslate.yes.tr(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
