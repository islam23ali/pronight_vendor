import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/resources/app_assets.dart';
import '../../../../core/resources/app_translate.dart';
import '../../../../core/resources/font_size.dart';
import '../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../components/custom_text/custom_text.dart';

class HomeReservationAndBilling extends StatefulWidget {
  const HomeReservationAndBilling({super.key});

  @override
  State<HomeReservationAndBilling> createState() => _HomeReservationAndBillingState();
}

class _HomeReservationAndBillingState extends State<HomeReservationAndBilling> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: 165.w,height: 116.h,
            child: Card(
              elevation: 5,
              surfaceTintColor: AppColors.white,
              color: AppColors.white,
              child:Padding(
                padding: const EdgeInsets.all(16),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      CustomSvgIcon(assetName: AppAssets.wallet,width: 15.w,height: 15.h),
                      SizedBox(width: 5.w),
                      CustomText(title: AppTranslate.reservations.tr(),fontColor: AppColors.textColor2)
                    ],),
                    SizedBox(height: 8.h),
                    CustomText(title: '200+',fontSize: AppFonts.font_16,fontWeight: FontWeight.bold,fontColor: AppColors.primaryColor),
                    SizedBox(height: 8.h),
                    CustomText(title: 'تم التحديث منذ 50 دقيقة',fontSize: AppFonts.font_8,fontColor: AppColors.textColor,)
                  ],),
              ) ,)),
        SizedBox(width: 165.w,height: 116.h,
            child: Card(
              elevation: 5,
              surfaceTintColor: AppColors.white,
              color: AppColors.white,
              child:Padding(
                padding: const EdgeInsets.all(16),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      CustomSvgIcon(assetName: AppAssets.billing,width: 15.w,height: 15.h),
                      SizedBox(width: 5.w),
                      CustomText(title: AppTranslate.billing.tr(),fontColor: AppColors.textColor2)
                    ],),
                    SizedBox(height: 8.h),
                    CustomText(title: '50',fontSize: AppFonts.font_16,fontWeight: FontWeight.bold,fontColor: AppColors.primaryColor),
                    SizedBox(height: 8.h),
                    CustomText(title: 'تم التحديث منذ 50 دقيقة',fontSize: AppFonts.font_8,fontColor: AppColors.textColor,)
                  ],),
              ) ,)),
      ],);
  }
}
