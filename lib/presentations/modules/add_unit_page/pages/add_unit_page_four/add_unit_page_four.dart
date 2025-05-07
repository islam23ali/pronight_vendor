import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/navigator/navigator.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/data/models/response/contens_model.dart';
import 'package:pronight_vendor/data/models/response/sub_models/add_unit_content_model.dart';
import 'package:pronight_vendor/presentations/modules/add_unit_page/pages/add_unit_page_four/widget/additional_service.dart';
import 'package:pronight_vendor/presentations/modules/add_unit_page/pages/add_unit_page_four/widget/content_card.dart';
import 'package:pronight_vendor/presentations/modules/add_unit_page/pages/add_unit_page_four/widget/facilities_card.dart';
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
import '../../../../components/loadings/custom_scaffold_messanger.dart';
import '../../add_unit_view_model.dart';
import '../../confirm_additional_screen/confirm_additional_screen.dart';
import '../../widget/custom_contant_dropdown.dart';
import '../../widget/custom_facilities_dropdown.dart';

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
                const ContentCard(),
                const FacilitiesCard(),
                const AddAdditionalService(),
                SizedBox(height: 40.h),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(width: 150.w,
                      bg: AppColors.white,fontColor: AppColors.primaryColor,
                      borderColor: AppColors.primaryColor,
                      onTap: () {
                        setState(() {
                          data.currentPage = 3;
                        });
                        data.pageController.previousPage(
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut);
                      },
                      title:AppTranslate.previous.tr(),
                    ),
                    CustomButton(width: 150.w,
                      onTap: () {
                      if(data.contentList.first.oneContent.id==-1){
                        CustomScaffoldMessanger.showToast(title: AppTranslate.pleaseSelectContent.tr());
                      }else if(data.contentList.first.theValue.text.isEmpty){
                        CustomScaffoldMessanger.showToast(title: AppTranslate.enterValue.tr());
                      }else if(data.facilitiesList.first.selectedFacilities?.id==-1){
                        CustomScaffoldMessanger.showToast(title: AppTranslate.pleaseSelectFacility.tr());
                      }else if(data.facilitiesList.first.textArController.text.isEmpty){
                        CustomScaffoldMessanger.showToast(title:AppTranslate.pleaseSelectFacilityDesAr.tr());
                      }else if(data.facilitiesList.first.textEnController.text.isEmpty){
                        CustomScaffoldMessanger.showToast(title: AppTranslate.pleaseSelectFacilityDesEn.tr());
                      }else if(data.additionalServiceList.first.titleArController.text.isEmpty){
                        CustomScaffoldMessanger.showToast(title: AppTranslate.pleaseEnterOfferTitleAr.tr());
                      }else if(data.additionalServiceList.first.titleEnController.text.isEmpty){
                        CustomScaffoldMessanger.showToast(title: AppTranslate.pleaseEnterOfferTitleEn.tr());
                      }else if(data.additionalServiceList.first.priceController.text=='0.0'){
                        CustomScaffoldMessanger.showToast(title: AppTranslate.pleaseEnterPrice.tr());
                      }else{data.addUnit();}
                      },
                      title:AppTranslate.addition.tr(),
                    ),
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
