import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/data/models/response/sub_models/add_facilitie_model.dart';
import 'package:pronight_vendor/presentations/modules/add_unit_page/add_unit_view_model.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../core/dimens/dimens.dart';
import '../../../../../../core/resources/app_assets.dart';
import '../../../../../../core/resources/app_translate.dart';
import '../../../../../../core/resources/font_size.dart';
import '../../../../../../data/models/response/contens_model.dart';
import '../../../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../../../components/custom_text/custom_text.dart';
import '../../../../../components/inputs/custom_text_form.dart';
import '../../../../../components/loadings/custom_scaffold_messanger.dart';
import '../../../widget/custom_facilities_dropdown.dart';

class FacilitiesCard extends StatefulWidget {
  const FacilitiesCard({super.key});

  @override
  State<FacilitiesCard> createState() => _FacilitiesCardState();
}

class _FacilitiesCardState extends State<FacilitiesCard> {
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
                    title: AppTranslate.unitFacilities.tr(),
                    fontSize: AppFonts.font_12,
                  ),
                ],
              )),
          ListView.builder(
              itemCount: data.facilitiesList.length,
              physics:const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context,index){
                AddFacilities model = data.facilitiesList[index];
                return Padding(
                  padding: EdgeInsets.all(12.r),
                  child: Column(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                            title: AppTranslate.selectAttachment.tr(),
                            fontSize: AppFonts.font_12,
                            fontColor: AppColors.primaryColor),
                        Column(
                          children: [
                            CustomFacilitiesDropdownButton(
                              color: AppColors.darkColor,
                              items: data.facilitiesModel?.data ?? [],
                              // value: data.selectedFacilities,
                              value: model.selectedFacilities,
                              onChanged: (OneConten? newValue) {
                                  // data.selectedFacilities = newValue;
                                  model.selectedFacilities = newValue;
                                  data.refreshData();
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
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(title: AppTranslate.additionalDescriptionAttachmentArabic.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                        CustomTextFormField(controller: model.textArController,
                          height: 60.h,textInputType: TextInputType.name,
                          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[\u0600-\u06FF\s]'))],
                          prefix: InkWell(onTap:(){model.textArController.clear();data.refreshData();},
                              child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(title: AppTranslate.additionalDescriptionAttachmentEnglish.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                        CustomTextFormField(controller: model.textEnController,
                          height: 60.h,textInputType: TextInputType.name,
                          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))],
                          prefix: InkWell(
                              onTap:(){model.textEnController.clear();data.refreshData();},
                              child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                        )
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        if(data.facilitiesList.last==data.facilitiesList[index]) (data.facilitiesList.first!=data.facilitiesList[index])?const SizedBox():
                        InkWell(
                            onTap: (){
                              if(data.facilitiesList[index].unitMainFacilityId!=-1||data.facilitiesList[index].textArController.text.isEmpty||data.facilitiesList[index].textEnController.text.isEmpty){
                                CustomScaffoldMessanger.showToast(title: AppTranslate.completeDataFirst.tr());
                              }else{
                                data.facilitiesList.add(AddFacilities(unitMainFacilityId: -1, textAr: '', textEn: ''));
                                data.refreshData();}
                            },
                            child: CustomSvgIcon(assetName: AppAssets.addVisitor,width: 30.w,height: 30.w,)),

                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        (data.facilitiesList.first==data.facilitiesList[index])?const SizedBox():
                        Row(
                          children: [
                            if(data.facilitiesList.last==data.facilitiesList[index])
                              InkWell(
                                  onTap: (){
                                    if(data.facilitiesList[index].unitMainFacilityId!=-1||data.facilitiesList[index].textArController.text.isEmpty||data.facilitiesList[index].textEnController.text.isEmpty){
                                      CustomScaffoldMessanger.showToast(title: AppTranslate.completeDataFirst.tr());
                                    }else{
                                      data.facilitiesList.add(AddFacilities(unitMainFacilityId: -1, textAr: '', textEn: ''));
                                      data.refreshData();}
                                  },
                                  child: CustomSvgIcon(assetName: AppAssets.addVisitor,width: 30.w,height: 30.w,)),
                            SizedBox(width: 5.w),
                            (data.facilitiesList.first==data.facilitiesList[index])?const SizedBox():InkWell(
                                onTap: (){
                                  data.facilitiesList.removeAt(index);
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
