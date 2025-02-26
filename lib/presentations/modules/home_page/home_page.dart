
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/dimens/dimens.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/app_assets.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/core/resources/font_size.dart';
import 'package:pronight_vendor/presentations/components/custom_svg/CustomSvgIcon.dart';
import 'package:pronight_vendor/presentations/components/custom_text/custom_text.dart';
import 'package:pronight_vendor/presentations/modules/home_page/widgets/custom_slider_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Dimens.padding_16v,horizontal: Dimens.padding_16h),
      child:Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: Dimens.padding_8h),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Row(children: [
              CustomPngIcon(assetName: AppAssets.pronightLogo,width: 35.w,height: 35.w,),
              SizedBox(width: 5.w),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                CustomText(title: AppTranslate.heyYou.tr(),fontSize: AppFonts.font_8,fontColor: AppColors.textColor,fontWeight: FontWeight.bold),
                  SizedBox(height: 5.w),
                  CustomText(title: 'تطبيقك المميز برونايت',fontSize: AppFonts.font_10,fontColor: AppColors.textColor2,fontWeight: FontWeight.bold,)
              ],)
            ]),
              // CustomSvgIcon(assetName: AppAssets.notificationIcon,width: 35.w,height: 35.w)
              CustomPngIcon(assetName: AppAssets.notIcon,width: 35.w,height: 35.w)
          ],),
        ),
        SizedBox(height: 20.h),
        const CustomSliderHome(),
        SizedBox(height: 20.h),
        Row(children: [
          Card()
        ],)
      ],),);
  }
}
