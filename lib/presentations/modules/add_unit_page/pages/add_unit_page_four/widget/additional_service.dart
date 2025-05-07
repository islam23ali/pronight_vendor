import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/presentations/modules/add_unit_page/add_unit_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../core/dimens/dimens.dart';
import '../../../../../../core/resources/app_assets.dart';
import '../../../../../../core/resources/app_translate.dart';
import '../../../../../../core/resources/font_size.dart';
import '../../../../../../data/models/response/sub_models/add_additional_service_model.dart';
import '../../../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../../../components/custom_switch/custom_switch.dart';
import '../../../../../components/custom_text/custom_text.dart';
import '../../../../../components/inputs/custom_text_form.dart';
import '../../../../../components/loadings/custom_scaffold_messanger.dart';

class AddAdditionalService extends StatefulWidget {
  const AddAdditionalService({super.key});

  @override
  State<AddAdditionalService> createState() => _AddAdditionalServiceState();
}

class _AddAdditionalServiceState extends State<AddAdditionalService> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AddUnitViewModel>(
      builder: (context,data,_) {
        return Column(children: [
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
          ListView.builder(
              itemCount: data.additionalServiceList.length,
              physics:const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context,index){
                AddAdditionalServices model = data.additionalServiceList[index];
                return Padding(
                  padding: EdgeInsets.all(12.r),
                  child: Column(children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(title: AppTranslate.addressArabic.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                        CustomTextFormField(controller: model.titleArController,
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
                        CustomTextFormField(controller: model.titleEnController,
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
                        CustomTextFormField(controller: model.priceController,
                          height: 60.h,textInputType: TextInputType.number,
                          // inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))],
                          prefix: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w),
                        )
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(title: AppTranslate.forEveryone.tr(),fontSize:AppFonts.font_15,fontColor: AppColors.primaryColor),
                          CustomSwitch(value: model.forPerson,
                              activeColor: AppColors.primaryColor,
                              inactiveColor: AppColors.gray,
                              onChanged: (_){
                                setState(() {
                                  model.forPerson=!model.forPerson;
                                });
                              })
                        ]),
                    SizedBox(height: 20.h),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        if(data.additionalServiceList.last==data.additionalServiceList[index]) (data.additionalServiceList.first!=data.additionalServiceList[index])?const SizedBox():
                        InkWell(
                            onTap: (){
                              if(data.additionalServiceList[index].priceController.text==0.0.toString()||data.additionalServiceList[index].titleEnController.text.isEmpty||data.additionalServiceList[index].titleArController.text.isEmpty){
                                CustomScaffoldMessanger.showToast(title: AppTranslate.completeDataFirst.tr());
                              }else{
                                data.additionalServiceList.add(AddAdditionalServices(price:0.0, forPerson: false, titleAr: '', titleEn: ''));
                                data.refreshData();}
                            },
                            child: CustomSvgIcon(assetName: AppAssets.addVisitor,width: 30.w,height: 30.w,)),

                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        (data.contentList.first==data.contentList[index])?const SizedBox():
                        Row(
                          children: [
                            if(data.contentList.last==data.contentList[index])
                              InkWell(
                                  onTap: (){
                                    if(data.additionalServiceList[index].priceController.text.isEmpty||data.additionalServiceList[index].titleEnController.text.isEmpty||data.additionalServiceList[index].titleArController.text.isEmpty){
                                      CustomScaffoldMessanger.showToast(title: AppTranslate.completeDataFirst.tr());
                                    }else{
                                      data.additionalServiceList.add(AddAdditionalServices(price:0.0, forPerson: false, titleAr: '', titleEn: ''));
                                      data.refreshData();}
                                  },
                                  child: CustomSvgIcon(assetName: AppAssets.addVisitor,width: 30.w,height: 30.w,)),
                            SizedBox(width: 5.w),
                            (data.contentList.first==data.contentList[index])?const SizedBox():InkWell(
                                onTap: (){
                                  data.contentList.removeAt(index);
                                  data.refreshData();
                                },
                                child: CustomSvgIcon(assetName: AppAssets.deleteVisitor,width: 30.w,height: 30.w,)),
                          ],
                        ),

                      ],
                    ),


                  ],),
                );
              }),
        ],);
      }
    );
  }
}
