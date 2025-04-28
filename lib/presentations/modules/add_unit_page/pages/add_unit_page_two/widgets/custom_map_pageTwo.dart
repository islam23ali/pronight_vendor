import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import '../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../core/dimens/dimens.dart';
import '../../../../../../core/resources/app_assets.dart';
import '../../../../../../core/resources/app_translate.dart';
import '../../../../../../core/resources/font_size.dart';
import '../../../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../../../components/custom_text/custom_text.dart';
import '../../../../../components/inputs/custom_text_form.dart';
import 'custom_map_widget.dart';

class CustomMapPageTwo extends StatefulWidget {
  const CustomMapPageTwo({super.key});

  @override
  State<CustomMapPageTwo> createState() => _CustomMapPageTwoState();
}

class _CustomMapPageTwoState extends State<CustomMapPageTwo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
            title: AppTranslate.detailedAddress.tr(),
            fontSize: AppFonts.font_12,
            fontColor: AppColors.primaryColor),
        SizedBox(height: 20.h),
        ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Container(
              height: 220.h,
              width: 319.w,
              color: AppColors.secondColor,
              child:  MapLocation(),
            ))
      ],
    );
  }
}
