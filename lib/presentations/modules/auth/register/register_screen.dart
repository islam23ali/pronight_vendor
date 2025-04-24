import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/dimens/dimens.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/core/resources/font_size.dart';
import 'package:pronight_vendor/presentations/components/custom_app_bar/custom_app_bar.dart';
import 'package:pronight_vendor/presentations/components/custom_button/custom_button.dart';
import 'package:pronight_vendor/presentations/components/custom_scaffold/custom_scaffold.dart';
import 'package:pronight_vendor/presentations/components/custom_text/custom_text.dart';
import 'package:pronight_vendor/presentations/modules/auth/auth_view_model.dart';
import 'package:provider/provider.dart';
import '../../../../core/app_theme/app_colors.dart';
import '../../../../core/resources/app_assets.dart';
import '../../../components/custom_avatar/custom_avatar.dart';
import '../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../components/inputs/custom_text_form.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(appBar: CustomAppBar(height: 64.h,title: AppTranslate.createAccount.tr(),fontSize: AppFonts.font_14,fontWeight: FontWeight.bold,),
      body:Consumer<AuthViewModel>(
        builder: (context,data,_) {
          return Padding(
            padding: EdgeInsets.all(Dimens.padding_24),
            child: SingleChildScrollView(
              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: CustomText(title: AppTranslate.createNewAccount.tr(),fontSize: AppFonts.font_17,fontWeight: FontWeight.bold,)),
                    SizedBox(height: 60.h),
                    Center(child: Stack(
                      children: [
                        InkWell(onTap:(){
                          data.pickImage();
                        },child:
                        // CustomAvatar(radius: 125.w,url: data.image)),
                        data.image!=null?
                        SizedBox(width: 130.w,height: 130.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100.r),
                            child: Image.file(
                              File(data.image??''),
                              filterQuality:
                              FilterQuality.high,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ): CustomAvatar(radius: 125.w,url: AppAssets.splashLogo),),
                        Positioned(bottom: 5,left: 5,
                            child: Container(
                          padding: EdgeInsets.all(8.r),
                          decoration:const BoxDecoration(shape: BoxShape.circle,color: Color(0xffF5F5F5)),
                          child:CustomSvgIcon(assetName: AppAssets.cameraIcon,width: 15.w,height: 15.h)))
                      ],
                    )),
                    SizedBox(height: 40.h),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(title: AppTranslate.theName.tr(),fontSize: AppFonts.font_14,fontColor: AppColors.primaryColor),
                        CustomTextFormField(controller: data.nameController,
                          height: 60.h,textInputType: TextInputType.name,
                          prefix: CustomSvgIcon(assetName: AppAssets.profileIcon,height: 20.w,width: 25.w,color: AppColors.textGrayColor,),
                        )
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(title: AppTranslate.phoneNumber.tr(),fontSize: AppFonts.font_14,fontColor: AppColors.primaryColor),
                        CustomTextFormField(controller: data.phoneNumberController,
                          height: 60.h,textInputType: TextInputType.phone,
                          prefix: InkWell(
                              onTap: (){
                                data.phoneNumberController.clear();
                              },
                              child: CustomSvgIcon(assetName: AppAssets.clearField,height: 20.w,width: 20.w,color: AppColors.textGrayColor,)),
                        )
                      ],
                    ),
                    SizedBox(height: 80.h),
                    CustomButton(onTap: (){
                     data.sendCode(true,'register');
                     // data.register();
                      },title: AppTranslate.createAccount.tr(),)
                  ]),
            ),
          );
        }
      ));
  }
}
