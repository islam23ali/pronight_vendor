
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/dimens/dimens.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/presentations/components/custom_app_bar/custom_app_bar.dart';
import 'package:pronight_vendor/presentations/components/custom_button/custom_button.dart';
import 'package:pronight_vendor/presentations/components/custom_scaffold/custom_scaffold.dart';
import 'package:pronight_vendor/presentations/components/custom_text/custom_text.dart';
import '../../../../../../../core/resources/app_assets.dart';
import '../../../../../../../core/resources/font_size.dart';
import '../../../../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../../../../components/inputs/custom_text_form.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController subMessageController=TextEditingController();
  TextEditingController messageController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(appBar: CustomAppBar(height: 64.h,title: AppTranslate.connectUs.tr(),fontSize: AppFonts.font_14,fontWeight: FontWeight.bold,),
      body:Padding(
        padding: EdgeInsets.all(Dimens.padding_24),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Center(child: CustomSvgIcon(assetName: AppAssets.contactUsLogo,width: 190.w,height: 150.h,)),
                    SizedBox(height: 20.h),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Container(width: 160.w,
                        padding: EdgeInsets.symmetric(horizontal: Dimens.padding_20h,vertical: Dimens.padding_12v),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25.r),color: AppColors.errorColor.withAlpha((0.10*255).round())),
                        child:Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          CustomSvgIcon(assetName: AppAssets.email,width: 24.w,height: 24.h,),
                          SizedBox(width: 5.w),
                          CustomText(title: AppTranslate.email.tr(),fontSize: AppFonts.font_14,fontColor: AppColors.errorColor)
                        ],) ,),
                      Container(width: 160.w,
                        padding: EdgeInsets.symmetric(horizontal: Dimens.padding_20h,vertical: Dimens.padding_12v),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25.r),color: AppColors.whatsAppColor.withAlpha((0.20*255).round())),
                        child:Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          CustomSvgIcon(assetName: AppAssets.whatsApp,width: 24.w,height: 24.h,),
                          SizedBox(width: 5.w),
                          CustomText(title: AppTranslate.whatsApp.tr(),fontSize: AppFonts.font_14,fontColor: AppColors.whatsAppColor)
                        ],) ,),
                    ],),
                    SizedBox(height: 20.h),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            height: 1.h,width: 100.w,color: AppColors.textGrayColor),
                        CustomText(title: AppTranslate.orContactUs.tr(),fontSize: AppFonts.font_14,),
                        Container(
                            height: 1.h,width: 100.w,color: AppColors.textGrayColor),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(title: AppTranslate.theName.tr(),fontSize: AppFonts.font_14,fontColor: AppColors.primaryColor),
                        CustomTextFormField(controller: nameController,
                          height: 60.h,textInputType: TextInputType.name,
                          prefix: CustomSvgIcon(assetName: AppAssets.profileIcon,height: 20.w,width: 20.w,color: AppColors.textGrayColor,),
                        )
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(title: AppTranslate.email.tr(),fontSize: AppFonts.font_14,fontColor: AppColors.primaryColor),
                        CustomTextFormField(controller: emailController,
                          height: 60.h,textInputType: TextInputType.emailAddress,
                          prefix: CustomSvgIcon(assetName: AppAssets.clearField,height: 16.w,width: 20.w,color: AppColors.textGrayColor,),
                        )
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(title: AppTranslate.messageTitle.tr(),fontSize: AppFonts.font_14,fontColor: AppColors.primaryColor),
                        CustomTextFormField(controller: subMessageController,
                          height: 60.h,textInputType: TextInputType.text,
                          prefix: CustomSvgIcon(assetName: AppAssets.clearField,height: 16.w,width: 20.w,color: AppColors.textGrayColor,),
                        )
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(title: AppTranslate.theMessage.tr(),fontSize: AppFonts.font_14,fontColor: AppColors.primaryColor),
                        CustomTextFormField(controller: messageController,
                          height: 60.h,textInputType: TextInputType.text,
                          prefix: CustomSvgIcon(assetName: AppAssets.clearField,height: 16.w,width: 20.w,color: AppColors.textGrayColor,),
                        )
                      ],
                    ),
                  ],),
              ),
            ),
            CustomButton(onTap: (){},title: AppTranslate.send.tr(),fontSize: AppFonts.font_14,fontWeight: FontWeight.w400,)
          ],
        ),
      ));
  }
}
