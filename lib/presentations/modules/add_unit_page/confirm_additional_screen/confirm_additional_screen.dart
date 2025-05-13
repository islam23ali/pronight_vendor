import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/presentations/components/custom_app_bar/custom_app_bar.dart';
import 'package:pronight_vendor/presentations/components/custom_button/custom_button.dart';
import 'package:pronight_vendor/presentations/components/custom_scaffold/custom_scaffold.dart';
import 'package:pronight_vendor/presentations/modules/add_unit_page/confirm_additional_screen/widget/custom_commercial_register_image.dart';
import 'package:pronight_vendor/presentations/modules/add_unit_page/confirm_additional_screen/widget/custom_license_image.dart';
import 'package:provider/provider.dart';

import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/dimens/dimens.dart';
import '../../../../core/resources/app_assets.dart';
import '../../../../core/resources/app_translate.dart';
import '../../../../core/resources/font_size.dart';
import '../../../../injection.dart';
import '../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../components/custom_text/custom_text.dart';
import '../../contracts_page/contract_screens/widget/success_payed_sheet.dart';
import '../add_unit_view_model.dart';
import 'widget/custom_id_image.dart';

class ConfirmAdditionalScreen extends StatefulWidget {
  const ConfirmAdditionalScreen({super.key, required this.id});
  final String? id;

  @override
  State<ConfirmAdditionalScreen> createState() => _ConfirmAdditionalScreenState();
}

class _ConfirmAdditionalScreenState extends State<ConfirmAdditionalScreen> {
AddUnitViewModel provider = getIt();
@override
  void initState() {
    super.initState();
    provider.initConfirmAddition();
  }
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(backgroundColor: const Color(0xffF6FFFA),
    systemNavigationBarColor: const Color(0xffF6FFFA),
    appBar: CustomAppBar(fontWeight: FontWeight.bold,fontSize: AppFonts.font_14,
    title: AppTranslate.confirmAddition.tr(),bgColor: const Color(0xffF6FFFA),statusBarColor: const Color(0xffF6FFFA),height: 64.h),
      body: Padding(
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
                                title:AppTranslate.confirmAddition.tr(),
                                fontSize: AppFonts.font_12,
                              ),
                              CustomText(
                                title: AppTranslate.completeYourDataConfirmAddition.tr(),
                                fontSize: AppFonts.font_10,
                                fontColor: Colors.grey,
                              )
                            ],
                          )
                        ],
                      )),
              SizedBox(height: 20.h),
                  const CustomIDImage(),
                  const CustomLicenseImage(),
                  const CustomCommercialRegisterImage(),
                  CustomButton(onTap: (){
                    provider.confirmAddition(widget.id);},title: AppTranslate.confirm.tr())
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
