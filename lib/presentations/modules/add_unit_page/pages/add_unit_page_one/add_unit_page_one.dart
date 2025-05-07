import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/presentations/components/inputs/custom_text_form_area.dart';
import 'package:pronight_vendor/presentations/components/loadings/custom_scaffold_messanger.dart';
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

class AddUnitPageOne extends StatefulWidget {
  const AddUnitPageOne({super.key});

  @override
  State<AddUnitPageOne> createState() => _AddUnitPageOneState();
}

class _AddUnitPageOneState extends State<AddUnitPageOne> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimens.padding_16),
      child: Consumer<AddUnitViewModel>(
        builder: (context,data,_) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: Dimens.padding_12h,vertical: Dimens.padding_16v),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r),color: AppColors.white),
            child: SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.min,
                children: [
                  Container(height: 59.h,
                      decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(Dimens.padding_8),
                          color: const Color(0xffF0FAFF),border: Border.all(width:1.w,color: const Color(0xffFFF9DC))),
                      padding: EdgeInsets.symmetric(vertical: Dimens.padding_12v,horizontal:Dimens.padding_24h ),
                      child:Row(
                        children: [
                          CustomSvgIcon(assetName: AppAssets.reportDetails,width: 24.w,height: 24.h),
                          SizedBox(width: 16.w),
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(title: AppTranslate.unitInformation.tr(),fontSize: AppFonts.font_12,),
                              CustomText(title: AppTranslate.basicDataAboutUnit.tr(),fontSize: AppFonts.font_10,fontColor: Colors.grey,)
                            ],)
                        ],)),
                  Column(children: [
                    SizedBox(height: 20.h),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(title: AppTranslate.unitNameArabic.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                        CustomTextFormField(controller: data.arabicUnitNameController,
                          height: 60.h,textInputType: TextInputType.name,
                          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[\u0600-\u06FF\s]'))],
                          prefix: InkWell(
                              onTap: (){
                                data.arabicUnitNameController.clear();
                              },
                              child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(title: AppTranslate.unitNameEnglish.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                        CustomTextFormField(controller: data.englishUnitNameController,
                          height: 60.h,textInputType: TextInputType.name,
                          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))],
                          prefix: InkWell(
                              onTap: (){
                                data.englishUnitNameController.clear();
                              },
                              child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(title: AppTranslate.thePrice.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                        CustomTextFormField(controller: data.unitPriceController,
                          height: 60.h,textInputType: TextInputType.number,
                          // inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))],
                          prefix: InkWell(
                              onTap: (){
                                data.unitPriceController.clear();
                              },
                              child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(title: AppTranslate.area.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                        CustomTextFormField(controller: data.unitAreaController,
                          height: 60.h,textInputType: TextInputType.number,
                          // inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))],
                          prefix: InkWell(
                              onTap: (){
                                data.unitAreaController.clear();
                              },
                              child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(title: AppTranslate.descriptionArabic.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                        CustomTextFormField(controller: data.arabicUnitDescriptionController,
                          height: 60.h,textInputType: TextInputType.name,
                          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[\u0600-\u06FF\s]'))],
                          prefix: InkWell(
                              onTap: (){
                                data.arabicUnitDescriptionController.clear();
                              },
                              child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(title: AppTranslate.descriptionEnglish.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                        CustomTextFormField(controller: data.englishUnitDescriptionController,
                          height: 60.h,textInputType: TextInputType.name,
                          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))],
                          prefix: InkWell(
                              onTap: (){
                                data.englishUnitDescriptionController.clear();
                              },
                              child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(title: AppTranslate.comments.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                        CustomTextFormFieldArea(controller: data.notesController,
                          height: 100.h,
                          borderColor: Colors.transparent,
                          prefix: InkWell(
                              onTap: (){data.notesController.clear();},
                              child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                    CustomButton(onTap: (){
                      if(data.arabicUnitNameController.text.isEmpty){
                        CustomScaffoldMessanger.showToast(title: AppTranslate.nameAr.tr());
                      }else if(data.englishUnitNameController.text.isEmpty){
                        CustomScaffoldMessanger.showToast(title: AppTranslate.nameEn.tr());
                      }else if(data.unitPriceController.text.isEmpty){
                        CustomScaffoldMessanger.showToast(title: AppTranslate.enterUnitPrice.tr());
                      }else if(data.unitAreaController.text.isEmpty){
                        CustomScaffoldMessanger.showToast(title: AppTranslate.enterUnitArea.tr());
                      }else if(data.arabicUnitDescriptionController.text.isEmpty){
                        CustomScaffoldMessanger.showToast(title: AppTranslate.desAr.tr());
                      }else if(data.englishUnitDescriptionController.text.isEmpty){
                        CustomScaffoldMessanger.showToast(title: AppTranslate.desEn.tr());
                      }else{
                        data.currentPage=1;
                        data.refreshData();

                      // _pageController.animateToPage(
                      //   1,
                      //   duration: const Duration(milliseconds: 300),
                      //   curve: Curves.easeInOut,
                      // );
                      data.pageController.animateToPage(data.currentPage,
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInOut);}
                    },title: AppTranslate.next.tr(),)
                  ],)
                ],
              ),
            ),);
        }
      ),
    );
  }
}
