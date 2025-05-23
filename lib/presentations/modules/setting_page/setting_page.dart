import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pronight_vendor/core/app_theme/app_colors.dart';
import 'package:pronight_vendor/core/dimens/dimens.dart';
import 'package:pronight_vendor/core/extensions/num_extensions.dart';
import 'package:pronight_vendor/core/resources/app_translate.dart';
import 'package:pronight_vendor/core/resources/font_size.dart';
import 'package:pronight_vendor/presentations/components/custom_app_bar/custom_app_bar.dart';
import 'package:pronight_vendor/presentations/components/custom_button/custom_button.dart';
import 'package:pronight_vendor/presentations/components/custom_text/custom_text.dart';
import 'package:pronight_vendor/presentations/modules/auth/login/login_screen.dart';
import 'package:pronight_vendor/presentations/modules/home_page/home_view_model.dart';
import 'package:pronight_vendor/presentations/modules/setting_page/screens/reservation_screen/reservation_screen.dart';
import 'package:pronight_vendor/presentations/modules/setting_page/widget/personal_data_card.dart';
import 'package:pronight_vendor/presentations/modules/setting_page/widget/other_card.dart';
import 'package:pronight_vendor/presentations/modules/setting_page/widget/user_card.dart';
import 'package:provider/provider.dart';

import '../../../core/navigator/navigator.dart';
import '../../../injection.dart';
import '../layout/bottom_nav_bar_app.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  @override
  Widget build(BuildContext context) {
    return  Container(child: Column(children: [
      CustomAppBar(title: AppTranslate.profile.tr(),isBackButtonExist: false,fontWeight: FontWeight.bold,fontSize: AppFonts.font_14,),
      Consumer<HomeViewModel>(
        builder: (context,data,_) {
          return Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal:Dimens.padding_24),
                child: Column(
                  children: [
                    const UserCard(),
                    SizedBox(height: 20.h),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      InkWell(onTap:(){
                        NavigatorHandler.pushAndRemoveUntil(BottomNavBar(bottomNavIndex: 2));
                      },
                        child: Material(elevation: 7,shadowColor: AppColors.white.withAlpha((0.40*255).round()),
                            borderRadius: BorderRadius.circular(16.r),
                            child: Container(width: 155.5.w,height: 73.h,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r),color: AppColors.white),
                              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                CustomText(title: data.homeModel?.data?.unitsCount.toString()??'',fontWeight: FontWeight.w500,fontSize: AppFonts.font_14,fontColor:AppColors.errorColor ,),
                                CustomText(title: AppTranslate.unit.tr(),fontSize: AppFonts.font_12,fontColor:AppColors.textColor ,)
                              ],),)),
                      ),
                      InkWell(onTap: (){
                        NavigatorHandler.push(const ReservationScreen());
                      },
                        child: Material(elevation: 7,shadowColor: AppColors.white.withAlpha((0.40*255).round()),
                            borderRadius: BorderRadius.circular(16.r),
                            child: Container(width: 155.5.w,height: 73.h,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r),color: AppColors.white),
                              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                CustomText(title: data.homeModel?.data?.reservationsCount.toString()??'',fontWeight: FontWeight.w500,fontSize: AppFonts.font_14,fontColor:AppColors.errorColor ,),
                                CustomText(title: AppTranslate.reservations.tr(),fontSize: AppFonts.font_12,fontColor:AppColors.textColor ,)
                              ],),)),
                      ),
                    ],),
                    SizedBox(height: 20.h),
                    const PersonalDataCard(),
                    SizedBox(height: 20.h),
                    const OtherCard(),
                    SizedBox(height: 60.h),
                    // CustomButton(onTap:(){NavigatorHandler.pushAndRemoveUntil(LoginScreen());})
                  ],
                ),
              ),
            ),
          );
        }
      )
    ],),);
  }
}
