import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/presentations/components/custom_button/custom_button.dart';
import 'package:pronight_vendor/presentations/components/custom_scaffold/custom_scaffold.dart';
import 'package:pronight_vendor/presentations/modules/auth/auth_view_model.dart';
import 'package:pronight_vendor/presentations/modules/setting_page/screens/sub_settings_screen/screens/about_app_screen/about_app_screen.dart';
import 'package:pronight_vendor/presentations/modules/setting_page/screens/sub_settings_screen/screens/change_language/change_language_sheet.dart';
import 'package:pronight_vendor/presentations/modules/setting_page/screens/sub_settings_screen/screens/contact_us_screen/contact_us_screen.dart';
import 'package:pronight_vendor/presentations/modules/setting_page/screens/sub_settings_screen/screens/delete_account_sheet/delete_account_sheet.dart';
import 'package:pronight_vendor/presentations/modules/setting_page/screens/sub_settings_screen/screens/invite_friend/invite_friend_sheet.dart';
import 'package:pronight_vendor/presentations/modules/setting_page/screens/sub_settings_screen/screens/rate_app_sheet/rate_app_sheet.dart';
import 'package:pronight_vendor/presentations/modules/setting_page/screens/sub_settings_screen/screens/support_and_assistance_screen/support_and_assistance_screen.dart';
import 'package:pronight_vendor/presentations/modules/setting_page/screens/sub_settings_screen/screens/termis_and_condition_screen/termis_and_condition_screen.dart';
import 'package:pronight_vendor/presentations/modules/setting_page/setting_view_model.dart';

import '../../../../../core/app_theme/app_colors.dart';
import '../../../../../core/dimens/dimens.dart';
import '../../../../../core/navigator/navigator.dart';
import '../../../../../core/resources/app_assets.dart';
import '../../../../../core/resources/app_translate.dart';
import '../../../../../core/resources/font_size.dart';
import '../../../../../injection.dart';
import '../../../../components/custom_app_bar/custom_app_bar.dart';
import '../../../../components/custom_svg/CustomSvgIcon.dart';
import '../../../../components/custom_text/custom_text.dart';
import '../../widget/user_card.dart';

class SubSettingsScreen extends StatefulWidget {
  const SubSettingsScreen({super.key});

  @override
  State<SubSettingsScreen> createState() => _SubSettingsScreenState();
}

class _SubSettingsScreenState extends State<SubSettingsScreen> {
  SettingsViewModel provider = getIt();
  AuthViewModel authProvider = getIt();
  @override
  void initState() {
    super.initState();
   WidgetsBinding.instance.addPostFrameCallback((_){
     provider.getAllSetting();
   });
  }
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(title: AppTranslate.profile.tr(),fontWeight: FontWeight.bold,fontSize: AppFonts.font_14,height: 64.h,),
      body: Column(children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal:Dimens.padding_24),
              child: Column(
                children: [
                  const UserCard(),
                  SizedBox(height: 20.h),
                  Container(
                      decoration: BoxDecoration(color: AppColors.white,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: Dimens.padding_16v ),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(title: AppTranslate.applicationSettings.tr(),fontSize: AppFonts.font_14,fontWeight: FontWeight.w500,),
                            SizedBox(height: 10.h),
                            _buildItem(context,
                                image: AppAssets.language,
                                isRow:true,
                                title: AppTranslate.theLanguage.tr(),
                                onTap: () {
                                  showChangeLanguageSheet(context);
                                }),
                            _buildItem(context,
                                image: AppAssets.aboutApp,
                                isRow:true,
                                title: AppTranslate.aboutApp.tr(),
                                onTap: () {
                                  NavigatorHandler.push(const AboutAppScreen());
                                }),
                            _buildItem(context,
                                image: AppAssets.termisAndCondition,
                                isRow:true,
                                title: AppTranslate.termsAndConditions.tr(),
                                onTap: () {
                                  NavigatorHandler.push(const TermsAndConditionScreen(isTermsAndConditions: true,));
                                }),
                            _buildItem(context,
                                image: AppAssets.contactUs,
                                isRow:true,
                                title: AppTranslate.contactUs.tr(),
                                onTap: () {
                                  NavigatorHandler.push(const ContactUsScreen());
                                }),
                            _buildItem(context,
                                image: AppAssets.suppert,
                                isRow:true,
                                title: AppTranslate.supportAssistance.tr(),
                                onTap: () {
                                  NavigatorHandler.push(const SupportAndAssistanceScreen());
                                }),
                            _buildItem(context,
                              isRow:true,
                              image: AppAssets.share,
                              title: AppTranslate.inviteFriend.tr(),
                              onTap: () {
                                showInviteFriendSheet(context);
                              },
                            ),
                            _buildItem(context,
                              isRow:true,
                              image: AppAssets.rateApp,
                              title: AppTranslate.appEvaluation.tr(),
                              onTap: () {
                                showRateAppSheet(context);
                              },
                            ),
                            _buildItem(context,
                              isRow:true,
                              image: AppAssets.deleteAccount,
                              title: AppTranslate.deleteAccount.tr(),
                              onTap: () {showDeleteAccountSheet(context);

                              },
                            ),

                          ],),
                      )),
                  SizedBox(height: 100.w),
                  CustomButton(onTap: (){
                    authProvider.logout();
                  },title: AppTranslate.logout.tr(),)
                ],
              ),
            ),
          ),
        )
      ],),
    );
  }
  Future<dynamic> showChangeLanguageSheet(BuildContext context) async {
    return showModalBottomSheet(
      // expand: false,
      context: context,
      backgroundColor: Colors.white,
      builder: (context) => const SafeArea(child: LangSheet()),
    );
  }
  Future<dynamic> showInviteFriendSheet(BuildContext context) async {
    return showModalBottomSheet(
      // expand: false,
      context: context,
      backgroundColor: Colors.white,
      builder: (context) => const SafeArea(child: InviteFriendSheet()),
    );
  }
  Future<dynamic> showRateAppSheet(BuildContext context) async {
    return showModalBottomSheet(
      // expand: false,
      context: context,
      backgroundColor: Colors.white,
      builder: (context) => const SafeArea(child: RateAppSheet()),
    );
  }
  Future<dynamic> showDeleteAccountSheet(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) =>const DeleteAccountSheet(),
    );
  }

}

_buildItem(BuildContext context,
    {required String image,
      required String title,
      Color? titleColor,
      bool? isRow,
      String? subTitle,
      GestureTapCallback? onTap}) {
  return ListTile(

    onTap: onTap,
    minVerticalPadding: 0,
    contentPadding: const EdgeInsets.all(0),
    trailing:(isRow==true)? Icon(
      Icons.arrow_forward_ios,
      size: 16.r,
      color:  AppColors.blackColor,
    ):const SizedBox(),
    title: Transform(transform: Matrix4.translationValues(15, 0.0, 0.0),
      child:CustomText(title: title,fontColor: AppColors.textGrayColor,fontSize: AppFonts.font_12,),
    ),dense: true,
    leading: SizedBox(width: 40.w,
      height: 40.h,
      child: Center(
        child: CustomSvgIcon(assetName:
        image,
          width: 20.w,
          height: 20.h,
        ),
      ),
    ),
  );
}