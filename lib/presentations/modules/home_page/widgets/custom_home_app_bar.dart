import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/navigator/navigator.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/dimens/dimens.dart';
import '../../../../core/resources/app_assets.dart';
import '../../../../core/resources/app_translate.dart';
import '../../../../core/resources/font_size.dart';
import '../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../components/custom_text/custom_text.dart';
import '../../notification_screen/notification_screen.dart';

class CustomHomeAppBar extends StatefulWidget {
  const CustomHomeAppBar({super.key});

  @override
  State<CustomHomeAppBar> createState() => _CustomHomeAppBarState();
}

class _CustomHomeAppBarState extends State<CustomHomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimens.padding_8h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            CustomPngIcon(
              assetName: AppAssets.pronightLogo,
              width: 35.w,
              height: 35.w,
            ),
            SizedBox(width: 5.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                    title: AppTranslate.heyYou.tr(),
                    fontSize: AppFonts.font_8,
                    fontColor: AppColors.textColor,
                    fontWeight: FontWeight.bold),
                SizedBox(height: 5.w),
                CustomText(
                  title: AppTranslate.yourUniqueApplicationPronight.tr(),
                  fontSize: AppFonts.font_10,
                  fontColor: AppColors.textColor2,
                  fontWeight: FontWeight.bold,
                )
              ],
            )
          ]),
          // CustomSvgIcon(assetName: AppAssets.notificationIcon,width: 35.w,height: 35.w)
          InkWell(onTap: (){
            NavigatorHandler.push(const NotificationScreen());
          },
            child: CustomPngIcon(
                assetName: AppAssets.notIcon, width: 35.w, height: 35.w),
          )
        ],
      ),
    );
  }
}
