import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/app_assets.dart';
import 'package:pronight_vendor/presentations/components/custom_svg/CustomSvgIcon.dart';

import '../../../../../core/app_theme/app_colors.dart';
import '../../../../../core/dimens/dimens.dart';
import '../../../../../core/resources/app_translate.dart';
import '../../../../../core/resources/font_size.dart';
import '../../../../components/custom_text/custom_text.dart';

class SuccessPayedSheet extends StatefulWidget {
  const SuccessPayedSheet({super.key});

  @override
  State<SuccessPayedSheet> createState() => _SuccessPayedSheetState();
}

class _SuccessPayedSheetState extends State<SuccessPayedSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: Dimens.padding_20v, right: Dimens.padding_16h, left: Dimens.padding_16h,bottom:MediaQuery.viewInsetsOf(context).bottom),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(36.r)),
          color:  AppColors.white
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 50.w,height: 3.w,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r),color: AppColors.greyColor),),
          SizedBox(height: 20.h),
          CustomText(title: AppTranslate.confirmationMessage.tr(),fontWeight: FontWeight.bold,),
          Divider(color: AppColors.blackColor.withAlpha((0.20*255).round()),height: 40.h,),
          Padding(padding: EdgeInsets.symmetric(horizontal: Dimens.padding_12h),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomSvgIcon(assetName: AppAssets.successDone,width: 75.w,height: 75.h),
                SizedBox(height: 20.h),
                CustomText(title: AppTranslate.unitAddedSuccessfully.tr(),fontColor: AppColors.textColor2,fontSize: AppFonts.font_14,),


              ],) ,),
        ],),
    );
  }
}
