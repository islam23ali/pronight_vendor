import 'package:easy_localization/easy_localization.dart';
import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/dimens/dimens.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';

import '../../presentations/components/custom_text/custom_text.dart';

class NoDataScreen extends StatelessWidget {
  final String?  title;
  final String? desc;
  final String? image;
  const NoDataScreen({super.key, this.title ,  this.desc ,  this.image });


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:  EdgeInsets.all(Dimens.padding_24),
      child: Center(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Lottie.asset(
              image??'assets/images/json/empty.json',
              width:200.w,
              height: 200.h,
            ),
             SizedBox(height: 12.h),

            CustomText(
                title:
                AppTranslate.noResultFound.tr(),
                fontColor: AppColors.darkColor,
                fontWeight: FontWeight.bold),


            // Text(
            //   desc??'',
            //   style: TextStyles().getRegularStyle().hintStyle(),
            //   textAlign: TextAlign.center,
            // ),
            const SizedBox(height: 12),

          ]),
        ),
      ),
    );
  }
}
