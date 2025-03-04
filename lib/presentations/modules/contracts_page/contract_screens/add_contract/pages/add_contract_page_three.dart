import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/my_separator.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../core/dimens/dimens.dart';
import '../../../../../../core/resources/app_assets.dart';
import '../../../../../../core/resources/app_translate.dart';
import '../../../../../../core/resources/font_size.dart';
import '../../../../../components/custom_button/custom_button.dart';
import '../../../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../../../components/custom_text/custom_text.dart';
import '../../../../../components/inputs/custom_text_form.dart';
import '../add_contract_view_model.dart';

class AddContractPageThree extends StatefulWidget {
  const AddContractPageThree({super.key});

  @override
  State<AddContractPageThree> createState() => _AddContractPageThreeState();
}

class _AddContractPageThreeState extends State<AddContractPageThree> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimens.padding_16),
      child: Consumer<AddContractViewModel>(
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
                                CustomText(title: AppTranslate.tenantsCompanionsData.tr(),fontSize: AppFonts.font_12,),
                                CustomText(title: AppTranslate.basicDataForTenantsCompanions.tr(),fontSize: AppFonts.font_10,fontColor: Colors.grey,)
                              ],)
                          ],)),
                    Column(children: [
                      SizedBox(height: 20.h),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(title: AppTranslate.theNameOfTheCompanion.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                          CustomTextFormField(controller: data.companionNameController,
                            height: 56.h,textInputType: TextInputType.text,
                            prefix: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w),
                          )
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(title: AppTranslate.iDNumber.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                          CustomTextFormField(controller: data.iDNumberCompanionsController,
                            height: 56.h,textInputType: TextInputType.number,
                            prefix: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w),
                          )
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(title: AppTranslate.nationality.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                          CustomTextFormField(controller: data.nationalityCompanionsController,
                            height: 56.h,textInputType: TextInputType.text,
                            prefix: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w),
                          )
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(title: AppTranslate.facilitiesProximity.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                          CustomTextFormField(controller: data.facilitiesProximityController,
                            height: 56.h,textInputType: TextInputType.text,
                            prefix: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w),
                          )
                        ],
                      ),
                      SizedBox(height: 20.h),
                      const MySeparator(color: AppColors.blackColor,),
                      SizedBox(height: 20.h),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        CustomButton(onTap: (){},width: 135.w,bg: const Color(0xff045B9A),title: AppTranslate.addFacilities.tr(),fontWeight: FontWeight.w400,),
                        CustomButton(onTap: (){},width: 135.w,bg: const Color(0xffEF0404),title: AppTranslate.deleteFacilities.tr(),fontWeight: FontWeight.w400,),
                      ],),
                      SizedBox(height: 40.h),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(onTap: (){
                            setState(() {
                              data.currentPage=2;
                            });
                            data.pageController.previousPage(
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeInOut);
                          },
                            bg: AppColors.white,
                            borderColor: AppColors.primaryColor,
                            fontColor: AppColors.primaryColor,
                            width: 150.w,
                            title: AppTranslate.previous.tr(),),
                          CustomButton(onTap: (){
                            setState(() {
                              data.currentPage=3;
                            });
                            data.pageController.animateToPage(data.currentPage,
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeInOut);
                          }, width: 150.w,
                            title: AppTranslate.next.tr(),),
                        ],
                      )
                    ],)
                  ],
                ),
              ),);
          }
      ),
    );
  }
}
