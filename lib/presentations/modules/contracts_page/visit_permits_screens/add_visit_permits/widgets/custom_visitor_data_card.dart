import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/data/models/response/sub_models/add_visitor_model.dart';
import 'package:pronight_vendor/presentations/components/loadings/custom_scaffold_messanger.dart';
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

class CustomVisitorDataList extends StatefulWidget {
  const CustomVisitorDataList({super.key});

  @override
  State<CustomVisitorDataList> createState() => _CustomVisitorDataListState();
}

class _CustomVisitorDataListState extends State<CustomVisitorDataList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AddVisitPermitViewModel>(
      builder: (context,data,_) {
        return
          ListView.builder(
              shrinkWrap: true,
              physics:const NeverScrollableScrollPhysics(),
              itemCount: data.visitorsList.length,
              itemBuilder: (context,index){
                return Card(color: AppColors.white,
                    elevation:4,
                    surfaceTintColor: AppColors.white,
                    child:Column(
                      children: [
                        InkWell(onTap:(){
                          setState(() {
                            data.openVisitor=!data.openVisitor;
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
                                          CustomText(title: AppTranslate.visitorData.tr(),fontSize: AppFonts.font_12,),
                                          CustomText(title: AppTranslate.basicDataAboutVisitors.tr(),fontSize: AppFonts.font_10,fontColor: Colors.grey,)
                                        ],)
                                    ],),
                                  Icon(Icons.expand_more_rounded,color: AppColors.gray,size: 25.r,)
                                ],
                              )),
                        ),
                        if (data.openVisitor==false) const SizedBox() else Padding(
                          padding: EdgeInsets.all(12.r),
                          child: Column(children: [
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(title: AppTranslate.nameOfTheFacility.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                                CustomTextFormField(controller: data.visitorsList[index].visitorNameController,
                                  height: 60.h,textInputType: TextInputType.name,
                                  prefix: InkWell(
                                      onTap: (){
                                        data.visitorsList[index].visitorNameController.clear();
                                        data.refreshData();
                                      },
                                      child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                                )
                              ],
                            ),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(title: AppTranslate.companionIDNumber.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                                CustomTextFormField(controller: data.visitorsList[index].visitorIDNumberController,
                                  height: 60.h,textInputType: TextInputType.number,
                                  prefix: InkWell(
                                      onTap: (){
                                        data.visitorsList[index].visitorIDNumberController.clear();
                                        data.refreshData();
                                      },
                                      child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                                )
                              ],
                            ),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(title: AppTranslate.facilitiesPhoneNumber.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                                CustomTextFormField(controller: data.visitorsList[index].visitorPhoneController,
                                  height: 60.h,textInputType: TextInputType.phone,
                                  prefix: InkWell(onTap: (){
                                    data.visitorsList[index].visitorPhoneController.clear();
                                    data.refreshData();
                                  },child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                                )
                              ],
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(),
                                Row(
                                  children: [
                                    InkWell(
                                        onTap: (){
                                          if(data.visitorsList[index].visitorNameController.text.isEmpty||data.visitorsList[index].visitorIDNumberController.text.isEmpty||data.visitorsList[index].visitorPhoneController.text.isEmpty){
                                            CustomScaffoldMessanger.showToast(title: AppTranslate.enterVisitorDataFirst.tr());
                                          }else{
                                            data.visitorsList.add(AddVisitor(name: '', idNo: '',phoneCode:'',phone: ''));
                                            data.refreshData();
                                          }
                                        },
                                        child: CustomSvgIcon(assetName: AppAssets.addVisitor,width: 30.w,height: 30.w,)),
                                    SizedBox(width: 5.w),
                                    (data.visitorsList.first==data.visitorsList[index])?const SizedBox():
                                    InkWell(
                                        onTap: (){
                                          data.visitorsList.removeAt(index);
                                          data.refreshData();
                                        },
                                        child: CustomSvgIcon(assetName: AppAssets.deleteVisitor,width: 30.w,height: 30.w,)),
                                  ],
                                ),
                              ],
                            )
                          ],),
                        )
                      ],
                    ));
              });
      }
    );
  }
}
