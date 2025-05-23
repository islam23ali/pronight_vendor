import 'dart:math' as math;

import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/font_size.dart';
import 'package:easy_localization/easy_localization.dart' as el;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/dimens/dimens.dart';
import '../../../core/navigator/navigator.dart';
import '../../../core/resources/app_assets.dart';
import '../../../core/utils/preferences.dart';
import '../custom_svg/CustomSvgIcon.dart';
import '../custom_text/custom_text.dart';

Preferences preferences = Preferences();

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final double? fontSize;
  final Color? fontColor;
  final bool? centerTitle;
  final FontWeight? fontWeight;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final bool isBackButtonExist;
  final VoidCallback? onBackPress;
  final Widget? leading;
  final Widget? buttonWidget;
  final double? elevation;
  final double? leadingWidth;
  final double? iconBackSize;
  final double? height;
  final Color? bgColor;
  final Color? statusBarColor;
  final IconData? iconBack;
  final Color? topColor;
  final Brightness? topColorIcons;
  final SystemUiOverlayStyle? systemUiOverlayStyle;
  final PreferredSizeWidget? bottom;

  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.leadingWidth,
    this.fontSize,
    this.fontColor,
    this.centerTitle,
    this.actions,
    this.bottom,
    this.elevation,
    this.bgColor,
    this.statusBarColor,
    this.systemUiOverlayStyle,
    this.titleWidget,
    this.isBackButtonExist = true,
    this.onBackPress,
    this.iconBack,
    this.iconBackSize,
    this.topColor,
    this.topColorIcons,
    this.height,
    this.buttonWidget,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          systemOverlayStyle: systemUiOverlayStyle ??
              SystemUiOverlayStyle(
                  statusBarColor:statusBarColor?? AppColors.white,
                  statusBarIconBrightness: topColorIcons ?? Brightness.dark),
          backgroundColor:bgColor?? AppColors.white,
          // surfaceTintColor: AppColors.white,
          // shadowColor: AppColors.white,
          elevation: .3,
          bottom: bottom,
          title: CustomText(
              title: title ?? '',
              fontSize: AppFonts.font_14,
              fontColor:fontColor?? AppColors.textColor2,
              fontWeight:fontWeight?? FontWeight.w400),
          centerTitle: false,
          leading: leading ??
              (isBackButtonExist ? InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  NavigatorHandler.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      right: context.locale.languageCode == 'ar'
                          ? Dimens.padding_16
                          : 0,
                      left: context.locale.languageCode == 'en'
                          ? Dimens.padding_16
                          : 0),
                  child: Transform.rotate(
                    angle: context.locale.languageCode == 'en' ? math.pi : 0,
                    // Rotate by 45 degrees (π/4 radians)
                    child: CustomSvgIcon(
                        assetName: AppAssets.back,
                        width: 25.w,
                        height: 25.h),
                  ),
                ),
              ):const SizedBox.shrink()),
          actions: actions,
          leadingWidth: leadingWidth ?? 46.w,
          automaticallyImplyLeading: true,
        ),
        buttonWidget==null?const SizedBox.shrink(): Container(
          height: height!-56,alignment: Alignment.center,
          child: buttonWidget,color: bgColor,)
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(Dimens.width, height ?? 56.h);
}
