import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:provider/provider.dart';
import '../../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../../core/dimens/dimens.dart';
import '../../../../../../../core/resources/app_assets.dart';
import '../../../../../../../core/resources/app_translate.dart';
import '../../../../../../../core/resources/font_size.dart';
import '../../../../components/custom_button/custom_button.dart';
import '../../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../../components/custom_text/custom_text.dart';
import '../../../../components/inputs/custom_text_form.dart';
import '../../../contracts_page/contract_screens/add_contract/widget/custom_dropdown.dart';
import '../../add_unit_view_model.dart';
import '../../widget/custom_city_dropdown.dart';

class AddUnitPageTwo extends StatefulWidget {
  const AddUnitPageTwo({super.key});

  @override
  State<AddUnitPageTwo> createState() => _AddUnitPageTwoState();
}

class _AddUnitPageTwoState extends State<AddUnitPageTwo> {
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
                              title: 'عنوان الوحدة',
                              fontSize: AppFonts.font_12,
                            ),
                            CustomText(
                              title: 'البيانات الأساسية التي تخص العنوان ...',
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                            title: 'المدينة',
                            fontSize: AppFonts.font_12,
                            fontColor: AppColors.primaryColor),
                        Column(
                          children: [
                            CustomCityDropdownButton(
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                            title: AppTranslate.selectSector.tr(),
                            fontSize: AppFonts.font_12,
                            fontColor: AppColors.primaryColor),
                        SizedBox(height: 20.h),
                        Stack(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10.r),
                                child: Container(
                                  height: 220.h,
                                  width: 319.w,
                                  color: AppColors.secondColor,
                                )),
                            Positioned(
                                bottom: 20,
                                left: 0,
                                right: 0,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Dimens.padding_12h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Material(
                                        elevation: 3,
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        child: CustomTextFormField(
                                          controller: controller,
                                          bgColor: AppColors.white,
                                          width: 248.w,
                                          height: 35.h,
                                          underLineColor: Colors.transparent,
                                          borderRaduis: 8.r,
                                          suffix: CustomSvgIcon(
                                            assetName: AppAssets.searchIcon,
                                            width: 16.w,
                                            height: 16.h,
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: Dimens.padding_8h),
                                        ),
                                      ),
                                      Container(
                                        width: 35.w,
                                        height: 35.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                            color: AppColors.primaryColor),
                                        child: Center(
                                            child: CustomSvgIcon(
                                                assetName: AppAssets.doneIcon,
                                                width: 20.5.w,
                                                height: 16.5.h)),
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                            title: 'الصورة الأساسية',
                            fontSize: AppFonts.font_12,
                            fontColor: AppColors.primaryColor),
                        SizedBox(height: 20.h),
                        SizedBox(height: 110.h,
                          child: Column(mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            CustomSvgIcon(assetName: AppAssets.upload,width: 52.5.w,height: 41.55.h),
                            SizedBox(height: 20.h),
                            CustomText(
                                title: 'قم برفع الصورة الأساسية هنا',
                                fontSize: AppFonts.font_12,
                                fontColor: Color(0xffCCCCCC)),
                            SizedBox(height: 10.h),
                            Divider(thickness: 3.h,color:  Color(0xffCCCCCC),)
                          ],),),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                            title: 'الصورة الفرعية',
                            fontSize: AppFonts.font_12,
                            fontColor: AppColors.primaryColor),
                        SizedBox(height: 20.h),
                        SizedBox(height: 110.h,
                          child: Column(mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            CustomSvgIcon(assetName: AppAssets.upload,width: 52.5.w,height: 41.55.h),
                            SizedBox(height: 20.h),
                            CustomText(
                                title: 'يمكنك رفع اكتر من صورة هنا',
                                fontSize: AppFonts.font_12,
                                fontColor: Color(0xffCCCCCC)),
                            SizedBox(height: 10.h),
                            Divider(thickness: 3.h,color:  Color(0xffCCCCCC),)
                          ],),),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    CustomButton(
                      onTap: () {
                        setState(() {
                          data.currentPage = 2;
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
