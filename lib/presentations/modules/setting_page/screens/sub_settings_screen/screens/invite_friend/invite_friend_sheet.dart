
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/app_assets.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/presentations/components/custom_svg/CustomSvgIcon.dart';
import 'package:pronight_vendor/presentations/components/inputs/custom_text_form.dart';
import 'package:pronight_vendor/presentations/modules/setting_page/setting_view_model.dart';
import 'package:provider/provider.dart';
import '../../../../../../../core/app_theme/app_colors.dart';
import '../../../../../../../core/dimens/dimens.dart';
import '../../../../../../components/custom_text/custom_text.dart';


class InviteFriendSheet extends StatefulWidget {
  const InviteFriendSheet({super.key,});

  @override
  State<InviteFriendSheet> createState() => _EditCatBottomSheetState();
}

class _EditCatBottomSheetState extends State<InviteFriendSheet> {

  @override
  void initState() {
    super.initState();
    // androidController.text='https://apps.apple.com /us/app/2cklks;l;';
    // appleController.text='https://apps.apple.com /us/app/2cklks;l;';
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Dimens.padding_20v, right: Dimens.padding_12h, left: Dimens.padding_12h,bottom:Dimens.padding_32v),
      child: Consumer<SettingsViewModel>(
        builder: (context,data,_) {
          return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Container(
                        width: 40.w,
                        height: 4.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.r),
                          color: AppColors.gray.withAlpha((0.40 * 255).round()),
                        ),
                      ),
                    ),
                    SizedBox(height:  Dimens.padding_16v),
                    Center(child: CustomText(title: AppTranslate.inviteFriend.tr(),fontWeight: FontWeight.bold,textAlign: TextAlign.center)),
                    SizedBox(height:  Dimens.padding_8v),
                    Divider(thickness: 1.w),
                    SizedBox(height:  Dimens.padding_16v),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      CustomTextFormField(controller: TextEditingController(),width: 316.w,height: 42.h,underLineColor: Colors.transparent,
                        bgColor:const Color(0xffEEECEC),readOnly: true,hint: data.settingsModel?.data?.appleUrl??'',
                        prefix:  CustomSvgIcon(assetName: AppAssets.apple,width: 25.w,height: 25.h),),
                      InkWell(
                          onTap: (){
                            data.copyToClipboard(data.settingsModel?.data?.googlePlayUrl??'');
                          },
                          child: CustomSvgIcon(assetName: AppAssets.copy,width: 25.w,height: 25.h)),
                    ],),
                    SizedBox(height: 20.h),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      CustomTextFormField(controller: TextEditingController(),width: 316.w,height: 42.h,underLineColor: Colors.transparent,
                        bgColor:const Color(0xffEEECEC),readOnly: true,hint:  data.settingsModel?.data?.googlePlayUrl??'',
                        prefix:  CustomSvgIcon(assetName: AppAssets.android,width: 25.w,height: 25.h),),
                      InkWell(
                          onTap: (){
                            data.copyToClipboard(data.settingsModel?.data?.googlePlayUrl??'');
                          },
                          child: CustomSvgIcon(assetName: AppAssets.copy,width: 25.w,height: 25.h)),
                    ],),
                  ],
          );
        }
      ),
    );
  }
}