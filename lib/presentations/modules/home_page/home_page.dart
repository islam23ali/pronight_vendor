import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/dimens/dimens.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/navigator/navigator.dart';
import 'package:pronight_vendor/core/resources/app_assets.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/core/resources/font_size.dart';
import 'package:pronight_vendor/presentations/components/custom_svg/CustomSvgIcon.dart';
import 'package:pronight_vendor/presentations/components/custom_text/custom_text.dart';
import 'package:pronight_vendor/presentations/modules/home_page/screens/all_reports/all_reports.dart';
import 'package:pronight_vendor/presentations/modules/home_page/screens/all_reports/report_detailes_screen/report_details_screen.dart';
import 'package:pronight_vendor/presentations/modules/home_page/widgets/custom_home_app_bar.dart';
import 'package:pronight_vendor/presentations/modules/home_page/widgets/custom_slider_home.dart';
import 'package:pronight_vendor/presentations/modules/home_page/widgets/home_reservation&billing.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(color: AppColors.bgHomeColor,
        padding: EdgeInsets.symmetric(
            vertical: Dimens.padding_16v, horizontal: Dimens.padding_16h),
        child: SingleChildScrollView(
          child: Column(
            children: [
             const CustomHomeAppBar(),
              SizedBox(height: 20.h),
              const CustomSliderHome(),
              SizedBox(height: 20.h),
              const HomeReservationAndBilling(),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      title: AppTranslate.reports.tr(),
                      fontSize: AppFonts.font_15,
                      fontWeight: FontWeight.bold),
                  InkWell(onTap: (){
                    NavigatorHandler.push(const AllReportsScreen());
                  },
                    child: CustomText(
                        title: AppTranslate.showMore.tr(), fontSize: AppFonts.font_12),
                  )
                ],
              ),
              SizedBox(height: 10.h),
              AnimationLimiter(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return AnimationConfiguration.staggeredGrid(
                          duration: const Duration(milliseconds: 900),
                          position: index,
                          columnCount: 1,
                          child:  ScaleAnimation(
                              duration: const Duration(milliseconds: 1000),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: FadeInAnimation(child:
                              InkWell(onTap: (){NavigatorHandler.push(const ReportDetailsScreen());},
                                child: Stack(
                                  children: [
                                    Container(height: 74.h,
                                      margin: EdgeInsets.symmetric(vertical: Dimens.padding_8),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r),color: AppColors.primaryColor),),
                                    Container(height: 75.h,
                                      padding: EdgeInsets.all(Dimens.padding_4),
                                      margin: EdgeInsets.only(top: Dimens.padding_8,bottom:Dimens.padding_8,right:Dimens.padding_4),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r),color: AppColors.white),
                                      child:Row(crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                        SizedBox(width: 35.w,height: 35.h,child: CustomSvgIcon(assetName: AppAssets.reportsIcon)),
                                        SizedBox(width: 10.w),
                                        SizedBox(width: 275.w,
                                          child: Column(mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                CustomText(title: 'فندق الأندلس مول',fontColor: AppColors.textColor4),
                                                Row(
                                                  children: [
                                                    CustomSvgIcon(assetName: AppAssets.address,width: 18.w,height: 18.h,color: AppColors.textColor,),
                                                    SizedBox(width: 5.w),
                                                    CustomText(title: 'الرياض',fontColor: AppColors.textColor,fontSize: AppFonts.font_10),
                                                  ],
                                                )
                                              ],),
                                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                Row(
                                                  children: [
                                                    CustomSvgIcon(assetName: AppAssets.bed,width: 18.w,height: 18.h,color: AppColors.textColor,),
                                                    SizedBox(width: 5.w),
                                                    CustomText(title: '20 غرفة',fontColor: AppColors.textColor,fontSize: AppFonts.font_10),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    CustomSvgIcon(assetName: AppAssets.room,width: 18.w,height: 18.h,color: AppColors.textColor,),
                                                    SizedBox(width: 5.w),
                                                    CustomText(title: '10 غرف متاحة',fontColor: AppColors.textColor,fontSize: AppFonts.font_10),
                                                  ],
                                                )
                                              ],)
                                            ],
                                          ),
                                        )
                                      ],) ,),
                                  ],
                                ),
                              )
                              )));
                    }),
              ),
            ],
          ),
        ),
    );
  }
}
