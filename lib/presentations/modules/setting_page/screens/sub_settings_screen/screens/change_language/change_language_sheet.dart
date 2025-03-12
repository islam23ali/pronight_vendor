
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:provider/provider.dart';
import '../../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../../core/dimens/dimens.dart';
import '../../../../../../components/custom_text/custom_text.dart';
import 'language_view_model.dart';


class LangSheet extends StatefulWidget {
  const LangSheet({super.key});

  @override
  State<LangSheet> createState() => _EditCatBottomSheetState();
}

class _EditCatBottomSheetState extends State<LangSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Dimens.padding_20v, right: Dimens.padding_16h, left: Dimens.padding_16h,bottom:Dimens.padding_32v),
      child: Consumer<LanguageViewModel>(
          builder: (context, data, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Container(
                    width: 40.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      color: AppColors.gray.withAlpha((0.40 * 255).round()),
                    ),
                  ),
                ),
                SizedBox(height:  Dimens.padding_16v),
                Center(child: CustomText(title: AppTranslate.theLanguage.tr(),fontWeight: FontWeight.bold,textAlign: TextAlign.center)),
                SizedBox(height:  Dimens.padding_8v),
                Divider(thickness: 1.w),
                SizedBox(height:  Dimens.padding_16v),
                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      data.changeLocale(context,"ar");
                    },
                    child: Container(
                      width: 153.w,height: 50.h,
                      padding:  EdgeInsets.symmetric(vertical: Dimens.padding_12v,horizontal: Dimens.padding_12h),
                      decoration: BoxDecoration(
                        color:data.locale.languageCode=="ar"? AppColors.primaryColor:AppColors.gray.withAlpha((0.20*255).round()),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Center(
                        child: CustomText(
                          title:  'عربي',fontWeight: FontWeight.bold,
                          fontColor: data.locale.languageCode=="ar"?AppColors.white:AppColors.primaryColor,
                        ),
                      ),

                    ),
                  ),
                  SizedBox(height:  Dimens.padding_8v),
                  InkWell(
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      data.changeLocale(context,"en");
                    },
                    child: Container(
                      width: 153.w,height: 50.h,
                      padding:  EdgeInsets.symmetric(vertical: Dimens.padding_12v,horizontal: Dimens.padding_12h),
                      decoration: BoxDecoration(
                        color:data.locale.languageCode=="ar"?AppColors.gray.withAlpha((0.20*255).round()):AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Center(
                        child: CustomText(
                          title:  'English',fontWeight: FontWeight.bold,
                          fontColor: data.locale.languageCode=="en"?AppColors.white:AppColors.primaryColor,// fication count

                        ),
                      ),

                    ),
                  ),
                ],)
              ],
            );
          }
      ),
    );
  }
}