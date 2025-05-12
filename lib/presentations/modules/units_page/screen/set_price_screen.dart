import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/utils/social_media_helper.dart';
import 'package:pronight_vendor/presentations/components/custom_app_bar/custom_app_bar.dart';
import 'package:pronight_vendor/presentations/components/custom_button/custom_button.dart';
import 'package:pronight_vendor/presentations/components/custom_scaffold/custom_scaffold.dart';
import '../../../../../../core/dimens/dimens.dart';
import '../../../../../../core/resources/app_assets.dart';
import '../../../../../../core/resources/app_translate.dart';
import '../../../../../../core/resources/font_size.dart';
import '../../../../../../data/models/response/reports_model.dart';
import '../../../components/alerts/custom_select_date.dart';
import '../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../components/custom_text/custom_text.dart';
import '../../../components/inputs/custom_text_form.dart';
class SetPriceScreen extends StatefulWidget {
  const SetPriceScreen({super.key});


  @override
  State<SetPriceScreen> createState() => _SetPriceScreenState();
}

class _SetPriceScreenState extends State<SetPriceScreen> {
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController selectPriceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: Color(0xffE9F5EE),
      systemNavigationBarColor: Color(0xffE9F5EE),
      appBar: CustomAppBar(fontWeight: FontWeight.bold,fontSize: AppFonts.font_14,
        title: AppTranslate.priceControl.tr(),bgColor: Color(0xffE9F5EE),statusBarColor: Color(0xffE9F5EE),height: 64.h,),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(Dimens.padding_16),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r),color: AppColors.white),
          child: Column(mainAxisSize: MainAxisSize.min,
            children: [
              Container(height: 59.h,
                  decoration: BoxDecoration(borderRadius:BorderRadius.only(topLeft:Radius.circular(20.r),topRight:Radius.circular(20.r)),
                    color:const Color(0xffF0FAFF),),
                  padding: EdgeInsets.symmetric(vertical: Dimens.padding_12v,horizontal:Dimens.padding_24h ),
                  child:Row(
                    children: [
                      CustomSvgIcon(assetName: AppAssets.reportDetails,width: 24.w,height: 24.h),
                      SizedBox(width: 16.w),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(title: 'ضبط السعر',fontSize: AppFonts.font_12,),
                          CustomText(title: 'قم باختيار التاريخ المراد ثم تحديد السعر المطلوب',fontSize: AppFonts.font_10,fontColor: Colors.grey,)
                        ],)
                    ],)),
              Padding(
                padding: EdgeInsets.all(Dimens.padding_16),
                child:
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(title: 'اختر التاريخ',fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                    Row(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width:150.w,
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(title: 'من',fontSize: AppFonts.font_12,fontColor: AppColors.greyColor),
                              CustomTextFormField(controller:startDateController,readOnly: true,
                                fontSize: AppFonts.font_12,
                                onTap: (){
                                  showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          CustomSelectDate(onDateSelected: (String value) {startDateController.text=value;},));
                                },
                                height: 60.h,textInputType: TextInputType.number,
                                suffix: CustomSvgIcon(assetName: AppAssets.date,color: Colors.black.withAlpha((0.50*244).round()),width: 16.w,height: 16.w,),
                                prefix: InkWell(
                                    onTap: (){
                                      startDateController.clear();
                                      // data.refreshData();
                                    },
                                    child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        SizedBox(width:150.w,
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(title: 'إلى',fontSize: AppFonts.font_12,fontColor: AppColors.greyColor),
                              CustomTextFormField(controller:endDateController,readOnly: true,
                                fontSize: AppFonts.font_12,
                                onTap: (){
                                  showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          CustomSelectDate(onDateSelected: (String value) {endDateController.text=value;},));
                                },
                                height: 60.h,textInputType: TextInputType.number,
                                suffix: CustomSvgIcon(assetName: AppAssets.date,color: Colors.black.withAlpha((0.50*244).round()),width: 16.w,height: 16.w,),
                                prefix: InkWell(
                                    onTap: (){
                                      endDateController.clear();
                                      // data.refreshData();
                                    },
                                    child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                              )
                            ],
                          ),
                        ),

                      ],),

                    CustomText(title: 'حدد السعر',fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                    CustomTextFormField(controller:selectPriceController,
                      height: 60.h,textInputType: TextInputType.number,
                      suffix: CustomText(title: 'ريال',fontSize: AppFonts.font_12,fontColor: AppColors.greyColor),
                      prefix: InkWell(
                          onTap: (){
                            selectPriceController.clear();
                            // data.refreshData();
                          },
                          child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                    ),
                    SizedBox(height: 200.h),
                    CustomButton(
                        title: AppTranslate.next.tr(),
                        onTap: (){})
                  ],
                ),),
            ],
          ),),
      ),);
  }
}
