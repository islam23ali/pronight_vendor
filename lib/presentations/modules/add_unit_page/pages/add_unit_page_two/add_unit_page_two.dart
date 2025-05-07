import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/data/models/response/cities_model.dart';
import 'package:pronight_vendor/presentations/components/loadings/custom_scaffold_messanger.dart';
import 'package:pronight_vendor/presentations/modules/add_unit_page/pages/add_unit_page_two/widgets/custom_map_pageTwo.dart';
import 'package:pronight_vendor/presentations/modules/add_unit_page/pages/add_unit_page_two/widgets/custom_map_widget.dart';
import 'package:pronight_vendor/presentations/modules/add_unit_page/pages/add_unit_page_two/widgets/up_load_main_image.dart';
import 'package:pronight_vendor/presentations/modules/add_unit_page/pages/add_unit_page_two/widgets/up_load_sub_image.dart';
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
                              title: AppTranslate.unitTitle.tr(),
                              fontSize: AppFonts.font_12,
                            ),
                            CustomText(
                              title: AppTranslate.basicDataAboutAddress.tr(),
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
                            title: AppTranslate.theCity.tr(),
                            fontSize: AppFonts.font_12,
                            fontColor: AppColors.primaryColor),
                        Column(
                          children: [
                            CustomCityDropdownButton(
                              color: AppColors.darkColor,
                              items: data.citiesModel?.data ?? [],
                              value: data.selectedCity,
                              onChanged: (OneCity? newValue) {
                                setState(() {
                                  data.selectedCity = newValue;
                                });
                              }),
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
                    const CustomMapPageTwo(),
                    SizedBox(height: 20.h),
                    const UpLoadMainImage(),
                    SizedBox(height: 20.h),
                    const UpLoadSubImages(),
                    SizedBox(height: 40.h),

                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(width: 150.w,
                          borderColor: AppColors.primaryColor,
                          bg: AppColors.white,fontColor: AppColors.primaryColor,
                          onTap: () {
                            setState(() {
                              data.currentPage = 1;
                            });
                            data.pageController.previousPage(
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeInOut);
                          },
                          title: AppTranslate.previous.tr(),
                        ),
                        CustomButton(width: 150.w,
                          onTap: () {
                          if(data.selectedCity==null){
                            CustomScaffoldMessanger.showToast(title: AppTranslate.selectCity.tr());
                          }else if(data.latitude==''){
                            CustomScaffoldMessanger.showToast(title: AppTranslate.selectAddress.tr());
                          }else if(data.image==''||data.image==null){
                            CustomScaffoldMessanger.showToast(title: AppTranslate.selectImage.tr());
                          }else{
                              data.currentPage = 2;
                              data.refreshData();
                            data.pageController.animateToPage(data.currentPage,
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeInOut);
                          }
                          },
                          title: AppTranslate.next.tr(),
                        ),
                      ],
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
