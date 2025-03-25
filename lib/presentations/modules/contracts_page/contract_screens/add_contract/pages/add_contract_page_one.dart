import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/data/models/response/sectors_model.dart';
import 'package:pronight_vendor/data/models/response/villas_model.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../core/dimens/dimens.dart';
import '../../../../../../core/resources/app_assets.dart';
import '../../../../../../core/resources/app_translate.dart';
import '../../../../../../core/resources/font_size.dart';
import '../../../../../components/alerts/custom_select_date.dart';
import '../../../../../components/custom_button/custom_button.dart';
import '../../../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../../../components/custom_text/custom_text.dart';
import '../../../../../components/inputs/custom_text_form.dart';
import '../add_contract_view_model.dart';
import '../widget/custom_beaches_dropdown.dart';
import '../widget/custom_dropdown.dart';
import '../widget/custom_sector_dropdown.dart';
import '../widget/custom_villas_dropdown.dart';

class AddContractPageOne extends StatefulWidget {
  const AddContractPageOne({super.key});

  @override
  State<AddContractPageOne> createState() => _AddContractPageOneState();
}

class _AddContractPageOneState extends State<AddContractPageOne> {

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
                              CustomText(title: AppTranslate.reportDetails.tr(),fontSize: AppFonts.font_12,),
                              CustomText(title: AppTranslate.basicDataAboutTheUnits.tr(),fontSize: AppFonts.font_10,fontColor: Colors.grey,)
                            ],)
                        ],)),
                  Column(children: [
                    SizedBox(height: 20.h),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(title: AppTranslate.arrivalDate.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                        CustomTextFormField(controller: data.arrivalDateController,readOnly: true,
                          onTap: (){
                            showDialog<String>(
                                context: context,
                                builder: (BuildContext context) =>
                                    CustomSelectDate(onDateSelected: (String value) {data.arrivalDateController.text=value;},));
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
                        CustomText(title: AppTranslate.exitDate.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                        CustomTextFormField(controller: data.exitDateController,readOnly: true,
                          onTap: (){
                            showDialog<String>(
                                context: context,
                                builder: (BuildContext context) =>
                                    CustomSelectDate(onDateSelected: (String value) {data.exitDateController.text=value;},));
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
                            (data.isLoading==true)?SizedBox(width: 30.w,height: 30.h,
                                child: CircularProgressIndicator(color: AppColors.primaryColor,strokeWidth: 2.w,)):
                            CustomSectorDropdownButton(
                              color: AppColors.darkColor,
                              items: data.sectorsModel?.data ?? [],
                              value: data.selectedSector,
                              onChanged: (OneSector? newValue) {
                                setState(() {
                                  data.selectedSector = newValue;
                                  data.selectedVilla = null;
                                  data.selectedBeach = null;
                                  data.getAllVillas(data.selectedSector?.id.toString());
                                  data.getAllBeaches(data.selectedSector?.id.toString());
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
                            (data.isVilLoading==true)?SizedBox(width: 30.w,height: 30.h,
                                child: CircularProgressIndicator(color: AppColors.primaryColor,strokeWidth: 2.w,)):
                            CustomVillasDropdownButton(
                              color: AppColors.darkColor,
                              inputColor:data.selectedSector==null? Colors.black12:Colors.transparent,
                              items: data.villasModel?.data ?? [],
                              value: data.selectedVilla,
                              disabledTitle: AppTranslate.selectSectorFirst.tr(),
                              onChanged: (OneVilla? newValue) {
                                setState(() {
                                  data.selectedVilla = newValue;
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
                            (data.isBeaLoading==true)?SizedBox(width: 30.w,height: 30.h,
                                child: CircularProgressIndicator(color: AppColors.primaryColor,strokeWidth: 2.w,)):
                            CustomBeachesDropdownButton(
                              color: AppColors.darkColor,
                              items: data.beachesModel?.data ?? [],
                              value: data.selectedBeach,
                              inputColor:data.selectedSector==null? Colors.black12:Colors.transparent,
                              disabledTitle: AppTranslate.selectSectorFirst.tr(),
                              onChanged: (OneVilla? newValue) {
                                setState(() {
                                  data.selectedBeach = newValue;
                                });
                              },
                            ),
                            Container(height: 2.h,width: 300,color: Colors.grey.shade400,),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    CustomButton(onTap: (){
                      setState(() {
                        data.currentPage=1;
                      });
                      // _pageController.animateToPage(
                      //   1,
                      //   duration: const Duration(milliseconds: 300),
                      //   curve: Curves.easeInOut,
                      // );
                      data.pageController.animateToPage(data.currentPage,
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInOut);
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
