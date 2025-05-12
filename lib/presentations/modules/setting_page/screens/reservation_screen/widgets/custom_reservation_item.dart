import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/navigator/navigator.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/data/models/response/all_reservation_model.dart';
import 'package:pronight_vendor/presentations/modules/home_page/home_view_model.dart';

import '../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../core/dimens/dimens.dart';
import '../../../../../../core/resources/app_assets.dart';
import '../../../../../../core/resources/font_size.dart';
import '../../../../../../injection.dart';
import '../../../../../components/custom_button/custom_button.dart';
import '../../../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../../../components/custom_text/custom_text.dart';
import '../reservation_details/reservation_details.dart';

class CustomReservationItem extends StatefulWidget {
  const CustomReservationItem({super.key, required this.isNew, required this.model});
  final bool isNew;
  final OneReservation? model;

  @override
  State<CustomReservationItem> createState() => _CustomReservationItemState();
}

class _CustomReservationItemState extends State<CustomReservationItem> {
  HomeViewModel provider = getIt();
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
                  CustomText(title: widget.model?.unit?.title??'',fontSize: AppFonts.font_10,fontColor: AppColors.textGrayColor),
                  Row(children: [
                    Container(width: 10.w,height: 10.h,margin:EdgeInsets.symmetric(horizontal: 5.w),decoration: const BoxDecoration(shape: BoxShape.circle,color: AppColors.primaryColor),),
                    (widget.isNew==false)?const SizedBox(): InkWell(onTap: (){
                      NavigatorHandler.push(ReservationDetails(id: widget.model?.id.toString()??''));
                    },child: CustomText(title: AppTranslate.details.tr(),fontColor: AppColors.darkColor,fontSize: AppFonts.font_11,fontWeight: FontWeight.bold,)),
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
                      CustomText(title: widget.model?.user?.user?.name??'',fontSize:AppFonts.font_11,fontColor: AppColors.textColor3,),
                      CustomText(title: 'منذ ساعة لسه back',fontSize:AppFonts.font_10,fontColor:AppColors.textGrayColor,)
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
                    CustomText(title: widget.model?.entryDate??'',fontSize: AppFonts.font_11,fontColor: AppColors.textColor3,)
                  ]),
                  Row(children: [
                    CustomSvgIcon(assetName: AppAssets.sectorNumber,width: 15.w,height: 15.h),
                    SizedBox(width: 5.w),
                    CustomText(title: '4 أيام  لسه back',fontSize: AppFonts.font_11,fontColor: AppColors.textColor3,)
                  ]),
                ],),
              (widget.isNew==false)?const SizedBox():  SizedBox(height: 10.h),
              (widget.isNew==false)?const SizedBox(): Row(children: [
                CustomSvgIcon(assetName: AppAssets.contractNum,width: 15.w,height: 15.h,),
                CustomText(title: ' ${widget.model?.totalPrice} ${AppTranslate.saudiRiyal.tr()} ',fontSize: AppFonts.font_12,fontColor: AppColors.textColor,)
              ]),
              SizedBox(height: 10.h),
              const Divider(color: AppColors.greyColor),
              (widget.isNew==true)?const SizedBox():  SizedBox(height: 10.h),
              (widget.isNew==true)?const SizedBox():  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    CustomSvgIcon(assetName: AppAssets.contractNum,width: 15.w,height: 15.h,),
                    CustomText(title: ' ${widget.model?.totalPrice} ${AppTranslate.saudiRiyal.tr()} ',fontSize: AppFonts.font_12,fontColor: AppColors.textColor,)
                  ]),
                  (widget.isNew==true)?const SizedBox(): InkWell(onTap: (){
                    NavigatorHandler.push(ReservationDetails(id: widget.model?.id.toString()??'',));
                  },
                      child: CustomText(title: AppTranslate.details.tr(),fontColor: AppColors.darkColor,fontSize: AppFonts.font_11,fontWeight: FontWeight.bold,)),

                ],
              ),
              (widget.isNew==true)?const SizedBox():  SizedBox(height: 10.h),

              (widget.isNew==false)?const SizedBox(): Align(alignment: Alignment.centerLeft,
                child: Row(crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomButton(onTap: (){
                      provider.updateReservationStatus(widget.model?.id.toString()??'','accepted');
                    },width: 60.w,height: 36.h,title: AppTranslate.accept.tr(),fontSize: AppFonts.font_12,fontWeight: FontWeight.w400),
                    SizedBox(width: 5.w),
                    CustomButton(onTap: (){
                      provider.updateReservationStatus(widget.model?.id.toString()??'','refused');
                    },width: 60.w,height: 36.h,bg: AppColors.white,borderColor: AppColors.primaryColor,
                      fontColor: AppColors.primaryColor,borderWidth: 3.w,
                      title: AppTranslate.refusal.tr(),fontSize: AppFonts.font_12,fontWeight: FontWeight.w400,)
                  ],),
              )

            ],),)),
    );
  }
}
