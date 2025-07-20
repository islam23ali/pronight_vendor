import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/presentations/components/inputs/custom_text_form_area.dart';
import 'package:pronight_vendor/presentations/components/loadings/custom_scaffold_messanger.dart';
import 'package:provider/provider.dart';
import 'package:flutter/widgets.dart' as ui;
import '../../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../../core/app_theme/text_styles.dart';
import '../../../../../../../core/dimens/dimens.dart';
import '../../../../../../../core/resources/app_assets.dart';
import '../../../../../../../core/resources/app_translate.dart';
import '../../../../../../../core/resources/font_size.dart';
import '../../../../../../components/custom_button/custom_button.dart';
import '../../../../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../../../../components/custom_text/custom_text.dart';
import '../../../../../../components/inputs/custom_text_form.dart';
import '../../add_contract_view_model.dart';

class AddContractPageTwo extends StatefulWidget {
  const AddContractPageTwo({super.key});

  @override
  State<AddContractPageTwo> createState() => _AddContractPageTwoState();
}

class _AddContractPageTwoState extends State<AddContractPageTwo> {

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
                                CustomText(title: AppTranslate.tenantInformation.tr(),fontSize: AppFonts.font_12,),
                                CustomText(title: AppTranslate.basicAboutTenant.tr(),fontSize: AppFonts.font_10,fontColor: Colors.grey,)
                              ],)
                          ],)),
                    Column(children: [
                      SizedBox(height: 20.h),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(title: AppTranslate.tenantName.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                          CustomTextFormField(controller: data.tenantNameController,
                            height: 56.h,textInputType: TextInputType.name,
                            prefix: InkWell(onTap: (){
                              data.tenantNameController.clear();
                              data.refreshData();
                            },
                                child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                          )
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(title: AppTranslate.iDNumber.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                          CustomTextFormField(controller: data.iDNumberController,
                            height: 56.h,textInputType: TextInputType.number,
                            prefix: InkWell(onTap: (){
                              data.iDNumberController.clear();
                              data.refreshData();
                            },
                                child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                          )
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(title: AppTranslate.nationality.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                          CustomTextFormField(controller: data.nationalityController,
                            height: 56.h,textInputType: TextInputType.text,
                            prefix: InkWell(onTap: (){
                              data.nationalityController.clear();
                              data.refreshData();
                            },
                                child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                          )
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(title: AppTranslate.mobileNumber.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                          CustomTextFormField(controller: data.mobileNumberController,
                            height: 56.h,textInputType: TextInputType.number,
                            suffix: Directionality(
                                textDirection: ui.TextDirection.ltr,
                                child: CountryCodePicker(
                                  padding: EdgeInsets.zero,
                                  backgroundColor: Colors.white,
                                  dialogTextStyle: AppTextStyles()
                                      .normalText(fontSize: AppFonts.font_14)
                                      .copyWith(color: Colors.black),
                                  onChanged: (countryCode){
                                    context
                                        .read<AddContractViewModel>().selectedCountryCodeAndFlag(countryCode.dialCode??'',countryCode.flagUri??'');
                                    print('bbbbbbbbbbb${data.phoneCode}');
                                  },
                                  builder: (countryCode) {
                                    return Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(4.r),
                                          child: Image.asset(
                                              countryCode?.flagUri ?? '',
                                              package: 'country_code_picker',
                                              width: 36.w,
                                              height: 24.h
                                          ),
                                        ),
                                        SizedBox(width: Dimens.padding_8h),
                                        CustomText(
                                            title: countryCode?.dialCode ?? ''),
                                        SizedBox(width: Dimens.padding_8h),
                                        Icon(
                                          Icons.expand_more_rounded,
                                          color: AppColors.darkColor,
                                          size: 14.r,
                                        ),
                                      ],
                                    );
                                  },
                                  initialSelection: 'sa',
                                  favorite: const ['+966', 'sa'],
                                  showCountryOnly: false,
                                  showOnlyCountryWhenClosed: false,
                                  showFlagMain: true,
                                  alignLeft: false,
                                  textOverflow: TextOverflow.ellipsis,
                                  flagWidth: 36.w,
                                )
                            ),

                            prefix: InkWell(onTap: (){
                              data.mobileNumberController.clear();
                              data.refreshData();
                            },
                                child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                          )
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        SizedBox(width:145.w,
                          child:
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(title: AppTranslate.rentalValue.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                                CustomTextFormField(controller: data.rentalValueController,
                                  height: 56.h,textInputType: TextInputType.number,
                                  prefix: InkWell(onTap: (){
                                    data.rentalValueController.clear();
                                    data.refreshData();
                                  },
                                      child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                                )
                              ],
                            ),),
                        SizedBox(width:145.w,
                          child:
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(title: AppTranslate.insuranceValue.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                                CustomTextFormField(controller: data.insuranceValueController,
                                  height: 56.h,textInputType: TextInputType.number,
                                  prefix: InkWell(onTap: (){
                                    data.insuranceValueController.clear();
                                    data.refreshData();
                                  },
                                      child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                                )
                              ],
                            ),),
                      ],),
                      SizedBox(height: 20.h),
                      // Column(crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     CustomText(title: AppTranslate.contractFees.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                      //     CustomTextFormField(controller: data.contractFeesController,
                      //       height: 56.h,textInputType: TextInputType.number,
                      //       prefix: InkWell(onTap: (){
                      //         data.contractFeesController.clear();
                      //         data.refreshData();
                      //       },
                      //           child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                      //     )
                      //   ],
                      // ),
                      // SizedBox(height: 20.h),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(title: AppTranslate.details.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                          CustomTextFormFieldArea(controller: data.detailsController,
                            // height: 156.h,
                            borderColor: Colors.transparent,
                            prefix: InkWell(onTap: (){
                              data.detailsController.clear();
                              data.refreshData();
                            },
                                child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                          )
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        CustomButton(onTap: (){
                          setState(() {
                            data.currentPage=1;
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
                          if(data.tenantNameController.text.isEmpty){
                            CustomScaffoldMessanger.showToast(title: AppTranslate.tenantNameIsRequired.tr());
                          }else if(data.iDNumberController.text.isEmpty){
                            CustomScaffoldMessanger.showToast(title: AppTranslate.iDNumberRequired.tr());
                          }else if(data.nationalityController.text.isEmpty){
                            CustomScaffoldMessanger.showToast(title: AppTranslate.nationalityRequired.tr());
                          }else if(data.mobileNumberController.text.isEmpty){
                            CustomScaffoldMessanger.showToast(title: AppTranslate.phoneNumberRequired.tr());
                          }else if(data.rentalValueController.text.isEmpty){
                            CustomScaffoldMessanger.showToast(title: AppTranslate.rentalValueRequired.tr());
                          }else if(data.insuranceValueController.text.isEmpty){
                            CustomScaffoldMessanger.showToast(title: AppTranslate.insuranceValueRequired.tr());
                          // }else if(data.contractFeesController.text.isEmpty){
                          //   CustomScaffoldMessanger.showToast(title: AppTranslate.contractFeesRequired.tr());
                          }else{
                          setState(() {
                            data.currentPage=2;
                          });
                          data.pageController.animateToPage(data.currentPage,
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeInOut);}
                        },
                          width: 150.w,
                          title: AppTranslate.next.tr(),)
                      ],)
                    ],)
                  ],
                ),
              ),);
          }
      ),
    );
  }
}
