import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/presentations/components/custom_app_bar/custom_app_bar.dart';
import 'package:pronight_vendor/presentations/components/custom_scaffold/custom_scaffold.dart';
import '../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../core/dimens/dimens.dart';
import '../../../../../../core/resources/app_assets.dart';
import '../../../../../../core/resources/app_translate.dart';
import '../../../../../../core/resources/font_size.dart';
import '../../../../../components/custom_button/custom_button.dart';
import '../../../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../../../components/custom_text/custom_text.dart';

class ReservationDetails extends StatefulWidget {
  const ReservationDetails({super.key});

  @override
  State<ReservationDetails> createState() => _ReservationDetailsState();
}

class _ReservationDetailsState extends State<ReservationDetails> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: const Color(0xffF6FFFA),
      systemNavigationBarColor: const Color(0xffF6FFFA),
      appBar: CustomAppBar(title: 'Reservation Details',height: 64.h,bgColor: const Color(0xffF6FFFA),statusBarColor: const Color(0xffF6FFFA)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimens.padding_24h,vertical: Dimens.padding_12),
        child:  Container(
                padding: EdgeInsets.symmetric(horizontal: Dimens.padding_12h,vertical: Dimens.padding_16v),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r),color: AppColors.white),
                child: SingleChildScrollView(
                  child: Column(mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(height: 59.h,
                          decoration: BoxDecoration(
                              borderRadius:BorderRadius.circular(Dimens.padding_8),
                              color: const Color(0xffF0FAFF),border: Border.all(width:1.w,color: const Color(0xffFFF9DC))),
                          padding: EdgeInsets.symmetric(vertical: Dimens.padding_12v,horizontal:Dimens.padding_24h ),
                          child:Row(
                            children: [
                              CustomSvgIcon(assetName: AppAssets.reportDetails,width: 24.w,height: 24.h),
                              SizedBox(width: 10.w),
                              CustomText(title:AppTranslate.orderDetails.tr(),fontSize: AppFonts.font_12,),
                            ],)),
                      Column(children: [
                        Container(
                          padding: EdgeInsets.all(16.r),
                          margin: EdgeInsets.symmetric(vertical:Dimens.padding_12v),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r),border: Border.all(width: 1.w,color: Color(0xffBDBDBD))),
                          child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Row(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(width:130.w,
                                    child: CustomText(title: AppTranslate.orderNumber.tr(),fontSize: AppFonts.font_11,)),
                                CustomText(title: '31212',fontSize: AppFonts.font_10,fontColor: AppColors.textGrayColor,)
                              ],
                            ),
                              SizedBox(height: 10.h),
                              Row(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(width:130.w,
                                      child: CustomText(title: AppTranslate.order.tr(),fontSize: AppFonts.font_11,)),
                                  Expanded(child: CustomText(title: 'حجز غرفة داخل فندق الرياض للسياحة',fontSize: AppFonts.font_10,fontColor: AppColors.textGrayColor,))
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Row(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(width:130.w,
                                      child: CustomText(title: AppTranslate.orderDate.tr(),fontSize: AppFonts.font_11,)),
                                  Expanded(child: CustomText(title: '2024-8-12',fontSize: AppFonts.font_10,fontColor: AppColors.textGrayColor,))
                                ],
                              ),
                          ],) ,),
                        Container(
                          padding: EdgeInsets.all(16.r),
                          margin: EdgeInsets.symmetric(vertical:Dimens.padding_12v),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r),border: Border.all(width: 1.w,color: Color(0xffBDBDBD))),
                          child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Row(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(width:130.w,
                                    child: CustomText(title: AppTranslate.numberOfRooms.tr(),fontSize: AppFonts.font_11,)),
                                CustomText(title: 'غرفتان',fontSize: AppFonts.font_10,fontColor: AppColors.textGrayColor,)
                              ],
                            ),
                              SizedBox(height: 10.h),
                              Row(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(width:130.w,
                                      child: CustomText(title: AppTranslate.numberOfDays.tr(),fontSize: AppFonts.font_11,)),
                                  Expanded(child: CustomText(title: '4 أيام و 3 ليال',fontSize: AppFonts.font_10,fontColor: AppColors.textGrayColor,))
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Row(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(width:130.w,
                                      child: CustomText(title: AppTranslate.orderTime.tr(),fontSize: AppFonts.font_11,)),
                                  Expanded(child: CustomText(title: '08:00 مساءاً',fontSize: AppFonts.font_10,fontColor: AppColors.textGrayColor,))
                                ],
                              ),
                          ],) ,),
                        Container(
                          padding: EdgeInsets.all(16.r),
                          margin: EdgeInsets.symmetric(vertical:Dimens.padding_12v),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r),border: Border.all(width: 1.w,color: Color(0xffBDBDBD))),
                          child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Row(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(width:130.w,
                                    child: CustomText(title: AppTranslate.roomPrice.tr(),fontSize: AppFonts.font_11,)),
                                CustomText(title: '500 ريال سعودي',fontSize: AppFonts.font_10,fontColor: AppColors.textGrayColor,)
                              ],
                            ),
                              SizedBox(height: 10.h),
                              Row(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(width:130.w,
                                      child: CustomText(title: AppTranslate.totalPrice.tr(),fontSize: AppFonts.font_11,)),
                                  Expanded(child: CustomText(title: ' 4250 ريال سعودي',fontSize: AppFonts.font_10,fontColor: AppColors.textGrayColor,))
                                ],
                              ),

                          ],) ,),
                        SizedBox(height: 10.w),
                        Divider(color: AppColors.textGrayColor.withAlpha((0.20*255).round()),),
                        SizedBox(height: 20.w),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomButton(onTap: (){},
                              width: 135.w,
                              fontWeight: FontWeight.w400,
                              fontSize: AppFonts.font_11,
                              title: AppTranslate.acceptRequest.tr(),),
                            CustomButton(onTap: (){},
                              bg: AppColors.white,
                              borderColor: AppColors.primaryColor,
                              fontColor: AppColors.primaryColor,
                              width: 135.w,
                              fontWeight: FontWeight.w400,
                              fontSize: AppFonts.font_11,
                              title: AppTranslate.requestDenied.tr(),),
                          ],
                        )
                      ],)
                    ],
                  ),
                )
        ),
      ),
    );
  }
}
