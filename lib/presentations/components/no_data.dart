import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/dimens/dimens.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/presentations/components/custom_svg/CustomSvgIcon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/app_assets.dart';
import '../../core/app_theme/text_styles.dart';



class NoDataScreen extends StatelessWidget {
  final String?  title;
  final String? desc;
  final String image;
  const NoDataScreen({Key? key, this.title ,  this.desc ,  this.image = AppAssets.gifEmptyList}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:  EdgeInsets.all(Dimens.padding_16),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          // SVGIcon(Assets.noData,height: 303.h,width: MediaQuery.of(context).size.width,),
          CustomSvgIcon(assetName:AppAssets.back,height: 170.h,width: MediaQuery.of(context).size.width,),

          Text(
            title??'No Result Found'.tr(),
            style: AppTextStyles().normalText().textColorNormal(AppColors.primaryColor),
            textAlign: TextAlign.center,
          ),
           SizedBox(height:Dimens.padding_16v),


          Text(
            desc??'',
            style: AppTextStyles().normalText(),
            textAlign: TextAlign.center,
          ),
           SizedBox(height:Dimens.padding_16v),

        ]),
      ),
    );
  }
}
