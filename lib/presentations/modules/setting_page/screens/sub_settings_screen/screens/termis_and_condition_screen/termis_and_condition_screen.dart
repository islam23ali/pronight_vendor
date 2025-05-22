import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/presentations/components/custom_app_bar/custom_app_bar.dart';
import 'package:pronight_vendor/presentations/components/custom_scaffold/custom_scaffold.dart';
import 'package:pronight_vendor/presentations/components/custom_text/custom_text.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/dimens/dimens.dart';
import '../../../../../../../core/resources/app_assets.dart';
import '../../../../../../../core/resources/font_size.dart';
import '../../../../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../../../contracts_page/widgets/custom_contract_item.dart';
import '../../../../setting_view_model.dart';

class TermsAndConditionScreen extends StatefulWidget {
  final bool isTermsAndConditions;
  const TermsAndConditionScreen({super.key, required this.isTermsAndConditions});

  @override
  State<TermsAndConditionScreen> createState() =>
      _TermsAndConditionScreenState();
}

class _TermsAndConditionScreenState extends State<TermsAndConditionScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title:(widget.isTermsAndConditions==true)? AppTranslate.termsAndConditions.tr():AppTranslate.privacyPolicy.tr(),
        height: 64.h,
        fontSize: AppFonts.font_14,
        fontWeight: FontWeight.bold,
      ),
      body: Consumer<SettingsViewModel>(
        builder: (context,data,_) {
          return Padding(
            padding: EdgeInsets.all(Dimens.padding_24),
            child: SingleChildScrollView(
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: Dimens.padding_16h,vertical: Dimens.padding_24v),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(45.r),border: Border.all(width: 1.w,color: Color(0xffE8E6E6)),color: Color(0xffE8E6E6).withAlpha((0.20*255).round())),
                    child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(title: (widget.isTermsAndConditions==true)? AppTranslate.termsAndConditions.tr():AppTranslate.privacyPolicy.tr(),fontSize: AppFonts.font_12,fontWeight: FontWeight.w500,),
                            Icon(Icons.expand_more_rounded,size: 35.r)
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Html(
                          data: '<div style="margin: 0; padding: 0;">${(widget.isTermsAndConditions==true)?data.settingsModel?.data?.termsConditions?? '':data.settingsModel?.data?.privacy?? ''}</div>',
                          style: {
                            "div": Style(
                              // margin: Margins.zero,
                              // padding: HtmlPaddings.zero,
                              color: AppColors.textColor,
                              fontWeight: FontWeight.normal,
                              fontSize: FontSize(8.sp),
                              fontFamily: 'font_regular',
                            ),
                            // "body": Style(
                            //   margin: Margins.zero, // Remove body margin
                            //   padding: HtmlPaddings.zero, // Remove body padding
                            // ),
                            "*": Style(
                              margin: Margins.zero,
                              padding: HtmlPaddings.zero,
                              lineHeight: LineHeight(1.5), // Set line height to 1
                            ),
                            // "strong": Style(
                            //   fontWeight: FontWeight.bold,
                            //   color: AppColors.textColor,
                            // ),
                            // "em": Style(
                            //   fontStyle: FontStyle.italic,
                            //   color: AppColors.textColor,
                            // ),
                            // "a": Style(
                            //   color: AppColors.textColor,
                            //   textDecoration: TextDecoration.underline,
                            // ),
                            // "span": Style(
                            //   color: AppColors.textColor,
                            // ),
                          },
                        ),
                        // CustomText(title:  data.settingsModel?.data?.aboutApp??'',
                        //   fontColor: AppColors.textGrayColor,fontSize: AppFonts.font_10,)
                      ],) ,),
                  // Expanded(
                  //   child: AnimationLimiter(
                  //     child: ListView.builder(
                  //         padding: EdgeInsets.symmetric(vertical: Dimens.padding_12v),
                  //         shrinkWrap: true,
                  //         itemCount: 10,
                  //         itemBuilder: (context, index) {
                  //           return AnimationConfiguration.staggeredGrid(
                  //               duration: const Duration(milliseconds: 900),
                  //               position: index,
                  //               columnCount: 1,
                  //               child:  ScaleAnimation(
                  //                   duration: const Duration(milliseconds: 1000),
                  //                   curve: Curves.fastLinearToSlowEaseIn,
                  //                   child: FadeInAnimation(child:
                  //                   Container(
                  //                     padding: EdgeInsets.all(Dimens.padding_16),
                  //                     margin: EdgeInsets.symmetric(vertical:Dimens.padding_8),
                  //                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r),color: AppColors.primaryColor.withAlpha((0.047*255).round())),
                  //                     child:Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                  //                       CustomText(title: 'الاستخدام المشروع',fontSize: AppFonts.font_11,fontWeight: FontWeight.w500,fontColor: AppColors.whatsAppColor),
                  //                       SizedBox(height: 5.h),
                  //                       CustomText(title: 'للدخول إلى موقع سكاي نيوز عربية، يجب أن لا يقل عمرك عن 21 عاما (حسب التقويم الميلادي) وأن تكون ذا أهلية قانونية كاملة. يحتاج أي شخص أقل من 21 عاما (حسب التقويم الميلادي) يقوم باستخدام موقع سكاي نيوز عربية إلى الحصول على موافقة والديه أو وصيه للقيام بذلك.',
                  //                         fontSize: AppFonts.font_10,fontWeight: FontWeight.w400,fontColor: AppColors.textGrayColor,)
                  //                     ],) ,))));
                  //         }),
                  //   ),
                  // )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
