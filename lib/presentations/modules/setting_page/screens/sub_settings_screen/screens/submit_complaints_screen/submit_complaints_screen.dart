import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/presentations/components/custom_app_bar/custom_app_bar.dart';
import 'package:pronight_vendor/presentations/components/custom_button/custom_button.dart';
import 'package:pronight_vendor/presentations/components/custom_scaffold/custom_scaffold.dart';

import '../../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../../core/dimens/dimens.dart';
import '../../../../../../../core/resources/app_assets.dart';
import '../../../../../../../core/resources/font_size.dart';
import '../../../../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../../../../components/custom_text/custom_text.dart';
import '../../../../../../components/inputs/custom_text_form.dart';

class SubmitComplaintsScreen extends StatefulWidget {
  const SubmitComplaintsScreen({super.key});

  @override
  State<SubmitComplaintsScreen> createState() => _SubmitComplaintsScreenState();
}

class _SubmitComplaintsScreenState extends State<SubmitComplaintsScreen> {
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController messageController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBar: CustomAppBar(height: 64.h,title: AppTranslate.submitComplaints.tr(),fontSize: AppFonts.font_14,fontWeight: FontWeight.bold,),
    body: Padding(
      padding: EdgeInsets.all(Dimens.padding_24),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Center(child: CustomSvgIcon(assetName: AppAssets.supportAssistanceLogo,width: 282.w,height: 241.h,)),
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
    ),);
  }
}
