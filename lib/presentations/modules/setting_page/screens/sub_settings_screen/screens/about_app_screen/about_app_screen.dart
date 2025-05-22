import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/dimens/dimens.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/presentations/components/custom_scaffold/custom_scaffold.dart';
import 'package:pronight_vendor/presentations/components/custom_text/custom_text.dart';
import 'package:pronight_vendor/presentations/modules/setting_page/setting_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/resources/app_assets.dart';
import '../../../../../../../core/resources/app_translate.dart';
import '../../../../../../../core/resources/font_size.dart';
import '../../../../../../components/custom_app_bar/custom_app_bar.dart';
import '../../../../../../components/custom_svg/CustomSvgIcon.dart';

class AboutAppScreen extends StatefulWidget {
  const AboutAppScreen({super.key});

  @override
  State<AboutAppScreen> createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(appBar: CustomAppBar(
      title: AppTranslate.aboutApp.tr(),
      height: 64.h,
      fontSize: AppFonts.font_14,
      fontWeight: FontWeight.bold,
    ),body: Consumer<SettingsViewModel>(
      builder: (context,data,_) {
        return Column(crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Center(child: CustomPngIcon(assetName: AppAssets.aboutUsLogo,width: 268.w,height: 185.h,)),
            SizedBox(height: 20.h),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: Dimens.padding_16h,vertical: Dimens.padding_24v),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(45.r),border: Border.all(width: 1.w,color: Color(0xffE8E6E6)),color: Color(0xffE8E6E6).withAlpha((0.20*255).round())),
                  child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(title: AppTranslate.aboutApp.tr(),fontSize: AppFonts.font_12,fontWeight: FontWeight.w500,),
                          Icon(Icons.expand_more_rounded,size: 35.r)
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Html(
                        data: '<div style="margin: 0; padding: 0;">${data.settingsModel?.data?.aboutApp?? ''}</div>',
                        style: {
                          "div": Style(
                            // margin: Margins.zero,
                            // padding: HtmlPaddings.zero,
                            color: AppColors.textColor,
                            fontWeight: FontWeight.normal,
                            fontSize: FontSize(8.sp),
                            fontFamily: 'font_regular',
                          ),
                          // "body": Style(
                          //   margin: Margins.zero, // Remove body margin
                          //   padding: HtmlPaddings.zero, // Remove body padding
                          // ),
                          "*": Style(
                            margin: Margins.zero,
                            padding: HtmlPaddings.zero,
                            lineHeight: LineHeight(1.5), // Set line height to 1
                          ),
                          // "strong": Style(
                          //   fontWeight: FontWeight.bold,
                          //   color: AppColors.textColor,
                          // ),
                          // "em": Style(
                          //   fontStyle: FontStyle.italic,
                          //   color: AppColors.textColor,
                          // ),
                          // "a": Style(
                          //   color: AppColors.textColor,
                          //   textDecoration: TextDecoration.underline,
                          // ),
                          // "span": Style(
                          //   color: AppColors.textColor,
                          // ),
                        },
                      ),
                      // CustomText(title:  data.settingsModel?.data?.aboutApp??'',
                      //   fontColor: AppColors.textGrayColor,fontSize: AppFonts.font_10,)
                    ],) ,),
              ),
            )

          ],);
      }
    ),);
  }
}
