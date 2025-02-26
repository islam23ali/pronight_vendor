import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/navigator/navigator.dart';
import 'package:pronight_vendor/core/resources/app_assets.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/core/resources/font_size.dart';
import 'package:pronight_vendor/presentations/components/custom_button/custom_button.dart';
import 'package:pronight_vendor/presentations/components/custom_svg/CustomSvgIcon.dart';
import 'package:pronight_vendor/presentations/components/custom_text/custom_text.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/screens/widget/success_payed_sheet.dart';

import '../../../../../core/app_theme/app_colors.dart';
import '../../../../../core/dimens/dimens.dart';
import '../../../../components/loadings/custom_scaffold_messanger.dart';

class PaymentTypeSheet extends StatefulWidget {
  const PaymentTypeSheet({super.key});

  @override
  State<PaymentTypeSheet> createState() => _PaymentTypeSheetState();
}

class _PaymentTypeSheetState extends State<PaymentTypeSheet> {
  int? isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      // constraints: BoxConstraints(
      //     maxHeight: Dimens.height*.55
      // ),
      padding: EdgeInsets.only(top: Dimens.padding_20v, right: Dimens.padding_16h, left: Dimens.padding_16h,bottom:MediaQuery.viewInsetsOf(context).bottom),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(36.r)),
        color:  AppColors.white
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
        CustomText(title: AppTranslate.payment.tr(),fontSize: AppFonts.font_14,fontWeight: FontWeight.bold,),
          Divider(color: AppColors.blackColor.withAlpha((0.20*255).round()),height: 50.h,),
          Padding(padding: EdgeInsets.symmetric(horizontal: Dimens.padding_16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 CustomText(title: AppTranslate.contractFees.tr(),fontColor: AppColors.primaryColor,),
              SizedBox(height: 10.h),
              CustomText(title: '150 ${AppTranslate.saudiRiyal.tr()}',fontColor: AppColors.textColor2,fontSize: AppFonts.font_11,),
                Divider(color: AppColors.blackColor.withAlpha((0.20*255).round()),height: 30.h,thickness: 3.h,),
                SizedBox(height: 20.h),
                InkWell(onTap: (){setState(() {
                  isSelected=0;
                });},
                  child: Container(
                    padding: EdgeInsets.all(Dimens.padding_12),
                    margin: EdgeInsets.symmetric(vertical:Dimens.padding_8),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),border: Border.all(width: 2.w,color: AppColors.primaryColor),),
                    child:Row(children: [
                      (isSelected==0)? CustomSvgIcon(assetName: AppAssets.selectedPayment,width: 20.w,height: 20.h):
                      CustomSvgIcon(assetName: AppAssets.unSelectedPayment,width: 18.w,height: 18.h),
                      SizedBox(width: 10.w),
                      CustomText(title: AppTranslate.paymentViaWallet.tr(),fontSize: AppFonts.font_14,fontColor: AppColors.textColor2,)
                    ],) ,),
                ),
                InkWell(onTap: (){setState(() {
                  isSelected=1;
                });},
                  child: Container(
                    padding: EdgeInsets.all(Dimens.padding_12),
                    margin: EdgeInsets.symmetric(vertical:Dimens.padding_8),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),border: Border.all(width: 2.w,color: AppColors.primaryColor),),
                    child:Row(children: [
                      (isSelected==1)? CustomSvgIcon(assetName: AppAssets.selectedPayment,width: 20.w,height: 20.h):
                      CustomSvgIcon(assetName: AppAssets.unSelectedPayment,width: 18.w,height: 18.h),
                      SizedBox(width: 10.w),
                      CustomText(title: AppTranslate.paymentByCard.tr(),fontSize: AppFonts.font_14,fontColor: AppColors.textColor2,)
                    ],) ,),
                ),
                SizedBox(height: 20.h),
                
              ],) ,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            CustomButton(onTap: (){
              if(isSelected==null){
                CustomScaffoldMessanger.showToast(title:' AppTranslate.enterVerificationCode');
              }
              else{
                showSuccessPayedSheet();
              }
            },title: AppTranslate.paymentConfirmation.tr(),width: 155.w,radius: 10.r,),
            CustomButton(onTap: (){NavigatorHandler.pop();},title: AppTranslate.cancelPayment.tr(),width: 155.w,radius: 10.r,
              bg: Colors.transparent,borderColor: AppColors.primaryColor,
              fontColor: AppColors.primaryColor,),
          ],)
      ],),
    );
  }
  Future<dynamic> showSuccessPayedSheet() async {
    return  showModalBottomSheet(
      // isDismissible: false,
        isScrollControlled: true,
        backgroundColor: AppColors.white,
        context: context,

        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(36.r),
            )),
        builder: (BuildContext context) {
          return const SuccessPayedSheet();
        });}
}
