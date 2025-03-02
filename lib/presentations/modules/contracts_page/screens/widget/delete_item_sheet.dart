import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/app_assets.dart';
import 'package:pronight_vendor/presentations/components/custom_button/custom_button.dart';
import 'package:pronight_vendor/presentations/components/custom_svg/CustomSvgIcon.dart';

import '../../../../../core/app_theme/app_colors.dart';
import '../../../../../core/dimens/dimens.dart';
import '../../../../../core/resources/app_translate.dart';
import '../../../../../core/resources/font_size.dart';
import '../../../../components/custom_text/custom_text.dart';

class DeleteItemSheet extends StatefulWidget {
  const DeleteItemSheet({super.key});

  @override
  State<DeleteItemSheet> createState() => _DeleteItemSheetState();
}

class _DeleteItemSheetState extends State<DeleteItemSheet> {
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
          CustomText(title: AppTranslate.confirmDeletion.tr()),
          Divider(color: AppColors.blackColor.withAlpha((0.20*255).round()),height: 40.h,),
          Padding(padding: EdgeInsets.symmetric(horizontal: Dimens.padding_12h),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomSvgIcon(assetName: AppAssets.deleteItem,width: 75.w,height: 75.h),
                SizedBox(height: 20.h),
                CustomText(title: AppTranslate.youSureWantDelete.tr(),fontColor: AppColors.textColor2,fontSize: AppFonts.font_14,),
                SizedBox(height: 20.h),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  CustomButton(onTap: (){},width: 155.w,title: AppTranslate.confirmDeletion.tr(),),
                  CustomButton(onTap: (){},width: 155.w,title: AppTranslate.cancelDeletion.tr(),fontColor: AppColors.primaryColor,borderColor: AppColors.primaryColor,bg: AppColors.white,),
                ],)

              ],) ,),
        ],),
    );
  }
}
