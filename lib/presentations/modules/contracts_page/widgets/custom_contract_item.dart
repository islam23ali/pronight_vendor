import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/navigator/navigator.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/dimens/dimens.dart';
import '../../../../core/resources/app_assets.dart';
import '../../../../core/resources/font_size.dart';
import '../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../components/custom_text/custom_text.dart';
import '../contract_screens/contract_details.dart';
import 'custom_coupon_card.dart';

class CustomContractItem extends StatefulWidget {
  const CustomContractItem({super.key});

  @override
  State<CustomContractItem> createState() => _CustomContractItemState();
}

class _CustomContractItemState extends State<CustomContractItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimens.padding_8v),
      child: CustomCouponCard(height: 90.h,
          backgroundColor:AppColors.cardColor,borderRadius: 15.r,curvePosition: 30.w,
          curveAxis: Axis.vertical,
          firstChild: RotatedBox(quarterTurns: 1,child: Padding(
            padding: EdgeInsets.symmetric(vertical:Dimens.padding_12),
            child: CustomText(title: 'قطاع رقم 1',textAlign: TextAlign.center,fontSize: AppFonts.font_9,),
          )),
          secondChild: Container(
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
            ),)),
    );
  }
}
