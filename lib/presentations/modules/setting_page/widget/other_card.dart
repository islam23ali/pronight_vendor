import 'package:easy_localization/easy_localization.dart';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/dimens/dimens.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/core/resources/font_size.dart';
import 'package:pronight_vendor/presentations/components/custom_svg/CustomSvgIcon.dart';
import 'package:pronight_vendor/presentations/components/custom_text/custom_text.dart';
import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/resources/app_assets.dart';
class OtherCard extends StatefulWidget {
  const  OtherCard({Key? key}) : super(key: key);

  @override
  _OtherCardState createState() => _OtherCardState();
}

class _OtherCardState extends State<OtherCard> {
  @override
  Widget build(BuildContext context) {
    return Material(elevation: 10,shadowColor: AppColors.white.withAlpha((0.90*255).round()),
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
          decoration: BoxDecoration(color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.padding_12h,vertical: Dimens.padding_16v ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(title: AppTranslate.other.tr(),fontSize: AppFonts.font_12,),
                _buildItem(context,
                    image: AppAssets.messages,
                    isRow:true,
                    title: AppTranslate.messages.tr(),
                    onTap: () {
                      // push(const Register(isRegister:false));
                    }),
                _buildItem(context,
                  isRow:true,
                  image: AppAssets.setting,
                  title: tr(AppTranslate.settings),
                  onTap: () {
                    // push(const WalletScreen());
                  },
                ),

              ],),
          )),
    );
  }
}
_buildItem(BuildContext context,
    {required String image,
      required String title,
      Color? titleColor,
      bool? isRow,
      String? subTitle,
      GestureTapCallback? onTap}) {
  return ListTile(

    onTap: onTap,
    minVerticalPadding: 0,
    contentPadding: const EdgeInsets.all(0),
    trailing:(isRow==true)? Icon(
      Icons.arrow_forward_ios,
      size: 16.r,
      color:  AppColors.blackColor,
    ):const SizedBox(),
    title: Transform(transform: Matrix4.translationValues(15, 0.0, 0.0),
      child:CustomText(title: title,fontColor: AppColors.textGrayColor,fontSize: AppFonts.font_11,),
    ),dense: true,
    leading: SizedBox(width: 40.w,
      height: 40.h,
      child: Center(
        child: CustomSvgIcon(assetName:
        image,
          width: 20.w,
          height: 20.h,
        ),
      ),
    ),
  );
}