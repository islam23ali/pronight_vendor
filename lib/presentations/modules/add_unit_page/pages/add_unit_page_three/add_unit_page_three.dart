import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/presentations/modules/add_unit_page/pages/add_unit_page_three/widgets/custom_offer_card.dart';
import 'package:provider/provider.dart';
import '../../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../../core/dimens/dimens.dart';
import '../../../../../../../core/resources/app_assets.dart';
import '../../../../../../../core/resources/app_translate.dart';
import '../../../../../../../core/resources/font_size.dart';
import '../../../../components/custom_button/custom_button.dart';
import '../../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../../components/custom_switch/custom_switch.dart';
import '../../../../components/custom_text/custom_text.dart';
import '../../../../components/inputs/custom_text_form.dart';
import '../../add_unit_view_model.dart';

class AddUnitPageThree extends StatefulWidget {
  const AddUnitPageThree({super.key});

  @override
  State<AddUnitPageThree> createState() => _AddUnitPageThreeState();
}

class _AddUnitPageThreeState extends State<AddUnitPageThree> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimens.padding_16),
      child: Consumer<AddUnitViewModel>(builder: (context, data, _) {
        return Container(
          padding: EdgeInsets.symmetric(
              horizontal: Dimens.padding_12h, vertical: Dimens.padding_16v),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: AppColors.white),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    height: 59.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimens.padding_8),
                        color: const Color(0xffF0FAFF),
                        border: Border.all(
                            width: 1.w, color: const Color(0xffFFF9DC))),
                    padding: EdgeInsets.symmetric(
                        vertical: Dimens.padding_12v,
                        horizontal: Dimens.padding_24h),
                    child: Row(
                      children: [
                        CustomSvgIcon(
                            assetName: AppAssets.reportDetails,
                            width: 24.w,
                            height: 24.h),
                        SizedBox(width: 16.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              title: AppTranslate.unitInformation.tr(),
                              fontSize: AppFonts.font_12,
                            ),
                            CustomText(
                              title: AppTranslate.basicDataAboutUnit.tr(),
                              fontSize: AppFonts.font_10,
                              fontColor: Colors.grey,
                            )
                          ],
                        )
                      ],
                    )),
                Column(
                  children: [
                    SizedBox(height: 20.h),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(title: AppTranslate.maximumNumberOfAdults.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                        CustomTextFormField(controller: data.arrivalDateController,
                          height: 60.h,textInputType: TextInputType.number,
                          // inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))],
                          prefix: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w),
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(title: AppTranslate.pricePerAdult.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                        CustomTextFormField(controller: data.arrivalDateController,
                          height: 60.h,textInputType: TextInputType.number,
                          // inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))],
                          prefix: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w),
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(title: AppTranslate.maximumNumberOfChildren.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                        CustomTextFormField(controller: data.arrivalDateController,
                          height: 60.h,textInputType: TextInputType.number,
                          // inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))],
                          prefix: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w),
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(title: AppTranslate.pricePerChild.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                        CustomTextFormField(controller: data.arrivalDateController,
                          height: 60.h,textInputType: TextInputType.number,
                          // inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))],
                          prefix: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w),
                        )
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(title: AppTranslate.thereIsOffer.tr(),fontSize:AppFonts.font_15,fontColor: AppColors.primaryColor),
                          CustomSwitch(value: data.isSwitchOffer,
                              activeColor: AppColors.primaryColor,
                              inactiveColor: AppColors.gray,
                              onChanged: (_){
                                setState(() {
                                  data.isSwitchOffer=!data.isSwitchOffer;
                                });
                              })
                        ]),
                    data.isSwitchOffer?const CustomOfferCard():const SizedBox(),
                    SizedBox(height: 40.h),
                    CustomButton(
                      onTap: () {
                        setState(() {
                          data.currentPage = 3;
                        });
                        // _pageController.animateToPage(
                        //   1,
                        //   duration: const Duration(milliseconds: 300),
                        //   curve: Curves.easeInOut,
                        // );
                        data.pageController.animateToPage(data.currentPage,
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut);
                      },
                      title: AppTranslate.next.tr(),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
