import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/navigator/navigator.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/presentations/components/custom_app_bar/custom_app_bar.dart';
import 'package:pronight_vendor/presentations/components/custom_scaffold/custom_scaffold.dart';
import 'package:pronight_vendor/presentations/modules/home_page/screens/all_reports/report_detailes_screen/report_details_screen.dart';

import '../../../../../core/app_theme/app_colors.dart';
import '../../../../../core/dimens/dimens.dart';
import '../../../../../core/resources/app_assets.dart';
import '../../../../../core/resources/font_size.dart';
import '../../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../../components/custom_text/custom_text.dart';
import '../../../../components/inputs/custom_text_form.dart';

class AllReportsScreen extends StatefulWidget {
  const AllReportsScreen({super.key});

  @override
  State<AllReportsScreen> createState() => _AllReportsScreenState();
}

class _AllReportsScreenState extends State<AllReportsScreen> {
  TextEditingController controller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(height: 135.h,
        bgColor: AppColors.primaryColor,topColor: AppColors.primaryColor,statusBarColor: AppColors.primaryColor,
        title:AppTranslate.reports.tr(),fontColor: AppColors.white,fontWeight: FontWeight.bold,
        buttonWidget: Padding(
          padding: EdgeInsets.all(Dimens.padding_16),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 284.w,height: 36.h,
                    child: CustomTextFormField(controller: controller,underLineColor: Colors.transparent,
                      borderRaduis: 7.r,
                      padding:EdgeInsets.symmetric(horizontal: Dimens.padding_12h) ,
                      bgColor: Color(0xffEFF8F2),hint: 'بحث',hintFontColor: AppColors.primaryColor,)),
                CustomSvgIcon(assetName: AppAssets.buttonSearch,width: 52.5.w,height: 36.h)
              ],
            ),
        ),),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimens.padding_16h,vertical:  Dimens.padding_12v),
              child: AnimationLimiter(
                child: ListView.builder(
                    shrinkWrap: true,
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
                              InkWell(onTap: (){
                                NavigatorHandler.push(const ReportDetailsScreen());
                              },
                                child: Stack(
                                  children: [
                                    Container(height: 74.h,
                                      margin: EdgeInsets.symmetric(vertical: Dimens.padding_8),
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.3), // Shadow color
                                              offset: const Offset(0, 3), // Shadow comes from the bottom
                                              blurRadius: 6, // Blur radius
                                              spreadRadius: 0, // Spread radius
                                            ),
                                          ],
                                          borderRadius: BorderRadius.circular(10.r),color: AppColors.primaryColor),),
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
            ),
          ),
        ],
      ),);
  }
}
