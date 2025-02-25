import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/app_assets.dart';
import 'package:pronight_vendor/presentations/components/custom_svg/CustomSvgIcon.dart';
import 'package:flutter/material.dart';
import '../../../core/dimens/dimens.dart';
import '../../../core/resources/font_size.dart';
import '../custom_text/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final Widget? titleWidget;
  final double? fontSize;
  final Color? fontColor;
  final FontWeight? fontWeight;

  final Color? bg;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final double? radius;
  final double? elevation;
  final double? iconHeight;
  final double? iconWidth;
  final String? icon;
  final Color? iconColor;
  final Color? borderColor;

  const CustomButton(
      {super.key,
        this.title,
      this.fontSize,
      this.fontWeight,
      this.fontColor,
      this.bg,
      required this.onTap,
      this.width,
      this.radius, this.height, this.elevation, this.icon, this.iconColor, this.iconHeight, this.iconWidth,this.borderColor, this.titleWidget

      });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width ?? Dimens.width,
        height: height??48.h,
        child: Card(
          margin: EdgeInsets.zero,
          surfaceTintColor: Colors.transparent,
          elevation: elevation??0,
          color: bg??AppColors.primaryColor,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                color:borderColor??bg??AppColors.primaryColor,
              ),
              borderRadius: BorderRadius.circular(radius??12.r)),
          child: Center(
            child:(title==null&&icon!='')?  CustomSvgIcon(assetName: icon??'',color:iconColor ,width:iconWidth?? 20.w,height: iconHeight??20.h,) :
            Row(crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (icon==null||icon=='')?const SizedBox(): CustomSvgIcon(assetName: icon??'',color:iconColor ,width:iconWidth?? 20.w,height: iconHeight??20.h,),
                (icon==null||icon=='')?const SizedBox(): SizedBox(width: 5.w),
              titleWidget?? CustomText(
                  title: title??'',
                  fontSize: fontSize??AppFonts.font_13,
                  fontColor: fontColor??AppColors.white,
                  fontWeight: fontWeight??FontWeight.bold,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
