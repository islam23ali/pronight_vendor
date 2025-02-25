import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/presentations/components/custom_app_bar/custom_app_bar.dart';
import 'package:pronight_vendor/presentations/components/custom_button/custom_button.dart';
import 'package:pronight_vendor/presentations/components/custom_scaffold/custom_scaffold.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/dimens/dimens.dart';
import '../../../../core/navigator/navigator.dart';
import '../../../../core/resources/app_assets.dart';
import '../../../../core/resources/app_translate.dart';
import '../../../../core/resources/font_size.dart';
import '../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../components/custom_text/custom_text.dart';
import '../custom_coupon_card.dart';

class ContractDetails extends StatefulWidget {
  const ContractDetails({super.key});

  @override
  State<ContractDetails> createState() => _ContractDetailsState();
}

class _ContractDetailsState extends State<ContractDetails> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(title: 'تفاصيل العقود ',),
      body: Padding(
        padding: EdgeInsets.all(Dimens.padding_16),
        child: CustomCouponCard(height: 649.h,
          backgroundColor:AppColors.cardDetailsColor,borderRadius: 15.r,curvePosition: 450.w,
          lineColor: AppColors.greyColor,lineHeight:1.w,
          secondChild: Padding(
            padding: EdgeInsets.symmetric(vertical:Dimens.padding_12),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(onTap: (){},width: 70.w,height: 54.h,icon: AppAssets.showContract,iconWidth: 25.w,iconHeight: 25.h,),
                CustomButton(onTap: (){},width: 70.w,height: 54.h,icon: AppAssets.editContract,iconWidth: 23.w,iconHeight: 23.h,),
                CustomButton(onTap: (){},width: 70.w,height: 54.h,icon: AppAssets.deleteContract,iconWidth: 25.w,iconHeight: 25.h,),
              ],
            )),
            firstChild: Column(
              children: [
                Container(height: 63.h,color: AppColors.primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: Dimens.padding_12h),
                  child:Align(alignment: Alignment.centerRight,
                    child: CustomText(textAlign: TextAlign.start,
                        title: 'تفاصيل العقد رقم 1',fontColor: AppColors.white,fontWeight: FontWeight.bold,fontSize: AppFonts.font_14),
                  ) ,),
                Padding(
                padding: EdgeInsets.all(Dimens.padding_16),
                child:
                Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 177.w,
                          child: Column(children: [
                            Row(children: [
                              CustomSvgIcon(assetName: AppAssets.userName,width: 13.w,height: 14.h,),
                              SizedBox(width: 5.w),
                              CustomText(title: 'عبدالرحمن محمد ',fontSize: AppFonts.font_10,fontWeight: FontWeight.bold,fontColor: AppColors.textColor3,)
                            ]),
                            SizedBox(height: 10.h),
                            Row(children: [
                              CustomSvgIcon(assetName: AppAssets.date,width: 13.w,height: 14.h,),
                              SizedBox(width: 5.w),
                              CustomText(title: '2023-09-12',fontSize: AppFonts.font_11,fontColor: AppColors.textColor2,)
                            ]),
                          ],),),
                        SizedBox(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              CustomSvgIcon(assetName: AppAssets.address,width: 14.w,height: 14.h,),
                              SizedBox(width: 5.w),
                              CustomText(title: 'فيلا',fontSize: AppFonts.font_11,fontColor: AppColors.textColor3,)
                            ]),
                            SizedBox(height: 10.h),
                            Row(children: [
                              CustomSvgIcon(assetName: AppAssets.contractNum,width: 13.w,height: 14.h,),
                              SizedBox(width: 5.w),
                              CustomText(title: '4250',fontSize: AppFonts.font_11,fontColor: AppColors.textColor3,)
                            ],),
                          ],
                        ),)
                      ],),
                    Align(alignment: Alignment.bottomLeft,
                      child: InkWell(onTap: (){
                        NavigatorHandler.push(ContractDetails());
                      },
                        child: CustomText(textAlign: TextAlign.left,
                          title: AppTranslate.details.tr(),fontSize: AppFonts.font_9,fontWeight: FontWeight.bold,fontColor: Color(0xff1C472E),),
                      ),
                    )
                  ],
                ),),
              ],
            )),
      ),);
  }
}
