import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/app_assets.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/core/resources/font_size.dart';
import 'package:pronight_vendor/presentations/components/custom_button/custom_button.dart';
import 'package:pronight_vendor/presentations/components/custom_svg/CustomSvgIcon.dart';
import 'package:pronight_vendor/presentations/components/custom_text/custom_text.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/visit_permits_screens/add_visit_permits/add_visit_permit_view_model.dart';
import 'package:pronight_vendor/presentations/modules/contracts_page/visit_permits_screens/visit_permit_view_model.dart';
import '../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../core/dimens/dimens.dart';
import '../../../../../../injection.dart';

class SendVisitPermitSheet extends StatefulWidget {
  const SendVisitPermitSheet({super.key});

  @override
  State<SendVisitPermitSheet> createState() => _SendVisitPermitSheetState();
}

class _SendVisitPermitSheetState extends State<SendVisitPermitSheet> {
  AddVisitPermitViewModel provider = getIt();
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
        CustomText(title: AppTranslate.sendVisitPermit.tr(),fontSize: AppFonts.font_14,fontWeight: FontWeight.bold,),
          Divider(color: AppColors.blackColor.withAlpha((0.20*255).round()),height: 50.h,),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    CustomText(title: AppTranslate.sendingVisitPermitToCustomerPhone.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.textColor2,)
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
                    CustomText(title: AppTranslate.sendVisitPermitToFacilityOwnerPhoneNumber.tr(),fontSize: AppFonts.font_12,fontColor: AppColors.textColor2,)
                  ],) ,),
              ),
              SizedBox(height: 20.h),
              (isSelected==null)?const SizedBox(): CustomButton(onTap: (){
                provider.addVisitPermitValidation();
              },title: AppTranslate.confirm.tr(),)
            ],),
      ],),
    );
  }
}
