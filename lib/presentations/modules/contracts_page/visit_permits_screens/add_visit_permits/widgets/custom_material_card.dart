import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/visit_permits_screens/add_visit_permits/add_visit_permit_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../core/dimens/dimens.dart';
import '../../../../../../core/resources/app_assets.dart';
import '../../../../../../core/resources/app_translate.dart';
import '../../../../../../core/resources/font_size.dart';
import '../../../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../../../components/custom_text/custom_text.dart';
import '../../../../../components/inputs/custom_text_form.dart';

class CustomMaterialCard extends StatefulWidget {
  const CustomMaterialCard({super.key});

  @override
  State<CustomMaterialCard> createState() => _CustomMaterialCardState();
}

class _CustomMaterialCardState extends State<CustomMaterialCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AddVisitPermitViewModel>(
      builder: (context,data,_) {
        return Card(color: AppColors.white,
            elevation: 4,
            surfaceTintColor: AppColors.white,
            child:Column(
              children: [
                InkWell(onTap:(){
                  setState(() {
                    data.openMaterial=!data.openMaterial;
                  });
                },
                  child: Container(height: 59.h,
                      decoration: BoxDecoration(
                          borderRadius:BorderRadius.only(topLeft: Radius.circular(Dimens.padding_8),topRight: Radius.circular(Dimens.padding_8)),
                          color: const Color(0xffF0FAFF),border: Border.all(width:1.w,color: const Color(0xffFFF9DC))),
                      padding: EdgeInsets.symmetric(vertical: Dimens.padding_12v,horizontal:Dimens.padding_24h ),
                      child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CustomSvgIcon(assetName: AppAssets.reportDetails,width: 24.w,height: 24.h),
                              SizedBox(width: 16.w),
                              Column(crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(title: AppTranslate.materialData.tr(),fontSize: AppFonts.font_12,),
                                  CustomText(title: AppTranslate.basicDataAboutTheMaterials.tr(),fontSize: AppFonts.font_10,fontColor: Colors.grey,)
                                ],)
                            ],),
                          Icon(Icons.expand_more_rounded,color: AppColors.gray,size: 25.r,)
                        ],
                      )),
                ),
                data.openMaterial==false?const SizedBox(): Padding(
                  padding: EdgeInsets.all(12.r),
                  child: Column(children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(title: AppTranslate.theName.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                        CustomTextFormField(controller: data.theNameController,readOnly: true,
                          height: 60.h,textInputType: TextInputType.name,
                          prefix: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w),
                        )
                      ],
                    ),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(title: AppTranslate.quantity.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                        CustomTextFormField(controller: data.quantityController,readOnly: true,
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
                    )
                  ],),
                )
              ],
            ));
      }
    );
  }
}
