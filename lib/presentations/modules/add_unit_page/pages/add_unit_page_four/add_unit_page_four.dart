import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/navigator/navigator.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:provider/provider.dart';
import '../../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../../core/dimens/dimens.dart';
import '../../../../../../../core/resources/app_assets.dart';
import '../../../../../../../core/resources/font_size.dart';
import '../../../../components/custom_button/custom_button.dart';
import '../../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../../components/custom_switch/custom_switch.dart';
import '../../../../components/custom_text/custom_text.dart';
import '../../../../components/inputs/custom_text_form.dart';
import '../../add_unit_view_model.dart';
import '../../confirm_additional_screen/confirm_additional_screen.dart';
import '../../widget/custom_contant_dropdown.dart';

class AddUnitPageFour extends StatefulWidget {
  const AddUnitPageFour({super.key});

  @override
  State<AddUnitPageFour> createState() => _AddUnitPageFourState();
}

class _AddUnitPageFourState extends State<AddUnitPageFour> {
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
                Column(
                  children: [
                    Container(
                        // height: 31.h,
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
                                width: 18.w,
                                height: 18.h),
                            SizedBox(width: 16.w),
                            CustomText(
                              title: AppTranslate.unitContents.tr(),
                              fontSize: AppFonts.font_12,
                            ),
                          ],
                        )),
                      Padding(
                      padding: EdgeInsets.all(12.r),
                      child: Column(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                                title: AppTranslate.selectContent.tr(),
                                fontSize: AppFonts.font_12,
                                fontColor: AppColors.primaryColor),
                            Column(
                              children: [
                                CustomContentDropdownButton(
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
                            CustomText(title: AppTranslate.value.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                            CustomTextFormField(controller: data.facilitiesPhoneNumberController,
                              height: 60.h,textInputType: TextInputType.number,
                              prefix: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w),
                            )
                          ],
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            Row(
                              children: [
                                CustomSvgIcon(assetName: AppAssets.addVisitor,width: 30.w,height: 30.w,),
                                SizedBox(width: 5.w),
                                CustomSvgIcon(assetName: AppAssets.deleteVisitor,width: 30.w,height: 30.w,),
                              ],
                            ),
                          ],
                        ),


                      ],),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                        // height: 31.h,
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
                                width: 18.w,
                                height: 18.h),
                            SizedBox(width: 16.w),
                            CustomText(
                              title: AppTranslate.unitFacilities.tr(),
                              fontSize: AppFonts.font_12,
                            ),
                          ],
                        )),
                      Padding(
                      padding: EdgeInsets.all(12.r),
                      child: Column(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                                title: AppTranslate.selectAttachment.tr(),
                                fontSize: AppFonts.font_12,
                                fontColor: AppColors.primaryColor),
                            Column(
                              children: [
                                CustomContentDropdownButton(
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
                            CustomText(title: AppTranslate.additionalDescriptionAttachmentArabic.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                            CustomTextFormField(controller: data.arrivalDateController,
                              height: 60.h,textInputType: TextInputType.name,
                              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[\u0600-\u06FF\s]'))],
                              prefix: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w),
                            )
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(title: AppTranslate.additionalDescriptionAttachmentEnglish.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                            CustomTextFormField(controller: data.arrivalDateController,
                              height: 60.h,textInputType: TextInputType.name,
                              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))],
                              prefix: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w),
                            )
                          ],
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            Row(
                              children: [
                                CustomSvgIcon(assetName: AppAssets.addVisitor,width: 30.w,height: 30.w,),
                                SizedBox(width: 5.w),
                                CustomSvgIcon(assetName: AppAssets.deleteVisitor,width: 30.w,height: 30.w,),
                              ],
                            ),
                          ],
                        ),


                      ],),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                        // height: 31.h,
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
                                width: 18.w,
                                height: 18.h),
                            SizedBox(width: 16.w),
                            CustomText(
                              title: AppTranslate.additionalServices.tr(),
                              fontSize: AppFonts.font_12,
                            ),
                          ],
                        )),
                      Padding(
                      padding: EdgeInsets.all(12.r),
                      child: Column(children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(title: AppTranslate.addressArabic.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                            CustomTextFormField(controller: data.arrivalDateController,
                              height: 60.h,textInputType: TextInputType.name,
                              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[\u0600-\u06FF\s]'))],
                              prefix: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w),
                            )
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(title: AppTranslate.addressEnglish.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                            CustomTextFormField(controller: data.arrivalDateController,
                              height: 60.h,textInputType: TextInputType.name,
                              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))],
                              prefix: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w),
                            )
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(title:AppTranslate.thePrice.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
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
                        SizedBox(height: 20.h),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            Row(
                              children: [
                                CustomSvgIcon(assetName: AppAssets.addVisitor,width: 30.w,height: 30.w,),
                                SizedBox(width: 5.w),
                                CustomSvgIcon(assetName: AppAssets.deleteVisitor,width: 30.w,height: 30.w,),
                              ],
                            ),
                          ],
                        ),


                      ],),
                    )
                  ],
                ),


                SizedBox(height: 40.h),
                CustomButton(
                  onTap: () {
                   NavigatorHandler.push(const ConfirmAdditionalScreen());
                  },
                  title:AppTranslate.addition.tr(),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
