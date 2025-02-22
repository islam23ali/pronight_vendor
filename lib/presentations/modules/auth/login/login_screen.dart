import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/dimens/dimens.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/app_assets.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/core/resources/font_size.dart';
import 'package:pronight_vendor/presentations/components/custom_app_bar/custom_app_bar.dart';
import 'package:pronight_vendor/presentations/components/custom_button/custom_button.dart';
import 'package:pronight_vendor/presentations/components/custom_scaffold/custom_scaffold.dart';
import 'package:pronight_vendor/presentations/components/custom_svg/CustomSvgIcon.dart';
import 'package:pronight_vendor/presentations/components/custom_text/custom_text.dart';
import 'package:pronight_vendor/presentations/components/inputs/custom_text_form.dart';
import 'package:pronight_vendor/presentations/modules/auth/login/widget/confirm_code/verification_code/confirm_code_sheet.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(backgroundColor: AppColors.white,
      systemNavigationBarColor: AppColors.white,
      appBar: CustomAppBar(height: 30.h,bgColor: AppColors.white,statusBarColor: AppColors.white,),
      body:Padding(
        padding: EdgeInsets.all(Dimens.padding_16),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            CustomPngIcon(assetName: AppAssets.splashLogo,width: 161.w,height: 85.h),
              SizedBox(height: 20.h),
              CustomText(title: AppTranslate.welcome.tr(),fontColor: AppColors.blackColor,fontWeight: FontWeight.bold,fontSize: AppFonts.font_18),
              SizedBox(height: 35.h),
              CustomText(title: AppTranslate.titleLogin.tr(),
                fontSize: AppFonts.font_15,fontColor: AppColors.textColor,),
              SizedBox(height: 70.h),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(title: AppTranslate.phoneNumber.tr(),fontSize: AppFonts.font_16,fontColor: AppColors.primaryColor),
                  CustomTextFormField(controller: controller,
                    height: 60,textInputType: TextInputType.number,
                    prefix: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w),
                  )
                ],
              ),
              SizedBox(height: 100.h),
              CustomButton(onTap: (){},title: AppTranslate.login.tr()),
              SizedBox(height: 140.h),
              InkWell(
                onTap: (){
                  showSendCodeSheet();
                },
                  child: CustomText(title: AppTranslate.forgotYourPassword.tr(),fontSize: AppFonts.font_16,fontColor: AppColors.primaryColor)),
            ],),
        ),
      ) ,);
  }
  Future<dynamic> showSendCodeSheet() async {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: AppColors.secondColor,
        builder: (context) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context)
                    .viewInsets
                    .bottom, // Adjust for the keyboard
              ),
              child:const ConfirmCodeSheet(),
            ),
          );
        });}
}
