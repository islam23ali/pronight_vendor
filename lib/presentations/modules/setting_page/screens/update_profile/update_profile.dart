import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/dimens/dimens.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/presentations/components/custom_app_bar/custom_app_bar.dart';
import 'package:pronight_vendor/presentations/components/custom_avatar/custom_avatar.dart';
import 'package:pronight_vendor/presentations/components/custom_scaffold/custom_scaffold.dart';
import 'package:pronight_vendor/presentations/components/images/network_image.dart';
import 'package:pronight_vendor/presentations/modules/setting_page/screens/update_profile/update_profile_view_model.dart';
import 'package:provider/provider.dart';
import '../../../../../core/app_theme/app_colors.dart';
import '../../../../../core/resources/app_assets.dart';
import '../../../../../core/resources/font_size.dart';
import '../../../../../injection.dart';
import '../../../../components/custom_button/custom_button.dart';
import '../../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../../components/custom_text/custom_text.dart';
import '../../../../components/inputs/custom_text_form.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  UpdateProfileViewModel provider = getIt();
  @override
  void initState() {
    super.initState();
 WidgetsBinding.instance.addPostFrameCallback((_){
   provider.initUpdateProfile();
 });
  }
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(appBar: CustomAppBar(title: AppTranslate.editProfile.tr(),fontWeight: FontWeight.bold,height: 65.h,),
      body:Consumer<UpdateProfileViewModel>(
        builder: (context,data,_) {
          return Padding(
            padding: EdgeInsets.all(Dimens.padding_24),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      // Center(child: CustomAvatar(radius: 175.w,url: AppAssets.splashLogo)),
                        Center(
                          child: SizedBox(height: 125.w,width: 125.w,
                            child: ClipRRect(borderRadius: BorderRadius.circular(100.r),
                              child: InkWell(onTap: (){
                                data.pickImage();
                                // print('mmmmmmm${data.image}');
                              },
                                child:(data.image!=null)?(data.image!.startsWith('http'))?AppNetworkImage(imageUrl: data.image??''):Image.file(File(data.image??''),fit: BoxFit.cover,width: Dimens.width,): Center(child: CustomAvatar(radius: 175.w,url: AppAssets.splashLogo)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(title: AppTranslate.theName.tr(),fontSize: AppFonts.font_14,fontColor: AppColors.primaryColor),
                            CustomTextFormField(controller: data.nameController,
                              height: 60.h,textInputType: TextInputType.name,
                              prefix: CustomSvgIcon(assetName: AppAssets.profileIcon,height: 20.w,width: 20.w,color: AppColors.textColor,),
                            )
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(title: AppTranslate.email.tr(),fontSize: AppFonts.font_14,fontColor: AppColors.primaryColor),
                            CustomTextFormField(controller: data.emailController,
                              height: 60.h,textInputType: TextInputType.emailAddress,
                              prefix: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w,color: AppColors.gray,),
                            )
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(title: AppTranslate.mobileNumber.tr(),fontSize: AppFonts.font_14,fontColor: AppColors.primaryColor),
                            CustomTextFormField(controller: data.phoneController,
                              height: 60.h,textInputType: TextInputType.phone,
                              prefix: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w,color: AppColors.gray,),
                            )
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(title: AppTranslate.password.tr(),fontSize: AppFonts.font_14,fontColor: AppColors.primaryColor),
                            CustomTextFormField(controller: data.passwordController,
                              height: 60.h,textInputType: TextInputType.text,
                              suffix: CustomSvgIcon(assetName: AppAssets.unSee,height: 14.w,width: 20.w,color: AppColors.gray,),
                              prefix: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w,color: AppColors.gray,),
                            )
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(title: AppTranslate.confirmPassword.tr(),fontSize: AppFonts.font_14,fontColor: AppColors.primaryColor),
                            CustomTextFormField(controller: data.confirmPasswordController,
                              height: 60.h,textInputType: TextInputType.text,
                              suffix: CustomSvgIcon(assetName: AppAssets.unSee,height: 14.w,width: 20.w,color: AppColors.gray,),
                              prefix: CustomSvgIcon(assetName: AppAssets.clearField,height: 14.w,width: 20.w,color: AppColors.gray,),
                            )
                          ],
                        ),
                    ],),
                  ),
                ),
                CustomButton(onTap: (){data.updateProfile();},title: AppTranslate.confirm.tr(),)
              ],
            ),
          );
        }
      ) ,);
  }
}
