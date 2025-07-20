import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart' as ui;
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
import 'package:provider/provider.dart';

import '../../../../core/app_theme/text_styles.dart';
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
                        suffix: Directionality(
                            textDirection: ui.TextDirection.ltr,
                            child: CountryCodePicker(
                              padding: EdgeInsets.zero,
                              backgroundColor: Colors.white,
                              dialogTextStyle: AppTextStyles()
                                  .normalText(fontSize: AppFonts.font_14)
                                  .copyWith(color: Colors.black),
                              onChanged: (countryCode){
                                context
                                    .read<AuthViewModel>().selectedCountryCodeAndFlag(countryCode.dialCode??'',countryCode.flagUri??'');
                                print('bbbbbbbbbbb${data.phoneCode}');
                              },
                              builder: (countryCode) {
                                return Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(4.r),
                                      child: Image.asset(
                                        countryCode?.flagUri ?? '',
                                        package: 'country_code_picker',
                                        width: 36.w,
                                        height: 24.h
                                      ),
                                    ),
                                    SizedBox(width: Dimens.padding_8h),
                                    CustomText(
                                        title: countryCode?.dialCode ?? ''),
                                    SizedBox(width: Dimens.padding_8h),
                                    Icon(
                                      Icons.expand_more_rounded,
                                      color: AppColors.darkColor,
                                      size: 14.r,
                                    ),
                                  ],
                                );
                              },
                              initialSelection: 'sa',
                              favorite: const ['+966', 'sa'],
                              showCountryOnly: false,
                              showOnlyCountryWhenClosed: false,
                              showFlagMain: true,
                              alignLeft: false,
                              textOverflow: TextOverflow.ellipsis,
                              flagWidth: 36.w,
                            )
                        ),
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
