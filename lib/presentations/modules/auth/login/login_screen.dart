import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/dimens/dimens.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/navigator/navigator.dart';
import 'package:pronight_vendor/core/resources/app_assets.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/core/resources/font_size.dart';
import 'package:pronight_vendor/presentations/components/custom_app_bar/custom_app_bar.dart';
import 'package:pronight_vendor/presentations/components/custom_button/custom_button.dart';
import 'package:pronight_vendor/presentations/components/custom_scaffold/custom_scaffold.dart';
import 'package:pronight_vendor/presentations/components/custom_svg/CustomSvgIcon.dart';
import 'package:pronight_vendor/presentations/components/custom_text/custom_text.dart';
import 'package:pronight_vendor/presentations/components/inputs/custom_text_form.dart';
import 'package:pronight_vendor/presentations/modules/auth/auth_view_model.dart';
import 'package:pronight_vendor/presentations/modules/auth/login/widget/confirm_code/verification_code/confirm_code_sheet.dart';
import 'package:provider/provider.dart';

import '../../../components/loadings/custom_scaffold_messanger.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(backgroundColor: AppColors.white,
      systemNavigationBarColor: AppColors.white,
      appBar: CustomAppBar(height: 66.h,bgColor: AppColors.white,statusBarColor: AppColors.white,isBackButtonExist: false),
      body:Consumer<AuthViewModel>(
        builder: (context,data,_) {
          return Padding(
            padding: EdgeInsets.all(Dimens.padding_16),
            child: SingleChildScrollView(
              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                CustomPngIcon(assetName: AppAssets.splashLogo,width: 161.w,height: 85.h),
                  SizedBox(height: 20.h),
                  CustomText(title: AppTranslate.welcome.tr(),fontColor: AppColors.blackColor,fontWeight: FontWeight.bold,fontSize: AppFonts.font_18),
                  SizedBox(height: 35.h),
                  CustomText(title: AppTranslate.titleLogin.tr(),textAlign: TextAlign.center,
                    fontSize: AppFonts.font_15,fontColor: AppColors.textColor,),
                  SizedBox(height: 70.h),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(title: AppTranslate.phoneNumber.tr(),fontSize: AppFonts.font_16,fontColor: AppColors.primaryColor),
                      CustomTextFormField(controller: data.phoneNumberController,
                        height: 60,textInputType: TextInputType.number,
                        inputFormatters: [LengthLimitingTextInputFormatter(10),FilteringTextInputFormatter.digitsOnly],
                        prefix: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w),
                      )
                    ],
                  ),
                  SizedBox(height: 100.h),
                  CustomButton(onTap: (){
                    if(data.phoneNumberController.text.isEmpty){
                      CustomScaffoldMessanger.showToast(title: AppTranslate.enterYourPhone.tr());
                    }else{
                      data.sendCode(true,'login');
                    // showSendCodeSheet();
                    }
                  },title: AppTranslate.login.tr()),
                  SizedBox(height: 20.h),
                  Align(alignment: Alignment.centerRight,
                    child: Row(
                      children: [
                        CustomText(title:AppTranslate.iDonNotHaveAccount.tr(),fontSize: AppFonts.font_11,fontWeight: FontWeight.bold,),
                        SizedBox(width: 5.w),
                        InkWell(onTap: (){
                          NavigatorHandler.push(const RegisterScreen());
                        },
                            child: CustomText(title:AppTranslate.createNewAccount.tr(),fontSize: AppFonts.font_11,fontWeight: FontWeight.bold,fontColor: Color(0xffF3BE1E),decoration: TextDecoration.underline,)),
                      ],
                    ),
                  ),
                  // SizedBox(height: 140.h),
                  // InkWell(
                  //   onTap: (){
                  //
                  //   },
                  //     child: CustomText(title: AppTranslate.forgotYourPassword.tr(),fontSize: AppFonts.font_16,fontColor: AppColors.primaryColor)),
                ],),
            ),
          );
        }
      ) ,);
  }

}
