import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/presentations/components/custom_app_bar/custom_app_bar.dart';
import 'package:pronight_vendor/presentations/components/custom_button/custom_button.dart';
import 'package:pronight_vendor/presentations/components/custom_scaffold/custom_scaffold.dart';
import 'package:pronight_vendor/presentations/components/loadings/custom_scaffold_messanger.dart';
import 'package:pronight_vendor/presentations/modules/add_unit_page/add_unit_view_model.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/dimens/dimens.dart';
import '../../../../../../core/resources/app_assets.dart';
import '../../../../../../core/resources/app_translate.dart';
import '../../../../../../core/resources/font_size.dart';
import '../../../../injection.dart';
import '../../../components/alerts/custom_select_date.dart';
import '../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../components/custom_text/custom_text.dart';
import '../../../components/inputs/custom_text_form.dart';
class SetPriceScreen extends StatefulWidget {
  const SetPriceScreen({super.key, required this.id});
  final String? id;


  @override
  State<SetPriceScreen> createState() => _SetPriceScreenState();
}

class _SetPriceScreenState extends State<SetPriceScreen> {
  AddUnitViewModel provider = getIt();

  @override
  void initState() {
    super.initState();
    provider.initSetPrice();
  }
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: Color(0xffE9F5EE),
      systemNavigationBarColor: Color(0xffE9F5EE),
      appBar: CustomAppBar(fontWeight: FontWeight.bold,fontSize: AppFonts.font_14,
        title: AppTranslate.priceControl.tr(),bgColor: Color(0xffE9F5EE),statusBarColor: Color(0xffE9F5EE),height: 64.h,),
      body: Consumer<AddUnitViewModel>(
        builder: (context,data,_) {
          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(Dimens.padding_16),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r),color: AppColors.white),
              child: Column(mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      decoration: BoxDecoration(borderRadius:BorderRadius.only(topLeft:Radius.circular(20.r),topRight:Radius.circular(20.r)),
                        color:const Color(0xffF0FAFF),),
                      padding: EdgeInsets.symmetric(vertical: Dimens.padding_12v,horizontal:Dimens.padding_24h ),
                      child:Row(
                        children: [
                          CustomSvgIcon(assetName: AppAssets.reportDetails,width: 24.w,height: 24.h),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(title: AppTranslate.priceControl1.tr(),fontSize: AppFonts.font_12,),
                                CustomText(title: AppTranslate.selectPrice.tr(),fontSize: AppFonts.font_10,fontColor: Colors.grey,)
                              ],),
                          )
                        ],)),
                  Padding(
                    padding: EdgeInsets.all(Dimens.padding_16),
                    child:
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(title: AppTranslate.selectDate.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                        Row(crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width:150.w,
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(title: AppTranslate.from.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.greyColor),
                                  CustomTextFormField(controller:data.fromDateSetPriceController,readOnly: true,
                                    fontSize: AppFonts.font_12,
                                    onTap: (){
                                      showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              CustomSelectDate(onDateSelected: (String value) {data.fromDateSetPriceController.text=value;},));
                                    },
                                    height: 60.h,textInputType: TextInputType.number,
                                    suffix: CustomSvgIcon(assetName: AppAssets.date,color: Colors.black.withAlpha((0.50*244).round()),width: 16.w,height: 16.w,),
                                    prefix: InkWell(
                                        onTap: (){
                                          data.fromDateSetPriceController.clear();
                                          data.refreshData();
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
                                  CustomText(title: AppTranslate.to.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.greyColor),
                                  CustomTextFormField(controller:data.toDateSetPriceController,readOnly: true,
                                    fontSize: AppFonts.font_12,
                                    onTap: (){
                                      showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              CustomSelectDate(onDateSelected: (String value) {data.toDateSetPriceController.text=value;},));
                                    },
                                    height: 60.h,textInputType: TextInputType.number,
                                    suffix: CustomSvgIcon(assetName: AppAssets.date,color: Colors.black.withAlpha((0.50*244).round()),width: 16.w,height: 16.w,),
                                    prefix: InkWell(
                                        onTap: (){
                                          data.toDateSetPriceController.clear();
                                          // data.refreshData();
                                        },
                                        child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                                  )
                                ],
                              ),
                            ),

                          ],),

                        CustomText(title: AppTranslate.setPrice.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.primaryColor),
                        CustomTextFormField(controller:data.newPriceController,
                          height: 60.h,textInputType: TextInputType.number,
                          suffix: CustomText(title: AppTranslate.riyal.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.greyColor),
                          prefix: InkWell(
                              onTap: (){
                                data.newPriceController.clear();
                                data.refreshData();
                              },
                              child: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w)),
                        ),
                        SizedBox(height: 200.h),
                        CustomButton(
                            title: AppTranslate.next.tr(),
                            onTap: (){
                              if(data.fromDateSetPriceController.text.isEmpty==true){
                                CustomScaffoldMessanger.showToast(title: AppTranslate.pleaseAddDateFrom.tr());
                              }else if(data.toDateSetPriceController.text.isEmpty==true){
                                CustomScaffoldMessanger.showToast(title: AppTranslate.pleaseAddDateTo.tr());
                                }else if(data.newPriceController.text.isEmpty==true){
                                CustomScaffoldMessanger.showToast(title: AppTranslate.pleaseAddNewPrice.tr());
                              }else{
                                data.setPrice(widget.id??'');
                              }
                            })
                      ],
                    ),),
                ],
              ),),
          );
        }
      ),);
  }
}
