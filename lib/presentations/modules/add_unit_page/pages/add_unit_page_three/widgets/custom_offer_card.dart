import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/presentations/modules/add_unit_page/add_unit_view_model.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../core/resources/app_assets.dart';
import '../../../../../../core/resources/app_translate.dart';
import '../../../../../../core/resources/font_size.dart';
import '../../../../../components/alerts/custom_select_date.dart';
import '../../../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../../../components/custom_text/custom_text.dart';
import '../../../../../components/inputs/custom_text_form.dart';
import '../../../widget/custom_offer_type_dropdown.dart';

class CustomOfferCard extends StatefulWidget {
  const CustomOfferCard({super.key});

  @override
  State<CustomOfferCard> createState() => _CustomOfferCardState();
}

class _CustomOfferCardState extends State<CustomOfferCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AddUnitViewModel>(
      builder: (context,data,_) {
        return Column(crossAxisAlignment: CrossAxisAlignment.center,children: [
          SizedBox(height: 20.h),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(title: AppTranslate.showStartDate.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
              CustomTextFormField(controller: data.exitDateController,readOnly: true,
                onTap: (){
                  showDialog<String>(
                      context: context,
                      builder: (BuildContext context) =>
                          CustomSelectDate(onDateSelected: (String value) {data.exitDateController.text=value;},));
                },
                height: 60.h,textInputType: TextInputType.number,
                suffix: CustomSvgIcon(assetName: AppAssets.date,color: Colors.black.withAlpha((0.50*244).round()),),
                prefix: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w),
              )
            ],
          ),
          SizedBox(height: 20.h),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(title: AppTranslate.offerExpirationDate.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
              CustomTextFormField(controller: data.exitDateController,readOnly: true,
                onTap: (){
                  showDialog<String>(
                      context: context,
                      builder: (BuildContext context) =>
                          CustomSelectDate(onDateSelected: (String value) {data.exitDateController.text=value;},));
                },
                height: 60.h,textInputType: TextInputType.number,
                suffix: CustomSvgIcon(assetName: AppAssets.date,color: Colors.black.withAlpha((0.50*244).round()),),
                prefix: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w),
              )
            ],
          ),
          SizedBox(height: 20.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                  title: AppTranslate.displayType.tr(),
                  fontSize: AppFonts.font_12,
                  fontColor: AppColors.primaryColor),
              Column(
                children: [
                  CustomOfferTypeDropdownButton(
                    color: AppColors.darkColor,
                    items: data.cityList ?? [],
                    value: data.value,
                    onChanged: (String? newValue) {
                      setState(() {
                        data.value = newValue;
                      });
                    },
                  ),
                  Container(
                    height: 2.h,
                    width: 300,
                    color: Colors.grey.shade400,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(title: AppTranslate.offerValue.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
              CustomTextFormField(controller: data.arrivalDateController,
                height: 60.h,textInputType: TextInputType.number,
                // inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))],
                prefix: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w),
              )
            ],
          ),

        ]);
      }
    );
  }
}
