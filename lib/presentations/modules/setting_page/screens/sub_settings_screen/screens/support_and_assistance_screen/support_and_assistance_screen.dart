import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/dimens/dimens.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/app_assets.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/core/resources/font_size.dart';
import 'package:pronight_vendor/presentations/components/custom_app_bar/custom_app_bar.dart';
import 'package:pronight_vendor/presentations/components/custom_scaffold/custom_scaffold.dart';
import 'package:pronight_vendor/presentations/components/custom_svg/CustomSvgIcon.dart';
import 'package:pronight_vendor/presentations/components/custom_text/custom_text.dart';

class SupportAndAssistanceScreen extends StatefulWidget {
  const SupportAndAssistanceScreen({super.key});

  @override
  State<SupportAndAssistanceScreen> createState() => _SupportAndAssistanceScreenState();
}

class _SupportAndAssistanceScreenState extends State<SupportAndAssistanceScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(appBar: CustomAppBar(title: AppTranslate.supportAssistance.tr(),height: 64.h,fontSize: AppFonts.font_14,fontWeight: FontWeight.bold,),
      body:Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: [Center(child: CustomSvgIcon(assetName: AppAssets.supportAssistanceLogo,width: 282.w,height: 241.h,)),
        Container(
          padding: EdgeInsets.all(Dimens.padding_16),
          margin: EdgeInsets.symmetric(horizontal:Dimens.padding_16h,vertical: Dimens.padding_12v),
          decoration: BoxDecoration(border: Border.all(width: 1.w,color: AppColors.textGrayColor),borderRadius: BorderRadius.circular(8.r)),
          child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
            CustomText(title: AppTranslate.submitComplaints.tr(),fontSize: AppFonts.font_14),
            Icon(Icons.arrow_forward_ios_rounded,size: 16.r,)
          ],) ,),
        Container(
          padding: EdgeInsets.all(Dimens.padding_16),
          margin: EdgeInsets.symmetric(horizontal:Dimens.padding_16h,vertical: Dimens.padding_12v),
          decoration: BoxDecoration(border: Border.all(width: 1.w,color: AppColors.textGrayColor),borderRadius: BorderRadius.circular(8.r)),
          child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
            CustomText(title: AppTranslate.connectUs.tr(),fontSize: AppFonts.font_14),
            Icon(Icons.arrow_forward_ios_rounded,size: 16.r,)
          ],) ,),
        Container(
          padding: EdgeInsets.all(Dimens.padding_16),
          margin: EdgeInsets.symmetric(horizontal:Dimens.padding_16h,vertical: Dimens.padding_12v),
          decoration: BoxDecoration(border: Border.all(width: 1.w,color: AppColors.textGrayColor),borderRadius: BorderRadius.circular(8.r)),
          child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
            CustomText(title: AppTranslate.privacyPolicy.tr(),fontSize: AppFonts.font_14),
            Icon(Icons.arrow_forward_ios_rounded,size: 16.r,)
          ],) ,),
        ],) ,);
  }
}
