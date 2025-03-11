import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/navigator/navigator.dart';

import '../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../core/dimens/dimens.dart';
import '../../../../../../core/resources/app_assets.dart';
import '../../../../../../core/resources/font_size.dart';
import '../../../../../components/custom_button/custom_button.dart';
import '../../../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../../../components/custom_text/custom_text.dart';
import '../reservation_details/reservation_details.dart';

class CustomReservationItem extends StatefulWidget {
  const CustomReservationItem({super.key, required this.isNew});
  final bool isNew;

  @override
  State<CustomReservationItem> createState() => _CustomReservationItemState();
}

class _CustomReservationItemState extends State<CustomReservationItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(vertical:Dimens.padding_8v),
      child: Material(elevation: 4,borderRadius: BorderRadius.circular(11.r),
          child: Container(
            padding: EdgeInsets.all(Dimens.padding_12),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(11.r),color: const Color(0xffF8FFFB)
            ),child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(title: 'فندق الرياض للسياحة',fontSize: AppFonts.font_10,fontColor: AppColors.textGrayColor),
                  Row(children: [
                    Container(width: 10.w,height: 10.h,margin:EdgeInsets.symmetric(horizontal: 5.w),decoration: const BoxDecoration(shape: BoxShape.circle,color: AppColors.primaryColor),),
                    (widget.isNew==false)?SizedBox(): InkWell(onTap: (){
                      NavigatorHandler.push(const ReservationDetails());
                    },child: CustomText(title: 'التفاصيل',fontColor: AppColors.darkColor,fontSize: AppFonts.font_11,fontWeight: FontWeight.bold,)),
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
              SizedBox(height:(widget.isNew==false)?20: 10.h),
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
              (widget.isNew==false)?const SizedBox():  SizedBox(height: 10.h),
              (widget.isNew==false)?const SizedBox(): Row(children: [
                CustomSvgIcon(assetName: AppAssets.contractNum,width: 15.w,height: 15.h,),
                CustomText(title: ' 4250 ريال سعودي ',fontSize: AppFonts.font_12,fontColor: AppColors.textColor,)
              ]),
              SizedBox(height: 10.h),
              const Divider(color: AppColors.greyColor),
              (widget.isNew==true)?const SizedBox():  SizedBox(height: 10.h),
              (widget.isNew==true)?const SizedBox():  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    CustomSvgIcon(assetName: AppAssets.contractNum,width: 15.w,height: 15.h,),
                    CustomText(title: ' 4250 ريال سعودي ',fontSize: AppFonts.font_12,fontColor: AppColors.textColor,)
                  ]),
                  (widget.isNew==true)?SizedBox(): InkWell(onTap: (){
                    NavigatorHandler.push(const ReservationDetails());
                  },
                      child: CustomText(title: 'التفاصيل',fontColor: AppColors.darkColor,fontSize: AppFonts.font_11,fontWeight: FontWeight.bold,)),

                ],
              ),
              (widget.isNew==true)?const SizedBox():  SizedBox(height: 10.h),

              (widget.isNew==false)?const SizedBox(): Align(alignment: Alignment.centerLeft,
                child: Row(crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomButton(onTap: (){},width: 60.w,height: 36.h,title: 'قبول',fontSize: AppFonts.font_12,fontWeight: FontWeight.w400),
                    SizedBox(width: 5.w),
                    CustomButton(onTap: (){},width: 60.w,height: 36.h,bg: AppColors.white,borderColor: AppColors.primaryColor,
                      fontColor: AppColors.primaryColor,borderWidth: 3.w,
                      title: 'رفض',fontSize: AppFonts.font_12,fontWeight: FontWeight.w400,)
                  ],),
              )

            ],),)),
    );
  }
}
