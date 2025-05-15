import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/presentations/app_loader.dart';
import 'package:pronight_vendor/presentations/components/custom_app_bar/custom_app_bar.dart';
import 'package:pronight_vendor/presentations/components/custom_scaffold/custom_scaffold.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../core/dimens/dimens.dart';
import '../../../../../../core/resources/app_assets.dart';
import '../../../../../../core/resources/app_translate.dart';
import '../../../../../../core/resources/font_size.dart';
import '../../../../../../injection.dart';
import '../../../../../components/custom_button/custom_button.dart';
import '../../../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../../../components/custom_text/custom_text.dart';
import '../../../setting_view_model.dart';

class ReservationDetails extends StatefulWidget {
  const ReservationDetails({super.key, required this.id});
  final String? id;

  @override
  State<ReservationDetails> createState() => _ReservationDetailsState();
}

class _ReservationDetailsState extends State<ReservationDetails> {
  SettingsViewModel provider = getIt();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      provider.reservationDetails(widget.id);
    });
  }
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: const Color(0xffF6FFFA),
      systemNavigationBarColor: const Color(0xffF6FFFA),
      appBar: CustomAppBar(title: AppTranslate.reservationDetails.tr(),height: 64.h,bgColor: const Color(0xffF6FFFA),statusBarColor: const Color(0xffF6FFFA)),
      body: Consumer<SettingsViewModel>(
        builder: (context,data,_) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.padding_24h,vertical: Dimens.padding_12),
            child: data.isLoading?const Center(child: AppLoader()): Container(
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
                                    CustomText(title: data.reservationDetailsModel?.data?.code.toString()??'',fontSize: AppFonts.font_10,fontColor: AppColors.textGrayColor,)
                                  ],
                                ),
                                  SizedBox(height: 10.h),
                                  Row(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(width:130.w,
                                          child: CustomText(title: AppTranslate.order.tr(),fontSize: AppFonts.font_11,)),
                                      Expanded(child: CustomText(title: 'حجز غرفة داخل فندق الرياض للسياحة لسه جيمي',fontSize: AppFonts.font_10,fontColor: AppColors.textGrayColor,))
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  Row(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(width:130.w,
                                          child: CustomText(title: AppTranslate.orderDate.tr(),fontSize: AppFonts.font_11,)),
                                      Expanded(child: CustomText(title: data.reservationDetailsModel?.data?.date??'',fontSize: AppFonts.font_10,fontColor: AppColors.textGrayColor,))
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
                                    CustomText(title: 'غرفتان لسه جيمي',fontSize: AppFonts.font_10,fontColor: AppColors.textGrayColor,)
                                  ],
                                ),
                                  SizedBox(height: 10.h),
                                  Row(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(width:130.w,
                                          child: CustomText(title: AppTranslate.numberOfDays.tr(),fontSize: AppFonts.font_11,)),
                                      Expanded(child: CustomText(title: '${data.reservationDetailsModel?.data?.daysCount.toString()} ${AppTranslate.days.tr()}',fontSize: AppFonts.font_10,fontColor: AppColors.textGrayColor,))
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                  Row(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(width:130.w,
                                          child: CustomText(title: AppTranslate.orderTime.tr(),fontSize: AppFonts.font_11,)),
                                      Expanded(child: CustomText(title: data.reservationDetailsModel?.data?.time??'',fontSize: AppFonts.font_10,fontColor: AppColors.textGrayColor,))
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
                                    CustomText(title: '500 ريال سعودي لسه جيمي ',fontSize: AppFonts.font_10,fontColor: AppColors.textGrayColor,)
                                  ],
                                ),
                                  SizedBox(height: 10.h),
                                  Row(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(width:130.w,
                                          child: CustomText(title: AppTranslate.totalPrice.tr(),fontSize: AppFonts.font_11,)),
                                      Expanded(child: CustomText(title: '${data.reservationDetailsModel?.data?.totalPrice} ${AppTranslate.saudiRiyal.tr()}',fontSize: AppFonts.font_10,fontColor: AppColors.textGrayColor,))
                                    ],
                                  ),

                              ],) ,),
                            SizedBox(height: 10.w),
                            data.reservationDetailsModel?.data?.status=='new'? Divider(color: AppColors.textGrayColor.withAlpha((0.20*255).round()),):SizedBox(),
                            SizedBox(height: 20.w),
                            data.reservationDetailsModel?.data?.status=='new'? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomButton(onTap: (){
                                  provider.updateReservationStatus(data.reservationDetailsModel?.data?.id.toString()??'','accepted');
                                },
                                  width: 135.w,
                                  fontWeight: FontWeight.w400,
                                  fontSize: AppFonts.font_11,
                                  title: AppTranslate.acceptRequest.tr(),),
                                CustomButton(onTap: (){
                                  provider.updateReservationStatus(data.reservationDetailsModel?.data?.id.toString()??'','refused');
                                },
                                  bg: AppColors.white,
                                  borderColor: AppColors.primaryColor,
                                  fontColor: AppColors.primaryColor,
                                  width: 135.w,
                                  fontWeight: FontWeight.w400,
                                  fontSize: AppFonts.font_11,
                                  title: AppTranslate.requestDenied.tr(),),
                              ],
                            ):SizedBox()
                          ],)
                        ],
                      ),
                    )
            ),
          );
        }
      ),
    );
  }
}
