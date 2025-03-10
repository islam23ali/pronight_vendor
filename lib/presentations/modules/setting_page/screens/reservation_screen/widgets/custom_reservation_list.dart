import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/app_assets.dart';
import 'package:pronight_vendor/core/resources/font_size.dart';
import 'package:pronight_vendor/presentations/components/custom_button/custom_button.dart';
import 'package:pronight_vendor/presentations/components/custom_svg/CustomSvgIcon.dart';
import 'package:pronight_vendor/presentations/components/custom_text/custom_text.dart';
import '../../../../../../core/dimens/dimens.dart';
import '../../../../contracts_page/widgets/custom_contract_item.dart';

class CustomReservationList extends StatefulWidget {
  const CustomReservationList({super.key});

  @override
  State<CustomReservationList> createState() => _CustomReservationListState();
}

class _CustomReservationListState extends State<CustomReservationList> {
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: Dimens.padding_12v),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return AnimationConfiguration.staggeredGrid(
                duration:const Duration(milliseconds: 900),
                position: index,
                columnCount: 1,
                child: ScaleAnimation(
                    duration:const Duration(milliseconds: 1000),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: FadeInAnimation(child:
                    Material(elevation: 4,borderRadius: BorderRadius.circular(11.r),
                        child: Container(
                          padding: EdgeInsets.all(Dimens.padding_12),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(11.r),color: Color(0xffF8FFFB)
                        ),child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(title: 'فندق الرياض للسياحة',fontSize: AppFonts.font_10,fontColor: AppColors.textGrayColor),
                              Row(children: [
                                Container(width: 10.w,height: 10.h,margin:EdgeInsets.symmetric(horizontal: 5.w),decoration: BoxDecoration(shape: BoxShape.circle,color: AppColors.primaryColor),),
                                CustomText(title: 'التفاصيل',fontColor: AppColors.darkColor,fontSize: AppFonts.font_11,fontWeight: FontWeight.bold,),
                              ],)
                          ],),
                            SizedBox(height: 10.h),
                            SizedBox(height: 32.h,
                              child: Row(children: [
                                CustomSvgIcon(assetName: AppAssets.reservationIcon,width: 29.w,height: 29.h),
                                SizedBox(width: 10.w),
                                Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                CustomText(title: 'أجرى عبدالرحمن أحمد حجزاً',fontSize:AppFonts.font_11,fontColor: AppColors.textColor3,),
                                CustomText(title: 'منذ ساعة',fontSize:AppFonts.font_10,fontColor:AppColors.textGrayColor,)
                                ],)
                              ],),
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Row(children: [
                                CustomSvgIcon(assetName: AppAssets.date,width: 12.w,height: 12.h),
                                SizedBox(width: 5.w),
                                CustomText(title: '2023-09-12',fontSize: AppFonts.font_11,fontColor: AppColors.textColor3,)
                              ]),
                              Row(children: [
                                CustomSvgIcon(assetName: AppAssets.sectorNumber,width: 15.w,height: 15.h),
                                SizedBox(width: 5.w),
                                CustomText(title: '4 أيام',fontSize: AppFonts.font_11,fontColor: AppColors.textColor3,)
                              ]),
                            ],),
                            SizedBox(height: 10.h),
                            Row(children: [
                              CustomSvgIcon(assetName: AppAssets.contractNum,width: 15.w,height: 15.h,),
                              CustomText(title: ' 4250 ريال سعودي ',fontSize: AppFonts.font_12,fontColor: AppColors.textColor,)
                            ]),
                            SizedBox(height: 10.h),
                            Divider(),
                            SizedBox(height: 10.h),
                            Row(crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                              CustomButton(onTap: (){},width: 60.w,height: 36.h,title: 'قبول',fontSize: AppFonts.font_12,fontWeight: FontWeight.w400,),
                              SizedBox(width: 5.w),
                              CustomButton(onTap: (){},width: 60.w,height: 36.h,bg: AppColors.white,borderColor: AppColors.primaryColor,
                                fontColor: AppColors.primaryColor,borderWidth: 3.w,
                                title: 'رفض',fontSize: AppFonts.font_12,fontWeight: FontWeight.w400,)
                            ],)

                        ],),))
                    )));
          }),
    );
  }
}
