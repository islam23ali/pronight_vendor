import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/data/models/response/all_units_model.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/resources/app_assets.dart';
import '../../../../core/resources/app_translate.dart';
import '../../../../core/resources/font_size.dart';
import '../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../components/custom_text/custom_text.dart';
import '../../../components/images/network_image.dart';
import '../../../components/rate_bar/raitingBar.dart';

class CustomUnitCard extends StatefulWidget {
  const CustomUnitCard({super.key, required this.model});
  final OneUnit? model;

  @override
  State<CustomUnitCard> createState() => _CustomUnitCardState();
}

class _CustomUnitCardState extends State<CustomUnitCard> {
  @override
  Widget build(BuildContext context) {
    return Card(color: AppColors.white,surfaceTintColor: AppColors.white,elevation: 4,
      child:Padding(
        padding:  EdgeInsets.all(8.0.r),
        child: Row(mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppNetworkImage(imageUrl: widget.model?.image??'',width: 67.87.w,height: 69.w,borderRadius: 10.r,errorImage: AppAssets.bgItemDetails,fit: BoxFit.cover,),
            SizedBox(width: 245.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(title: widget.model?.title??'',fontSize: AppFonts.font_11,fontWeight: FontWeight.w500,),
                      CustomText(title: AppTranslate.more.tr(),fontSize: AppFonts.font_9,fontWeight: FontWeight.bold,fontColor: const Color(0xff1C472E),),
                    ],
                  ),
                  Html(
                    data: '<div style="margin: 0; padding: 0;">${widget.model?.desc ?? ''}</div>',
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
                  // CustomText(title: widget.model?.desc??'',fontSize: AppFonts.font_8,fontColor: AppColors.textColor,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        CustomSvgIcon(assetName: AppAssets.address,width: 14.w,height: 14.h,color: AppColors.primaryColor,),
                        SizedBox(width: 5.w),
                        CustomText(title: widget.model?.city?.title??'',fontSize: AppFonts.font_9,fontColor: AppColors.textColor2,),
                      ]),
                      RateWidget(itemSize: 12.r,initialRating: widget.model?.rate,)
                    ],
                  )
                ],),
            )
          ],),
      ) ,);
  }
}
