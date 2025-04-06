import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/app_assets.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/core/resources/font_size.dart';
import 'package:pronight_vendor/presentations/components/custom_button/custom_button.dart';
import 'package:pronight_vendor/presentations/components/custom_svg/CustomSvgIcon.dart';
import 'package:pronight_vendor/presentations/components/custom_text/custom_text.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/contract_screens/add_contract/add_contract_view_model.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../core/dimens/dimens.dart';

class SendContractSheet extends StatefulWidget {
  const SendContractSheet({super.key});

  @override
  State<SendContractSheet> createState() => _SendContractSheetState();
}

class _SendContractSheetState extends State<SendContractSheet> {

  @override
  Widget build(BuildContext context) {
    return Consumer<AddContractViewModel>(
      builder: (context,data,_) {
        return Container(
          padding: EdgeInsets.only(top: Dimens.padding_20v, right: Dimens.padding_16h, left: Dimens.padding_16h,bottom:MediaQuery.viewInsetsOf(context).bottom),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(36.r)),
            color:  AppColors.white
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
            CustomText(title: AppTranslate.sendContract.tr(),fontSize: AppFonts.font_14,fontWeight: FontWeight.bold,),
              Divider(color: AppColors.blackColor.withAlpha((0.20*255).round()),height: 50.h,),
              Padding(padding: EdgeInsets.symmetric(horizontal: Dimens.padding_16),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(onTap: (){setState(() {
                      data.isSelected=0;
                      data.refreshData();
                    });},
                      child: Container(
                        padding: EdgeInsets.all(Dimens.padding_12),
                        margin: EdgeInsets.symmetric(vertical:Dimens.padding_8),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),border: Border.all(width: 2.w,color: AppColors.primaryColor),),
                        child:Row(children: [
                          (data.isSelected==0)? CustomSvgIcon(assetName: AppAssets.selectedPayment,width: 20.w,height: 20.h):
                          CustomSvgIcon(assetName: AppAssets.unSelectedPayment,width: 18.w,height: 18.h),
                          SizedBox(width: 10.w),
                          CustomText(title: AppTranslate.sendContractToCustomersPhone.tr(),fontSize: AppFonts.font_14,fontColor: AppColors.textColor2,)
                        ],) ,),
                    ),
                    InkWell(onTap: (){setState(() {
                      data.isSelected=1;
                      data.refreshData();
                    });},
                      child: Container(
                        padding: EdgeInsets.all(Dimens.padding_12),
                        margin: EdgeInsets.symmetric(vertical:Dimens.padding_8),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),border: Border.all(width: 2.w,color: AppColors.primaryColor),),
                        child:Row(children: [
                          (data.isSelected==1)? CustomSvgIcon(assetName: AppAssets.selectedPayment,width: 20.w,height: 20.h):
                          CustomSvgIcon(assetName: AppAssets.unSelectedPayment,width: 18.w,height: 18.h),
                          SizedBox(width: 10.w),
                          CustomText(title: AppTranslate.sendContractFacilityOwnersPhone.tr(),fontSize: AppFonts.font_14,fontColor: AppColors.textColor2,)
                        ],) ,),
                    ),
                    SizedBox(height: 20.h),
                    (data.isSelected==null)?const SizedBox(): CustomButton(onTap: (){
                      data.addContract();
                    },title: AppTranslate.confirm.tr(),)
                  ],) ,),
          ],),
        );
      }
    );
  }
}
