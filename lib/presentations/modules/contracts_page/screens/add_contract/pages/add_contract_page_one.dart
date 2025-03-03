import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/screens/add_contract/add_contract_view_model.dart';
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
import '../widget/custom_dropdown.dart';

class AddContractPageOne extends StatefulWidget {
  const AddContractPageOne({super.key});

  @override
  State<AddContractPageOne> createState() => _AddContractPageOneState();
}

class _AddContractPageOneState extends State<AddContractPageOne> {

  TextEditingController controller =TextEditingController();
  TextEditingController dateController =TextEditingController();
  List<String>? cityList = ['القاهرة', 'المنوفية'];
  String? value;

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
                          color: Color(0xffF0FAFF),border: Border.all(width:1.w,color: Color(0xffFFF9DC))),
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
                        CustomText(title: 'تاريخ الوصول',fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                        CustomTextFormField(controller: dateController,readOnly: true,
                          onTap: (){
                            showDialog<String>(
                                context: context,
                                builder: (BuildContext context) =>
                                    CustomSelectDate(onDateSelected: (String value) {dateController.text=value;},));
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
                        CustomText(title: 'تاريخ الخروج',fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                        CustomTextFormField(controller: dateController,readOnly: true,
                          onTap: (){
                            showDialog<String>(
                                context: context,
                                builder: (BuildContext context) =>
                                    CustomSelectDate(onDateSelected: (String value) {dateController.text=value;},));
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
                        CustomText(title: 'اختر القطاع',fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                        Column(
                          children: [
                            CustomDropdownButton(
                              color: AppColors.darkColor,
                              items: cityList ?? [],
                              value: value,
                              onChanged: (String? newValue) {
                                setState(() {
                                  value = newValue;
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
                        CustomText(title: 'فيلا',fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                        Column(
                          children: [
                            CustomDropdownButton(
                              color: AppColors.darkColor,
                              items: cityList ?? [],
                              value: value,
                              onChanged: (String? newValue) {
                                setState(() {
                                  value = newValue;
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
                        CustomText(title: 'شاطيء',fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                        Column(
                          children: [
                            CustomDropdownButton(
                              color: AppColors.darkColor,
                              items: cityList ?? [],
                              value: value,
                              onChanged: (String? newValue) {
                                setState(() {
                                  value = newValue;
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
