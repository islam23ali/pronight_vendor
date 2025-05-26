import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/navigator/navigator.dart';
import 'package:pronight_vendor/core/utils/social_media_helper.dart';
import 'package:pronight_vendor/presentations/app_loader.dart';
import 'package:pronight_vendor/presentations/components/custom_app_bar/custom_app_bar.dart';
import 'package:pronight_vendor/presentations/components/custom_button/custom_button.dart';
import 'package:pronight_vendor/presentations/components/custom_scaffold/custom_scaffold.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/contract_screens/add_contract/add_contract.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/contract_screens/widget/delete_item_sheet.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/contract_screens/widget/payment_type_sheet.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/contracts_view_model.dart';
import 'package:provider/provider.dart';
import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/dimens/dimens.dart';
import '../../../../core/resources/app_assets.dart';
import '../../../../core/resources/app_translate.dart';
import '../../../../core/resources/font_size.dart';
import '../../../../injection.dart';
import '../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../components/custom_text/custom_text.dart';
import '../widgets/custom_coupon_card.dart';

class ContractDetails extends StatefulWidget {
  const ContractDetails({super.key, required this.id});
  final String? id;

  @override
  State<ContractDetails> createState() => _ContractDetailsState();
}

class _ContractDetailsState extends State<ContractDetails> {
  SocialMediaHelper socialMediaHelper =SocialMediaHelper();
  ContractViewModel provider = getIt();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      provider.oneContractDetails(widget.id??'-1');
    });
  }
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(title: AppTranslate.contractDetails.tr(),height: 64.h,),
      body: Consumer<ContractViewModel>(
        builder: (context,data,_) {
          return data.isLoading?const Center(child: AppLoader()): Padding(
            padding: EdgeInsets.all(Dimens.padding_16),
            child: CustomCouponCard(height: 649.h,
              backgroundColor:AppColors.cardDetailsColor,borderRadius: 15.r,curvePosition: 450.w,
              lineColor: AppColors.greyColor,lineHeight:1.w,
              secondChild: Padding(
                padding: EdgeInsets.symmetric(vertical:Dimens.padding_12),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomButton(onTap: (){socialMediaHelper.openFacebookApp('https://pro-night.com/contract/79MK1v3Dn90wNtM8RNg0');},width: 70.w,height: 54.h,icon: AppAssets.showContract,iconWidth: 25.w,iconHeight: 25.h,),
                    CustomButton(onTap: (){
                      NavigatorHandler.push(AddContract(id:widget.id.toString()));
                    },width: 70.w,height: 54.h,icon: AppAssets.editContract,iconWidth: 23.w,iconHeight: 23.h,),
                    CustomButton(onTap: (){showDeleteItemSheet();},width: 70.w,height: 54.h,icon: AppAssets.deleteContract,iconWidth: 25.w,iconHeight: 25.h,),
                  ],
                )),
                firstChild: Column(
                  children: [
                    Container(height: 63.h,color: AppColors.primaryColor,
                      padding: EdgeInsets.symmetric(horizontal: Dimens.padding_12h),
                      child:Align(alignment: Alignment.centerRight,
                        child: CustomText(textAlign: TextAlign.start,
                            title: '${AppTranslate.detailsContract.tr()} ${data.oneContractModel?.data?.sector?.name}',fontColor: AppColors.white,fontWeight: FontWeight.bold,fontSize: AppFonts.font_14),
                      ) ,),
                    Padding(
                    padding: EdgeInsets.all(Dimens.padding_16),
                    child:
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: Dimens.width/2-40.w,
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                CustomText(title: AppTranslate.tenantName.tr(),fontSize: AppFonts.font_11,fontColor: AppColors.textColor2,),
                                SizedBox(height: 10.h),
                                Row(children: [
                                  CustomSvgIcon(assetName: AppAssets.userName,width: 13.w,height: 14.h,),
                                  SizedBox(width: 5.w),
                                  CustomText(title: data.oneContractModel?.data?.tenant?.name??'',fontSize: AppFonts.font_10,fontWeight: FontWeight.bold,fontColor: AppColors.textColor3,)
                                ]),
                                SizedBox(height: 20.h),
                                CustomText(title: AppTranslate.villa.tr(),fontSize: AppFonts.font_11,fontColor: AppColors.textColor2,),
                                SizedBox(height: 10.h),
                                Row(children: [
                                  CustomSvgIcon(assetName: AppAssets.address,width: 14.w,height: 14.h,),
                                  SizedBox(width: 5.w),
                                  CustomText(title: data.oneContractModel?.data?.villa?.name??'',fontSize: AppFonts.font_11,fontColor: AppColors.textColor3,)
                                ]),
                                SizedBox(height: 20.h),
                                CustomText(title: AppTranslate.rentalValue.tr(),fontSize: AppFonts.font_11,fontColor: AppColors.textColor2,),
                                SizedBox(height: 10.h),
                                Row(children: [
                                  CustomSvgIcon(assetName: AppAssets.contractNum,width: 14.w,height: 14.h,),
                                  SizedBox(width: 5.w),
                                  CustomText(title: data.oneContractModel?.data?.rentValue.toString()??'',fontSize: AppFonts.font_11,fontColor: AppColors.textColor3,)
                                ]),
                                SizedBox(height: 20.h),
                                CustomText(title: AppTranslate.contractStatus.tr(),fontSize: AppFonts.font_11,fontColor: AppColors.textColor2,),
                                SizedBox(height: 10.h),
                                CustomText(title:(data.oneContractModel?.data?.isPaid==true)?AppTranslate.paymentConfirmed.tr():AppTranslate.paymentPending.tr(),fontSize: AppFonts.font_11,fontColor: AppColors.textColor2,),

                              ],),
                            ),
                            SizedBox(width: Dimens.width/2-40.w,
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                CustomText(title: AppTranslate.sectorNumber.tr(),fontSize: AppFonts.font_11,fontColor: AppColors.textColor2,),
                                SizedBox(height: 10.h),
                                Row(children: [
                                  CustomSvgIcon(assetName: AppAssets.sectorNumber,width: 15.w,height: 15.h,),
                                  SizedBox(width: 5.w),
                                  CustomText(title: '${AppTranslate.sector.tr()} ${data.oneContractModel?.data?.sector?.name}',fontSize: AppFonts.font_11,fontWeight: FontWeight.bold,fontColor: AppColors.textColor3,)
                                ]),
                                SizedBox(height: 20.h),
                                CustomText(title: AppTranslate.beach.tr(),fontSize: AppFonts.font_11,fontColor: AppColors.textColor2,),
                                SizedBox(height: 10.h),
                                Row(children: [
                                  CustomSvgIcon(assetName: AppAssets.beach,width: 17.w,height: 18.h,),
                                  SizedBox(width: 5.w),
                                  CustomText(title: data.oneContractModel?.data?.beach?.name??'',fontSize: AppFonts.font_11,fontColor: AppColors.textColor3,)
                                ]),
                                SizedBox(height: 20.h),
                                CustomText(title: AppTranslate.createIn.tr(),fontSize: AppFonts.font_11,fontColor: AppColors.textColor2,),
                                SizedBox(height: 10.h),
                                Row(children: [
                                  CustomSvgIcon(assetName: AppAssets.date,width: 14.w,height: 14.h,),
                                  SizedBox(width: 5.w),
                                  CustomText(title: data.oneContractModel?.data?.createdAt??'',fontSize: AppFonts.font_11,fontColor: AppColors.textColor3,)
                                ]),

                              ],),
                            ),
                          ],),
                        SizedBox(height: 20.h),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          CustomText(title: AppTranslate.operationsOTheContract.tr(),fontSize: AppFonts.font_11,fontColor: AppColors.textColor2,),
                          Row(
                            children: [
                              InkWell(onTap: (){socialMediaHelper.openFacebookApp('https://pro-night.com/contract/79MK1v3Dn90wNtM8RNg0');},
                                child: Container(
                                  padding: EdgeInsets.all(Dimens.padding_4),
                                  margin: EdgeInsets.symmetric(horizontal:Dimens.padding_4h),
                                  decoration: BoxDecoration( borderRadius: BorderRadius.circular(3.r),border: Border.all(width: 1.5.w,color: AppColors.primaryColor)),
                                  child:CustomSvgIcon(assetName: AppAssets.showContract,width: 20.w,height: 20.w,color: AppColors.primaryColor,) ,),
                              ),
                             data.oneContractModel?.data?.isPaid==true? const SizedBox(): InkWell(onTap:(){
                                showPaymentTypesSheet(data.oneContractModel?.data?.price.toString()??'',data.oneContractModel?.data?.id.toString()??'');
                              },
                                child: Container(
                                  padding: EdgeInsets.all(Dimens.padding_4),
                                  margin: EdgeInsets.symmetric(horizontal:Dimens.padding_4h),
                                  decoration: BoxDecoration( borderRadius: BorderRadius.circular(3.r),border: Border.all(width: 1.5.w,color: AppColors.primaryColor)),
                                  child:CustomSvgIcon(assetName: AppAssets.payMoney,width: 20.w,height: 20.w,color: AppColors.primaryColor,) ,),
                              ),
                              InkWell(onTap: (){
                                data.printContract(widget.id.toString());
                              },
                                child: Container(
                                  padding: EdgeInsets.all(Dimens.padding_4),
                                  margin: EdgeInsets.symmetric(horizontal:Dimens.padding_4h),
                                  decoration: BoxDecoration( borderRadius: BorderRadius.circular(3.r),border: Border.all(width: 1.5.w,color: AppColors.primaryColor)),
                                  child:CustomSvgIcon(assetName: AppAssets.filePDF,width: 20.w,height: 20.w,color: AppColors.primaryColor,) ,),
                              ),
                            ],
                          ),
                          ],),
                        (data.oneContractModel?.data?.note==null||data.oneContractModel?.data?.note=='')?const SizedBox():  SizedBox(height: 20.h),
                        (data.oneContractModel?.data?.note==null||data.oneContractModel?.data?.note=='')?const SizedBox(): CustomText(title: AppTranslate.comments.tr(),fontSize: AppFonts.font_11,fontColor: AppColors.textColor2,),
                        (data.oneContractModel?.data?.note==null||data.oneContractModel?.data?.note=='')?const SizedBox(): (data.oneContractModel?.data?.note==null||data.oneContractModel?.data?.note=='')?const SizedBox():SizedBox(height: 10.h),
                        (data.oneContractModel?.data?.note==null||data.oneContractModel?.data?.note=='')?const SizedBox(): CustomText(title: data.oneContractModel?.data?.note??'',fontSize: AppFonts.font_11,fontColor: AppColors.textColor2,),
                      ],
                    ),),
                  ],
                )),
          );
        }
      ),);
  }
  Future<dynamic> showPaymentTypesSheet(String price,contractId) async {
    return  showModalBottomSheet(
      // isDismissible: false,
        isScrollControlled: true,
        backgroundColor: AppColors.white,
        context: context,

        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24.r),
            )),
        builder: (BuildContext context) {
          return  PaymentTypeSheet( price: price, contractId: contractId,);
        });}
  Future<dynamic> showDeleteItemSheet() async {
    return  showModalBottomSheet(
      // isDismissible: false,
      //   isScrollControlled: true,
        backgroundColor: AppColors.white,
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24.r),
            )),
        builder: (BuildContext context) {
          return  DeleteItemSheet(
            onConfirmed: () {
              NavigatorHandler.pop();
            provider.deleteContract(widget.id.toString());
             });
        });}
}
