
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/my_separator.dart';
import 'package:pronight_vendor/data/models/response/sub_models/add_escort_model.dart';
import 'package:pronight_vendor/presentations/components/loadings/custom_scaffold_messanger.dart';
import 'package:provider/provider.dart';
import '../../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../../core/dimens/dimens.dart';
import '../../../../../../../core/resources/app_assets.dart';
import '../../../../../../../core/resources/app_translate.dart';
import '../../../../../../../core/resources/font_size.dart';
import '../../../../../../components/custom_button/custom_button.dart';
import '../../../../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../../../../components/custom_text/custom_text.dart';
import '../../../../../../components/inputs/custom_text_form.dart';
import '../../add_contract_view_model.dart';

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
                      ListView.builder(
                        itemCount: data.escorts.length,
                          physics:const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context,index){
                        return
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              SizedBox(height: 20.h),
                              Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(title: AppTranslate.theNameOfTheCompanion.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                                  CustomTextFormField(controller: data.escorts[index].companionNameController,
                                    height: 56.h,textInputType: TextInputType.text,
                                    prefix: InkWell(onTap:(){
                                      data.escorts[index].companionNameController.clear();
                                    },
                                        child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                                  )
                                ],
                              ),
                              SizedBox(height: 20.h),
                              Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(title: AppTranslate.iDNumber.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                                  CustomTextFormField(controller: data.escorts[index].iDNumberCompanionsController,
                                    height: 56.h,textInputType: TextInputType.number,
                                    prefix: InkWell(onTap:(){
                                      data.escorts[index].iDNumberCompanionsController.clear();
                                    },
                                        child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                                  )
                                ],
                              ),
                              SizedBox(height: 20.h),
                              Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(title: AppTranslate.nationality.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                                  CustomTextFormField(controller: data.escorts[index].nationalityCompanionsController,
                                    height: 56.h,textInputType: TextInputType.text,
                                    prefix: InkWell(onTap:(){
                                      data.escorts[index].nationalityCompanionsController.clear();
                                    },child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                                  )
                                ],
                              ),
                              SizedBox(height: 20.h),
                              Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(title: AppTranslate.facilitiesProximity.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                                  CustomTextFormField(controller: data.escorts[index].facilitiesProximityController,
                                    height: 56.h,textInputType: TextInputType.text,
                                    prefix: InkWell(onTap:(){
                                      data.escorts[index].facilitiesProximityController.clear();
                                    },
                                        child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                                  )
                                ],
                              ),
                              SizedBox(height: 20.h),
                              const MySeparator(color: AppColors.blackColor,),
                              SizedBox(height: 20.h),
                                if(data.escorts.last==data.escorts[index]) (data.escorts.first!=data.escorts[index])?const SizedBox():
                                CustomButton(onTap: (){
                                  if(data.escorts[index].companionNameController.text.isEmpty||data.escorts[index].iDNumberCompanionsController.text.isEmpty){
                                    CustomScaffoldMessanger.showToast(title: AppTranslate.accompanyingTenantDataRequired.tr());
                                  }else{
                                  data.escorts.add(AddEscort(name: '', idNo: '', nationality: '', kinship: ''));
                                  data.refreshData();}
                                },bg: const Color(0xff045B9A),title: AppTranslate.addFacilities.tr(),fontWeight: FontWeight.w400,),

                                (data.escorts.first==data.escorts[index])?const SizedBox():
                                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                 if(data.escorts.last==data.escorts[index]) CustomButton(onTap: (){
                                   if(data.escorts[index].companionNameController.text.isEmpty||data.escorts[index].iDNumberCompanionsController.text.isEmpty){
                                     CustomScaffoldMessanger.showToast(title: AppTranslate.accompanyingTenantDataRequired.tr());
                                   }else{
                                    data.escorts.add(AddEscort(name: '', idNo: '', nationality: '', kinship: ''));
                                    data.refreshData();}
                                    },width: 135.w,bg: const Color(0xff045B9A),title: AppTranslate.addFacilities.tr(),fontWeight: FontWeight.w400,),
                                  (data.escorts.first==data.escorts[index])?const SizedBox(): CustomButton(onTap: (){
                                    data.escorts.removeAt(index);
                                    data.refreshData();
                                    },width: 135.w,bg: const Color(0xffEF0404),title: AppTranslate.deleteFacilities.tr(),fontWeight: FontWeight.w400,),
                                ],),
                            ],);
                      }),
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
                            if(data.escorts.first.companionNameController.text.isEmpty||data.escorts.first.iDNumberCompanionsController.text.isEmpty){
                              CustomScaffoldMessanger.showToast(title: AppTranslate.accompanyingTenantDataRequired.tr());
                            }else{
                            setState(() {
                              data.currentPage=3;
                            });
                            data.pageController.animateToPage(data.currentPage,
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeInOut);}
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
