import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../core/dimens/dimens.dart';
import '../../../../../../core/resources/app_assets.dart';
import '../../../../../../core/resources/app_translate.dart';
import '../../../../../../core/resources/font_size.dart';
import '../../../../../../data/models/response/contens_model.dart';
import '../../../../../../data/models/response/sub_models/add_unit_content_model.dart';
import '../../../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../../../components/custom_text/custom_text.dart';
import '../../../../../components/inputs/custom_text_form.dart';
import '../../../../../components/loadings/custom_scaffold_messanger.dart';
import '../../../add_unit_view_model.dart';
import '../../../widget/custom_contant_dropdown.dart';

class ContentCard extends StatefulWidget {
  const ContentCard({super.key});

  @override
  State<ContentCard> createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> {
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
                    title: AppTranslate.unitContents.tr(),
                    fontSize: AppFonts.font_12,
                  ),
                ],
              )),
          ListView.builder(
              itemCount: data.contentList.length,
              physics:const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context,index){
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(12.r),
                      child: Column(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                                title: AppTranslate.selectContent.tr(),
                                fontSize: AppFonts.font_12,
                                fontColor: AppColors.primaryColor),
                            Column(
                              children: [
                                CustomContentDropdownButton(
                                  color: AppColors.darkColor,
                                  items: data.contentsModel?.data ?? [],
                                  value: data.contentList[index].oneContent,
                                  onChanged: (OneConten? newValue) {

                                    data.contentList[index].oneContent = newValue!;
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
                            CustomText(title: AppTranslate.value.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                            CustomTextFormField(controller: data.contentList[index].theValue,
                              height: 60.h,textInputType: TextInputType.number,
                              prefix: InkWell(
                                  onTap:(){
                                    data.contentList[index].theValue.clear();
                                    data.refreshData();
                                  },
                                  child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                            )
                          ],
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            if(data.contentList.last==data.contentList[index]) (data.contentList.first!=data.contentList[index])?const SizedBox():
                            InkWell(
                                onTap: (){
                                  if(data.contentList[index].oneContent.id==null||data.contentList[index].theValue.text.isEmpty){
                                    CustomScaffoldMessanger.showToast(title: AppTranslate.completeDataFirst.tr());
                                  }else{
                                    data.contentList.add(AddContent(unitMainContentId: -1, value: ''));
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
                                        if(data.contentList[index].oneContent.id==null||data.contentList[index].theValue.text.isEmpty){
                                          CustomScaffoldMessanger.showToast(title: AppTranslate.completeDataFirst.tr());
                                        }else{
                                          data.contentList.add(AddContent(unitMainContentId: -1, value: ''));
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
                    )
                  ],
                );
              }),
        ],);
      }
    );
  }
}
