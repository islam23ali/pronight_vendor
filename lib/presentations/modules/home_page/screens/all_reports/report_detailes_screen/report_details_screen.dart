import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/utils/social_media_helper.dart';
import 'package:pronight_vendor/presentations/components/custom_app_bar/custom_app_bar.dart';
import 'package:pronight_vendor/presentations/components/custom_scaffold/custom_scaffold.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/screens/widget/payment_type_sheet.dart';
import '../../../../../../core/dimens/dimens.dart';
import '../../../../../../core/resources/app_assets.dart';
import '../../../../../../core/resources/app_translate.dart';
import '../../../../../../core/resources/font_size.dart';
import '../../../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../../../components/custom_text/custom_text.dart';

class ReportDetailsScreen extends StatefulWidget {
  const ReportDetailsScreen({super.key});

  @override
  State<ReportDetailsScreen> createState() => _ReportDetailsScreenState();
}

class _ReportDetailsScreenState extends State<ReportDetailsScreen> {
  SocialMediaHelper socialMediaHelper =SocialMediaHelper();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: Color(0xffE9F5EE),
      systemNavigationBarColor: Color(0xffE9F5EE),
      appBar: CustomAppBar(fontWeight: FontWeight.bold,fontSize: AppFonts.font_14,
        title: AppTranslate.reportDetails.tr(),bgColor: Color(0xffE9F5EE),statusBarColor: Color(0xffE9F5EE),height: 64.h,),
      body: Container(
        margin: EdgeInsets.all(Dimens.padding_16),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r),color: AppColors.white),
        child: Column(mainAxisSize: MainAxisSize.min,
        children: [
          Container(height: 59.h,
            decoration: BoxDecoration(borderRadius:BorderRadius.only(topLeft:Radius.circular(20.r),topRight:Radius.circular(20.r)),
              color: Color(0xffF0FAFF),),
            padding: EdgeInsets.symmetric(vertical: Dimens.padding_12v,horizontal:Dimens.padding_24h ),
            child:Row(
              children: [
                CustomSvgIcon(assetName: AppTranslate.reportDetails,width: 24.w,height: 24.h),
                SizedBox(width: 16.w),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  CustomText(title: AppTranslate.reportDetails.tr(),fontSize: AppFonts.font_12,),
                  CustomText(title: AppTranslate.basicDataAboutTheUnits.tr(),fontSize: AppFonts.font_10,fontColor: Colors.grey,)
                ],)
            ],)),
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
                          CustomText(title: AppTranslate.unitName.tr(),fontSize: AppFonts.font_11,fontColor: AppColors.textColor2,),
                          SizedBox(height: 10.h),
                          Row(children: [
                            CustomSvgIcon(assetName: AppAssets.homeIcon,width: 15.w,height: 15.h,),
                            SizedBox(width: 5.w),
                            CustomText(title: ' الأندلس مول',fontSize: AppFonts.font_11,fontColor: AppColors.textColor3,)
                          ]),
                          SizedBox(height: 20.h),
                          CustomText(title: AppTranslate.unitLocation.tr(),fontSize: AppFonts.font_11,fontColor: AppColors.textColor2,),
                          SizedBox(height: 10.h),
                          Row(children: [
                            CustomSvgIcon(assetName: AppAssets.address,width: 17.w,height: 17.h,),
                            SizedBox(width: 5.w),
                            CustomText(title: 'الرياض',fontSize: AppFonts.font_11,fontColor: AppColors.textColor3,)
                          ]),
                          SizedBox(height: 20.h),
                          CustomText(title: AppTranslate.numberRoomsAvailable.tr(),fontSize: AppFonts.font_11,fontColor: AppColors.textColor2,),
                          SizedBox(height: 10.h),
                          Row(children: [
                            CustomSvgIcon(assetName: AppAssets.room,width: 17.w,height: 17.h,color: AppColors.textColor2,),
                            SizedBox(width: 5.w),
                            CustomText(title: '10 ${AppTranslate.availableRooms.tr()}',fontSize: AppFonts.font_11,fontColor: AppColors.textColor3,)
                          ]),
                          SizedBox(height: 20.h),
                          CustomText(title: AppTranslate.lastUpdate.tr(),fontSize: AppFonts.font_11,fontColor: AppColors.textColor2,),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              CustomSvgIcon(assetName: AppAssets.date,width: 14.w,height: 14.h,),
                              SizedBox(width: 5.w),
                              CustomText(title: '2023-09-12',fontSize: AppFonts.font_11,fontColor: AppColors.textColor2,),
                            ],
                          ),

                        ],),
                    ),
                    SizedBox(width: Dimens.width/2-40.w,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(title: AppTranslate.placeType.tr(),fontSize: AppFonts.font_11,fontColor: AppColors.textColor2,),
                          SizedBox(height: 10.h),
                          Row(children: [
                            CustomSvgIcon(assetName: AppAssets.address,width: 15.w,height: 15.h,),
                            SizedBox(width: 5.w),
                            CustomText(title: 'فيلا',fontSize: AppFonts.font_11,fontWeight: FontWeight.bold,fontColor: AppColors.textColor3,)
                          ]),
                          SizedBox(height: 20.h),
                          CustomText(title: AppTranslate.numberOfRooms.tr(),fontSize: AppFonts.font_11,fontColor: AppColors.textColor2,),
                          SizedBox(height: 10.h),
                          Row(children: [
                            CustomSvgIcon(assetName: AppAssets.bed,width: 17.w,height: 18.h,color: AppColors.textColor2,),
                            SizedBox(width: 5.w),
                            CustomText(title: '20 ${AppTranslate.room.tr()}',fontSize: AppFonts.font_11,fontColor: AppColors.textColor3,)
                          ]),
                          SizedBox(height: 20.h),
                          CustomText(title: AppTranslate.numberRoomsBooked.tr(),fontSize: AppFonts.font_11,fontColor: AppColors.textColor2,),
                          SizedBox(height: 10.h),
                          Row(children: [
                            CustomSvgIcon(assetName: AppAssets.roomReservation,width: 17.w,height: 17.h,),
                            SizedBox(width: 5.w),
                            CustomText(title: '10 ${AppTranslate.bookedRooms.tr()}',fontSize: AppFonts.font_11,fontColor: AppColors.textColor3,)
                          ]),

                        ],),
                    ),
                  ],),
                SizedBox(height: 20.h),
                CustomText(title: AppTranslate.comments.tr(),fontSize: AppFonts.font_11,fontColor: AppColors.textColor2,),
                SizedBox(height: 10.h),
                CustomText(title: 'يتم هنا كتابة أى ملاحظات خاصة بالعقد',fontSize: AppFonts.font_11,fontColor: AppColors.textColor2,),
              ],
            ),),
        ],
      ),),);
  }
  Future<dynamic> showPaymentTypesSheet() async {
    return  showModalBottomSheet(
      // isDismissible: false,
        isScrollControlled: true,
        backgroundColor: AppColors.white,
        context: context,

        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24.r),
            )),
        builder: (BuildContext context) {
          return const PaymentTypeSheet();
        });}
}
