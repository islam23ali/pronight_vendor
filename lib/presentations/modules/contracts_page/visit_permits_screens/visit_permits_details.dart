import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/utils/social_media_helper.dart';
import 'package:pronight_vendor/presentations/components/custom_app_bar/custom_app_bar.dart';
import 'package:pronight_vendor/presentations/components/custom_button/custom_button.dart';
import 'package:pronight_vendor/presentations/components/custom_scaffold/custom_scaffold.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/contract_screens/widget/delete_item_sheet.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/contract_screens/widget/payment_type_sheet.dart';
import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/dimens/dimens.dart';
import '../../../../core/resources/app_assets.dart';
import '../../../../core/resources/app_translate.dart';
import '../../../../core/resources/font_size.dart';
import '../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../components/custom_text/custom_text.dart';
import '../widgets/custom_coupon_card.dart';

class VisitPermitsDetails extends StatefulWidget {
  const VisitPermitsDetails({super.key});

  @override
  State<VisitPermitsDetails> createState() => _VisitPermitsDetailsState();
}

class _VisitPermitsDetailsState extends State<VisitPermitsDetails> {
  SocialMediaHelper socialMediaHelper =SocialMediaHelper();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(title: AppTranslate.visitPermitDetails.tr(),height: 64.h,),
      body: Padding(
        padding: EdgeInsets.all(Dimens.padding_16),
        child: CustomCouponCard(height: 549.h,
          backgroundColor:AppColors.cardDetailsColor,borderRadius: 15.r,curvePosition: 400.w,
          lineColor: AppColors.greyColor,lineHeight:1.w,
          secondChild: Padding(
            padding: EdgeInsets.symmetric(vertical:Dimens.padding_12),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(onTap: (){socialMediaHelper.openFacebookApp('https://pro-night.com/visitPermit/srml0os98SMGD3O7oVxr');},width: 70.w,height: 54.h,icon: AppAssets.showContract,iconWidth: 25.w,iconHeight: 25.h,),
                CustomButton(onTap: (){},width: 70.w,height: 54.h,icon: AppAssets.editContract,iconWidth: 23.w,iconHeight: 23.h,),
                CustomButton(onTap: (){showDeleteItemSheet();},width: 70.w,height: 54.h,icon: AppAssets.deleteContract,iconWidth: 25.w,iconHeight: 25.h,),
              ],
            )),
            firstChild: Column(
              children: [
                Container(height: 63.h,color: AppColors.primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: Dimens.padding_12h),
                  child:Align(alignment: Alignment.centerRight,
                    child: CustomText(textAlign: TextAlign.start,
                        title: AppTranslate.entryAndExitPermitForPersons.tr(),fontColor: AppColors.white,fontWeight: FontWeight.bold,fontSize: AppFonts.font_14),
                  ) ,),
                Padding(
                padding: EdgeInsets.all(Dimens.padding_16),
                child:
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: Dimens.width/2-40.w,
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            CustomText(title: AppTranslate.sectorNumber.tr(),fontSize: AppFonts.font_11,fontColor: AppColors.textColor2,),
                            SizedBox(height: 10.h),
                            Row(children: [
                              CustomSvgIcon(assetName: AppAssets.sectorNumber,width: 13.w,height: 14.h,),
                              SizedBox(width: 5.w),
                              CustomText(title: 'قطاع رقم 1',fontSize: AppFonts.font_10,fontWeight: FontWeight.bold,fontColor: AppColors.textColor3,)
                            ]),
                            SizedBox(height: 20.h),
                            CustomText(title: AppTranslate.ownerName.tr(),fontSize: AppFonts.font_11,fontColor: AppColors.textColor2,),
                            SizedBox(height: 10.h),
                            Row(children: [
                              CustomSvgIcon(assetName: AppAssets.userName,width: 14.w,height: 14.h,),
                              SizedBox(width: 5.w),
                              CustomText(title: 'عبدالرحمن محمد ',fontSize: AppFonts.font_11,fontColor: AppColors.textColor3,)
                            ]),
                            SizedBox(height: 20.h),
                            CustomText(title: AppTranslate.numberOfDays.tr(),fontSize: AppFonts.font_11,fontColor: AppColors.textColor2,),
                            SizedBox(height: 10.h),
                            Row(children: [
                              CustomSvgIcon(assetName: AppAssets.sectorNumber,width: 14.w,height: 14.h,),
                              SizedBox(width: 5.w),
                              CustomText(title: '4 أيام ',fontSize: AppFonts.font_11,fontColor: AppColors.textColor3,)
                            ]),
                              SizedBox(height: 20.h),
                            CustomText(title: AppTranslate.driverName.tr(),fontSize: AppFonts.font_11,fontColor: AppColors.textColor2,),
                            SizedBox(height: 10.h),
                            Row(children: [
                              CustomSvgIcon(assetName: AppAssets.userName,width: 14.w,height: 14.h,),
                              SizedBox(width: 5.w),
                              CustomText(title: 'عبدالرحمن محمد ',fontSize: AppFonts.font_11,fontColor: AppColors.textColor3,)
                            ]),
                          ],),
                        ),
                        SizedBox(width: Dimens.width/2-40.w,
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            CustomText(title: AppTranslate.unitNumber.tr(),fontSize: AppFonts.font_11,fontColor: AppColors.textColor2,),
                            SizedBox(height: 10.h),
                            Row(children: [
                              CustomSvgIcon(assetName: AppAssets.sectorNumber,width: 15.w,height: 15.h,),
                              SizedBox(width: 5.w),
                              CustomText(title: 'وحدة رقم 1',fontSize: AppFonts.font_11,fontWeight: FontWeight.bold,fontColor: AppColors.textColor3,)
                            ]),
                            SizedBox(height: 20.h),
                            CustomText(title: AppTranslate.beach.tr(),fontSize: AppFonts.font_11,fontColor: AppColors.textColor2,),
                            SizedBox(height: 10.h),
                            Row(children: [
                              CustomSvgIcon(assetName: AppAssets.beach,width: 17.w,height: 18.h,),
                              SizedBox(width: 5.w),
                              CustomText(title: 'شاطيء الأحلام',fontSize: AppFonts.font_11,fontColor: AppColors.textColor3,)
                            ]),
                            SizedBox(height: 20.h),
                            CustomText(title: AppTranslate.dateOfDeclaration.tr(),fontSize: AppFonts.font_11,fontColor: AppColors.textColor2,),
                            SizedBox(height: 10.h),
                            Row(children: [
                              CustomSvgIcon(assetName: AppAssets.date,width: 14.w,height: 14.h,),
                              SizedBox(width: 5.w),
                              CustomText(title: '2023-09-12',fontSize: AppFonts.font_11,fontColor: AppColors.textColor3,)
                            ]),

                            SizedBox(height: 20.h),
                            CustomText(title: AppTranslate.permitStatus.tr(),fontSize: AppFonts.font_11,fontColor: AppColors.textColor2,),
                            SizedBox(height: 10.h),
                            Row(children: [
                              CustomSvgIcon(assetName: AppAssets.selectedPayment,width: 14.w,height: 14.h,),
                              SizedBox(width: 5.w),
                              CustomText(title: 'ساري',fontSize: AppFonts.font_11,fontColor: AppColors.textColor3,)
                            ]),

                          ],),
                        ),
                      ],),
                    SizedBox(height: 20.h),
                    CustomText(title: AppTranslate.comments.tr(),fontSize: AppFonts.font_11,fontColor: AppColors.textColor2,),
                    SizedBox(height: 10.h),
                    CustomText(title: 'يتم هنا كتابة أى ملاحظات خاصة بالعقد ',fontSize: AppFonts.font_11,fontColor: AppColors.textColor2,),
                  ],
                ),),
              ],
            )),
      ),);
  }
  Future<dynamic> showDeleteItemSheet() async {
    return  showModalBottomSheet(
      // isDismissible: false,
      //   isScrollControlled: true,
        backgroundColor: AppColors.white,
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24.r),
            )),
        builder: (BuildContext context) {
          return const DeleteItemSheet();
        });}
}
