import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/presentations/components/inputs/custom_pin_code_field.dart';

import 'package:provider/provider.dart';
import '../../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../../core/dimens/dimens.dart';
import '../../../../../../../core/resources/app_assets.dart';
import '../../../../../../../core/resources/app_translate.dart';
import '../../../../../../../core/resources/font_size.dart';
import '../../../../../../../injection.dart';
import '../../../../../../components/custom_button/custom_button.dart';
import '../../../../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../../../../components/custom_text/custom_text.dart';
import '../forgot_password_view_model.dart';
import 'resend_code.dart';
import 'dart:ui' as ui;


class ConfirmCodeSheet extends StatefulWidget {

  const ConfirmCodeSheet({super.key}) ;

  @override
  State<ConfirmCodeSheet> createState() => _ConfirmCodeSheetState();
}

class _ConfirmCodeSheetState extends State<ConfirmCodeSheet> {
 ForgotPasswordViewModel  provider =getIt();


    
    // String otp = _controller.text;
    // Provider.of<AuthViewModel>(context, listen: false).verifyOTPFirebase(otp, widget._phone, context);


  @override
  Widget build(BuildContext context) {
    return
      Consumer<ForgotPasswordViewModel>(
        builder: (context, data, _) {return Container(
        margin:EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      decoration: BoxDecoration(
        color: AppColors.white,
          borderRadius:
           BorderRadius.vertical(top: Radius.circular(AppFonts.font_16)),
      ),
      padding:   EdgeInsets.symmetric(horizontal: Dimens.padding_16h,vertical:Dimens.padding_16v ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomSvgIcon(assetName:AppAssets.next1,height:Dimens.padding_3h,width: Dimens.padding_2v,),
          SizedBox(height:16.h),
          Center(
            child: Column(
              children: [
                CustomText(
                 title: tr(AppTranslate.gallery),
                  fontColor: AppColors.blackColor,
                  fontSize: AppFonts.font_14,
                  textAlign: TextAlign.center,
                ),
                // Directionality(
                //   textDirection: ui.TextDirection.ltr,
                  // child: CustomText(
                  // title:   ' ${"+962"} ${removeLeadingZeroFromString(provider.phoneController.text)} ',
                  //   textAlign: TextAlign.center,
                  // ),
                // ),
              ],
            ),
          ),
          SizedBox(height:16.h),
          CustomPinCodeTextField(controller: provider.controller, fieldsCount: 5,
          // onCompleted: (value){
          //   provider.refreshData();
          // },
          ),
          SizedBox(height:16.h),
          ResendConfirmCode(
            fontSize: AppFonts.font_14, fromRegister:false,),
          SizedBox(height:16.h),

          CustomButton(
            height: 50.h,
            bg: provider.controller.text.length==5?AppColors.primaryColor:AppColors.blue,
            // loading: isLoading,
            onTap:provider.controller.text.length==5? () {
              if (MediaQuery.of(context).viewInsets.bottom > 0) {
                FocusScope.of(context).unfocus();
              }
// provider.confirmCode(provider.controller.text);
            }:(){

            },
            title:  tr(AppTranslate.confirm),
          ),
        ],
      ),
    );});
  }
}