import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/presentations/components/custom_app_bar/custom_app_bar.dart';
import 'package:pronight_vendor/presentations/components/custom_scaffold/custom_scaffold.dart';
import 'package:pronight_vendor/presentations/components/custom_text/custom_text.dart';

import '../../../../../../../core/dimens/dimens.dart';
import '../../../../../../../core/resources/app_assets.dart';
import '../../../../../../../core/resources/font_size.dart';
import '../../../../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../../../contracts_page/widgets/custom_contract_item.dart';

class TermsAndConditionScreen extends StatefulWidget {
  const TermsAndConditionScreen({super.key});

  @override
  State<TermsAndConditionScreen> createState() =>
      _TermsAndConditionScreenState();
}

class _TermsAndConditionScreenState extends State<TermsAndConditionScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: AppTranslate.termsAndConditions.tr(),
        height: 64.h,
        fontSize: AppFonts.font_14,
        fontWeight: FontWeight.bold,
      ),
      body: Padding(
        padding: EdgeInsets.all(Dimens.padding_24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: CustomSvgIcon(
              assetName: AppAssets.termsAndConditionLogo,
              width: 93.w,
              height: 83.h,
            )),
            SizedBox(height: 20.h),
            Expanded(
              child: AnimationLimiter(
                child: ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: Dimens.padding_12v),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return AnimationConfiguration.staggeredGrid(
                          duration: const Duration(milliseconds: 900),
                          position: index,
                          columnCount: 1,
                          child:  ScaleAnimation(
                              duration: const Duration(milliseconds: 1000),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: FadeInAnimation(child: 
                              Container(
                                padding: EdgeInsets.all(Dimens.padding_16),
                                margin: EdgeInsets.symmetric(vertical:Dimens.padding_8),
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r),color: AppColors.primaryColor.withAlpha((0.047*255).round())),
                                child:Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                                  CustomText(title: 'الاستخدام المشروع',fontSize: AppFonts.font_11,fontWeight: FontWeight.w500,fontColor: AppColors.whatsAppColor),
                                  SizedBox(height: 5.h),
                                  CustomText(title: 'للدخول إلى موقع سكاي نيوز عربية، يجب أن لا يقل عمرك عن 21 عاما (حسب التقويم الميلادي) وأن تكون ذا أهلية قانونية كاملة. يحتاج أي شخص أقل من 21 عاما (حسب التقويم الميلادي) يقوم باستخدام موقع سكاي نيوز عربية إلى الحصول على موافقة والديه أو وصيه للقيام بذلك.',
                                    fontSize: AppFonts.font_10,fontWeight: FontWeight.w400,fontColor: AppColors.textGrayColor,)
                                ],) ,))));
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
