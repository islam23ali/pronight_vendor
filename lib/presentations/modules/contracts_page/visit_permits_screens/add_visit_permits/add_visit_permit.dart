import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/visit_permits_screens/add_visit_permits/widgets/custom_dropdown_visit_permit.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/visit_permits_screens/add_visit_permits/widgets/custom_material_card.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/visit_permits_screens/add_visit_permits/widgets/custom_visitor_data_card.dart';
import 'package:provider/provider.dart';
import '../../../../../core/app_theme/app_colors.dart';
import '../../../../../core/dimens/dimens.dart';
import '../../../../../core/resources/app_assets.dart';
import '../../../../../core/resources/app_translate.dart';
import '../../../../../core/resources/font_size.dart';
import '../../../../components/alerts/custom_select_date.dart';
import '../../../../components/custom_app_bar/custom_app_bar.dart';
import '../../../../components/custom_button/custom_button.dart';
import '../../../../components/custom_scaffold/custom_scaffold.dart';
import '../../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../../components/custom_switch/custom_switch.dart';
import '../../../../components/custom_text/custom_text.dart';
import '../../../../components/inputs/custom_text_form.dart';
import 'add_visit_permit_view_model.dart';

class AddVisitPermit extends StatefulWidget {
  const AddVisitPermit({super.key});

  @override
  State<AddVisitPermit> createState() => _AddVisitPermitState();
}

class _AddVisitPermitState extends State<AddVisitPermit> {

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: const Color(0xffF6FFFA),
      systemNavigationBarColor: const Color(0xffF6FFFA),
      appBar: CustomAppBar(fontWeight: FontWeight.bold,fontSize: AppFonts.font_14,
        title: AppTranslate.addVisitPermit.tr(),bgColor: const Color(0xffF6FFFA),statusBarColor: const Color(0xffF6FFFA),height: 64.h,),
      body: Consumer<AddVisitPermitViewModel>(
          builder: (context,data,_) {
            return Column(crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10.h),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(Dimens.padding_16),
                    child: Consumer<AddVisitPermitViewModel>(
                        builder: (context,data,_) {
                          return Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r),color: AppColors.white),
                            child: SingleChildScrollView(
                              child: Column(mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(height: 59.h,
                                      decoration: BoxDecoration(
                                          borderRadius:BorderRadius.only(topLeft: Radius.circular(Dimens.padding_8),topRight: Radius.circular(Dimens.padding_8)),
                                          color: const Color(0xffF0FAFF),border: Border.all(width:1.w,color: const Color(0xffFFF9DC))),
                                      padding: EdgeInsets.symmetric(vertical: Dimens.padding_12v,horizontal:Dimens.padding_24h ),
                                      child:Row(
                                        children: [
                                          CustomSvgIcon(assetName: AppAssets.reportDetails,width: 24.w,height: 24.h),
                                          SizedBox(width: 16.w),
                                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomText(title: AppTranslate.declarationData.tr(),fontSize: AppFonts.font_12,),
                                              CustomText(title: AppTranslate.basicDataForThePermit.tr(),fontSize: AppFonts.font_10,fontColor: Colors.grey,)
                                            ],)
                                        ],)),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: Dimens.padding_12h,vertical: Dimens.padding_16v),
                                    child: Column(children: [
                                      SizedBox(height: 20.h),
                                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          CustomText(title: AppTranslate.dateOfVisit.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                                          CustomTextFormField(controller: data.visitDateController,readOnly: true,
                                            onTap: (){
                                              showDialog<String>(
                                                  context: context,
                                                  builder: (BuildContext context) =>
                                                      CustomSelectDate(onDateSelected: (String value) {data.visitDateController.text=value;},));
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
                                          CustomText(title: AppTranslate.selectSector.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                                          Column(
                                            children: [
                                              CustomDropdownVisitPermitButton(
                                                color: AppColors.darkColor,
                                                items: data.cityList ?? [],
                                                value: data.value,
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    data.value = newValue;
                                                  });
                                                },
                                              ),
                                              Container(height: 2.h,width: 300,color: Colors.grey.shade400,),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20.h),
                                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          CustomText(title: AppTranslate.villa.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                                          Column(
                                            children: [
                                              CustomDropdownVisitPermitButton(
                                                color: AppColors.darkColor,
                                                items: data.cityList ?? [],
                                                value: data.value,
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    data.value = newValue;
                                                  });
                                                },
                                              ),
                                              Container(height: 2.h,width: 300,color: Colors.grey.shade400,),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20.h),
                                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          CustomText(title: AppTranslate.beach.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                                          Column(
                                            children: [
                                              CustomDropdownVisitPermitButton(
                                                color: AppColors.darkColor,
                                                items: data.cityList ?? [],
                                                value: data.value,
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    data.value = newValue;
                                                  });
                                                },
                                              ),
                                              Container(height: 2.h,width: 300,color: Colors.grey.shade400,),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20.h),
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(width: 150.w,
                                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  CustomText(title: AppTranslate.numberOfDays.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                                                  CustomTextFormField(controller: data.numberOfDaysController,
                                                    height: 60.h,textInputType: TextInputType.number,
                                                    prefix: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 150.w,
                                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  CustomText(title: AppTranslate.permitStatus.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                                                  CustomTextFormField(controller: data.permitStatusController,
                                                    height: 60.h,textInputType: TextInputType.text,
                                                    prefix: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ]),
                                      SizedBox(height: 20.h),
                                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          CustomText(title: AppTranslate.driverName.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                                          CustomTextFormField(controller: data.driverNameController,
                                            height: 60.h,textInputType: TextInputType.name,
                                            prefix: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 20.h),
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(width: 150.w,
                                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      CustomText(title: AppTranslate.visitors.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                                                      CustomSwitch(value: data.isSwitchVisitors,
                                                          activeColor: AppColors.primaryColor,
                                                          inactiveColor: AppColors.gray,
                                                          onChanged: (_){
                                                            setState(() {
                                                              data.isSwitchVisitors=!data.isSwitchVisitors;
                                                            });
                                                          })
                                                    ])
                                            ),
                                            SizedBox(width: 150.w,
                                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      CustomText(title: AppTranslate.materials.tr(),fontSize:AppFonts.font_12,fontColor: AppColors.primaryColor),
                                                      CustomSwitch(value: data.isSwitchMaterials,
                                                          activeColor: AppColors.primaryColor,
                                                          inactiveColor: AppColors.gray,
                                                          onChanged: (_){
                                                            setState(() {
                                                              data.isSwitchMaterials=!data.isSwitchMaterials;
                                                            });
                                                          })
                                                    ])
                                            ),
                                          ]),
                                      SizedBox(height: 20.h),
                                      const CustomVisitorDataCard(),
                                      SizedBox(height: 10.h),
                                      const CustomMaterialCard(),
                                      SizedBox(height: 20.h),
                                      CustomButton(onTap: (){

                                      },title: AppTranslate.send.tr(),)
                                    ],),
                                  )
                                ],
                              ),
                            ),);
                        }
                    ),
                  ),
                ),
              ],
            );
          }
      ),
    );
  }
}
