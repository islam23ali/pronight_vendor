
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/app_assets.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/core/resources/font_size.dart';
import 'package:pronight_vendor/presentations/components/custom_button/custom_button.dart';
import 'package:pronight_vendor/presentations/components/custom_svg/CustomSvgIcon.dart';
import 'package:pronight_vendor/presentations/components/inputs/custom_text_form.dart';
import 'package:pronight_vendor/presentations/components/inputs/custom_text_form_area.dart';
import 'package:provider/provider.dart';
import '../../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../../core/dimens/dimens.dart';
import '../../../../../../components/custom_text/custom_text.dart';


class RateAppSheet extends StatefulWidget {
  const RateAppSheet({super.key});

  @override
  State<RateAppSheet> createState() => _EditCatBottomSheetState();
}

class _EditCatBottomSheetState extends State<RateAppSheet> {
  TextEditingController controller = TextEditingController();
int? onStarSubmit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Dimens.padding_20v, right: Dimens.padding_12h, left: Dimens.padding_12h,bottom:Dimens.padding_32v),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.r),
                color: AppColors.gray.withAlpha((0.40 * 255).round()),
              ),
            ),
          ),
          SizedBox(height:  Dimens.padding_16v),
          Center(child: CustomText(title: AppTranslate.appEvaluation.tr(),fontWeight: FontWeight.bold,textAlign: TextAlign.center)),
          SizedBox(height:  Dimens.padding_8v),
          Divider(thickness: 1.w),
          SizedBox(height:  Dimens.padding_16v),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          InkWell(onTap: (){setState(() {
            onStarSubmit=0;
          });},
            child: SizedBox(width: 70.w,height: 50.h,
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              CustomSvgIcon(assetName: AppAssets.star,width: 26.w,height: 26.h,color:onStarSubmit==0?AppColors.circleColor:null),
                  CustomText(title: AppTranslate.excellent.tr(),fontSize: AppFonts.font_9,fontWeight: FontWeight.bold,)
              ],),),
          ),
          InkWell(onTap: (){
            setState(() {
              onStarSubmit=1;
            });
          },
            child: SizedBox(width: 70.w,height: 50.h,
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              CustomSvgIcon(assetName: AppAssets.star,width: 26.w,height: 26.h,color:(onStarSubmit==1||onStarSubmit==0)?AppColors.circleColor:null),
                  CustomText(title: AppTranslate.veryGood.tr(),fontSize: AppFonts.font_9,fontWeight: FontWeight.bold,)
              ],),),
          ),
          InkWell(onTap: (){
            setState(() {
              onStarSubmit=2;
            });
          },
            child: SizedBox(width: 70.w,height: 50.h,
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              CustomSvgIcon(assetName: AppAssets.star,width: 26.w,height: 26.h,color:(onStarSubmit==2||onStarSubmit==1||onStarSubmit==0)?AppColors.circleColor:null),
                  CustomText(title: AppTranslate.good.tr(),fontSize: AppFonts.font_9,fontWeight: FontWeight.bold,)
              ],),),
          ),
          InkWell(onTap: (){
            setState(() {
              onStarSubmit=3;
            });
          },
            child: SizedBox(width: 70.w,height: 50.h,
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              CustomSvgIcon(assetName: AppAssets.star,width: 26.w,height: 26.h,color:(onStarSubmit==3||onStarSubmit==2||onStarSubmit==1||onStarSubmit==0)?AppColors.circleColor:null),
                  CustomText(title: AppTranslate.average.tr(),fontSize: AppFonts.font_9,fontWeight: FontWeight.bold,)
              ],),),
          ),
        ],),
          SizedBox(height:  Dimens.padding_16v),
          CustomText(title: AppTranslate.comments.tr(),fontWeight: FontWeight.bold,fontSize: AppFonts.font_14),
          SizedBox(height:  Dimens.padding_16v),
          CustomTextFormFieldArea(controller: controller,bgColor: Color(0xffFAFAFA)),
          SizedBox(height:  Dimens.padding_16v),
          CustomButton(onTap: (){},title: AppTranslate.send.tr(),radius: 50.r,width: 354.w,)
        ],
      ),
    );
  }
}