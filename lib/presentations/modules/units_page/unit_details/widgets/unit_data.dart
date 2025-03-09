import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';

import '../../../../../core/app_theme/app_colors.dart';
import '../../../../../core/dimens/dimens.dart';
import '../../../../../core/resources/app_translate.dart';
import '../../../../../core/resources/font_size.dart';
import '../../../../components/custom_text/custom_text.dart';

class UnitData extends StatefulWidget {
  const UnitData({super.key});

  @override
  State<UnitData> createState() => _UnitDataState();
}

class _UnitDataState extends State<UnitData> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(child: Column(children: [
          CustomText(title: AppTranslate.theFamily.tr(),fontSize: AppFonts.font_10,fontWeight: FontWeight.w500,fontColor: AppColors.textColor,),
          SizedBox(height: 5.h),
          Container(height: 38.h,padding: EdgeInsets.all(Dimens.padding_8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),color: AppColors.bgHomeColor),alignment: Alignment.center,
            child: CustomText(title: '2 ${AppTranslate.family.tr()}',fontSize: AppFonts.font_12,fontWeight: FontWeight.w500,),)
        ])),
        SizedBox(child: Column(children: [
          CustomText(title: AppTranslate.bathrooms.tr(),fontSize: AppFonts.font_10,fontWeight: FontWeight.w500,fontColor: AppColors.textColor,),
          SizedBox(height: 5.h),
          Container(height: 38.h,padding: EdgeInsets.all(Dimens.padding_8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),color: AppColors.bgHomeColor),alignment: Alignment.center,
            child: CustomText(title: '2 ${AppTranslate.bathroom.tr()}',fontSize: AppFonts.font_12,fontWeight: FontWeight.w500,),)
        ])),
        SizedBox(child: Column(children: [
          CustomText(title: AppTranslate.theAdults.tr(),fontSize: AppFonts.font_10,fontWeight: FontWeight.w500,fontColor: AppColors.textColor,),
          SizedBox(height: 5.h),
          Container(height: 38.h,padding: EdgeInsets.all(Dimens.padding_8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),color: AppColors.bgHomeColor),alignment: Alignment.center,
            child: CustomText(title: '2 ${AppTranslate.adults.tr()}',fontSize: AppFonts.font_12,fontWeight: FontWeight.w500,),)
        ])),
        SizedBox(child: Column(children: [
          CustomText(title: AppTranslate.theChildren.tr(),fontSize: AppFonts.font_10,fontWeight: FontWeight.w500,fontColor: AppColors.textColor,),
          SizedBox(height: 5.h),
          Container(height: 38.h,padding: EdgeInsets.all(Dimens.padding_8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),color: AppColors.bgHomeColor),alignment: Alignment.center,
            child: CustomText(title: '2 ${AppTranslate.kids.tr()}',fontSize: AppFonts.font_12,fontWeight: FontWeight.w500,),)
        ])),
      ],);
  }
}
